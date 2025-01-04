package com.web.controller.user;

import com.web.config.Environment;
import com.web.dto.PaymentSession;
import com.web.dto.ResponsePayment;
import com.web.entity.Cart;
import com.web.entity.Invoice;
import com.web.enums.Paytype;
import com.web.models.QueryStatusTransactionResponse;
import com.web.processor.QueryTransactionStatus;
import com.web.repository.CartRepository;
import com.web.repository.HistoryPayRepository;
import com.web.repository.ProductRepository;
import com.web.service.InvoiceService;
import com.web.service.MomoService;
import com.web.utils.UserUtils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class CheckoutController {

    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private UserUtils userUtils;

    @Autowired
    private InvoiceService invoiceService;

    @Autowired
    private MomoService momoService;

    @Autowired
    private HistoryPayRepository historyPayRepository;

    @RequestMapping(value = {"/checkout"}, method = RequestMethod.GET)
    public String checkout(Model model) {
        List<Cart> list = cartRepository.findByUser(userUtils.getUserWithAuthority().getId());
        Double d = 0D;
        for(Cart g : list){
            d += g.getQuantity() * g.getProduct().getPrice();
        }
        model.addAttribute("gioHangList",list);
        model.addAttribute("tongTien",d);
        model.addAttribute("userlogged",userUtils.getUserWithAuthority());
        return "user/checkout";
    }

    @RequestMapping(value = {"/checkout"}, method = RequestMethod.POST)
    public String checkoutPost(RedirectAttributes redirectAttributes, HttpServletRequest request,
                               @RequestParam String fullname, @RequestParam String phone, @RequestParam String address,
                               @RequestParam String note, @RequestParam String paytype, HttpSession session) {
        List<Cart> list = cartRepository.findByUser(userUtils.getUserWithAuthority().getId());
        Double d = 0D;
        if (address == null || address.trim().isEmpty()) {
            // Thêm thông báo lỗi nếu địa chỉ trống
            redirectAttributes.addFlashAttribute("error", "Địa chỉ không được để trống.");
            // Chuyển hướng lại trang checkout để người dùng sửa
            return "redirect:/checkout";
        }
        for(Cart g : list){
            if(g.getQuantity() > g.getProduct().getQuantity()){
                // Thêm thông báo cảnh báo về số lượng không hợp lệ
                redirectAttributes.addFlashAttribute("warning", "Số lượng sản phẩm " + g.getProduct().getName() + " không được vượt quá số lượng còn lại: " + g.getProduct().getQuantity());
                // Chuyển hướng lại trang trước
                String referer = request.getHeader("Referer");
                return "redirect:" + referer;
            }
            d += g.getQuantity() * g.getProduct().getPrice();
        }
        // Chỉ tiếp tục với thanh toán nếu không có lỗi
        if(paytype.equals("momo")){
            ResponsePayment responsePayment = momoService.getUrlPayment(d);
            PaymentSession paymentSession = new PaymentSession(responsePayment, fullname, phone, address, note);
            session.setAttribute("paymentSession", paymentSession);
            return "redirect:" + responsePayment.getUrl();
        }
        else{
            Invoice invoice = invoiceService.createInvoice(Paytype.COD, fullname, phone, address, note);
            return "redirect:/taikhoan";
        }
    }


    @RequestMapping(value = {"/payment"}, method = RequestMethod.GET)
    public String payment(Model model, @RequestParam String requestId, @RequestParam String orderId, HttpSession session) throws Exception {
        Environment environment = Environment.selectEnv("dev");
        QueryStatusTransactionResponse queryStatusTransactionResponse = QueryTransactionStatus.process(environment, orderId, requestId);
        System.out.println("qqqq-----------------------------------------------------------"+queryStatusTransactionResponse.getMessage());
        if(historyPayRepository.findByOrderIdAndRequestId(orderId, requestId).isPresent()){
            model.addAttribute("warning", "Đơn hàng đã được đặt trước đó");
        }
        else if(queryStatusTransactionResponse.getResultCode() != 0){
            model.addAttribute("error", "Thanh toán thất bại");
        }
        else if(queryStatusTransactionResponse.getResultCode() == 0){
            model.addAttribute("success", "Thanh toán thành công");
            PaymentSession p = (PaymentSession) session.getAttribute("paymentSession");
            Invoice invoice = invoiceService.createInvoice(Paytype.PAYMENT_ONLINE, p.getFullname(), p.getPhone(), p.getAddress(), p.getNote());
            invoiceService.createHistoryPay(orderId, requestId, invoice);
            session.removeAttribute("paymentSession");
        }
        return "user/payment";
    }

}

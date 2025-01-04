package com.web.controller.user;

import com.web.entity.Invoice;
import com.web.entity.InvoiceDetail;
import com.web.entity.Product;
import com.web.enums.Paytype;
import com.web.repository.InvoiceDetailRepository;
import com.web.repository.InvoiceRepository;
import com.web.repository.ProductRepository;
import com.web.repository.StatusRepository;
import com.web.utils.StatusUtils;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class InvoiceController {

    @Autowired
    private InvoiceRepository invoiceRepository;

    @Autowired
    private StatusRepository statusRepository;

    @Autowired
    private InvoiceDetailRepository invoiceDetailRepository;

    @Autowired
    private ProductRepository productRepository;

    @PostMapping("/cancel-invoice")
    public String delete(RedirectAttributes redirectAttributes, @RequestParam("id") Long id, HttpServletRequest request){
        Invoice invoice = invoiceRepository.findById(id).get();
        if(invoice.getPayType().equals(Paytype.PAYMENT_ONLINE)){
            redirectAttributes.addFlashAttribute("error", "Đơn hàng đã thanh toán, không thể hủy!");
        }
        if(invoice.getStatus().getId() == StatusUtils.DA_GUI || invoice.getStatus().getId() == StatusUtils.DA_HUY
                ||invoice.getStatus().getId() == StatusUtils.DA_NHAN || invoice.getStatus().getId() == StatusUtils.KHONG_NHAN_HANG){
            redirectAttributes.addFlashAttribute("error", "không thể hủy!");
        }
        invoice.setStatus(statusRepository.findById(StatusUtils.DA_HUY).get());
        invoiceRepository.save(invoice);
        List<InvoiceDetail> list = invoiceDetailRepository.findByInvoice(id);
        for(InvoiceDetail i : list){
            Product product = i.getProduct();
            product.setQuantity(product.getQuantity() + i.getQuantity());
            productRepository.save(product);
        }
        redirectAttributes.addFlashAttribute("message", "Hủy đơn hàng thành công!");
        String referer = request.getHeader("Referer");
        return "redirect:" + referer;
    }
}

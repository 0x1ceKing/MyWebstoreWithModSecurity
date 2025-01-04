package com.web.controller.admin;

import com.web.entity.Invoice;
import com.web.entity.Status;
import com.web.enums.Paytype;
import com.web.repository.InvoiceRepository;
import com.web.repository.StatusRepository;
import com.web.utils.StatusUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.sql.Date;
import java.util.List;
import java.util.Optional;

@Controller(value = "adminInvoiceController")
@RequestMapping("/admin")
public class InvoiceController {

    @Autowired
    private InvoiceRepository invoiceRepository;

    @Autowired
    private StatusRepository statusRepository;

    @RequestMapping(value = {"/invoice"}, method = RequestMethod.GET)
    public String invoice(Model model, @RequestParam(required = false) String fromDate,
                          @RequestParam(required = false) String toDate,
                          @RequestParam(required = false) String pay,
                          @RequestParam(required = false) Long statusId) {
        Date from = null;
        Date to = null;
        if(fromDate != null && toDate != null){
            if(!fromDate.equals("") && !toDate.equals("")){
                from = Date.valueOf(fromDate);
                to = Date.valueOf(toDate);
            }
        }
        if(from == null || to == null){
            from = Date.valueOf("2000-01-01");
            to = Date.valueOf("2200-01-01");
        }
        if(statusId != null){
            if (statusId == -1) statusId = null;
        }
        Paytype paytype = null;
        if(pay != null){
            if (!pay.equals("")) paytype = Paytype.valueOf(pay.toUpperCase());
        }
        List<Invoice> list = null;
        System.out.println(paytype);
        System.out.println(statusId);
        if(paytype == null && statusId == null){
            list = invoiceRepository.findByDate(from, to);
        }
        if(paytype == null && statusId != null){
            list = invoiceRepository.findByDateAndStatus(from, to, statusId);
        }
        if(paytype != null && statusId == null){
            list = invoiceRepository.findByDateAndPaytype(from, to,paytype);
        }
        if(paytype != null && statusId != null){
            System.out.println("case 4");
            list = invoiceRepository.findByDateAndPaytypeAndStatus(from, to,paytype,statusId);
        }
        model.addAttribute("listInvoice", list);
        model.addAttribute("listStatus", statusRepository.findAll());
        model.addAttribute("statusId", statusId);
        return "admin/invoice";
    }

    @PostMapping("/update-status-invoice")
    public String updateStatus(@RequestParam Long invoiceId, @RequestParam Long statusId, RedirectAttributes redirectAttributes) {
        Optional<Status> status = statusRepository.findById(statusId);
        Long idSt = status.get().getId();
        if(idSt == StatusUtils.DA_HUY){
            redirectAttributes.addFlashAttribute("error", "không thể cập nhật trạng thái này!");
            return "redirect:/admin/invoice";
        }
        Optional<Invoice> invoice = invoiceRepository.findById(invoiceId);
        if(invoice.get().getStatus().getId() == StatusUtils.DA_HUY){
            redirectAttributes.addFlashAttribute("error", "Đơn hàng đã bị hủy, không thẻ cập nhật trạng thái!");
            return "redirect:/admin/invoice";
        }
        invoice.get().setStatus(status.get());
        invoiceRepository.save(invoice.get());
        redirectAttributes.addFlashAttribute("message", "Đã cập nhật trạng thái!");
        return "redirect:/admin/invoice";
    }
}

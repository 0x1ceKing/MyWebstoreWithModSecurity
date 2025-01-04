package com.web.controller.admin;

import com.web.entity.Invoice;
import com.web.enums.Role;
import com.web.repository.InvoiceRepository;
import com.web.repository.ProductRepository;
import com.web.repository.UserRepository;
import com.web.service.ThongKeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class ThongKeController {

    @Autowired
    private ThongKeService thongKeService;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private InvoiceRepository invoiceRepository;

    @RequestMapping(value = {"/index"}, method = RequestMethod.GET)
    public String index(Model model) {
        model.addAttribute("doanhThuThangNay", thongKeService.doanhThuThangNay());
        model.addAttribute("numberAdmin", thongKeService.numberAdmin());
        model.addAttribute("numberProduct", thongKeService.numberProduct());
        model.addAttribute("revenueByDate", thongKeService.revenueByDate());
        model.addAttribute("numInvoiceToDay", thongKeService.numInvoiceToDay());
        return "admin/index";
    }

    @RequestMapping(value = {"/doanhthu"}, method = RequestMethod.GET)
    public String doanhthu(Model model,@RequestParam(required = false) Integer year) {
        if(year == null){
            year = LocalDate.now().getYear();
        }
        List<Double> list = new ArrayList<>();
        for(int i=1; i< 13; i++){
            Double sum = invoiceRepository.calDt(i, year);
            if(sum == null){
                sum = 0D;
            }
            list.add(sum);
        }
        model.addAttribute("dataPoints", list);
        return "admin/doanhthu";
    }
}

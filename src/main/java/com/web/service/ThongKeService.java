package com.web.service;

import com.web.enums.Role;
import com.web.repository.InvoiceRepository;
import com.web.repository.ProductRepository;
import com.web.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;

@Service
public class ThongKeService {

    @Autowired
    private InvoiceRepository invoiceRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ProductRepository productRepository;

    public Double doanhThuThangNay(){
        Date date = new Date(System.currentTimeMillis());
        String[] str = date.toString().split("-");
        Integer year = Integer.valueOf(str[0]);
        Integer month = Integer.valueOf(str[1]);
        return invoiceRepository.calDt(month, year);
    }

    public Double numberAdmin(){
        return userRepository.countAdmin(Role.ROLE_ADMIN);
    }

    public Long numberProduct(){
        return productRepository.count();
    }

    public Double revenueByDate(){
        Date date = new Date(System.currentTimeMillis());
        return invoiceRepository.revenueByDate(date);
    }

    public Double numInvoiceToDay(){
        Date date = new Date(System.currentTimeMillis());
        return invoiceRepository.numInvoiceToDay(date);
    }
}

package com.web.service;

import com.web.entity.Cart;
import com.web.entity.HistoryPay;
import com.web.entity.Invoice;
import com.web.entity.InvoiceDetail;
import com.web.enums.Paytype;
import com.web.repository.*;
import com.web.utils.StatusUtils;
import com.web.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

@Service
public class InvoiceService {

    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private StatusRepository statusRepository;

    @Autowired
    private UserUtils userUtils;

    @Autowired
    private StatusUtils statusUtils;

    @Autowired
    private InvoiceRepository invoiceRepository;

    @Autowired
    private InvoiceDetailRepository invoiceDetailRepository;

    @Autowired
    private HistoryPayRepository historyPayRepository;

    public Invoice createInvoice(Paytype paytype, String fullname, String phone, String address, String note){
        List<Cart> list = cartRepository.findByUser(userUtils.getUserWithAuthority().getId());
        Double d = 0D;
        for(Cart g : list){
            d += g.getQuantity() * g.getProduct().getPrice();
        }
        Invoice invoice = new Invoice();
        invoice.setNote(note);
        invoice.setReceiverName(fullname);
        invoice.setPhone(phone);
        invoice.setAddress(address);
        invoice.setCreatedDate(new Date(System.currentTimeMillis()));
        invoice.setCreatedTime(new Time(System.currentTimeMillis()));
        invoice.setUser(userUtils.getUserWithAuthority());
        invoice.setTotalAmount(d);
        invoice.setPayType(paytype);
        invoice.setStatus(statusRepository.findById(StatusUtils.DANG_CHO_XAC_NHAN).get());
        Invoice result = invoiceRepository.save(invoice);
        for(Cart g : list){
            InvoiceDetail invoiceDetail = new InvoiceDetail();
            invoiceDetail.setInvoice(result);
            invoiceDetail.setQuantity(g.getQuantity());
            invoiceDetail.setProduct(g.getProduct());
            invoiceDetail.setPrice(g.getProduct().getPrice());
            invoiceDetailRepository.save(invoiceDetail);
            g.getProduct().setQuantity(g.getProduct().getQuantity() - g.getQuantity());
            g.getProduct().setQuantitySold(g.getProduct().getQuantitySold() + g.getQuantity());
            productRepository.save(g.getProduct());
        }
        return result;
    }

    public HistoryPay createHistoryPay(String orderId, String requestId, Invoice invoice){
        if(historyPayRepository.findByOrderIdAndRequestId(orderId, requestId).isPresent()){
            return null;
        }
        HistoryPay historyPay = new HistoryPay();
        historyPay.setInvoice(invoice);
        historyPay.setCreatedDate(new Date(System.currentTimeMillis()));
        historyPay.setOrderId(orderId);
        historyPay.setRequestId(requestId);
        historyPay.setTotalAmount(invoice.getTotalAmount());
        historyPayRepository.save(historyPay);
        return historyPay;
    }
}

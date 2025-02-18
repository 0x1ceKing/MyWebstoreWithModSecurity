package com.web.entity;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.web.enums.Paytype;
import lombok.Getter;
import lombok.Setter;

import jakarta.persistence.*;
import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "invoice")
@Getter
@Setter
public class Invoice {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    private Date createdDate;

    private Time createdTime;

    private Double totalAmount;

    private String receiverName;

    private String phone;

    private String address;

    private String note;

    @Enumerated(EnumType.STRING)
    private Paytype payType;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "status_id")
    private Status status;

    @OneToMany(mappedBy = "invoice", cascade = CascadeType.REMOVE)
    private List<InvoiceDetail> invoiceDetails;
}

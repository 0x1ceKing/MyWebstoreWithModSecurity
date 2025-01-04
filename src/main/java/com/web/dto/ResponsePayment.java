package com.web.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ResponsePayment {
    private String url;

    public String getUrl() {
        return url;
    }

    private String orderId;
    private String requestId;
    public ResponsePayment(String url, String orderId, String requestId) {
        this.url = url;
        this.orderId = orderId;
        this.requestId = requestId;
    }


}


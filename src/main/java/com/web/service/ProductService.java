package com.web.service;

import com.web.dto.ProductSpecification;
import com.web.entity.Product;
import com.web.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;

    public Page<Product> findAll(Pageable pageable){
        Page<Product> page = productRepository.findAll(pageable);
        return page;
    }

    public Product findById(Long id){
        if(id == null) return null;
        return productRepository.findById(id).get();
    }

    public Page<Product> searchFull(List<Long> cate, Double small, Double large, Pageable pageable) {
        ProductSpecification productSpecification = new ProductSpecification(cate, small, large);
        return productRepository.findAll(productSpecification, pageable);
    }

    public Page<Product> searchParam(String param, Pageable pageable) {
        param = "%"+param+"%";
        return productRepository.findByParam(param, pageable);
    }
}

package com.web.utils;

import com.web.entity.User;
import com.web.repository.CartRepository;
import com.web.repository.CategoryRepository;
import com.web.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.ui.Model;

@ControllerAdvice
public class GlobalModelAttributes {

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private UserUtils userUtils;

    @Autowired
    private CartRepository cartRepository;

    @ModelAttribute
    public void addGlobalAttributes(Model model) {
        model.addAttribute("danhMucListGlobal", categoryRepository.findAll());
        model.addAttribute("soLuongGhGlobal", 0);
        model.addAttribute("sanPhamBanChayGlobal", productRepository.productBestSell());

        User user = userUtils.getUserWithAuthority();
        if (user != null){
            model.addAttribute("soLuongGhGlobal", cartRepository.soLuongGh(user.getId()));
        }
        else{
            model.addAttribute("soLuongGhGlobal", 0);
        }
    }
}

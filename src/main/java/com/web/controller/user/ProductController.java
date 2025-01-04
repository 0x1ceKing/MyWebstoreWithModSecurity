package com.web.controller.user;

import com.web.entity.Product;
import com.web.repository.InstructRepository;
import com.web.repository.ProductRepository;
import com.web.service.ProductService;
import com.web.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller(value = "userProductController")
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private InstructRepository instructRepository;

    @Autowired
    private UserUtils userUtils;

    private Integer size = 10;

    @RequestMapping(value = {"/detail"}, method = RequestMethod.GET)
    public String detail(Model model, @RequestParam(required = false) Long id) {
        if(id == null){
            return "redirect:/index";
        }
        Product product = productService.findById(id);
        model.addAttribute("sanPham",product);
        model.addAttribute("sanPhamLienQuan", productRepository.findByCategory(product.getCategory().getId()));
        if(userUtils.getUserWithAuthority() != null){
            model.addAttribute("iduser",userUtils.getUserWithAuthority().getId());
        }
        return "user/detail";
    }

    @RequestMapping(value = {"/index","/"}, method = RequestMethod.GET)
    public String index(Model model, Pageable pageable) {
        pageable = PageRequest.of(pageable.getPageNumber(), size, pageable.getSort());
        Page<Product> page = productService.findAll(pageable);
        model.addAttribute("sanPhamList", page.getContent());
        model.addAttribute("tongSoTrang", page.getTotalPages());
        model.addAttribute("pageable", pageable);
        model.addAttribute("lastBlog", instructRepository.lastInstruct());
        model.addAttribute("lastBlog", instructRepository.lastInstruct().get());
        model.addAttribute("listBlog", instructRepository.getInstructIndex());
        return "user/index";
    }

    @RequestMapping(value = {"/product"}, method = RequestMethod.GET)
    public String product(@RequestParam(required = false) Double smallPrice, @RequestParam(required = false) Double largePrice,
                          @RequestParam(required = false) List<Long> category, Model model, Pageable pageable) {
        pageable = PageRequest.of(pageable.getPageNumber(), size, pageable.getSort());
        Page<Product> page = productService.searchFull(category, smallPrice, largePrice, pageable);
        model.addAttribute("sanPhamList", page.getContent());
        model.addAttribute("tongSoTrang", page.getTotalPages());
        model.addAttribute("pageable", pageable);
        if(category != null){
            model.addAttribute("categories", category);
        }
        if(smallPrice != null && largePrice != null){
            model.addAttribute("smallPrice", smallPrice);
            model.addAttribute("largePrice", largePrice);
        }
        return "user/product.html";
    }

    @RequestMapping(value = {"/search"}, method = RequestMethod.GET)
    public String search(@RequestParam(required = false) String search,Model model, Pageable pageable) {
        pageable = PageRequest.of(pageable.getPageNumber(), size, pageable.getSort());
        Page<Product> page = productService.searchParam(search, pageable);
        model.addAttribute("sanPhamList", page.getContent());
        model.addAttribute("tongSoTrang", page.getTotalPages());
        model.addAttribute("pageable", pageable);
        return "user/search.html";
    }


}

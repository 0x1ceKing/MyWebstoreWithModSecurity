package com.web.controller.user;

import com.web.entity.Cart;
import com.web.entity.Product;
import com.web.entity.ProductComment;
import com.web.entity.User;
import com.web.repository.CartRepository;
import com.web.repository.ProductCommentRepository;
import com.web.repository.ProductRepository;
import com.web.utils.UserUtils;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.sql.Date;
import java.sql.Time;
import java.util.List;
import java.util.Optional;

@Controller
public class CommentController {

    @Autowired
    private ProductCommentRepository productCommentRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private UserUtils userUtils;

    @PostMapping("/add-comment")
    public String add(RedirectAttributes redirectAttributes, HttpServletRequest request,
                      @RequestParam String noiDung, @RequestParam Long id){
        User user = userUtils.getUserWithAuthority();
        Product sanPham = productRepository.findById(id).get();
        ProductComment gh = new ProductComment();
        gh.setProduct(sanPham);
        gh.setUser(user);
        gh.setContent(noiDung);
        gh.setCreatedDate(new Date(System.currentTimeMillis()));
        gh.setCreatedTime(new Time(System.currentTimeMillis()));
        productCommentRepository.save(gh);
        redirectAttributes.addFlashAttribute("message", "Đã đăng tải bình luận của bạn!");
        String referer = request.getHeader("Referer");
        return "redirect:" + referer;
    }

    @GetMapping("/delete-comment")
    public String delete(RedirectAttributes redirectAttributes, @RequestParam("id") Long id, HttpServletRequest request){
        productCommentRepository.deleteById(id);
        redirectAttributes.addFlashAttribute("message", "Xóa bình luận thành công!");
        String referer = request.getHeader("Referer");
        return "redirect:" + referer;
    }
}

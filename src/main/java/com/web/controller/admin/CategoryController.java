package com.web.controller.admin;

import com.web.entity.Category;
import com.web.repository.CategoryRepository;
import com.web.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin")
public class CategoryController {

    @Autowired
    private CategoryRepository categoryRepository;
    @Autowired
    private ProductRepository productRepository;

    @RequestMapping(value = {"/danhmuc"}, method = RequestMethod.GET)
    public String danhmuc(Model model) {
        model.addAttribute("listcate", categoryRepository.findAll());
        return "admin/danhmuc";
    }

//    @PostMapping(value = {"/addcategory"})
//    public String addcategory(@RequestParam String name, RedirectAttributes redirectAttributes) {
//        Category category = new Category();
//        category.setName(name);
//        categoryRepository.save(category);
//        redirectAttributes.addFlashAttribute("message", "Thêm danh mục thành công!");
//        return "redirect:/admin/danhmuc";
//    }
@PostMapping(value = {"/addcategory"})
public String addCategory(@RequestParam String name, RedirectAttributes redirectAttributes) {
    // Kiểm tra xem danh mục đã tồn tại trong hệ thống chưa
    if (categoryRepository.findByName(name) != null) {
        // Nếu danh mục đã tồn tại, gửi thông báo lỗi
        redirectAttributes.addFlashAttribute("error", "Không thể thêm danh mục! Danh mục này đã tồn tại trong hệ thống.");

    } else {
        // Nếu chưa tồn tại, lưu danh mục mới
        Category category = new Category();
        category.setName(name);
        categoryRepository.save(category);
        redirectAttributes.addFlashAttribute("message", "Thêm danh mục thành công!");
    }
    return "redirect:/admin/danhmuc";
}


    @PostMapping(value = {"/updatecategory"})
    public String updatecategory(@RequestParam String name, @RequestParam Long id, RedirectAttributes redirectAttributes) {
        Category category = categoryRepository.findById(id).get();
        category.setName(name);
        categoryRepository.save(category);
        redirectAttributes.addFlashAttribute("message", "Cập nhật danh mục thành công!");
        return "redirect:/admin/danhmuc";
    }

    @GetMapping(value = {"/deletecategory"})
    public String deletecategory(@RequestParam Long id, RedirectAttributes redirectAttributes) {
        try {
            categoryRepository.deleteById(id);
        }catch (Exception e){
            redirectAttributes.addFlashAttribute("error", "Danh mục đã có liên kết, không thể xóa!");
            return "redirect:/admin/danhmuc";
        }
        redirectAttributes.addFlashAttribute("message", "Xóa danh mục thành công!");
        return "redirect:/admin/danhmuc";
    }
    @GetMapping(value = {"/searchByCategory"})
    public String searchByCategory(@RequestParam(required = false) Long categoryId, Model model) {
        if (categoryId != null) {
            Category category = categoryRepository.findById(categoryId).orElse(null);
            if (category != null) {
                model.addAttribute("products", productRepository.findByCategory(category));
            } else {
                model.addAttribute("error", "Danh mục không tồn tại.");
            }
            model.addAttribute("selectedCategory", categoryId); // Lưu ID danh mục đã chọn
        }
        model.addAttribute("listcate", categoryRepository.findAll());
        return "admin/danhmuc";
    }



}
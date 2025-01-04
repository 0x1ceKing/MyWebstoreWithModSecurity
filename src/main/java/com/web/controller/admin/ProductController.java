package com.web.controller.admin;

import com.web.entity.Product;
import com.web.entity.ProductImage;
import com.web.repository.CategoryRepository;
import com.web.repository.ProductImageRepository;
import com.web.repository.ProductRepository;
import com.web.utils.CloudinaryService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.sql.Timestamp;
import java.util.List;

@Controller(value = "adminProductController")
@RequestMapping("/admin")
public class ProductController {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private ProductImageRepository productImageRepository;

    @Autowired
    private CloudinaryService cloudinaryService;


    @RequestMapping(value = {"/product"}, method = RequestMethod.GET)
    public String product(Model model, @RequestParam(required = false) Long category) {
        if(category != null){
            if(category == -1) category = null;
        }
        List<Product> list = null;
        if(category == null){
            list = productRepository.findAll();
        }
        else{
            list = productRepository.findByCategory(category);
        }
        model.addAttribute("listProduct", list);
        model.addAttribute("category", category);
        model.addAttribute("listCategory", categoryRepository.findAll());
        return "admin/product";
    }

    @RequestMapping(value = {"/addproduct"}, method = RequestMethod.GET)
    public String addproduct(Model model,@RequestParam(required = false) Long id) {
        if(id == null){
            model.addAttribute("product", new Product());
            model.addAttribute("type", "add");
        }
        else{
            model.addAttribute("product", productRepository.findById(id).get());
            model.addAttribute("type", "update");
        }
        model.addAttribute("danhMucList", categoryRepository.findAll());
        return "admin/addproduct";
    }
    @RequestMapping(value = {"/updateproduct"}, method = RequestMethod.GET)
    public String updateproduct(Model model,@RequestParam(required = false) Long id) {
        if(id == null){
            model.addAttribute("product", new Product());
            model.addAttribute("type", "add");
        }
        else{
            model.addAttribute("product", productRepository.findById(id).get());
            model.addAttribute("type", "update");
        }
        model.addAttribute("danhMucList", categoryRepository.findAll());
        return "admin/updateproduct";
    }

    @PostMapping("/add-san-pham")
    public String postSanPham(@ModelAttribute("product") Product product,
                              @RequestParam("imgbanner") MultipartFile imgbanner,
                              @RequestParam("listfile") List<MultipartFile> listfile,
                              BindingResult bindingResult,
                              RedirectAttributes redirectAttributes) {

        // Kiểm tra mã sản phẩm đã tồn tại không phân biệt chữ hoa chữ thường
        if (product.getCode() != null && productRepository.existsByCodeIgnoreCase(product.getCode())) {
            bindingResult.rejectValue("code", "error.code", "Mã sản phẩm đã tồn tại!");
        }

        // Kiểm tra nếu có lỗi, trả lại form với lỗi
        if (bindingResult.hasErrors()) {
            return "admin/addproduct"; // Trả về form khi có lỗi
        }

        // Logic lưu sản phẩm
        String img = "";
        product.setCreatedDate(new Timestamp(System.currentTimeMillis()));
        product.setQuantitySold(0);
        if (product.getId() != null) {
            Product ex = productRepository.findById(product.getId()).get();
            product.setCreatedDate(new Timestamp(System.currentTimeMillis()));
            product.setQuantitySold(ex.getQuantitySold());
            img = ex.getImageBanner();
        }
        if (!imgbanner.isEmpty()) {
            img = cloudinaryService.uploadFile(imgbanner);
        }
        product.setImageBanner(img);
        productRepository.save(product);

        List<String> list = cloudinaryService.uploadMultiFile(listfile);
        for (String s : list) {
            ProductImage anhSanPham = new ProductImage();
            anhSanPham.setLinkImage(s);
            anhSanPham.setProduct(product);
            productImageRepository.save(anhSanPham);
        }

        redirectAttributes.addFlashAttribute("message", "Upload sản phẩm thành công!");
        return "redirect:/admin/product";
    }



    @GetMapping("/delete-sanpham")
    public String deleteSanPham(@RequestParam("id") Long id, RedirectAttributes redirectAttributes){
        try {
            productRepository.deleteById(id);
        }
        catch (Exception e){
            Product p = productRepository.findById(id).get();
            p.setDeleted(true);
            productRepository.save(p);
        }
        redirectAttributes.addFlashAttribute("message", "Xóa sản phẩm thành công!");
        return "redirect:/admin/product";
    }

    @GetMapping("/delete-anh-sanpham")
    public String deleteAnhSanPham(@RequestParam("id") Long id, RedirectAttributes redirectAttributes, HttpServletRequest request){
        productImageRepository.deleteById(id);
        redirectAttributes.addFlashAttribute("message", "Xóa ảnh thành công!");
        String referer = request.getHeader("Referer");
        return "redirect:" + referer;
    }
}

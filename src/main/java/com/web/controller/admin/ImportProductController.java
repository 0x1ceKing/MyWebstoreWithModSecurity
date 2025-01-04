package com.web.controller.admin;

import com.web.entity.ImportProduct;
import com.web.entity.Instruct;
import com.web.entity.Product;
import com.web.repository.ImportProductRepository;
import com.web.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class ImportProductController {

    @Autowired
    private ImportProductRepository importProductRepository;

    @Autowired
    private ProductRepository productRepository;

    @RequestMapping(value = {"/importproduct"}, method = RequestMethod.GET)
    public String importproduct(Model model, @RequestParam(required = false)Date fromDate,@RequestParam(required = false)Date toDate ) {
        Timestamp from = null;
        Timestamp to = null;
        List<ImportProduct> list = null;
        if(fromDate == null || toDate == null){
            from = new Timestamp(Date.valueOf("2000-01-01").getTime());
            to = new Timestamp(Date.valueOf("2100-01-01").getTime());
        }
        else{
            from = new Timestamp(fromDate.getTime());
            to = new Timestamp(toDate.getTime());
        }
        model.addAttribute("listImp", importProductRepository.findByDate(from, to));
        return "admin/importproduct";
    }

    @RequestMapping(value = {"/addimportproduct"}, method = RequestMethod.GET)
    public String addimportproduct(Model model, @RequestParam(required = false) Long id) {
        model.addAttribute("importProduct", new ImportProduct());
        model.addAttribute("listProduct", productRepository.findAllDesc());
        if(id != null){
            model.addAttribute("importProduct", importProductRepository.findById(id).get());
        }
        return "admin/addimportproduct";
    }

    @PostMapping(value = {"/addimportproduct"})
    public String add(@ModelAttribute ImportProduct importProduct, @RequestParam Long productId,RedirectAttributes redirectAttributes) {
        Product product = productRepository.findById(productId).get();
        if(importProduct.getId() == null){
            importProduct.setImportDate(new Timestamp(System.currentTimeMillis()));
            importProduct.setProduct(product);
            product.setQuantity(product.getQuantity() + importProduct.getQuantity());
            importProductRepository.save(importProduct);
            productRepository.save(product);
        }
        else{
            ImportProduct imp = importProductRepository.findById(importProduct.getId()).get();
            product.setQuantity(product.getQuantity() - imp.getQuantity());
            product.setQuantity(product.getQuantity() + importProduct.getQuantity());
            productRepository.save(product);
            importProduct.setProduct(product);
            importProduct.setImportDate(imp.getImportDate());
            importProductRepository.save(importProduct);
        }
        importProductRepository.save(importProduct);
        redirectAttributes.addFlashAttribute("message", "Thêm nhập hàng thành công!");
        return "redirect:/admin/importproduct";
    }


    @GetMapping(value = {"/deleteimportproduct"})
    public String delete(@RequestParam Long id, RedirectAttributes redirectAttributes) {
        ImportProduct imp = importProductRepository.findById(id).get();
        Product product = imp.getProduct();
        product.setQuantity(product.getQuantity() - imp.getQuantity());
        if(product.getQuantity() < 0){
            redirectAttributes.addFlashAttribute("error", "Số lượng sản phẩm không thể nhỏ hơn 0!");
            return "redirect:/admin/importproduct";
        }
        productRepository.save(product);
        importProductRepository.deleteById(id);
        redirectAttributes.addFlashAttribute("message", "Xóa nhập hàng thành công!");
        return "redirect:/admin/importproduct";
    }
}

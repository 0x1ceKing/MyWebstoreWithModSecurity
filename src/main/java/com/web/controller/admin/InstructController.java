package com.web.controller.admin;
import com.web.entity.Category;
import com.web.entity.Instruct;
import com.web.repository.InstructRepository;
import com.web.utils.CloudinaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.sql.Date;

@Controller
@RequestMapping("/admin")
public class InstructController {

    @Autowired
    private InstructRepository instructRepository;

    @Autowired
    private CloudinaryService cloudinaryService;

    @RequestMapping(value = {"/instruct"}, method = RequestMethod.GET)
    public String instruct(Model model) {
        model.addAttribute("listInstruct", instructRepository.findAllDesc());
        return "admin/instruct";
    }

    @RequestMapping(value = {"/addinstruct"}, method = RequestMethod.GET)
    public String addinstruct(Model model, @RequestParam(required = false) Long id) {
        model.addAttribute("instruct", new Instruct());
        if(id != null){
            model.addAttribute("instruct", instructRepository.findById(id).get());
        }
        return "admin/addinstruct";
    }

    @PostMapping(value = {"/addinstruct"})
    public String add(@ModelAttribute Instruct instruct, @RequestParam MultipartFile file, RedirectAttributes redirectAttributes) {
        if(instruct.getId() != null){
            Instruct ex = instructRepository.findById(instruct.getId()).get();
            instruct.setCreatedDate(ex.getCreatedDate());
            instruct.setNumView(ex.getNumView());
            instruct.setImageBanner(ex.getImageBanner());
        }
        else{
            instruct.setCreatedDate(new Date(System.currentTimeMillis()));
            instruct.setNumView(0);
        }
        if (!file.isEmpty()) {
            String img = cloudinaryService.uploadFile(file);
            instruct.setImageBanner(img);
        }
        instructRepository.save(instruct);
        redirectAttributes.addFlashAttribute("message", "Thêm bài viết thành công!");
        return "redirect:/admin/instruct";
    }

    @GetMapping(value = {"/deleteinstruct"})
    public String delete(@RequestParam Long id, RedirectAttributes redirectAttributes) {
        instructRepository.deleteById(id);
        redirectAttributes.addFlashAttribute("message", "Xóa bài viết thành công!");
        return "redirect:/admin/instruct";
    }
}

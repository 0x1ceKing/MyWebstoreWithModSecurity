package com.web.controller.user;

import com.web.entity.Instruct;
import com.web.entity.Product;
import com.web.repository.InstructRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller(value = "userInstructController")
public class InstructController {

    @Autowired
    private InstructRepository instructRepository;

    private Integer size = 10;

    @RequestMapping(value = {"/blog"}, method = RequestMethod.GET)
    public String blog(Model model, @RequestParam(required = false) String search, Pageable pageable) {
        pageable = PageRequest.of(pageable.getPageNumber(), size, pageable.getSort());
        if(search == null) search = "";
        search = "%"+search+"%";
        Page<Instruct> page = instructRepository.findByParam(search,pageable);
        model.addAttribute("blogList", page.getContent());
        model.addAttribute("tongSoTrang", page.getTotalPages());
        model.addAttribute("pageable", pageable);
        return "user/instruction";
    }

    @RequestMapping(value = {"/chitietblog"}, method = RequestMethod.GET)
    public String chiTietBlog(Model model, @RequestParam Long id, Pageable pageable) {
        model.addAttribute("blog", instructRepository.findById(id).get());
        return "user/instruction-detail";
    }
}

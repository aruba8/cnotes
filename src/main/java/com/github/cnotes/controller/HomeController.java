package com.github.cnotes.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Map;

@Controller
public class HomeController {

    @GetMapping("/")
    public String index() {
        return "index";
    }


}

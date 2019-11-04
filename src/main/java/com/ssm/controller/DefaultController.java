package com.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
public class DefaultController {
    @RequestMapping("/")
    public String index() {
        return "forward:/shouye";
    }

    @GetMapping("/helloHtml")
    public String helloHtml(Map<String,Object> map){
        map.put("hello","你好");
        return "html/test";
    }
}

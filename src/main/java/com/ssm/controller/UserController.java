package com.ssm.controller;


import com.ssm.model.User;
import com.ssm.tool.SensitiveWordsFilter;
import com.ssm.tool.Shuru;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {


    @RequestMapping("/login")
    public void login(User user, HttpServletRequest request){
        HttpSession session = request.getSession();
        //String prePath = (String)session.getAttribute("preLink");
        //prePath = replacePath(prePath);
        //user.setUserName(SensitiveWordsFilter.replace(user.getUserName()));
        session.setAttribute("userName",user.getUserName());
        session.setAttribute("userEmail",user.getUserEmail());
        //return "redirect:"+prePath;
    }

    @RequestMapping("/cancellation")
    public void cancellation(HttpServletRequest request, HttpServletResponse response){
       // HttpSession session = request.getSession();
        //session.removeAttribute("userName");
       // session.removeAttribute("userEmail");
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }

    }

    private String replacePath(String path){
        if(path==null){
            return path="/shouye";
        }
        if(path.equals("/resources_download")){
            path = "/resources";
        } else if(path.contains("good")){
            String[] s = path.split("/");
            path = "/article/details/"+s[3];
        } else {
            path = "/shouye";
        }
        return path;
    }
}

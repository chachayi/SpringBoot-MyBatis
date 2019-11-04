package com.ssm.security;

import com.ssm.tool.Shuru;
import com.ssm.tool.SpringSessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Service
public class MyUserDatailService implements UserDetailsService {

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        System.out.println(username+"aa");
       HttpServletRequest request = SpringSessionUtil.request;
        HttpSession session = request.getSession();
        session.setAttribute("userName",username);
        //session.setAttribute("userEmail",user.getUserEmail());

        if (session.getAttribute("userName") == "null") {
            throw new UsernameNotFoundException("该用户不存在");
        }

        // 获取用户的角色
        List<GrantedAuthority> authorities = new ArrayList<>();
        // 角色必须以`ROLE_`开头
        authorities.add(new SimpleGrantedAuthority("ROLE_user"));

        //user类继承UserDetails，它具有密码，用户名，权限等信息
        return new User(
                //(String) session.getAttribute("userName"),
                username,
                // 密码不加密
                "123",
                // user.getPassword(),
                authorities
        );
    }
}
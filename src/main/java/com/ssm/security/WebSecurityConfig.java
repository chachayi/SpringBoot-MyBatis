package com.ssm.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true) // 开启方法级安全验证，否则controller中的方法不会被拦截
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private MyUserDatailService userDatailService;

    /**
     * 指定加密方式
     */
    @Bean
    public PasswordEncoder passwordEncoder(){
        // 使用BCrypt加密密码
        //return new BCryptPasswordEncoder();
      return new PasswordEncoder() {
           @Override
            public String encode(CharSequence charSequence) {
                return charSequence.toString();
            }

           @Override
           public boolean matches(CharSequence charSequence, String s) {
               return s.equals(charSequence.toString());
           }
        };
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth
                .userDetailsService(userDatailService)
                .passwordEncoder(passwordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers("/resources_download").authenticated() // 请求需要验证
                .anyRequest().permitAll() // 允许post请求/add-user访问
                .and()
                .formLogin()//开启formLogin默认配置
                .loginPage("/login")
                .loginProcessingUrl("/user/login")
                .defaultSuccessUrl("/resources",true)//登录成功跳转接口
                .and()
                .logout()   //退出登录相关配置
                .logoutUrl("/cancellation")   //自定义退出登录页面
                //.logoutSuccessHandler(new CoreqiLogoutSuccessHandler()) //退出成功后要做的操作（如记录日志），和logoutSuccessUrl互斥
                //.logoutSuccessUrl("/index") //退出成功后跳转的页面
                //.deleteCookies("JSESSIONID")    //退出时要删除的Cookies的名字

                .and()
                .csrf().disable();// post请求要关闭csrf验证,不然访问报错
    }

    @Override
    public void configure(WebSecurity web) {
        //解决静态资源被拦截的问题
        web.ignoring().antMatchers("/static/**");
    }
    }
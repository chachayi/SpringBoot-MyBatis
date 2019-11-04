package com.ssm;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.ssm.dao")
public class NewssmApplication {
    public static void main(String[] args) {
        SpringApplication.run(NewssmApplication.class, args);
    }
}

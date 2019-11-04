package com.ssm.tool;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;


    public class SpringSessionUtil {
        public static HttpServletRequest request = null;
        static{
            ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
            request = requestAttributes.getRequest();
        }

    }


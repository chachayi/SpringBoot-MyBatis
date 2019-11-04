package com.ssm.controller;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

@Controller
public class ToolController {

    //下载方法一
    /*
    ResponseEntity标识整个http相应：状态码、头部信息以及相应体内容。因此我们可以使用其对http响应实现完整配置
    */
    @RequestMapping("/resources_download")
    public ResponseEntity<byte[]> export(String fileName) throws IOException {
        HttpHeaders headers = new HttpHeaders();
        File file = new File(this.getClass().getClassLoader().getResource("resources/"+fileName).getPath());

        String downloadFileName = new String(fileName.getBytes("UTF-8"),"iso-8859-1");//设置编码
        //设置下载的附件 (myFileName必须处理中文名称哦!)
        headers.setContentDispositionFormData("attachment", downloadFileName);
        //设置MIME类型
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        //用FileUpload组件的FileUtils读取文件，并构建成ResponseEntity<byte[]>返回给浏览器
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
                headers, HttpStatus.CREATED);
    }
    //下载方法二
    @RequestMapping("/resources_download2")
    public ResponseEntity<byte[]> download(HttpServletRequest request, String fileName) throws IOException {
        byte[] body = null;
        InputStream is = getClass().getClassLoader().getResourceAsStream("resources/"+fileName);//读取文件流
        body = new byte[is.available()];
        is.read(body);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "attchement;filename=" + fileName);
        HttpStatus statusCode = HttpStatus.OK;
        ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(body, headers, statusCode);
        return entity;
    }

}

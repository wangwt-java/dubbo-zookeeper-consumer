package com.jk.controller;

import com.jk.util.FTPUtils;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.Date;

/**
 * Created by Administrator on 2018/4/23 0023.
 */
@Controller
@RequestMapping("/uploadImage")
public class uploadImage {

    @RequestMapping("/fileuploadBrnadLogo")
    @ResponseBody
    public Object fileuploadBrnadLogo(MultipartFile rankimg) throws FileNotFoundException {
        CommonsMultipartFile cf = (CommonsMultipartFile)rankimg;
        //这个rankimg是MultipartFile的
        DiskFileItem fi = (DiskFileItem) cf.getFileItem();
        File file = fi.getStoreLocation();
        //获取时间戳
        long timeprint = new Date().getTime() / 1000;
        FTPUtils instance = FTPUtils.getInstance();
        boolean open = instance.open();
        if (open) {
            String imagePath =  "xx_brand"+timeprint+".jpg";
            boolean upload = instance.upload("xx_brand"+timeprint+".jpg", "image", new FileInputStream(file));
            System.out.println(upload);
        }
        return 1;
    }
}
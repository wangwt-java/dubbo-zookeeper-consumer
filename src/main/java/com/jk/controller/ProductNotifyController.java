package com.jk.controller;

import com.jk.model.ProductNotify;
import com.jk.service.ProductNotifyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/4/17 0017.
 */
@Controller
@RequestMapping("/productNotifyController")
public class ProductNotifyController {

    @Autowired
    private ProductNotifyService productNotifyService;

    @RequestMapping("/toProductNotifyJsp")
    public String toProductNotifyJsp(){
        return "WEB-INF/view/productNotify/productNotify";
    }

    @RequestMapping("/selectProductNotifyList")
    @ResponseBody
    public List<ProductNotify> selectProductNotifyList(ProductNotify productNotify){
        List<ProductNotify> productNotifyList = productNotifyService.selectProductNotifyList(productNotify);
        return productNotifyList;
    }

    @RequestMapping("/selectProductNotifyListPage")
    @ResponseBody
    public Map<String,Object> selectProductNotifyListPage(ProductNotify productNotify, Integer page, Integer rows){
        if (page == null || page<=0){
            page = 1;
        }
        if (rows == null || rows<=0){
            rows = 3;
        }
        //开始位置 = 页数 * （每页条数 - 1） +1
        Integer startPos = page * (rows - 1)+1;
        //结束位置 = 页数*每页的条数
        Integer endPos = page * rows;
        Map<String,Object> map = new HashMap<String, Object>();
        Long count = productNotifyService.selectProductNotifyCount(productNotify);
        List<ProductNotify> productNotifys = productNotifyService.selectProductNotifyListPage(productNotify,startPos,endPos);
        map.put("total",count);
        map.put("rows",productNotifys);
        return map;
    }

    @RequestMapping("/deleteProductNotifyByPrimaryKeys")
    @ResponseBody
    public Integer deleteProductNotifyByPrimaryKeys(String ids){
        return productNotifyService.deleteProductNotifyByPrimaryKeys(ids);
    }
}

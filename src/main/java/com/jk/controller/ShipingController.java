package com.jk.controller;

import com.alibaba.fastjson.JSONObject;
import com.jk.model.Shipping;
import com.jk.service.ShipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by wzh on 2018/4/13.
 */
@Controller
@RequestMapping("shipping")
public class ShipingController {

    @Autowired
    private ShipService shipService;

    /**
     *跳转到显示页面
     */
    @RequestMapping("/toshiplist")
    public String toshiplist(){
        return "WEB-INF/order/shiplist";
    }

    //查询列表
    @RequestMapping("/queryPaymentList")
    @ResponseBody
    public Object queryPaymentList(Shipping shipping,int page,int rows){
        JSONObject json = shipService.queryPaymentList(shipping,page,rows);
        return json;
    }
    //批量删除
    @RequestMapping("deleteshipbuids")
    public void deleteshipbuids(String ids){
        shipService.deleteshipbuids(ids);
    }
}

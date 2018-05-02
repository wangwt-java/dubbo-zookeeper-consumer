package com.jk.controller;

import com.alibaba.fastjson.JSONObject;
import com.jk.model.Returns;
import com.jk.service.ReturnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by wzh on 2018/4/13.
 */
@Controller
@RequestMapping("returns")
public class ReturnController {

    @Autowired
    private ReturnService returnService;

    /**
     *跳转到显示页面
     */
    @RequestMapping("/toreturnslist")
    public String toreturnslist(){
        return "WEB-INF/order/returnslist";
    }

    //查询列表
    @RequestMapping("/queryReturnsList")
    @ResponseBody
    public Object queryReturnsList(Returns returns,int page ,int rows){
        JSONObject json = returnService.queryReturnsList(returns,page,rows);
        return json;
    }
    //批量删除
    @RequestMapping("deletereturnsbuids")
    public void deletereturnsbuids(String ids){
        returnService.deletereturnsbuids(ids);
    }
}

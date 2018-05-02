package com.jk.controller;


import com.alibaba.fastjson.JSONObject;
import com.jk.model.Refunds;
import com.jk.service.RefundsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by wzh on 2018/4/13.
 */
@Controller
@RequestMapping("refunds")
public class RefundsController {

    @Autowired
    private RefundsService refundsService;

    /*跳转到展示页面
    * */
    @RequestMapping("toRefundsList")
    public String toRefundsList(){
        return "WEB-INF/order/refundslist";
    }

    /*查询refunds列表
    * */
    @RequestMapping("queryRefundsList")
    @ResponseBody
    public Object queryRefundsList(Refunds refunds,int page,int rows){
        JSONObject jsonObject = refundsService.queryRefundsList(refunds,page,rows);
        return jsonObject;
    }
    //批量删除
    @RequestMapping("deleterefundsbyids")
    public void deleterefundsbyids(String ids){
        refundsService.deleterefundsbyids(ids);
    }
}

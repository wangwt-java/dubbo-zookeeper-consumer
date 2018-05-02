package com.jk.controller;

import com.alibaba.fastjson.JSONObject;
import com.jk.model.Order;
import com.jk.model.Payment;
import com.jk.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by wzh on 2018/4/10.
 */
@Controller
@RequestMapping("/orderController")
public class OrderController  extends BaseController{
    @Autowired
    private OrderService orderService;

    /**
     *跳转到显示页面
     */
    @RequestMapping("/toorderlist")
    public String toorderlist(){
        return "WEB-INF/order/orderlist";
    }
    /**
     *跳转到添加页面
     */
    @RequestMapping("/toaddorder")
    public String toaddorder(){
        return "WEB-INF/order/addorder";
    }
    /**
     * 用户列表查询
     * @param
     */
    @RequestMapping("/orderlist")
    @ResponseBody
    public Object orderlist(Order order, int page,int rows) {
        JSONObject orderlist = orderService.orderlist(order,page,rows);
        return orderlist;
    }

    @RequestMapping("/deleteorder")
    @ResponseBody
    public String deleteorder(String ids) {

        Long count = orderService.deleteorder(ids);

        return count+"";
    }
    /**
     * payment收款单//跳转展示页面
     */

    @RequestMapping("/topaymenetlist")
    public String toShowMemberRank(){
        return "WEB-INF/order/paymentlist";
    }

    //查询列表
    @RequestMapping("/queryPaymentList")
    @ResponseBody
    public Object queryPaymentList(Payment payment,int page,int rows){
        JSONObject json = orderService.queryPaymentList(payment,page,rows);
        return json;
    }
}

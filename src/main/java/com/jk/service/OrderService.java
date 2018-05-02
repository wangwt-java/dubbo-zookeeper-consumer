package com.jk.service;

import com.alibaba.fastjson.JSONObject;
import com.jk.model.Order;
import com.jk.model.Payment;

/**
 * Created by wzh on 2018/4/9.
 */
public interface OrderService {


    public JSONObject orderlist(Order order, int page, int rows);

    Long deleteorder(String ids);

    JSONObject queryPaymentList(Payment payment, int page, int rows);
}

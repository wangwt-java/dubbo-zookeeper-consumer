package com.jk.service;

import com.alibaba.fastjson.JSONObject;
import com.jk.model.Shipping;

/**
 * Created by wzh on 2018/4/13.
 */
public interface ShipService {
    JSONObject queryPaymentList(Shipping shipping, Integer page, Integer rows);

    void deleteshipbuids(String ids);
}

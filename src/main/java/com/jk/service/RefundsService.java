package com.jk.service;

import com.alibaba.fastjson.JSONObject;
import com.jk.model.Refunds;

/**
 * Created by wzh on 2018/4/13.
 */
public interface RefundsService {
    JSONObject queryRefundsList(Refunds refunds, int page, int rows);

    void deleterefundsbyids(String ids);
}

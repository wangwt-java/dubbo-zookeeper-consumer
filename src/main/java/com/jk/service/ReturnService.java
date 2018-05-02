package com.jk.service;

import com.alibaba.fastjson.JSONObject;
import com.jk.model.Returns;

/**
 * Created by wzh on 2018/4/13.
 */
public interface ReturnService {

    JSONObject queryReturnsList(Returns returns, int page, int row);

    void deletereturnsbuids(String ids);
}

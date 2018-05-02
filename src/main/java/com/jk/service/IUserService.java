package com.jk.service;

import com.alibaba.fastjson.JSONObject;
import com.jk.model.User;

import java.util.List;
import java.util.Map;

/**
 * Created by yangzhichao on 2018-04-03.
 */
public interface IUserService {

    /**
     * 用户列表查询
     * @param user
     * @return
     */
    public List<User> userList(User user);

    Map<String,Object> login(User user);

    JSONObject queryLog(Integer page, Integer rows);
}

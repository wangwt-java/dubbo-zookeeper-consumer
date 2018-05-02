package com.jk.controller;

import com.alibaba.dubbo.common.json.JSONObject;
import com.alibaba.fastjson.JSON;
import com.jk.model.Tree;
import com.jk.service.TreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by Administrator on 2018/4/9 0009.
 */
@Controller
@RequestMapping("tree")
public class TreeController {
    @Autowired
    private TreeService treeService;

    @RequestMapping(value="queryTree")
    @ResponseBody
    public List<Tree> queryTree(Integer selectedpid){
        List<Tree> trees = treeService.queryTree(selectedpid);
        return trees;
    }
}

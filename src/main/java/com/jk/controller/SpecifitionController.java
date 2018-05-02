package com.jk.controller;

import com.jk.model.Specifition;
import com.jk.service.SpecifitionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/4/17 0017.
 */
@Controller
@RequestMapping("/specifitionController")
public class SpecifitionController {

    @Autowired
    private SpecifitionService specifitionService;

    @RequestMapping("/toSpecifitionJsp")
    public String toSpecifitionJsp(){
        return "WEB-INF/view/specifition/specifition";
    }

    @RequestMapping("/selectSpecifitionList")
    @ResponseBody
    public List<Specifition> selectSpecifitionList(Specifition specifition){
        List<Specifition> specifitionList = specifitionService.selectSpecifitionList(specifition);
        return specifitionList;
    }

    @RequestMapping("/selectSpecifitionPage")
    @ResponseBody
    public Map<String,Object> selectSpecifitionPage(Specifition specifition, Integer page, Integer rows){
        if (page == null || page<=0){
            page = 1;
        }
        if (rows == null || rows<=0){
            rows = 3;
        }
        //开始位置 = 页数 * （每页条数 - 1） +1
        Integer startPos = page * (rows - 1)+1;
        //结束位置 = 页数*每页的条数
        Integer endPos = page * rows;
        Map<String,Object> map = new HashMap<String, Object>();
        Long count = specifitionService.selectSpecifitionCount(specifition);
        List<Specifition> specifitions = specifitionService.selectSpecifitionPage(specifition,startPos,endPos);
        map.put("total",count);
        map.put("rows",specifitions);
        return map;
    }

    @RequestMapping("/deleteSpecifitionByPrimaryKeys")
    @ResponseBody
    public Integer deleteSpecifitionByPrimaryKeys(String ids){
        return specifitionService.deleteSpecifitionByPrimaryKeys(ids);
    }
}

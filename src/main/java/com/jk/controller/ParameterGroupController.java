package com.jk.controller;

import com.jk.model.ParameterGroup;
import com.jk.service.ParameterGroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/4/14 0014.
 */
@Controller
@RequestMapping("/parameterGroupController")
public class ParameterGroupController {

    @Autowired
    private ParameterGroupService parameterGroupService;


    @RequestMapping("/toParameterJsp")
    public String toParameterJsp(){
        return "WEB-INF/view/parameter/parameter";
    }

    @RequestMapping("/selectParameterGroupList")
    @ResponseBody
    public List<ParameterGroup> selectParameterGroupList(ParameterGroup parameterGroup){
        List<ParameterGroup> parameterGroupList = parameterGroupService.selectParameterGroupList(parameterGroup);
        return parameterGroupList;
    }


    @RequestMapping("/selectParameterGroupPage")
    @ResponseBody
    public Map<String,Object> selectParameterGroupPage(ParameterGroup parameterGroup, Integer page, Integer rows){
        if (page == null || page<=0){
            page = 1;
        }
        if (rows == null || rows<=0){
            rows = 10;
        }
        //开始位置 = 页数 * （每页条数 - 1） +1
        //Integer startPos = page * (rows - 1)+1;
        Integer startPos = page * (rows - 1);
        //结束位置 = 页数*每页的条数
        Integer endPos = page * rows;
        Map<String,Object> map = new HashMap<String, Object>();
        Long count = parameterGroupService.selectParameterGroupCount(parameterGroup);
        List<ParameterGroup> parameterGroups = parameterGroupService.selectParameterGroupPage(parameterGroup,startPos,endPos);
        map.put("total",count);
        map.put("rows",parameterGroups);
        return map;
    }

    @RequestMapping("/deleteByPrimaryKey")
    @ResponseBody
    public Integer deleteByPrimaryKey(ParameterGroup parameterGroup){
        return parameterGroupService.deleteByPrimaryKey(parameterGroup.getId());
    }

    @RequestMapping("/deleteParametersByPrimaryKeys")
    @ResponseBody
    public Integer deleteParametersByPrimaryKeys(String ids){
        return parameterGroupService.deleteParametersByPrimaryKeys(ids);
    }

    @RequestMapping("/insertSelective")
    @ResponseBody
    public Integer insertSelective(String createDate,Integer productCategory,String name,Integer orders) throws ParseException {
        ParameterGroup parameterGroup = new ParameterGroup();
        parameterGroup.setOrders(Long.valueOf(orders));
        parameterGroup.setName(name);
        parameterGroup.setProductCategory(BigDecimal.valueOf(productCategory));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        parameterGroup.setCreateDate(sdf.parse(createDate));
        parameterGroup.setModifyDate(new Date());
        return parameterGroupService.insertSelective(parameterGroup);
    }

    @RequestMapping("/selectByPrimaryKey")
    @ResponseBody
    public ParameterGroup selectByPrimaryKey(Integer id){
        ParameterGroup rePrameterGroup = parameterGroupService.selectByPrimaryKey(BigDecimal.valueOf(id));
        return rePrameterGroup;
    }

    @RequestMapping("/updateByPrimaryKeySelective")
    @ResponseBody
    public Integer updateByPrimaryKeySelective(String createDate, Integer id,Integer productCategory,String name,Integer orders) throws ParseException {
        ParameterGroup parameterGroup2 = new ParameterGroup();
        parameterGroup2.setId(BigDecimal.valueOf(id));
        parameterGroup2.setOrders(Long.valueOf(orders));
        parameterGroup2.setName(name);
        parameterGroup2.setProductCategory(BigDecimal.valueOf(productCategory));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        parameterGroup2.setCreateDate(sdf.parse(createDate));
        parameterGroup2.setModifyDate(new Date());
        return parameterGroupService.updateByPrimaryKeySelective(parameterGroup2);
    }
}

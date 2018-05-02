package com.jk.controller;

import com.jk.model.Attribute;
import com.jk.service.AttributeService;
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
 * Created by Administrator on 2018/4/15 0015.
 */
@Controller
@RequestMapping("/attributeController")
public class AttributeController {

    @Autowired
    private AttributeService attributeService;

    @RequestMapping("/toAttributeJsp")
    public String toAttributeJsp(){
        return "WEB-INF/view/attribute/attribute";
    }

    @RequestMapping("/selectAttributeList")
    @ResponseBody
    public List<Attribute> selectAttributeList(Attribute attribute){
        List<Attribute> attributeList = attributeService.selectAttributeList(attribute);
        return attributeList;
    }

    @RequestMapping("/selectAttributePage")
    @ResponseBody
    public Map<String,Object> selectAttributePage(Attribute attribute, Integer page, Integer rows){
        if (page == null || page<=0){
            page = 1;
        }
        if (rows == null || rows<=0){
            rows = 10;
        }
        //开始位置 = 页数 * （每页条数 - 1） +1
        Integer startPos = page * (rows - 1)+1;
        //结束位置 = 页数*每页的条数
        Integer endPos = page * rows;
        Map<String,Object> map = new HashMap<String, Object>();
        Long count = attributeService.selectAttributeCount(attribute);
        List<Attribute> attributes = attributeService.selectAttributePage(attribute,startPos,endPos);
        map.put("total",count);
        map.put("rows",attributes);
        return map;
    }

    @RequestMapping("/deleteAttributeByPrimaryKeys")
    @ResponseBody
    public Integer deleteAttributeByPrimaryKeys(String ids){
        return attributeService.deleteAttributeByPrimaryKeys(ids);
    }

    @RequestMapping("/insertSelective")
    @ResponseBody
    public Integer insertSelective(Integer productCategory,String name,Integer orders){
        Attribute attribute = new Attribute();
        attribute.setProductCategory(BigDecimal.valueOf(productCategory));
        attribute.setName(name);
        attribute.setOrders(Long.valueOf(orders));
        attribute.setCreateDate(new Date());
        attribute.setModifyDate(new Date());
        attribute.setPropertyIndex(Long.valueOf(0));
        return attributeService.insertSelective(attribute);
    }

    @RequestMapping("/selectByPrimaryKey")
    @ResponseBody
    public Attribute selectByPrimaryKey(Integer id){
        Attribute reAttribute =  attributeService.selectByPrimaryKey(BigDecimal.valueOf(id));
        return reAttribute;
    }

    @RequestMapping("/updateByPrimaryKeySelective")
    @ResponseBody
    public Integer updateByPrimaryKeySelective(Integer id,String createDate,Integer productCategory,String name,Integer orders) throws ParseException {
        Attribute attribute2 = new Attribute();
        attribute2.setId(BigDecimal.valueOf(id));
        attribute2.setProductCategory(BigDecimal.valueOf(productCategory));
        attribute2.setName(name);
        attribute2.setOrders(Long.valueOf(orders));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        attribute2.setCreateDate(sdf.parse(createDate));
        attribute2.setModifyDate(new Date());
        attribute2.setPropertyIndex(Long.valueOf(0));
        return attributeService.updateByPrimaryKeySelective(attribute2);
    }
}

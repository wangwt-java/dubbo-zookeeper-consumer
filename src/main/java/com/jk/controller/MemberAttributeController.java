package com.jk.controller;

import com.alibaba.fastjson.JSONObject;
import com.jk.model.MemberAttribute;
import com.jk.service.MemberAttributeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/memberAttribute")
public class MemberAttributeController {

    @Autowired
    private MemberAttributeService memberAttributeService;

    //跳转展示页面
    @RequestMapping("/toShowMemberAttribute")
    public String toShowMemberRank(){
        return "WEB-INF/view/member/memberattribute/showMemberAttribute";
    }

    //查询
    @RequestMapping("/queryMemberAttributeListPager")
    @ResponseBody
    public Object queryMemberAttributeListPager(){
        JSONObject json = memberAttributeService.queryMemberAttributeListPager();
        return json;
    }

    //跳转添加页面
    @RequestMapping("/toaddMemberAttribute")
    public String toaddMemberAttribute(){
        return "WEB-INF/view/member/memberattribute/addMemberAttribute";
    }

    //添加
    @RequestMapping("/addMemberAttribute")
    @ResponseBody
    public Object addMemberAttribute(MemberAttribute memberAttribute){
        Integer i = memberAttributeService.addMemberAttribute(memberAttribute);
        return i;
    }

    //跳转修改页面
    @RequestMapping("/toupdateMemberAttribute")
    public ModelAndView toupdateMemberAttribute(Integer id){
        ModelAndView mav = new ModelAndView();
        mav.addObject("id",id);
        mav.setViewName("WEB-INF/view/member/memberattribute/updateMemberAttribute");
        return mav;
    }

    //根据id查询
    @RequestMapping("/queryMemberAttributeByid")
    @ResponseBody
    public Object queryMemberAttributeByid(MemberAttribute memberAttribute){
        memberAttribute = memberAttributeService.queryMemberAttributeByid(memberAttribute);
        return memberAttribute;
    }

    //修改
    @RequestMapping("/updateMemberAttribute")
    @ResponseBody
    public Object updateMemberAttribute(MemberAttribute memberAttribute){
        Integer i = memberAttributeService.updateMemberAttribute(memberAttribute);
        return i;
    }

    //删除
    @RequestMapping("/deleteMemberAttribute")
    @ResponseBody
    public Object deleteMemberAttribute(String ids){
        Integer i = memberAttributeService.deleteMemberAttribute(ids);
        return i;
    }

}

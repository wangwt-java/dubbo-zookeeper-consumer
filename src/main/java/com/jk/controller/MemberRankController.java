package com.jk.controller;

import com.alibaba.fastjson.JSONObject;
import com.jk.model.MemberRank;
import com.jk.service.MemberRankService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/memberRank")
public class MemberRankController {

    @Autowired
    private MemberRankService memberRankService;

    //跳转展示页面
    @RequestMapping("/toShowMemberRank")
    public String toShowMemberRank(){

        return "WEB-INF/view/member/memberrank/showMembersRank";
    }

    //查询列表
    @RequestMapping("/queryMemberRankListPager")
    @ResponseBody
    public Object queryMemberRankListPager(){
        JSONObject json = memberRankService.queryMemberRankListPager();
        return json;
    }

    //跳转添加页面
    @RequestMapping("/toaddMemberRank")
    public String toaddMemberRank(){
        return "WEB-INF/view/member/memberrank/addMemberRank";
    }

    //添加
    @RequestMapping("/addMemberRank")
    @ResponseBody
    public Object addMemberRank(MemberRank memberrank){
        Integer i = memberRankService.addMemberRank(memberrank);
        return i;
    }

//    //跳转修改页面
//    @RequestMapping("/toupdateMemberRank")
//    public ModelAndView toupdateMemberRank(String mrid){
//        ModelAndView mav=new ModelAndView();
//        mav.setViewName("WEB-INF/view/member/memberrank/updateMemberRank");
//        mav.addObject("mrid",mrid);
//        return mav;
//    }

    //修改前查询回显
    @RequestMapping("/queryMemberRankById")
    public ModelAndView queryMemberRankById(MemberRank memberrank){
        ModelAndView mav=new ModelAndView();
        memberrank = memberRankService.queryMemberRankById(memberrank);
        mav.setViewName("WEB-INF/view/member/memberrank/updateMemberRank");
        mav.addObject("memberrank",memberrank);
        return mav;
    }

//    //修改前查询回显
//    @RequestMapping("/queryMemberRankById")
//    @ResponseBody
//    public Object queryMemberRankById(MemberRank memberrank){
//        memberrank = memberRankService.queryMemberRankById(memberrank);
//        return memberrank;
//    }

    //修改
    @RequestMapping("/updateMemberRank")
    @ResponseBody
    public Object updateMemberRank(MemberRank memberrank){
        Integer i = memberRankService.updateMemberRank(memberrank);
        return i;
    }

    //删除
    @RequestMapping("/deleteMemberRank")
    @ResponseBody
    public Object deleteMemberRank(String ids){
        Integer i = memberRankService.deleteMemberRank(ids);
        return i;
    }

}

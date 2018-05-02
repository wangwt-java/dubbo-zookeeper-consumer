package com.jk.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.jk.model.User;
import com.jk.service.IUserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by yangzhichao on 2018-04-03.
 */
@Controller
@RequestMapping("/userController")
public class UserController{
    //日志记录
    private static final Logger logger = Logger.getLogger(UserController.class);
    ModelAndView mav = new ModelAndView();

    @Autowired
    private IUserService userService;

    /**
     * 用户列表查询
     * @param user
     */
    //返回freemarker模板
 /*   @RequestMapping("/userList")
    public String userList(Model model, User user) {
        List<User> userList = userService.userList(user);
        String dateFormat = JSON.toJSONStringWithDateFormat(userList, "yyyy-MM-dd");
        model.addAttribute("users",userList);
        return "index";
    }*/

    //登陆
    @RequestMapping(value="login")
    @ResponseBody
    public Integer login(User user,String vali,HttpServletRequest request,HttpSession session){
        Integer flag = 0 ;
        //生成验证码时放入session的值
        String code = (String)request.getSession().getAttribute("rand");
//		从map中get出来登录结果 进行判断
        //用前台用户输入的验证码与生成的验证码比较
        if(vali.equals(code)){
            //正确时，调用查询方法
            Map<String, Object> map = userService.login(user);
            flag = (Integer) map.get("flag");
            if(flag == 2){
//			如果是登录成功
//			从map中get出来用户对象 存到session中
                User loginUser = (User) map.get("userInfo");
                session.setAttribute("loginName", loginUser.getName());
                session.setAttribute("loginID", loginUser.getId());
                session.setAttribute("loginUser", loginUser);
            }
            return flag;
        }else{
            //失败返回
            flag = 3;
            return flag;
        }
    }

    //登陆成功跳转至主页面
    @RequestMapping("toIndex")
    public ModelAndView toIndex(HttpSession session){
        String loginName = (String) session.getAttribute("loginName");
        mav.addObject("loginName",loginName);
        mav.setViewName("index");
        return mav;
    }

    //注销
    @RequestMapping("logout")
    public void logout(HttpSession session,HttpServletResponse response,HttpServletRequest request) throws IOException {
        session.removeAttribute("loginUser");
        //response.sendRedirect("login.jhtml");
        session.invalidate();
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
    //跳转到日志记录页面
    @RequestMapping("toLogList")
    public ModelAndView toLogList(HttpSession session){
        String loginName = (String) session.getAttribute("loginName");
        mav.addObject("loginName",loginName);
        mav.setViewName("logList");
        return mav;
    }
    //查询mongodb的记录日志
    @RequestMapping("queryLog")
    @ResponseBody
    public JSONObject queryLog(Integer page, Integer rows){
        return userService.queryLog(page, rows);
    }

}

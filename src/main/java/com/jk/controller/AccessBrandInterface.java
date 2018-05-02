package com.jk.controller;

import com.jk.model.Brand;
import com.jk.util.HttpClient;
import org.springframework.asm.Type;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2018/4/20 0020.
 */
@Controller
@RequestMapping("/accessBrandInterface")
public class AccessBrandInterface extends BaseController{

    @RequestMapping("/selectBrandList")
    public void selectBrandList(HttpServletResponse response,String name){
        String url = "http://localhost:8901/brandController/findBrandList";
        Map<String,String> params = new HashMap<String,String>();
        params.put("name",name);
        HttpClient client = new HttpClient();
        String result = client.get(url,params);
        super.ajaxOut(result,response);
    }

    @RequestMapping(value="deleteBrandByPrimaryKeys")
    @ResponseBody
    public String deleteBrandByPrimaryKeys(String ids){
        String url = "http://localhost:8901/brandController/deleteBrandByIds";
        Map<String,String> params = new HashMap<String,String>();
        params.put("ids",ids);
        HttpClient client = new HttpClient();
        String result = client.get(url,params);
        //String jsonString = JSON.toJSONString(result);
        System.out.println(result);
        return result;
    }

    //"name":name,"type":type,"logo":logo,"orders":orders,"introduction":introduction
    @RequestMapping(value="insertBrand")
    @ResponseBody
    public String insertBrand(String createDate, String name,String urls, Integer type,String logo,Integer orders, String introduction){
        String url = "http://localhost:8901/brandController/insertBrand";
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("orders",orders);
        params.put("name",name);
        params.put("url",urls);
        params.put("createDate",createDate);
        params.put("logo",logo);
        params.put("introduction",introduction);
        params.put("type",type);
        HttpClient client = new HttpClient();
        String result = client.post(url,params);
        System.out.println(result);
        return result;
    }

    @RequestMapping("/selectBrandById")
    public void selectBrandById(HttpServletResponse response,Integer id){
        String url = "http://localhost:8901/brandController/findBrandById";
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("id",id);
        HttpClient client = new HttpClient();
        String result = client.get(url,params);
        super.outString(result,response);
    }

    @RequestMapping(value="updateBrandById")
    @ResponseBody
    public String updateBrandById(String createDate, Integer id,String name,String urls, Integer type,String logo,Integer orders, String introduction){
        String url = "http://localhost:8901/brandController/updateBrandById";
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("id",id);
        params.put("url",urls);
        params.put("createDate",createDate);
        params.put("orders",orders);
        params.put("name",name);
        params.put("logo",logo);
        params.put("introduction",introduction);
        params.put("type",type);
        HttpClient client = new HttpClient();
        String result = client.post(url,params);
        System.out.println(result);
        return result;
    }
}

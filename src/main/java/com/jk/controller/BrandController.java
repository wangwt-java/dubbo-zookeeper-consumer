package com.jk.controller;

import com.jk.model.Brand;
import com.jk.service.BrandService;
import com.jk.util.ConstantsBean;
import com.jk.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/4/13 0013.
 */
@Controller
@RequestMapping("/brandController")
public class BrandController {

    @Autowired
    private BrandService brandService;

    @RequestMapping("/toBrandJsp")
    public String toBrandJsp(){
        return "WEB-INF/view/brand/brand";
    }

    @RequestMapping("/selectBrandList")
    @ResponseBody
    public List<Brand> selectBrandList(Brand brand){
        List<Brand> brandList = brandService.selectBrandList(brand);
        return brandList;
    }

    /**
     * 上传图片
     * @param file
     * @return
     */
    /*@RequestMapping(value="fileuploadBrnadLogo")
    @ResponseBody
    public String fileupload(@RequestParam MultipartFile file){
        String upFile = FileUtil.upFile(file, ConstantsBean.IMG_PATH);
        return ConstantsBean.IMG_SERVER_PATH+upFile;
    }*/

    /**
     * 分页条件查询
     * @return
     */
    @RequestMapping("/selectBrandListPage")
    @ResponseBody
    public Map<String,Object> selectBrandListPage(Brand brand, Integer page, Integer rows){
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
        Long count = brandService.selectBrandCount(brand);
        List<Brand> brands = brandService.selectBrandPage(brand,startPos,endPos);
        map.put("total",count);
        map.put("rows",brands);
        return map;
    }
    /**
     * 单删
     * @param id
     * @return
     */
    @RequestMapping("/deleteByPrimaryKey")
    @ResponseBody
    public Integer deleteByPrimaryKey(Integer id){
        return brandService.deleteByPrimaryKey(BigDecimal.valueOf(id));
    }

    /**
     * 添加
     * @param brand
     * @return
     */
    @RequestMapping("/insertSelective")
    @ResponseBody
    public Integer insertSelective(Brand brand){
        return brandService.insertSelective(brand);
    }

    /**
     * 修改
     * @param brand
     * @return
     */
    @RequestMapping("/updateByPrimaryKeySelective")
    @ResponseBody
    public Integer updateByPrimaryKeySelective(Brand brand){
        return brandService.updateByPrimaryKeySelective(brand);
    }

    /**
     * 单查
     * @param id
     * @return
     */
    @RequestMapping("/selectByPrimaryKey")
    @ResponseBody
    public Brand selectByPrimaryKey(Integer id){
        Brand reBrand = brandService.selectByPrimaryKey(BigDecimal.valueOf(id));
        return reBrand;
    }

    @RequestMapping("/deleteBrandByPrimaryKeys")
    @ResponseBody
    public Integer deleteBrandByPrimaryKeys(String ids){
        return brandService.deleteBrandByPrimaryKeys(ids);
    }
}

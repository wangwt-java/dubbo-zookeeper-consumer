package com.jk.controller;

import com.jk.model.Product;
import com.jk.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 王文通
 * Created by Administrator on 2018/4/8 0008.
 */

@Controller
@RequestMapping("/productController")
public class ProductController {

    @Autowired
    private ProductService productService;

    @RequestMapping("/toProductJsp")
    public String toProductJsp(){
        return "WEB-INF/view/product/product";
    }

    @RequestMapping("/selectProductList")
    @ResponseBody
    public List<Product> selectProductList(Product product){
        List<Product> productList = productService.selectProductList(product);
        return productList;
    }

    /**
     * 条件分页查询
     * @param product
     * @param page
     * @param rows
     * @return
     */
    @RequestMapping("/selectProductPage")
    @ResponseBody
    public  Map<String,Object> selectProductPage(Product product, Integer page, Integer rows){
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
        Long count = productService.selectProductCount(product);
        List<Product> productList = productService.selectProductPage(product,startPos,endPos);
        map.put("total",count);
        map.put("rows",productList);
        return map;
    }

    /**
     * 根据id查询
     * @param product
     * @return
     */
    @RequestMapping("/selectByPrimaryKey")
    @ResponseBody
    public Product selectByPrimaryKey(Product product){
        Product reProduct = productService.selectByPrimaryKey(product.getId());
        return reProduct;
    }

    /**
     * 查询回显
     * @param product
     * @return
     */
    @RequestMapping("/editProductById")
    @ResponseBody
    public Product editProductById(Product product){
        Product reUpdateProduct = productService.selectByPrimaryKey(product.getId());
        return reUpdateProduct;
    }

    @RequestMapping("/toAddProductJsp")
    public String toAddProductJsp(){
        return "WEB-INF/view/product/addProduct";
    }

    /**
     * 添加
     * @param product
     * @return
     */
    @RequestMapping("/insertSelective")
    @ResponseBody
    public Integer insertSelective(Product product){
        product.setCreateDate(new Date());
        product.setModifyDate(new Date());
        return productService.insertSelective(product);
    }

    /**
     * 单删
     * @param product
     * @return
     */
    @RequestMapping("/deleteByPrimaryKey")
    @ResponseBody
    public Integer deleteByPrimaryKey(Product product){
        return productService.deleteByPrimaryKey(product.getId());
    }

    /**
     * 修改
     * @param product
     * @return
     */
    @RequestMapping("/updateByPrimaryKeySelective")
    @ResponseBody
    public Integer updateByPrimaryKeySelective(Product product){
        return productService.updateByPrimaryKeySelective(product);
    }

    /**
     * 批删
     * @param ids
     * @return
     */
    @RequestMapping("/deleteByPrimaryKeys")
    @ResponseBody
    public Integer deleteByPrimaryKeys(String ids){
        return productService.deleteByPrimaryKeys(ids);
    }
}

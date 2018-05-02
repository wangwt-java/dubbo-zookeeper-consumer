package com.jk.controller;

import com.jk.model.ProductCategory;
import com.jk.service.ProductCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2018/4/9 0009.
 */

/**
 * ProductCategoryController
 */
@Controller
@RequestMapping("/productCategoryController")
public class ProductCategoryController {

    @Autowired
    private ProductCategoryService productCategoryService;

    @RequestMapping("/toProductCategory")
    public String toProductCategory(){
        return "WEB-INF/view/productCategory/productCategory";
    }


    /**
     * 查询集合
     */
    @RequestMapping("/selectProductCategory")
    @ResponseBody
    public List<ProductCategory> selectProductCategory(){
        List<ProductCategory> productCategoryList = productCategoryService.selectProductCategory();
        return productCategoryList;
    }

    @RequestMapping("/selectProductCategoryTree")
    @ResponseBody
    public List<ProductCategory> selectProductCategoryTree(){
        List<ProductCategory> relist = productCategoryService.selectProductCategoryTree();
        return relist;
    }

    /**
     * 根据ID删除
     * @param id
     * @return
     */
    @RequestMapping("/deleteByPrimaryKey")
    @ResponseBody
    public Integer deleteByPrimaryKey(Integer id){
        return productCategoryService.deleteByPrimaryKey(BigDecimal.valueOf(id));
    }

    /**
     * 添加
     * @param name
     * @param createTime
     * @param parent
     * @param seoTitle
     * @param seoKeyworks
     * @param orders
     * @param seoDescription
     * @return
     */
    @RequestMapping("/insertSelective")
    @ResponseBody
    public Integer insertSelective(String name,String createDate,String treePath, Integer parent,String seoTitle,String seoKeyworks,Integer orders,String seoDescription){
        ProductCategory productCategory = new ProductCategory();
        productCategory.setParent(BigDecimal.valueOf(parent));
        productCategory.setName(name);
        productCategory.setOrders(Long.valueOf(orders));
        productCategory.setSeoDescription(seoDescription);
        productCategory.setSeoKeywords(seoKeyworks);
        productCategory.setSeoTitle(seoTitle);
        productCategory.setTreePath(treePath);
        if (parent == null || parent==0){
            productCategory.setGrade((long) 0);
        }else{
            ProductCategory reProductCategory2 =  productCategoryService.selectByPrimaryKey(BigDecimal.valueOf(parent));
            productCategory.setGrade(reProductCategory2.getGrade()+1);
        }
        productCategory.setModifyDate(new Date());
        productCategory.setCreateDate(new Date());
        return productCategoryService.insertSelective(productCategory);
    }

    /**
     * 单个查询
     * @param id
     */
    @RequestMapping("/selectByPrimaryKey")
    @ResponseBody
    public ProductCategory selectByPrimaryKey(Integer id){
        ProductCategory reProductCategory =  productCategoryService.selectByPrimaryKey(BigDecimal.valueOf(id));
        return reProductCategory;
    }

    /**
     * 查询回显
     * @param id
     * @return
     */
    @RequestMapping("/selectProductCategorParentyByPrimaryKey")
    @ResponseBody
    public ProductCategory selectProductCategorParentyByPrimaryKey(Integer id){
        ProductCategory reProductCategory =  productCategoryService.selectByPrimaryKey(BigDecimal.valueOf(id));
        if(reProductCategory.getParent()==null || reProductCategory.getParent().equals(0)){
            reProductCategory.setText("顶级分类");
        }else{
            ProductCategory reParentProductCategor = productCategoryService.selectByPrimaryKey(reProductCategory.getParent());
            reProductCategory.setText(reParentProductCategor.getName());
        }
        return reProductCategory;
    }

    /**
     * 根据ID修改
     * @param id
     * @param name
     * @param createDate
     * @param treePath
     * @param parent
     * @param seoTitle
     * @param seoKeyworks
     * @param orders
     * @param seoDescription
     * @return
     */
    @RequestMapping("/updateByPrimaryKeySelective")
    @ResponseBody
    public Integer updateByPrimaryKeySelective(String brandIds,Integer id, String name,String createDate,String treePath, Integer parent,String seoTitle,String seoKeyworks,Integer orders,String seoDescription) throws ParseException {
        ProductCategory productCategory2 = new ProductCategory();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        productCategory2.setId(BigDecimal.valueOf(id));
        productCategory2.setParent(BigDecimal.valueOf(parent));
        productCategory2.setName(name);
        productCategory2.setOrders(Long.valueOf(orders));
        productCategory2.setSeoDescription(seoDescription);
        productCategory2.setSeoKeywords(seoKeyworks);
        productCategory2.setSeoTitle(seoTitle);
        productCategory2.setTreePath(treePath);
        //productCategory.setCreateDate(sdf.parse(createTime));
        if (parent== null || parent==0){
            productCategory2.setGrade((long) 0);
        }else{
            ProductCategory reProductCategory2 =  productCategoryService.selectByPrimaryKey(BigDecimal.valueOf(parent));
            productCategory2.setGrade(reProductCategory2.getGrade()+1);
        }
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
        productCategory2.setModifyDate(new Date());
        productCategory2.setCreateDate(sdf1.parse(createDate));
        return productCategoryService.updateByPrimaryKeySelective(brandIds,productCategory2);
    }
}

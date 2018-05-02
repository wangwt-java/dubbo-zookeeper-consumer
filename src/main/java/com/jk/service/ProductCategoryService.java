package com.jk.service;

import com.jk.model.ProductCategory;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by Administrator on 2018/4/9 0009.
 */
public interface ProductCategoryService {

    int deleteByPrimaryKey(BigDecimal id);

    int insert(ProductCategory record);

    int insertSelective(ProductCategory record);

    ProductCategory selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(String brandIds, ProductCategory record);

    int updateByPrimaryKey(ProductCategory record);

    List<ProductCategory> selectProductCategory();

    List<ProductCategory> selectProductCategoryTree();
}

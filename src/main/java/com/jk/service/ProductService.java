package com.jk.service;

import com.jk.model.Product;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by Administrator on 2018/4/8 0008.
 */
public interface ProductService {

    int deleteByPrimaryKey(BigDecimal id);

    int insert(Product record);

    int insertSelective(Product record);

    Product selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKeyWithBLOBs(Product record);

    int updateByPrimaryKey(Product record);

    Long selectProductCount(Product product);

    List<Product> selectProductPage(Product product, Integer startPos, Integer endPos);

    Integer deleteByPrimaryKeys(String ids);

    List<Product> selectProductList(Product product);
}

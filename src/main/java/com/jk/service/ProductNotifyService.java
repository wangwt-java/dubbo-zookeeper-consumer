package com.jk.service;

import com.jk.model.ProductNotify;

import java.math.BigDecimal;
import java.util.List;

public interface ProductNotifyService {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(ProductNotify record);

    int insertSelective(ProductNotify record);

    ProductNotify selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(ProductNotify record);

    int updateByPrimaryKey(ProductNotify record);

    Long selectProductNotifyCount(ProductNotify productNotify);

    List<ProductNotify> selectProductNotifyListPage(ProductNotify productNotify, Integer startPos, Integer endPos);

    Integer deleteProductNotifyByPrimaryKeys(String ids);

    List<ProductNotify> selectProductNotifyList(ProductNotify productNotify);
}
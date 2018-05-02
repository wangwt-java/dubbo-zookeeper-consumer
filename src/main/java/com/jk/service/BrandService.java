package com.jk.service;

import com.jk.model.Brand;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by Administrator on 2018/4/13 0013.
 */
public interface BrandService {

    int deleteByPrimaryKey(BigDecimal id);

    int insert(Brand record);

    int insertSelective(Brand record);

    Brand selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(Brand record);

    int updateByPrimaryKeyWithBLOBs(Brand record);

    int updateByPrimaryKey(Brand record);

    List<Brand> selectBrandList(Brand brand);

    Long selectBrandCount(Brand brand);

    List<Brand> selectBrandPage(Brand brand, Integer startPos, Integer endPos);

    Integer deleteBrandByPrimaryKeys(String ids);
}

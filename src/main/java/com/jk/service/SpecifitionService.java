package com.jk.service;

import com.jk.model.Specifition;

import java.math.BigDecimal;
import java.util.List;

public interface SpecifitionService {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(Specifition record);

    int insertSelective(Specifition record);

    Specifition selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(Specifition record);

    int updateByPrimaryKey(Specifition record);

    Long selectSpecifitionCount(Specifition specifition);

    List<Specifition> selectSpecifitionPage(Specifition specifition, Integer startPos, Integer endPos);

    Integer deleteSpecifitionByPrimaryKeys(String ids);

    List<Specifition> selectSpecifitionList(Specifition specifition);
}
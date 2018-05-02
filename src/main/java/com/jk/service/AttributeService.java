package com.jk.service;

import com.jk.model.Attribute;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by Administrator on 2018/4/15 0015.
 */
public interface AttributeService {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(Attribute record);

    int insertSelective(Attribute record);

    Attribute selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(Attribute record);

    int updateByPrimaryKey(Attribute record);

    Long selectAttributeCount(Attribute attribute);

    List<Attribute> selectAttributePage(Attribute attribute, Integer startPos, Integer endPos);

    Integer deleteAttributeByPrimaryKeys(String ids);

    List<Attribute> selectAttributeList(Attribute attribute);
}

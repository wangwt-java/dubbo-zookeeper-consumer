package com.jk.service;

import com.jk.model.ParameterGroup;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by Administrator on 2018/4/14 0014.
 */
public interface ParameterGroupService {

    int deleteByPrimaryKey(BigDecimal id);

    int insert(ParameterGroup record);

    int insertSelective(ParameterGroup record);

    ParameterGroup selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(ParameterGroup record);

    int updateByPrimaryKey(ParameterGroup record);

    Long selectParameterGroupCount(ParameterGroup parameterGroup);

    List<ParameterGroup> selectParameterGroupPage(ParameterGroup parameterGroup, Integer startPos, Integer endPos);

    Integer deleteParametersByPrimaryKeys(String ids);

    List<ParameterGroup> selectParameterGroupList(ParameterGroup parameterGroup);
}

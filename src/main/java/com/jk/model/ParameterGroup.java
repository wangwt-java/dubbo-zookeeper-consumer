package com.jk.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ParameterGroup implements Serializable{
    private static final long serialVersionUID = 3931854661169107587L;
    private BigDecimal id;

    private Date createDate;

    private Date modifyDate;

    private Long orders;

    private String name;

    private BigDecimal productCategory;

    private String parameterGroupParameter;

    private String parameterGroupCategory;

    public String getParameterGroupParameter() {
        return parameterGroupParameter;
    }

    public void setParameterGroupParameter(String parameterGroupParameter) {
        this.parameterGroupParameter = parameterGroupParameter;
    }

    public String getParameterGroupCategory() {
        return parameterGroupCategory;
    }

    public void setParameterGroupCategory(String parameterGroupCategory) {
        this.parameterGroupCategory = parameterGroupCategory;
    }

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public String getCreateDate() {
        if(createDate==null){
            return  null;
        }
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(createDate);
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    public Long getOrders() {
        return orders;
    }

    public void setOrders(Long orders) {
        this.orders = orders;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public BigDecimal getProductCategory() {
        return productCategory;
    }

    public void setProductCategory(BigDecimal productCategory) {
        this.productCategory = productCategory;
    }
}
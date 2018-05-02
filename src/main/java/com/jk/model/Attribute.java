package com.jk.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Attribute implements Serializable {
    private static final long serialVersionUID = 1552303379163776068L;

    private BigDecimal id;

    private Date createDate;

    private Date modifyDate;

    private Long orders;

    private String name;

    private Long propertyIndex;

    private BigDecimal productCategory;

    private String attributeOption;

    private String attributeCategory;

    public String getAttributeCategory() {
        return attributeCategory;
    }

    public void setAttributeCategory(String attributeCategory) {
        this.attributeCategory = attributeCategory;
    }

    public String getAttributeOption() {
        return attributeOption;
    }

    public void setAttributeOption(String attributeOption) {
        this.attributeOption = attributeOption;
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

    public Long getPropertyIndex() {
        return propertyIndex;
    }

    public void setPropertyIndex(Long propertyIndex) {
        this.propertyIndex = propertyIndex;
    }

    public BigDecimal getProductCategory() {
        return productCategory;
    }

    public void setProductCategory(BigDecimal productCategory) {
        this.productCategory = productCategory;
    }
}
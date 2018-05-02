package com.jk.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class SpecifitionValue implements Serializable{
    private static final long serialVersionUID = -6108870616099666888L;
    private BigDecimal id;

    private Date createDate;

    private Date modifyDate;

    private Long orders;

    private String image;

    private String name;

    private BigDecimal specification;

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public Date getCreateDate() {
        return createDate;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public BigDecimal getSpecification() {
        return specification;
    }

    public void setSpecification(BigDecimal specification) {
        this.specification = specification;
    }
}
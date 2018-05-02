package com.jk.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ProductNotify implements Serializable{
    private static final long serialVersionUID = 4305699542421865152L;
    private BigDecimal id;

    private Date createDate;

    private Date modifyDate;

    private String email;

    private Short hasSent;

    private BigDecimal member;

    private BigDecimal product;

    private String memberName;

    private String productName;

    private String productState;

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductState() {
        return productState;
    }

    public void setProductState(String productState) {
        this.productState = productState;
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

    public String getModifyDate() {
        if(modifyDate==null){
            return  null;
        }
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(modifyDate);
    }

    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Short getHasSent() {
        return hasSent;
    }

    public void setHasSent(Short hasSent) {
        this.hasSent = hasSent;
    }

    public BigDecimal getMember() {
        return member;
    }

    public void setMember(BigDecimal member) {
        this.member = member;
    }

    public BigDecimal getProduct() {
        return product;
    }

    public void setProduct(BigDecimal product) {
        this.product = product;
    }
}
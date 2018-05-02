package com.jk.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class ProductCategory implements Serializable{
    private static final long serialVersionUID = -8852097903575308457L;
    private BigDecimal id;

    private Date createDate;

    private Date modifyDate;

    private Long orders;

    private Long grade;

    private String name;

    private String seoDescription;

    private String seoKeywords;

    private String seoTitle;

    private String treePath;

    private BigDecimal parent;

    private List<ProductCategory> nodes;
    private String text;
    private BigDecimal pid;

    public BigDecimal getPid() {
        return pid;
    }

    public void setPid(BigDecimal pid) {
        this.pid = pid;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public List<ProductCategory> getNodes() {
        return nodes;
    }

    public void setNodes(List<ProductCategory> nodes) {
        this.nodes = nodes;
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

    public Long getGrade() {
        return grade;
    }

    public void setGrade(Long grade) {
        this.grade = grade;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getSeoDescription() {
        return seoDescription;
    }

    public void setSeoDescription(String seoDescription) {
        this.seoDescription = seoDescription == null ? null : seoDescription.trim();
    }

    public String getSeoKeywords() {
        return seoKeywords;
    }

    public void setSeoKeywords(String seoKeywords) {
        this.seoKeywords = seoKeywords == null ? null : seoKeywords.trim();
    }

    public String getSeoTitle() {
        return seoTitle;
    }

    public void setSeoTitle(String seoTitle) {
        this.seoTitle = seoTitle == null ? null : seoTitle.trim();
    }

    public String getTreePath() {
        return treePath;
    }

    public void setTreePath(String treePath) {
        this.treePath = treePath == null ? null : treePath.trim();
    }

    public BigDecimal getParent() {
        return parent;
    }

    public void setParent(BigDecimal parent) {
        this.parent = parent;
    }
}
package com.jk.model;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Review implements Serializable {
    private static final long serialVersionUID = 5645754733832283846L;

    private Integer id;

    private Date createDate;

    private Date modifyDate;

    private String content;

    private String ip;

    private Integer isShow;

    private Integer score;

    private Integer member;

    private Integer product;

    //业务字段
    private String membername;//会员名称

    private String productname;//会员名称

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public Integer getIsShow() {
        return isShow;
    }

    public void setIsShow(Integer isShow) {
        this.isShow = isShow;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getMember() {
        return member;
    }

    public void setMember(Integer member) {
        this.member = member;
    }

    public Integer getProduct() {
        return product;
    }

    public void setProduct(Integer product) {
        this.product = product;
    }

    public String getMembername() {
        return membername;
    }

    public void setMembername(String membername) {
        this.membername = membername;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    @Override
    public String toString() {
        return "Review{" +
                "id=" + id +
                ", createDate=" + createDate +
                ", modifyDate=" + modifyDate +
                ", content='" + content + '\'' +
                ", ip='" + ip + '\'' +
                ", isShow=" + isShow +
                ", score=" + score +
                ", member=" + member +
                ", product=" + product +
                ", membername='" + membername + '\'' +
                ", productname='" + productname + '\'' +
                '}';
    }
}
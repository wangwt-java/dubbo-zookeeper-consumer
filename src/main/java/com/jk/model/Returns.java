package com.jk.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class Returns implements Serializable{

    private static final long serialVersionUID = 7233269168594870543L;

    private BigDecimal id;

    private Date createDate;

    private Date modifyDate;

    private String address;

    private String area;

    private String deliveryCorp;

    private BigDecimal freight;

    private String memo;

    private String operator;

    private String phone;

    private String shipper;

    private String shippingMethod;

    private String sn;

    private String trackingNo;

    private String zipCode;

    private BigDecimal orders;

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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area == null ? null : area.trim();
    }

    public String getDeliveryCorp() {
        return deliveryCorp;
    }

    public void setDeliveryCorp(String deliveryCorp) {
        this.deliveryCorp = deliveryCorp == null ? null : deliveryCorp.trim();
    }

    public BigDecimal getFreight() {
        return freight;
    }

    public void setFreight(BigDecimal freight) {
        this.freight = freight;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator == null ? null : operator.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getShipper() {
        return shipper;
    }

    public void setShipper(String shipper) {
        this.shipper = shipper == null ? null : shipper.trim();
    }

    public String getShippingMethod() {
        return shippingMethod;
    }

    public void setShippingMethod(String shippingMethod) {
        this.shippingMethod = shippingMethod == null ? null : shippingMethod.trim();
    }

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn == null ? null : sn.trim();
    }

    public String getTrackingNo() {
        return trackingNo;
    }

    public void setTrackingNo(String trackingNo) {
        this.trackingNo = trackingNo == null ? null : trackingNo.trim();
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode == null ? null : zipCode.trim();
    }

    public BigDecimal getOrders() {
        return orders;
    }

    public void setOrders(BigDecimal orders) {
        this.orders = orders;
    }
}
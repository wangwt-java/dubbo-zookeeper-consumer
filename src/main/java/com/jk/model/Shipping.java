package com.jk.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class Shipping implements Serializable{

    private static final long serialVersionUID = 7941929840683545481L;
    private BigDecimal id;

    private Date createDate;

    private Date modifyDate;

    private String address;

    private String area;

    private String consignee;

    private String deliveryCorp;

    private String deliveryCorpCode;

    private String deliveryCorpUrl;

    private BigDecimal freight;

    private String memo;

    private String operator;

    private String phone;

    private String shippingMethod;

    private String sn;

    private String trackingNo;

    private String zipCode;

    private BigDecimal orders;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Shipping shipping = (Shipping) o;

        if (!getId().equals(shipping.getId())) return false;
        if (getCreateDate() != null ? !getCreateDate().equals(shipping.getCreateDate()) : shipping.getCreateDate() != null)
            return false;
        if (getModifyDate() != null ? !getModifyDate().equals(shipping.getModifyDate()) : shipping.getModifyDate() != null)
            return false;
        if (getAddress() != null ? !getAddress().equals(shipping.getAddress()) : shipping.getAddress() != null)
            return false;
        if (getArea() != null ? !getArea().equals(shipping.getArea()) : shipping.getArea() != null) return false;
        if (getConsignee() != null ? !getConsignee().equals(shipping.getConsignee()) : shipping.getConsignee() != null)
            return false;
        if (getDeliveryCorp() != null ? !getDeliveryCorp().equals(shipping.getDeliveryCorp()) : shipping.getDeliveryCorp() != null)
            return false;
        if (getDeliveryCorpCode() != null ? !getDeliveryCorpCode().equals(shipping.getDeliveryCorpCode()) : shipping.getDeliveryCorpCode() != null)
            return false;
        if (getDeliveryCorpUrl() != null ? !getDeliveryCorpUrl().equals(shipping.getDeliveryCorpUrl()) : shipping.getDeliveryCorpUrl() != null)
            return false;
        if (getFreight() != null ? !getFreight().equals(shipping.getFreight()) : shipping.getFreight() != null)
            return false;
        if (getMemo() != null ? !getMemo().equals(shipping.getMemo()) : shipping.getMemo() != null) return false;
        if (getOperator() != null ? !getOperator().equals(shipping.getOperator()) : shipping.getOperator() != null)
            return false;
        if (getPhone() != null ? !getPhone().equals(shipping.getPhone()) : shipping.getPhone() != null) return false;
        if (getShippingMethod() != null ? !getShippingMethod().equals(shipping.getShippingMethod()) : shipping.getShippingMethod() != null)
            return false;
        if (getSn() != null ? !getSn().equals(shipping.getSn()) : shipping.getSn() != null) return false;
        if (getTrackingNo() != null ? !getTrackingNo().equals(shipping.getTrackingNo()) : shipping.getTrackingNo() != null)
            return false;
        if (getZipCode() != null ? !getZipCode().equals(shipping.getZipCode()) : shipping.getZipCode() != null)
            return false;
        return getOrders() != null ? getOrders().equals(shipping.getOrders()) : shipping.getOrders() == null;

    }

    @Override
    public int hashCode() {
        int result = getId().hashCode();
        result = 31 * result + (getCreateDate() != null ? getCreateDate().hashCode() : 0);
        result = 31 * result + (getModifyDate() != null ? getModifyDate().hashCode() : 0);
        result = 31 * result + (getAddress() != null ? getAddress().hashCode() : 0);
        result = 31 * result + (getArea() != null ? getArea().hashCode() : 0);
        result = 31 * result + (getConsignee() != null ? getConsignee().hashCode() : 0);
        result = 31 * result + (getDeliveryCorp() != null ? getDeliveryCorp().hashCode() : 0);
        result = 31 * result + (getDeliveryCorpCode() != null ? getDeliveryCorpCode().hashCode() : 0);
        result = 31 * result + (getDeliveryCorpUrl() != null ? getDeliveryCorpUrl().hashCode() : 0);
        result = 31 * result + (getFreight() != null ? getFreight().hashCode() : 0);
        result = 31 * result + (getMemo() != null ? getMemo().hashCode() : 0);
        result = 31 * result + (getOperator() != null ? getOperator().hashCode() : 0);
        result = 31 * result + (getPhone() != null ? getPhone().hashCode() : 0);
        result = 31 * result + (getShippingMethod() != null ? getShippingMethod().hashCode() : 0);
        result = 31 * result + (getSn() != null ? getSn().hashCode() : 0);
        result = 31 * result + (getTrackingNo() != null ? getTrackingNo().hashCode() : 0);
        result = 31 * result + (getZipCode() != null ? getZipCode().hashCode() : 0);
        result = 31 * result + (getOrders() != null ? getOrders().hashCode() : 0);
        return result;
    }

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

    public String getConsignee() {
        return consignee;
    }

    public void setConsignee(String consignee) {
        this.consignee = consignee == null ? null : consignee.trim();
    }

    public String getDeliveryCorp() {
        return deliveryCorp;
    }

    public void setDeliveryCorp(String deliveryCorp) {
        this.deliveryCorp = deliveryCorp == null ? null : deliveryCorp.trim();
    }

    public String getDeliveryCorpCode() {
        return deliveryCorpCode;
    }

    public void setDeliveryCorpCode(String deliveryCorpCode) {
        this.deliveryCorpCode = deliveryCorpCode == null ? null : deliveryCorpCode.trim();
    }

    public String getDeliveryCorpUrl() {
        return deliveryCorpUrl;
    }

    public void setDeliveryCorpUrl(String deliveryCorpUrl) {
        this.deliveryCorpUrl = deliveryCorpUrl == null ? null : deliveryCorpUrl.trim();
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
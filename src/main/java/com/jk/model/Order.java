package com.jk.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class Order implements Serializable {

    private static final long serialVersionUID = -462312206769104530L;
    private BigDecimal id;

    private Date createDate;

    private Date modifyDate;

    private String address;

    private BigDecimal amountPaid;

    private String areaName;

    private String consignee;

    private BigDecimal couponDiscount;

    private Date expire;

    private BigDecimal fee;

    private BigDecimal freight;

    private String invoiceTitle;

    private Short isAllocatedStock;

    private Short isInvoice;

    private Date lockExpire;

    private String memo;

    private BigDecimal offsetAmount;

    private Long orderStatus;

    private String paymentMethodName;

    private Long paymentStatus;

    private String phone;

    private BigDecimal point;

    private String promotion;

    private BigDecimal promotionDiscount;

    private String shippingMethodName;

    private Long shippingStatus;

    private String sn;

    private BigDecimal tax;

    private String zipCode;

    private BigDecimal area;

    private BigDecimal couponCode;

    private BigDecimal member;

    private BigDecimal operator;

    private BigDecimal paymentMethod;

    private BigDecimal shippingMethod;

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

    public BigDecimal getAmountPaid() {
        return amountPaid;
    }

    public void setAmountPaid(BigDecimal amountPaid) {
        this.amountPaid = amountPaid;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName == null ? null : areaName.trim();
    }

    public String getConsignee() {
        return consignee;
    }

    public void setConsignee(String consignee) {
        this.consignee = consignee == null ? null : consignee.trim();
    }

    public BigDecimal getCouponDiscount() {
        return couponDiscount;
    }

    public void setCouponDiscount(BigDecimal couponDiscount) {
        this.couponDiscount = couponDiscount;
    }

    public Date getExpire() {
        return expire;
    }

    public void setExpire(Date expire) {
        this.expire = expire;
    }

    public BigDecimal getFee() {
        return fee;
    }

    public void setFee(BigDecimal fee) {
        this.fee = fee;
    }

    public BigDecimal getFreight() {
        return freight;
    }

    public void setFreight(BigDecimal freight) {
        this.freight = freight;
    }

    public String getInvoiceTitle() {
        return invoiceTitle;
    }

    public void setInvoiceTitle(String invoiceTitle) {
        this.invoiceTitle = invoiceTitle == null ? null : invoiceTitle.trim();
    }

    public Short getIsAllocatedStock() {
        return isAllocatedStock;
    }

    public void setIsAllocatedStock(Short isAllocatedStock) {
        this.isAllocatedStock = isAllocatedStock;
    }

    public Short getIsInvoice() {
        return isInvoice;
    }

    public void setIsInvoice(Short isInvoice) {
        this.isInvoice = isInvoice;
    }

    public Date getLockExpire() {
        return lockExpire;
    }

    public void setLockExpire(Date lockExpire) {
        this.lockExpire = lockExpire;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
    }

    public BigDecimal getOffsetAmount() {
        return offsetAmount;
    }

    public void setOffsetAmount(BigDecimal offsetAmount) {
        this.offsetAmount = offsetAmount;
    }

    public Long getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Long orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getPaymentMethodName() {
        return paymentMethodName;
    }

    public void setPaymentMethodName(String paymentMethodName) {
        this.paymentMethodName = paymentMethodName == null ? null : paymentMethodName.trim();
    }

    public Long getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(Long paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public BigDecimal getPoint() {
        return point;
    }

    public void setPoint(BigDecimal point) {
        this.point = point;
    }

    public String getPromotion() {
        return promotion;
    }

    public void setPromotion(String promotion) {
        this.promotion = promotion == null ? null : promotion.trim();
    }

    public BigDecimal getPromotionDiscount() {
        return promotionDiscount;
    }

    public void setPromotionDiscount(BigDecimal promotionDiscount) {
        this.promotionDiscount = promotionDiscount;
    }

    public String getShippingMethodName() {
        return shippingMethodName;
    }

    public void setShippingMethodName(String shippingMethodName) {
        this.shippingMethodName = shippingMethodName == null ? null : shippingMethodName.trim();
    }

    public Long getShippingStatus() {
        return shippingStatus;
    }

    public void setShippingStatus(Long shippingStatus) {
        this.shippingStatus = shippingStatus;
    }

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn == null ? null : sn.trim();
    }

    public BigDecimal getTax() {
        return tax;
    }

    public void setTax(BigDecimal tax) {
        this.tax = tax;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode == null ? null : zipCode.trim();
    }

    public BigDecimal getArea() {
        return area;
    }

    public void setArea(BigDecimal area) {
        this.area = area;
    }

    public BigDecimal getCouponCode() {
        return couponCode;
    }

    public void setCouponCode(BigDecimal couponCode) {
        this.couponCode = couponCode;
    }

    public BigDecimal getMember() {
        return member;
    }

    public void setMember(BigDecimal member) {
        this.member = member;
    }

    public BigDecimal getOperator() {
        return operator;
    }

    public void setOperator(BigDecimal operator) {
        this.operator = operator;
    }

    public BigDecimal getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(BigDecimal paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public BigDecimal getShippingMethod() {
        return shippingMethod;
    }

    public void setShippingMethod(BigDecimal shippingMethod) {
        this.shippingMethod = shippingMethod;
    }
}
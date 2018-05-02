package com.jk.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Product implements Serializable {
    private static final long serialVersionUID = -9015939873321965033L;
    private BigDecimal id;

    //创建日期
    private Date createDate;

    //修改日期
    private Date modifyDate;

    //
    private Long allocatedStock;

    private String attributeValue0;

    private String attributeValue1;

    private String attributeValue10;

    private String attributeValue11;

    private String attributeValue12;

    private String attributeValue13;

    private String attributeValue14;

    private String attributeValue15;

    private String attributeValue16;

    private String attributeValue17;

    private String attributeValue18;

    private String attributeValue19;

    private String attributeValue2;

    private String attributeValue3;

    private String attributeValue4;

    private String attributeValue5;

    private String attributeValue6;

    private String attributeValue7;

    private String attributeValue8;

    private String attributeValue9;

    //成本
    private BigDecimal cost;

    //全称
    private String fullName;

    private BigDecimal hits;

    private String image;

    private Short isGift;

    private Short isList;

    private Short isMarketable;

    private Short isTop;

    private String keyword;

    private BigDecimal marketPrice;

    private String memo;

    private BigDecimal monthHits;

    private Date monthHitsDate;

    private BigDecimal monthSales;

    private Date monthSalesDate;

    private String name;

    private BigDecimal point;

    private BigDecimal price;

    private BigDecimal sales;

    private Double score;

    private BigDecimal scoreCount;

    private String seoDescription;

    private String seoKeywords;

    private String seoTitle;

    private String sn;

    //库存
    private Long stock;

    private String stockMemo;

    private BigDecimal totalScore;

    private String unit;

    private BigDecimal weekHits;

    private Date weekHitsDate;

    private BigDecimal weekSales;

    private Date weekSalesDate;

    private Long weight;

    private BigDecimal brand;

    private BigDecimal goods;

    private BigDecimal productCategory;

    private String introduction;

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

    public Long getAllocatedStock() {
        return allocatedStock;
    }

    public void setAllocatedStock(Long allocatedStock) {
        this.allocatedStock = allocatedStock;
    }

    public String getAttributeValue0() {
        return attributeValue0;
    }

    public void setAttributeValue0(String attributeValue0) {
        this.attributeValue0 = attributeValue0 == null ? null : attributeValue0.trim();
    }

    public String getAttributeValue1() {
        return attributeValue1;
    }

    public void setAttributeValue1(String attributeValue1) {
        this.attributeValue1 = attributeValue1 == null ? null : attributeValue1.trim();
    }

    public String getAttributeValue10() {
        return attributeValue10;
    }

    public void setAttributeValue10(String attributeValue10) {
        this.attributeValue10 = attributeValue10 == null ? null : attributeValue10.trim();
    }

    public String getAttributeValue11() {
        return attributeValue11;
    }

    public void setAttributeValue11(String attributeValue11) {
        this.attributeValue11 = attributeValue11 == null ? null : attributeValue11.trim();
    }

    public String getAttributeValue12() {
        return attributeValue12;
    }

    public void setAttributeValue12(String attributeValue12) {
        this.attributeValue12 = attributeValue12 == null ? null : attributeValue12.trim();
    }

    public String getAttributeValue13() {
        return attributeValue13;
    }

    public void setAttributeValue13(String attributeValue13) {
        this.attributeValue13 = attributeValue13 == null ? null : attributeValue13.trim();
    }

    public String getAttributeValue14() {
        return attributeValue14;
    }

    public void setAttributeValue14(String attributeValue14) {
        this.attributeValue14 = attributeValue14 == null ? null : attributeValue14.trim();
    }

    public String getAttributeValue15() {
        return attributeValue15;
    }

    public void setAttributeValue15(String attributeValue15) {
        this.attributeValue15 = attributeValue15 == null ? null : attributeValue15.trim();
    }

    public String getAttributeValue16() {
        return attributeValue16;
    }

    public void setAttributeValue16(String attributeValue16) {
        this.attributeValue16 = attributeValue16 == null ? null : attributeValue16.trim();
    }

    public String getAttributeValue17() {
        return attributeValue17;
    }

    public void setAttributeValue17(String attributeValue17) {
        this.attributeValue17 = attributeValue17 == null ? null : attributeValue17.trim();
    }

    public String getAttributeValue18() {
        return attributeValue18;
    }

    public void setAttributeValue18(String attributeValue18) {
        this.attributeValue18 = attributeValue18 == null ? null : attributeValue18.trim();
    }

    public String getAttributeValue19() {
        return attributeValue19;
    }

    public void setAttributeValue19(String attributeValue19) {
        this.attributeValue19 = attributeValue19 == null ? null : attributeValue19.trim();
    }

    public String getAttributeValue2() {
        return attributeValue2;
    }

    public void setAttributeValue2(String attributeValue2) {
        this.attributeValue2 = attributeValue2 == null ? null : attributeValue2.trim();
    }

    public String getAttributeValue3() {
        return attributeValue3;
    }

    public void setAttributeValue3(String attributeValue3) {
        this.attributeValue3 = attributeValue3 == null ? null : attributeValue3.trim();
    }

    public String getAttributeValue4() {
        return attributeValue4;
    }

    public void setAttributeValue4(String attributeValue4) {
        this.attributeValue4 = attributeValue4 == null ? null : attributeValue4.trim();
    }

    public String getAttributeValue5() {
        return attributeValue5;
    }

    public void setAttributeValue5(String attributeValue5) {
        this.attributeValue5 = attributeValue5 == null ? null : attributeValue5.trim();
    }

    public String getAttributeValue6() {
        return attributeValue6;
    }

    public void setAttributeValue6(String attributeValue6) {
        this.attributeValue6 = attributeValue6 == null ? null : attributeValue6.trim();
    }

    public String getAttributeValue7() {
        return attributeValue7;
    }

    public void setAttributeValue7(String attributeValue7) {
        this.attributeValue7 = attributeValue7 == null ? null : attributeValue7.trim();
    }

    public String getAttributeValue8() {
        return attributeValue8;
    }

    public void setAttributeValue8(String attributeValue8) {
        this.attributeValue8 = attributeValue8 == null ? null : attributeValue8.trim();
    }

    public String getAttributeValue9() {
        return attributeValue9;
    }

    public void setAttributeValue9(String attributeValue9) {
        this.attributeValue9 = attributeValue9 == null ? null : attributeValue9.trim();
    }

    public BigDecimal getCost() {
        return cost;
    }

    public void setCost(BigDecimal cost) {
        this.cost = cost;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName == null ? null : fullName.trim();
    }

    public BigDecimal getHits() {
        return hits;
    }

    public void setHits(BigDecimal hits) {
        this.hits = hits;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    public Short getIsGift() {
        return isGift;
    }

    public void setIsGift(Short isGift) {
        this.isGift = isGift;
    }

    public Short getIsList() {
        return isList;
    }

    public void setIsList(Short isList) {
        this.isList = isList;
    }

    public Short getIsMarketable() {
        return isMarketable;
    }

    public void setIsMarketable(Short isMarketable) {
        this.isMarketable = isMarketable;
    }

    public Short getIsTop() {
        return isTop;
    }

    public void setIsTop(Short isTop) {
        this.isTop = isTop;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword == null ? null : keyword.trim();
    }

    public BigDecimal getMarketPrice() {
        return marketPrice;
    }

    public void setMarketPrice(BigDecimal marketPrice) {
        this.marketPrice = marketPrice;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
    }

    public BigDecimal getMonthHits() {
        return monthHits;
    }

    public void setMonthHits(BigDecimal monthHits) {
        this.monthHits = monthHits;
    }

    public Date getMonthHitsDate() {
        return monthHitsDate;
    }

    public void setMonthHitsDate(Date monthHitsDate) {
        this.monthHitsDate = monthHitsDate;
    }

    public BigDecimal getMonthSales() {
        return monthSales;
    }

    public void setMonthSales(BigDecimal monthSales) {
        this.monthSales = monthSales;
    }

    public Date getMonthSalesDate() {
        return monthSalesDate;
    }

    public void setMonthSalesDate(Date monthSalesDate) {
        this.monthSalesDate = monthSalesDate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public BigDecimal getPoint() {
        return point;
    }

    public void setPoint(BigDecimal point) {
        this.point = point;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getSales() {
        return sales;
    }

    public void setSales(BigDecimal sales) {
        this.sales = sales;
    }

    public Double getScore() {
        return score;
    }

    public void setScore(Double score) {
        this.score = score;
    }

    public BigDecimal getScoreCount() {
        return scoreCount;
    }

    public void setScoreCount(BigDecimal scoreCount) {
        this.scoreCount = scoreCount;
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

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn == null ? null : sn.trim();
    }

    public Long getStock() {
        return stock;
    }

    public void setStock(Long stock) {
        this.stock = stock;
    }

    public String getStockMemo() {
        return stockMemo;
    }

    public void setStockMemo(String stockMemo) {
        this.stockMemo = stockMemo == null ? null : stockMemo.trim();
    }

    public BigDecimal getTotalScore() {
        return totalScore;
    }

    public void setTotalScore(BigDecimal totalScore) {
        this.totalScore = totalScore;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit == null ? null : unit.trim();
    }

    public BigDecimal getWeekHits() {
        return weekHits;
    }

    public void setWeekHits(BigDecimal weekHits) {
        this.weekHits = weekHits;
    }

    public Date getWeekHitsDate() {
        return weekHitsDate;
    }

    public void setWeekHitsDate(Date weekHitsDate) {
        this.weekHitsDate = weekHitsDate;
    }

    public BigDecimal getWeekSales() {
        return weekSales;
    }

    public void setWeekSales(BigDecimal weekSales) {
        this.weekSales = weekSales;
    }

    public Date getWeekSalesDate() {
        return weekSalesDate;
    }

    public void setWeekSalesDate(Date weekSalesDate) {
        this.weekSalesDate = weekSalesDate;
    }

    public Long getWeight() {
        return weight;
    }

    public void setWeight(Long weight) {
        this.weight = weight;
    }

    public BigDecimal getBrand() {
        return brand;
    }

    public void setBrand(BigDecimal brand) {
        this.brand = brand;
    }

    public BigDecimal getGoods() {
        return goods;
    }

    public void setGoods(BigDecimal goods) {
        this.goods = goods;
    }

    public BigDecimal getProductCategory() {
        return productCategory;
    }

    public void setProductCategory(BigDecimal productCategory) {
        this.productCategory = productCategory;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction == null ? null : introduction.trim();
    }
}
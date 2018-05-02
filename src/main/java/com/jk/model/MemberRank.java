package com.jk.model;

import java.io.Serializable;

public class MemberRank implements Serializable{

    private static final long serialVersionUID = 2534632567343141193L;

    private Integer id;

    /** 名称 */
    private String name;

    /** 优惠比例 */
    private Double scale;

    /** 消费金额 */
    private Double amount;

    /** 是否默认 */
    private Integer is_Default;

    /** 是否特殊 */
    private Integer is_Special;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getScale() {
        return scale;
    }

    public void setScale(Double scale) {
        this.scale = scale;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public Integer getIs_Default() {
        return is_Default;
    }

    public void setIs_Default(Integer is_Default) {
        this.is_Default = is_Default;
    }

    public Integer getIs_Special() {
        return is_Special;
    }

    public void setIs_Special(Integer is_Special) {
        this.is_Special = is_Special;
    }

    @Override
    public String toString() {
        return "MemberRank{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", scale=" + scale +
                ", amount=" + amount +
                ", is_Default=" + is_Default +
                ", is_Special=" + is_Special +
                '}';
    }
}

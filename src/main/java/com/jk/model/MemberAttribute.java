package com.jk.model;

import java.io.Serializable;

public class MemberAttribute implements Serializable {

    private static final long serialVersionUID = -4395758892297746979L;

    /** id */
    private Integer id;

    /** 名称 */
    private String name;

    /** 类型 */
    private Integer type;

    /** 是否启用 */
    private Integer is_Enabled;

    /** 是否必填 */
    private Integer is_Required;

    /** 排序 */
    private Integer orders;

    /** 属性序号 */
    private Integer property_index;

    /** 可选项以逗号分开的字符串 */
    private String kxxoptions;

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

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getIs_Enabled() {
        return is_Enabled;
    }

    public void setIs_Enabled(Integer is_Enabled) {
        this.is_Enabled = is_Enabled;
    }

    public Integer getIs_Required() {
        return is_Required;
    }

    public void setIs_Required(Integer is_Required) {
        this.is_Required = is_Required;
    }

    public Integer getOrders() {
        return orders;
    }

    public void setOrders(Integer orders) {
        this.orders = orders;
    }

    public Integer getProperty_index() {
        return property_index;
    }

    public void setProperty_index(Integer property_index) {
        this.property_index = property_index;
    }

    public String getKxxoptions() {
        return kxxoptions;
    }

    public void setKxxoptions(String kxxoptions) {
        this.kxxoptions = kxxoptions;
    }

    @Override
    public String toString() {
        return "MemberAttribute{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", type=" + type +
                ", is_Enabled=" + is_Enabled +
                ", is_Required=" + is_Required +
                ", orders=" + orders +
                ", property_index=" + property_index +
                ", kxxoptions='" + kxxoptions + '\'' +
                '}';
    }
}

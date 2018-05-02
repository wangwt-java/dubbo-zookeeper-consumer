package com.jk.model;

import java.io.Serializable;
import java.math.BigDecimal;

public class AttributeOption implements Serializable{
    private static final long serialVersionUID = -3775410474180124573L;
    private BigDecimal attribute;

    private String options;

    public BigDecimal getAttribute() {
        return attribute;
    }

    public void setAttribute(BigDecimal attribute) {
        this.attribute = attribute;
    }

    public String getOptions() {
        return options;
    }

    public void setOptions(String options) {
        this.options = options == null ? null : options.trim();
    }
}
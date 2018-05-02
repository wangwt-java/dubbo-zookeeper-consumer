package com.jk.model;


import java.io.Serializable;
import java.util.List;

/**
 * Created by Administrator on 2018/4/9 0009.
 */
public class Tree implements Serializable{
    private static final long serialVersionUID = 4107782503792212105L;
    private Integer id;
    private String text;
    private Integer pid;
    private String url;

    //业务字段
    private List<Tree> nodes;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public List<Tree> getNodes() {
        return nodes;
    }

    public void setNodes(List<Tree> nodes) {
        this.nodes = nodes;
    }
}

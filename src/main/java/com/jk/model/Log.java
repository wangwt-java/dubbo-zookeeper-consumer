/** 
 * <pre>项目名称:easyui-1-pm 
 * 文件名称:Log.java 
 * 包名:com.tf.color.model 
 * 创建日期:2018年1月31日下午6:39:36 
 * Copyright (c) 2018, yuxy123@gmail.com All Rights Reserved.</pre> 
 */  
package com.jk.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.io.Serializable;

/** 
 * <pre>项目名称：easyui-1-pm    
 * 类名称：Log    
 * 类描述：    
 * 创建人：小飞飞  
 * 创建时间：2018年1月31日 下午6:39:36    
 * 修改人：小飞飞
 * 修改时间：2018年1月31日 下午6:39:36    
 * 修改备注：       
 * @version </pre>    
 */
@Document(collection="shoplogInfo")
public class Log implements Serializable {
	private static final long serialVersionUID = -2780702835524047362L;
	@Id
	private String logid;
	private Object returnvals;
	private String methodname;
	private Object params;
	private String urlstr;
	private String acttime;
	public String getLogid() {
		return logid;
	}
	public void setLogid(String logid) {
		this.logid = logid;
	}
	public Object getReturnvals() {
		return returnvals;
	}
	public void setReturnvals(Object returnvals) {
		this.returnvals = returnvals;
	}
	public String getMethodname() {
		return methodname;
	}
	public void setMethodname(String methodname) {
		this.methodname = methodname;
	}
	public Object getParams() {
		return params;
	}
	public void setParams(Object params) {
		this.params = params;
	}
	public String getUrlstr() {
		return urlstr;
	}
	public void setUrlstr(String urlstr) {
		this.urlstr = urlstr;
	}
	public String getActtime() {
		return acttime;
	}
	public void setActtime(String acttime) {
		this.acttime = acttime;
	}
	
}

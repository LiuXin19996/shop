package com.mym.shop.vo;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * 一级分类的实体类对象
 * @author 穆亚梅
 *
 */
public class Category implements Serializable{
	private Integer cid;
	private String cname;
	
	private Set<CategorySecond> categorySeconds = new HashSet<CategorySecond>();
	 
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public Set<CategorySecond> getCategorySeconds() {
		return categorySeconds;
	}
	public void setCategorySeconds(Set<CategorySecond> categorySeconds) {
		this.categorySeconds = categorySeconds;
	}
	 
}

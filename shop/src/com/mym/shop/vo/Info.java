package com.mym.shop.vo;

import java.io.Serializable;
import java.sql.Time;
import java.util.Date;

/**
 * 信息实体
 * @author Administrator
 *
 */
public class Info implements Serializable {
	private Integer info_id;
	private String  title;
	private String  content;
	private String    pub_time;
	private String publisher;
	public Integer getInfo_id() {
		return info_id;
	}
	public void setInfo_id(Integer info_id) {
		this.info_id = info_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
    
	public String getPub_time() {
		return pub_time;
	}
	public void setPub_time(String pub_time) {
		this.pub_time = pub_time;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
 
	
	
	
	

}

package com.mym.shop.vo;

/**
* 订单项的实体
* @author 穆亚梅
*
*/
public class OrderItem {
	private Integer itemid;
	private Integer count;
	private Double subtotal;
	
	private Product product;
	
	private Order order;
	private Integer evaluation_code;
	private String comments;
	private String color;
	private String size;
	
	
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public Integer getEvaluation_code() {
		return evaluation_code;
	}
	public void setEvaluation_code(Integer evaluationCode) {
		evaluation_code = evaluationCode;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public Integer getItemid() {
		return itemid;
	}
	public void setItemid(Integer itemid) {
		this.itemid = itemid;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Double getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(Double subtotal) {
		this.subtotal = subtotal;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	
}

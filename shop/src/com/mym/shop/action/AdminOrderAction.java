package com.mym.shop.action;

import java.util.List;

import com.mym.shop.service.OrderService;
import com.mym.shop.uitls.PageBean;
import com.mym.shop.vo.Order;
import com.mym.shop.vo.OrderItem;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminOrderAction extends ActionSupport implements
		ModelDriven<Order> {
	
	private Order order = new Order();
	private int uid;

	public void setUid(int uid) {
		this.uid = uid;
	}

	public Order getModel() {
		return order;
	}

	
	private Integer page;

	public void setPage(Integer page) {
		this.page = page;
	}

	
	private OrderService orderService;

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	
	public String findAll() {
		
		PageBean<Order> pageBean = orderService.findAll(page);
		
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		
		return "findAll";
	}

	

	
	public String findOrderItem() {
		
		List<OrderItem> list = orderService.findOrderItem(order.getOid());
		
		ActionContext.getContext().getValueStack().set("list", list);
		
		return "findOrderItem";
	}

	
	public String findOrderItemMemberPoints() {
		
		List<Order> list = orderService.findByUidOrderItemMemberPoints(uid);
		
		ActionContext.getContext().getValueStack().set("list", list);
		
		return "findOrderItemMemberPoints";
	}

	
	public String updateState() {
		
		Order currOrder = orderService.findByOid(order.getOid());
		currOrder.setState(3);
		orderService.update(currOrder);
		
		return "updateStateSuccess";
	}

}

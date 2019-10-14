package com.mym.shop.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.sound.midi.SysexMessage;

import org.apache.struts2.ServletActionContext;

import com.mym.shop.service.OrderService;
import com.mym.shop.service.ProductService;
import com.mym.shop.service.UserService;
import com.mym.shop.uitls.PageBean;
import com.mym.shop.vo.Cart;
import com.mym.shop.vo.CartItem;
import com.mym.shop.vo.Order;
import com.mym.shop.vo.OrderItem;
import com.mym.shop.vo.Product;
import com.mym.shop.vo.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public  class OrderAction extends ActionSupport implements ModelDriven<Order>  {

	
	private Order order = new Order();
	
	
	private String proname="123";
	
    private int evalCode=1;
	
	private String comments;
	
    private  int ordId;
	
	private int ordItId;
	
	
	private ProductService productService;
	

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}


	public void setOrdId(int ordId) {
		this.ordId = ordId;
	}


	public void setOrdItId(int ordItId) {
		this.ordItId = ordItId;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public void setEvalCode(int evalCode) {
		this.evalCode = evalCode;
	}

	
	
	public int getEvalCode() {
		return evalCode;
	}


	public void setProname(String proname) {
		this.proname = proname;
	}

	public String getProname() {
		return proname;
	}




	public Order getModel() {
		return order;
	}
	
	

	
	
	private OrderService orderService;
    private UserService  userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	

	
	private Integer page;

	public void setPage(Integer page) {
		this.page = page;
	}
	
	
	public String saveOrder() {

		  
		   User existUser = (User) ServletActionContext.getRequest().getSession()
				       .getAttribute("existUser");
		  if (existUser == null) {
			   this.addActionMessage("亲!您还没有登录!");
			   return "login";
		   }
		   order.setUser(existUser);			
		    
			
			Cart cart = (Cart) ServletActionContext.getRequest().getSession()
					.getAttribute("cart");
			if (cart == null) {
				this.addActionMessage("亲!您还没有购物!");
				return "msg";
			}
			order.setTotal(cart.getTotal());
			
			order.setState(1); 
			
			order.setOrdertime(new Date());
			
			for (CartItem cartItem : cart.getCartItems()) {
				
				OrderItem orderItem = new OrderItem();
				orderItem.setCount(cartItem.getCount());
				orderItem.setSubtotal(cartItem.getSubtotal());
				orderItem.setProduct(cartItem.getProduct());
				orderItem.setColor(cartItem.getColor());
				orderItem.setSize(cartItem.getSize());
				orderItem.setOrder(order);

				order.getOrderItems().add(orderItem);
			}
			orderService.save(order);
			
			cart.clearCart();

			
			
			

			return "saveOrder";
		}
		
		
		public String findByUid() {
			
			User existUser = (User) ServletActionContext.getRequest().getSession()
					.getAttribute("existUser");
			
			Integer uid = existUser.getUid();
			
			PageBean<Order> pageBean = orderService.findByUid(uid, page);
			
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			return "findByUid";
		}
		
		
		
		public String findByUidMemberPoints() {
			
			 User  existUser = (User) ServletActionContext.getRequest().getSession()
					.getAttribute("existUser");
			
			Integer uid = existUser.getUid();
			
		   
		   Double mp=orderService.getMp(uid);
		   ActionContext.getContext().getValueStack().set("mp", mp);
			  
			
			PageBean<Order> pageBean = orderService.findByUidMemberPoints(uid, page);
			
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			return "findByUidMemberPoints";
		}
		
		
		public String findByOid() {
			order = orderService.findByOid(order.getOid());
			return "findByOid";
		}
		
		
		public String payOrder() throws IOException {
			
			orderService.updateSales(order.getOid());
			
			Order currOrder = orderService.findByOid(order.getOid());
			currOrder.setAddr(order.getAddr());
			currOrder.setName(order.getName());
			currOrder.setPhone(order.getPhone());
			currOrder.setState(2);
			
			orderService.update(currOrder);
 
			
			List<Product> hList = productService.findHot();
			
			ActionContext.getContext().getValueStack().set("hList", hList);
			
			List<Product> nList = productService.findNew();
			
			ActionContext.getContext().getValueStack().set("nList", nList);
			
			 
			return "msg";
			
		}
	 

		

		
		
		
		public String updateState(){

			
			orderService.updateMp(order.getOid());
			
			orderService.updateEvalCode(order.getOid());
			
			Order currOrder = orderService.findByOid(order.getOid());
			currOrder.setState(4);
			orderService.update(currOrder);
			return "updateStateSuccess";
		}
		
		public String findByPname(){
			
		
			
			 User  existUser = (User) ServletActionContext.getRequest().getSession()
					.getAttribute("existUser");
			
			Integer uid = existUser.getUid();
			
			PageBean<Order> pageBean = orderService.findByPname(uid, page,proname);
			
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			return "findByPname";
		}

		/**
		 * evalCode  评价状态码   1为评价了   2为未评价
		 * @return
		 */
		public String findByEvalCode(){
			
			
			User existUser = (User) ServletActionContext.getRequest().getSession()
					.getAttribute("existUser");
			
			Integer uid = existUser.getUid();
			
			PageBean<OrderItem> pageBean = orderService.findByEvalCode(uid, page,evalCode);
			
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			
			return "findByEvalCode";
		}
		
		/**
		 * 给未评价的商品评论
		 * @return
		 */
		
		public String evalGoods(){

		 



			ActionContext.getContext().getValueStack().set("evalCode", evalCode);
			ActionContext.getContext().getValueStack().set("ordItId",ordItId);
			ActionContext.getContext().getValueStack().set("page",page);
			
			return "evalGoods";
		}
		
		
		/**
		 * 保存评论
		 */
		
		
		public String saveComments(){
			
	 
			
			User existUser = (User) ServletActionContext.getRequest().getSession()
					.getAttribute("existUser");
			
			Integer uid = existUser.getUid();
			
		 
			
			orderService.saveComments(comments,evalCode,ordItId);
			
			PageBean<OrderItem> pageBean = orderService.findByEvalCode(uid, 1,1);
			
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			return "saveComments";
		}
		
	 public String findMpByPname(){
	   
	   
	   User  existUser = (User) ServletActionContext.getRequest().getSession()
					.getAttribute("existUser");
	   
	  Integer uid = existUser.getUid();
	  
	  
	  Double mp=orderService.getMp(uid);
	  ActionContext.getContext().getValueStack().set("mp", mp);
	   
	  PageBean<Order> pageBean = orderService.findMpByPname(uid, page,proname);
	  
	   ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			 
		return "findMpByPname";
	 }
	 
	 
	
}

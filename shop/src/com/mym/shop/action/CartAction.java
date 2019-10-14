package com.mym.shop.action;

import com.mym.shop.service.ProductService;
import com.mym.shop.vo.Cart;
import com.mym.shop.vo.CartItem;
import com.mym.shop.vo.Product;
import com.mym.shop.vo.User;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

public class CartAction extends ActionSupport {
	
	private Integer pid;
	
	private Integer count;
	
	private ProductService productService;
	
	private String color;
	private String size;
	

	public void setColor(String color) {
		this.color = color;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	
	public String addCart() {
		
		User existUser = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("existUser");
		if (existUser == null) {
			this.addActionMessage("亲!您还没有登录!");
			return "login";
		}
		
		CartItem cartItem = new CartItem();
		
		cartItem.setCount(count);
		
		Product product = productService.findByPid(pid);
		
		cartItem.setProduct(product);
		cartItem.setColor(color);
		cartItem.setSize(size);
		
		
		Cart cart = getCart();
		cart.addCart(cartItem);

		return "addCart";
	}

	
	public String clearCart(){
		
		Cart cart = getCart();
		
		cart.clearCart();
		return "clearCart";
	}
	
	
	public String removeCart(){
		
		Cart cart = getCart();
		
		cart.removeCart(pid);
		
		return "removeCart";
	}
	
	
	public String myCart(){
		User existUser = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("existUser");
		if (existUser == null) {
			this.addActionMessage("亲!您还没有登录!");
			return "login";
		}
		return "myCart";
	}
	
	
	private Cart getCart() {
		Cart cart = (Cart) ServletActionContext.getRequest().getSession()
				.getAttribute("cart");
		if (cart == null) {
			
			cart = new Cart();
			ServletActionContext.getRequest().getSession()
					.setAttribute("cart", cart);
		}
		return cart;
	}
}
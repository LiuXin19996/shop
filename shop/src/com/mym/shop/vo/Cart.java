package com.mym.shop.vo;

import java.io.Serializable;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 购物车对象
 * 
 * @author 穆亚梅
 * 
 */
public class Cart implements Serializable{
	
	
	private Map<Integer, CartItem> map = new LinkedHashMap<Integer, CartItem>();

	
	public Collection<CartItem> getCartItems(){
		return map.values();
	}
	
	
	private double total;

	public double getTotal() {
		return total;
	}

	
	
	public void addCart(CartItem cartItem) {
		
		/*
		 *  * 如果存在:
		 *  	* 数量增加
		 *  	* 总计 = 总计 + 购物项小计
		 *  * 如果不存在:
		 *  	* 向map中添加购物项
		 *  	* 总计 = 总计 + 购物项小计
		 */
		
		Integer pid = cartItem.getProduct().getPid();
		
		if(map.containsKey(pid)){
			
			CartItem _cartItem = map.get(pid);
			_cartItem.setCount(_cartItem.getCount()+cartItem.getCount());
		}else{
			
			map.put(pid, cartItem);
		}
		
		total += cartItem.getSubtotal();
	}

	
	public void removeCart(Integer pid) {
		
		CartItem cartItem = map.remove(pid);
		
		total -= cartItem.getSubtotal();
	}

	
	public void clearCart() {
		
		map.clear();
		
		total = 0;
	}
}


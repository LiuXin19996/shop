package com.mym.shop.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.mym.shop.dao.OrderDao;
import com.mym.shop.uitls.PageBean;
import com.mym.shop.vo.Order;
import com.mym.shop.vo.OrderItem;
import com.mym.shop.vo.Product;

@Transactional
public class OrderService {

	
	private OrderDao orderDao;

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	
	public void save(Order order) {
		orderDao.save(order);
	}
	
	
	public PageBean<Order> findByUid(Integer uid,Integer page) {
		PageBean<Order> pageBean = new PageBean<Order>();
		
		pageBean.setPage(page);
		
		
		int limit = 5;
		pageBean.setLimit(limit);
		
		int totalCount = 0;
		totalCount = orderDao.findCountByUid(uid);
		pageBean.setTotalCount(totalCount);
		
		int totalPage = 0;
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		
		int begin = (page - 1)*limit;
		List<Order> list = orderDao.findPageByUid(uid,begin,limit);
		pageBean.setList(list);
		return pageBean;
	}

	
	public Order findByOid(Integer oid) {
		return orderDao.findByOid(oid);
	}

	
	public void update(Order currOrder) {
		orderDao.update(currOrder);
	}


	
	public PageBean<Order> findAll(Integer page) {
		PageBean<Order> pageBean = new PageBean<Order>();
		
		pageBean.setPage(page);
		
		int limit = 10;
		pageBean.setLimit(limit);
		
		int totalCount = orderDao.findCount();
		pageBean.setTotalCount(totalCount);
		
		int totalPage = 0;
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		
		int begin = (page - 1) * limit;
		List<Order> list = orderDao.findByPage(begin,limit);
		pageBean.setList(list);
		return pageBean;
	}


	
	public List<OrderItem> findOrderItem(Integer oid) {
		return orderDao.findOrderItem(oid);
	}

	public PageBean<Order> findByPname(Integer uid, Integer page, String proname) {
		PageBean<Order> pageBean = new PageBean<Order>();
		
		pageBean.setPage(page);
		
		
		int limit = 5;
		pageBean.setLimit(limit);
		
		int totalCount = 0;
		totalCount = orderDao.findCountByUidPname(uid,proname);
		pageBean.setTotalCount(totalCount);
		
		int totalPage = 0;
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		
		int begin = (page - 1)*limit;
		List<Order> list = orderDao.findPageByPname(uid,proname,begin,limit);
		pageBean.setList(list);
		return pageBean;
	}

	public PageBean<Order> findByUidMemberPoints(Integer uid, Integer page) {
		PageBean<Order> pageBean = new PageBean<Order>();
		
		pageBean.setPage(page);
		
		
		int limit = 5;
		pageBean.setLimit(limit);
		
		int totalCount = 0;
		totalCount = orderDao.findCountByUidMemberPoints(uid);
		pageBean.setTotalCount(totalCount);
		
		int totalPage = 0;
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		
		int begin = (page - 1)*limit;
		List<Order> list = orderDao.findPageByUidMemberPoints(uid,begin,limit);
		pageBean.setList(list);
		return pageBean;
	}

	public List<Order> findByUidOrderItemMemberPoints(int uid) {
		
		return orderDao.findByUidOrderItemMemberPoints(uid);
	}

	
	public PageBean<OrderItem> findByEvalCode(Integer uid, Integer page,
			int evalCode) {
		PageBean<OrderItem> pageBean = new PageBean<OrderItem>();
		
		pageBean.setPage(page);
		
		
		int limit = 5;
		pageBean.setLimit(limit);
		
		int totalCount = 0;
		totalCount = orderDao.findCountByUidEvalCode(uid,evalCode);
		pageBean.setTotalCount(totalCount);
		
		int totalPage = 0;
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		
		int begin = (page - 1)*limit;
		List<OrderItem> list = orderDao.findPageByEvalCode(uid,evalCode,begin,limit);
		pageBean.setList(list);
		return pageBean;
	}

 

	public void saveComments(String comments, int evalCode, int ordItId) {
		
		orderDao.saveComments(comments, evalCode,ordItId);
	}

	public void updateEvalCode(int ordId) {
		orderDao.updateEvalCode(ordId);
		
	}

	public void updateState(int ordId) {
		orderDao.updateState(ordId);
		
	}

	public void updateSales(int ordId) {
		orderDao.updateSales(ordId);
		
	}

	public void updateMp(int ordId) {
		 
		orderDao.updateMp(ordId);
		
	}

	public PageBean<Order> findMpByPname(Integer uid, Integer page,
			String proname) {
		
		PageBean<Order> pageBean = new PageBean<Order>();
		
		pageBean.setPage(page);
		
		
		int limit = 5;
		pageBean.setLimit(limit);
		
		int totalCount = 0;
		totalCount = orderDao.findMpCountByUidPname(uid,proname);
		pageBean.setTotalCount(totalCount);
		
		int totalPage = 0;
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		
		int begin = (page - 1)*limit;
		List<Order> list = orderDao.findMpPageByPname(uid,proname,begin,limit);
		pageBean.setList(list);
		return pageBean;
	}

	public Double getMp(Integer uid) {

		return orderDao.getMp(uid);
	}
	 

}

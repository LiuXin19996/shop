package com.mym.shop.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.omg.CORBA.PRIVATE_MEMBER;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
 

import com.mym.shop.uitls.CustomUtils;
import com.mym.shop.uitls.PageHibernateCallback;
import com.mym.shop.vo.OrderItem;
import com.mym.shop.vo.Product;

public class ProductDao extends HibernateDaoSupport {

	
	
	public void save(Product product) {
		this.getHibernateTemplate().save(product);
	}

	
	public void delete(Product product) {
		this.getHibernateTemplate().delete(product);
	}

	public void update(Product product) {
		this.getHibernateTemplate().update(product);
	}
	
	
	
	public List<Product> findHot() {
		
		DetachedCriteria criteria = DetachedCriteria.forClass(Product.class);
		
		criteria.add(Restrictions.eq("is_hot", 1));
		
		criteria.addOrder(Order.desc("pdate"));
		
		List<Product> list = this.getHibernateTemplate().findByCriteria(
				criteria, 0, 10);
		return list;
	}

	
	public List<Product> findNew() {
		
		DetachedCriteria criteria = DetachedCriteria.forClass(Product.class);
		
		criteria.addOrder(Order.desc("pdate"));
		
		List<Product> list = this.getHibernateTemplate().findByCriteria(criteria, 0, 10);
		return list;
	}
	
	
	public Product findByPid(Integer pid) {
		return this.getHibernateTemplate().get(Product.class, pid);
	}
	
	
	public int findCountCid(Integer cid) {
		String hql = "select count(*) from Product p where p.categorySecond.category.cid = ?";
		List<Long> list = this.getHibernateTemplate().find(hql,cid);
		if(list != null && list.size() > 0){
			return list.get(0).intValue();
		}
		return 0;
	}

	
	public List<Product> findByPageCid(Integer cid, int begin, int limit) {
		
		
		String hql = "select p from Product p join p.categorySecond cs join cs.category c where c.cid = ?";
		
		List<Product> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Product>(hql, new Object[]{cid}, begin, limit));
		if(list != null && list.size() > 0){
			return list;
		}
		return null;
		
	}
	

	
	public int findCountCsid(Integer csid) {
		String hql = "select count(*) from Product p where p.categorySecond.csid = ?";
		List<Long> list = this.getHibernateTemplate().find(hql, csid);
		if(list != null && list.size() > 0){
			return list.get(0).intValue();
		}
		return 0;
	}

	
	public List<Product> findByPageCsid(Integer csid, int begin, int limit) {
		String hql = "select p from Product p join p.categorySecond cs where cs.csid = ?";
		List<Product> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Product>(hql, new Object[]{csid}, begin, limit));
		if(list != null && list.size() > 0){
			return list;
		}
		return null;
	}

	
	public int findCount() {
		String hql = "select count(*) from Product";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list != null && list.size() > 0){
			return list.get(0).intValue();
		}
		return 0;
	}

	
	public List<Product> findByPage(int begin, int limit) {
		String hql = "from Product order by pdate desc";
		List<Product> list =  this.getHibernateTemplate().execute(new PageHibernateCallback<Product>(hql, null, begin, limit));
		if(list != null && list.size() > 0){
			return list;
		}
		return null;
	}

	public int findCountPname(String pname) {
		
		String hql = "select count(*) from Product p where p.pname like '%"+pname+"%'";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list != null && list.size() > 0){
			return list.get(0).intValue();
		}
		return 0;
	}

	public List<Product> findByPagePname(String pname, int begin, int limit) {
		
		String hql = "from Product p where p.pname like '%"+pname+"%'";
		List<Product> list =  this.getHibernateTemplate().execute(new PageHibernateCallback<Product>(hql,null, begin, limit));
		 System.out.print(pname);
		if(list != null && list.size() > 0){
			return list;
		}
		return null;
	}

	public int findCountCommentsByPid(int proId,int evalCode) {
		String hql = "select count(*) from OrderItem oi where oi.product.pid="+proId+" and oi.evaluation_code="+evalCode;
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list != null && list.size() > 0){
			return list.get(0).intValue();
		}
		return 0;
	}

	public List<OrderItem> findCommentsByPagePid(int proId, int evalCode, int begin, int limit) {
		String hql = "select oi from OrderItem oi where oi.product.pid="+proId+" and oi.evaluation_code="+evalCode;
		List<OrderItem> list =  this.getHibernateTemplate().execute(new PageHibernateCallback<OrderItem>(hql,null, begin, limit));
		
		for(OrderItem oi:list){
			System.out.println("评论: "+ oi.getComments());
		}
		
		if(list != null && list.size() > 0){
			return list;
		}
		return null;
	}

 

	public int colorState(int proId) {
		String hql="select p.color from Product p where p.pid="+proId;
		List<String> list = this.getHibernateTemplate().find(hql);
		for(String c:list){

			if(c==null){
				return 0;
			}
		}
	 
		 
		return 1;
	}

	public int sizeState(int proId) {
		String hql="select p.size from Product p where p.pid="+proId;
		List<String> list = this.getHibernateTemplate().find(hql);
		for(String s:list){
			

			 if(s==null){
				 return 0;
			 }
		}
	 
		return 1;
	}

	public List<String> colorList(int proId) {
		String hql="select p.color from Product p where p.pid="+proId;
		List<String> list = this.getHibernateTemplate().find(hql);
		List<String> colorList=new ArrayList<String>();
		for(String s:list){
			for(String w:CustomUtils.splitStr(s)){
				colorList.add(w);
			}
		}
		return colorList;
	}

	public List<String> sizeList(int proId) {
		String hql="select p.size from Product p where p.pid="+proId;
		List<String> list = this.getHibernateTemplate().find(hql);
		List<String> sizeList=new ArrayList<String>();
		for(String s:list){
			for(String w:CustomUtils.splitStr(s)){
				sizeList.add(w);
			}
		}
		return sizeList;
	}

	public void updateVisits(int proId) {
		Product product= (Product)getHibernateTemplate().get(Product.class, proId);
	    Integer v=product.getVisits();
	    if(v==null){
	    	product.setVisits(1);
	    }else{
	    	product.setVisits(v+1);
	    }
		System.out.println("updateVisits 商品的名字:  "+product.getPname());
	}

	public List<Product> findByPageVisits(int begin, int limit) {
		
		String hql = "from Product order by visits desc";
		List<Product> list =  this.getHibernateTemplate().execute(new PageHibernateCallback<Product>(hql, null, begin, limit));
		if(list != null && list.size() > 0){
			return list;
		}
		return null;
	}

	public List<Product> findByPageSales(int begin, int limit) {
		String hql = "from Product order by sales desc";
		List<Product> list =  this.getHibernateTemplate().execute(new PageHibernateCallback<Product>(hql, null, begin, limit));
		if(list != null && list.size() > 0){
			return list;
		}
		return null;
	}

 


}

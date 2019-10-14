package com.mym.shop.dao;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.engine.query.OrdinalParameterDescriptor;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.mym.shop.uitls.PageBean;
import com.mym.shop.uitls.PageHibernateCallback;
import com.mym.shop.vo.Order;
import com.mym.shop.vo.OrderItem;
import com.mym.shop.vo.Product;
import com.mym.shop.vo.User;

public class OrderDao extends HibernateDaoSupport  {

	
	public void save(Order order) {
		
		this.getHibernateTemplate().save(order);
		
	}

	
	public int findCountByUid(Integer uid) {
		String hql = "select count(*) from Order o where o.user.uid = ?";
		List<Long> list = this.getHibernateTemplate().find(hql, uid);
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	
	public List<Order> findPageByUid(Integer uid, int begin, int limit) {
		String hql = "from Order o where o.user.uid = ? order by o.ordertime desc";
		List<Order> list = this.getHibernateTemplate().execute(
				new PageHibernateCallback<Order>(hql, new Object[] { uid },
						begin, limit));
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}

	
	public Order findByOid(Integer oid) {
		return this.getHibernateTemplate().get(Order.class, oid);
	}

	
	public void update(Order currOrder) {
		this.getHibernateTemplate().update(currOrder);
		
	}

	
	public int findCount() {
		String hql = "select count(*) from Order";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	
	public List<Order> findByPage(int begin, int limit) {
		String hql = "from Order order by ordertime desc";
		List<Order> list = this.getHibernateTemplate().execute(
				new PageHibernateCallback<Order>(hql, null, begin, limit));
		return list;
	}

	
	public List<OrderItem> findOrderItem(Integer oid) {
		String hql = "from OrderItem oi where oi.order.oid = ?";
		List<OrderItem> list = this.getHibernateTemplate().find(hql, oid);
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}

	public List<Order> findPageByPname(Integer uid, String pname, int begin,int limit) {
		
		System.out.println(pname);
		String hql = "select ord from Order ord,OrderItem ordi,Product p where ord.oid=ordi.order.oid and ordi.product.pid=p.pid and ord.user.uid= ? and p.pname like '%"+pname+"%'";
		List<Order> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Order>(hql, new Object[] { uid }, begin, limit));            
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}

	public int findCountByUidPname(Integer uid, String proname) {
		String hql = "select count(*) from Order ord,OrderItem ordi,Product p where ord.oid=ordi.order.oid and ordi.product.pid=p.pid and ord.user.uid= ? and p.pname like '%"+proname+"%'";
		List<Long> list = this.getHibernateTemplate().find(hql, uid);
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	public int findCountByUidMemberPoints(Integer uid) {
		String hql = "select count(*) from Order o where o.state=4 and o.user.uid = ? ";
		List<Long> list = this.getHibernateTemplate().find(hql, uid);
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	public List<Order> findPageByUidMemberPoints(Integer uid, int begin,int limit) {
		String hql = "from Order o where o.state=4 and o.user.uid = ? order by o.ordertime desc";
		List<Order> list = this.getHibernateTemplate().execute(
				new PageHibernateCallback<Order>(hql, new Object[] { uid },
						begin, limit));
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}

	public List<Order> findByUidOrderItemMemberPoints(Integer uid) {
		String hql = "from Order o where o.state=4 and o.user.uid = ?";
		List<Order> list = this.getHibernateTemplate().find(hql, uid);
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}
	public int findCountByUidEvalCode(Integer uid, int evalCode) {
		String hql = "select count(*) from Order ord,OrderItem ordi,Product p where ord.oid=ordi.order.oid and ordi.product.pid=p.pid and ord.user.uid= ? and ordi.evaluation_code="+evalCode;
		List<Long> list = this.getHibernateTemplate().find(hql, uid);
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	public List<OrderItem> findPageByEvalCode(Integer uid, int evalCode, int begin,
			int limit) {
		
		String hql = "select ordi from Order ord,OrderItem ordi,Product p where ord.oid=ordi.order.oid and ordi.product.pid=p.pid and ord.user.uid= ? and ordi.evaluation_code="+evalCode+" order by ord.ordertime desc ";
		List<OrderItem> list = this.getHibernateTemplate().execute(
				new PageHibernateCallback<OrderItem>(hql, new Object[] { uid },
						begin, limit));
		
		
		for(OrderItem ordi : list){
				 System.out.print("返回订单项********");
				 System.out.print(ordi.getProduct().getPname());
				 
			}
		
		
		if (list != null && list.size() > 0) {
			return list;
		}
		
	 
		return null;
	}


	public void saveComments(String comments, int evalCode, int ordItId) {
		 
	 
		OrderItem oiItem= (OrderItem)getHibernateTemplate().get(OrderItem.class, ordItId);
		oiItem.setComments(comments);
		oiItem.setEvaluation_code(evalCode);
		
		
		System.out.println("订单项里面商品的名字:  "+oiItem.getProduct().getPname());
	 
 
		 
           
	}

	public void updateEvalCode(int ordId) {
		 
		System.out.println("执行更新评价状态码：");
        String hql="update OrderItem oi set oi.evaluation_code=2 where  oi.order.oid="+ordId;
        Query query=getSession().createQuery(hql);
        query.executeUpdate();
		
		  
	}

	public void updateState(int ordId) {
		System.out.println("执行更新交易状态码：");
        String hql="update Order ord set ord.state=2 where ord.oid="+ordId;
        Query query=getSession().createQuery(hql);
        query.executeUpdate();
		
	}

	public void updateSales(int ordId) {
		String hql = "select ordi from OrderItem ordi where ordi.order.oid=?";
		List<OrderItem> list = this.getHibernateTemplate().find(hql, ordId);
		for(OrderItem oi:list){
			System.out.println("updateSales: "+oi.getProduct().getPname());
			Product product= (Product)getHibernateTemplate().get(Product.class, oi.getProduct().getPid());
		    Integer s=product.getSales();
		    if(s==null){
		    	product.setSales(1);
		    }else{
		    	product.setSales(s+1);
		    }
			System.out.println("updateSales 商品的名字:  "+product.getPname());
		}
		 
		
	}

	public void updateMp(int ordId) {
		
		
		System.out.println("更新会员积分:+++");
		
		String hql = "select ord from Order ord where ord.oid=?";
		List<Order> list = this.getHibernateTemplate().find(hql, ordId);
		for(Order ord:list){
			System.out.println("updateMp"+ord.getUser().getName());
			User user=(User)getHibernateTemplate().get(User.class, ord.getUser().getUid());
			Double mp=user.getMember_points();
			if(mp==null){
				user.setMember_points(ord.getTotal());
			}else{
				user.setMember_points(mp+ord.getTotal());
			}
		}
	}

 

	public List<Order> findMpPageByPname(Integer uid, String proname,
			int begin, int limit) {
		String hql = "select ord from Order ord,OrderItem ordi,Product p where ord.oid=ordi.order.oid and ordi.product.pid=p.pid and ord.state=4"+" and ord.user.uid= ? and p.pname like '%"+proname+"%'";
		List<Order> list = this.getHibernateTemplate().execute(
				new PageHibernateCallback<Order>(hql, new Object[] { uid },
						begin, limit));
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}

	public int findMpCountByUidPname(Integer uid, String proname) {
		String hql = "select count(*) from Order ord,OrderItem ordi,Product p where ord.oid=ordi.order.oid and ordi.product.pid=p.pid and ord.state=4"+"  and ord.user.uid= ? and p.pname like '%"+proname+"%'";
		List<Long> list = this.getHibernateTemplate().find(hql, uid);
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	public Double getMp(Integer uid) {
		String hql = "select  u.member_points from  User u where u.uid=?";
		List<Double> list = this.getHibernateTemplate().find(hql, uid);
		if (list != null && list.size() > 0) {
			return list.get(0).doubleValue();
		}
		return 0.0;
 
	}
 

 


}

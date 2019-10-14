package com.mym.shop.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.mym.shop.uitls.PageHibernateCallback;
import com.mym.shop.vo.Category;
import com.mym.shop.vo.Info;
 

public class InfoDao extends HibernateDaoSupport{

	public void saveInfo(Info info) {
		 
		this.getHibernateTemplate().save(info);
		
	}

	public int findCount() {
		
		String hql = "select count(*) from Info";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list != null && list.size() > 0){
			return list.get(0).intValue();
		}
		return 0;
	}

	public List<Info> findByPage(int begin, int limit) {
		
		String hql = "from Info order by pub_time desc";
		List<Info> list =  this.getHibernateTemplate().execute(new PageHibernateCallback<Info>(hql, null, begin, limit));
		
		for(Info i:list){
			System.out.print("发布时间："+i.getPub_time()+"\n");
		}
		
		if(list != null && list.size() > 0){
			return list;
		}
		
 
		return null;
	}

	public Info findById(Integer info_id) {
		
		return this.getHibernateTemplate().get(Info.class,info_id);
	 
	}

	public void delInfo(Info inf) {
		
		this.getHibernateTemplate().delete(inf);
		
	}

	public void updateInfo(Info info) {
		 this.getHibernateTemplate().update(info);
		
	}

}

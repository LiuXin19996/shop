package com.mym.shop.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.mym.shop.uitls.PageHibernateCallback;
import com.mym.shop.vo.AdminUser;

public class AdminUserDao extends HibernateDaoSupport{

	
	public AdminUser login(AdminUser adminUser) {
		String hql = "from AdminUser where username = ? and password = ?";
		List<AdminUser> list = this.getHibernateTemplate().find(hql, adminUser.getUsername(),adminUser.getPassword());
		if(list != null && list.size()>0){
			return list.get(0);
		}
		return null;
	}

	public int findCount() {
		String hql = "select count(*) from AdminUser";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	public List<AdminUser> findByPage(int begin, int limit) {
		String hql = "from AdminUser";
		List<AdminUser> list = this.getHibernateTemplate().execute(
				new PageHibernateCallback<AdminUser>(hql, null, begin, limit));
		return list;
	}

	public AdminUser findByUid(Integer uid) {
		return this.getHibernateTemplate().get(AdminUser.class, uid);
	}

	public void delete(AdminUser existAdminUser) {
		this.getHibernateTemplate().delete(existAdminUser);
	}

	
	public void update(AdminUser existAdminUser) {
		this.getHibernateTemplate().update(existAdminUser);
	}

	public void save(AdminUser adminUser) {
		
		this.getHibernateTemplate().save(adminUser);
	}

}

package com.mym.shop.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.mym.shop.dao.AdminUserDao;
import com.mym.shop.uitls.PageBean;
import com.mym.shop.vo.AdminUser;
import com.mym.shop.vo.User;

@Transactional
public class AdminUserService {
	
	private AdminUserDao adminUserDao;

	public void setAdminUserDao(AdminUserDao adminUserDao) {
		this.adminUserDao = adminUserDao;
	}

	public AdminUser login(AdminUser adminUser) {
		return adminUserDao.login(adminUser);
	}

	
	public PageBean<AdminUser> findByPage(Integer page) {
		PageBean<AdminUser> pageBean = new PageBean<AdminUser>();
		
		pageBean.setPage(page);
		
		
		int limit = 5;
		pageBean.setLimit(limit);
		
		int totalCount = 0;
		totalCount = adminUserDao.findCount();
		pageBean.setTotalCount(totalCount);
		
		int totalPage = 0;
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		
		int begin = (page - 1)*limit;
		List<AdminUser> list = adminUserDao.findByPage(begin,limit);
		pageBean.setList(list);
		return pageBean;
	}


	public AdminUser findByUid(Integer uid) {
		return adminUserDao.findByUid(uid);
	}


	public void delete(AdminUser existAdminUser) {
		adminUserDao.delete(existAdminUser);
	}

	
	public void update(AdminUser existAdminUser) {
		adminUserDao.update(existAdminUser);
	}

	public void save(AdminUser adminUser) {
		
		adminUserDao.save(adminUser);
	}
	

}

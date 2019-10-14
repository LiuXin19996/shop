package com.mym.shop.service;

import org.springframework.transaction.annotation.Transactional;
import java.util.List;
import com.mym.shop.dao.UserDao;
import com.mym.shop.uitls.MailUitls;
import com.mym.shop.uitls.PageBean;
import com.mym.shop.uitls.UUIDUtils;
import com.mym.shop.vo.User;

@Transactional
public class UserService {
	private UserDao userDao;
	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	
	
	public User findByUsername(String username){
		return userDao.findByUsername(username);
	}
	
	
	
	public void save(User user) {
		
		user.setState(0); 
		String code = UUIDUtils.getUUID()+UUIDUtils.getUUID();
		user.setCode(code);
		userDao.save(user);
		
		MailUitls.sendMail(user.getEmail(), code);
	}
	

	
	public User findByCode(String code) {
		return userDao.findByCode(code);
	}
	
	
	public void update(User user) {
		userDao.update(user);
	}
	
	
	public User login(User user) {
		return userDao.login(user);
	}


	
	public PageBean<User> findByPage(Integer page) {
		PageBean<User> pageBean = new PageBean<User>();
		
		pageBean.setPage(page);
		
		
		int limit = 5;
		pageBean.setLimit(limit);
		
		int totalCount = 0;
		totalCount = userDao.findCount();
		pageBean.setTotalCount(totalCount);
		
		int totalPage = 0;
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		
		int begin = (page - 1)*limit;
		List list = userDao.findByPage(begin,limit);
		pageBean.setList(list);
		return pageBean;
	}


	public User findByUid(Integer uid) {
		return userDao.findByUid(uid);
	}


	public void delete(User existUser) {
		userDao.delete(existUser);
	}


	public PageBean<User> findByMemberPointsPage(Integer page) {
		PageBean<User> pageBean = new PageBean<User>();
		
		pageBean.setPage(page);
		
		
		int limit = 5;
		pageBean.setLimit(limit);
		
		int totalCount = 0;
		totalCount = userDao.findCount();
		pageBean.setTotalCount(totalCount);
		
		int totalPage = 0;
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		
		int begin = (page - 1)*limit;
		List list = userDao.findByMemberPointsPage(begin,limit);
		pageBean.setList(list);
		return pageBean;
	}


 

}

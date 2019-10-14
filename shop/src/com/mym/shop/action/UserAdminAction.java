package com.mym.shop.action;

import com.mym.shop.service.UserService;
import com.mym.shop.uitls.PageBean;
import com.mym.shop.vo.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 后台用户管理的Action类
 * @author mym
 *
 */
public class UserAdminAction extends ActionSupport implements ModelDriven<User>{
	
	private User user = new User();

	public User getModel() {
		return user;
	}
	
	
	private UserService userService;
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	
	private Integer page;

	public void setPage(Integer page) {
		this.page = page;
	}

	
	public String findAll(){
		PageBean<User> pageBean = userService.findByPage(page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findAll";
	}
	
	
	public String findAllMemberPoints(){
		PageBean<User> pageBean = userService.findByPage(page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findAllMemberPoints";
	}
	
	
	
	public String delete(){
		User existUser = userService.findByUid(user.getUid());
		userService.delete(existUser);
		return "deleteSuccess";
	}
	
	
	public String edit(){
		user = userService.findByUid(user.getUid());
		return "editSuccess";
	}
	
	
	public String update(){
		userService.update(user);
		return "updateSuccess";
	}
}

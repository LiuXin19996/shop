package com.mym.shop.action;

import org.apache.struts2.ServletActionContext;

import com.mym.shop.service.AdminUserService;
import com.mym.shop.uitls.PageBean;
import com.mym.shop.vo.AdminUser;
import com.mym.shop.vo.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminUserAction extends ActionSupport implements ModelDriven<AdminUser> {

	
	private AdminUser adminUser = new AdminUser();

	
	private AdminUserService adminUserService;
	
	public AdminUser getModel() {
		 
		return adminUser;
	}

	public void setAdminUserService(AdminUserService adminUserService) {
		this.adminUserService = adminUserService;
	}
	
	
	public String login() {
		
		AdminUser existAdminUser = adminUserService.login(adminUser);
		
		if (existAdminUser == null) {
			
			this.addActionError("用户名或密码错误!");
			return "loginFail";
		} else {
			
			ServletActionContext.getRequest().getSession()
					.setAttribute("existAdminUser", existAdminUser);
			return "loginSuccess";
		}
	}
    
	
	private Integer page;

	public void setPage(Integer page) {
		this.page = page;
	}

	
	public String findAll(){
		PageBean<AdminUser> pageBean = adminUserService.findByPage(page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findAll";
	}
	
	
	public String delete(){
		AdminUser existAdminUser = adminUserService.findByUid(adminUser.getUid());
		adminUserService.delete(existAdminUser);
		return "deleteSuccess";
	}
	
	
	public String edit(){
		adminUser = adminUserService.findByUid(adminUser.getUid());
		return "editSuccess";
	}
	
	
	public String update(){
		adminUserService.update(adminUser);
		return "updateSuccess";
	}
	
	
	public String save(){
		
		adminUserService.save(adminUser);
		
		return "saveSuccess";
	}
	/**
	 * 管理员用户退出的方法
	 */
	public String quit() {
		
		ServletActionContext.getRequest().getSession().invalidate();
		return "quit";
	}
}

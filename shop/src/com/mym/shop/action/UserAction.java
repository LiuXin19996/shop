package com.mym.shop.action;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.omg.CORBA.PRIVATE_MEMBER;

import com.mym.shop.service.UserService;
import com.mym.shop.vo.Cart;
import com.mym.shop.vo.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends ActionSupport implements ModelDriven<User> {

	private User user = new User();
    private String pwd;
	
	private String checkcode;
	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}
	
	private int usid;
	private String realName;
	 
	
	private File upload;
	private String uploadFileName;
	private String uploadContentType;

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public void setUsid(int usid) {
		this.usid = usid;
	}
	
	
	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
 

	 

	public void setRealName(String realName) {
		this.realName = realName;
	}

	
	private UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public User getModel() {
		
		return user;
	}

	public String registPage() {

		return "registPage";
	}

	public String findByName() throws IOException {
		
		User existUser = userService.findByUsername(user.getUsername());
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		
		if (existUser != null) {
			
			response.getWriter().println("<font color='red'>用户名已经存在</font>");
		} else {
			
			response.getWriter().println("<font color='green'>用户名可以使用</font>");
		}
		return NONE;
	}

	
	public String regist() {
		
		User existUser = userService.findByUsername(user.getUsername());
		if(existUser!=null){
			return "registPage";
		}
         	
		
		
		String checkcode1 = (String) ServletActionContext.getRequest()
				.getSession().getAttribute("checkcode");
		if (!checkcode.equalsIgnoreCase(checkcode1)) {
			this.addActionError("验证码输入错误!");
			return "checkcodeFail";
		}
		userService.save(user);
		this.addActionMessage("注册成功!请去邮箱激活!");
		return "msg";
	}

	
	public String active() {
		
		User existUser = userService.findByCode(user.getCode());
		
		if (existUser == null) {
			
			this.addActionMessage("激活失败:激活码错误!");
		} else {
			
			
			existUser.setState(1);
			existUser.setCode(null);
			existUser.setMember_points(0.0);
			userService.update(existUser);
			this.addActionMessage("激活成功:请去登录!");
		}
		return "msg";
	}

	
	public String loginPage() {
		return "loginPage";
	}

	
	public String login() {
		User existUser = userService.login(user);
		
		if (existUser == null) {
			
			this.addActionError("登录失败:用户名或密码错误或用户未激活!");
			return LOGIN;
		} else {
			
			
			
			
			ServletActionContext.getRequest().getSession()
					.setAttribute("existUser", existUser);
			setPwd(existUser.getPassword());
			
			return "loginSuccess";
		}

	}

	
	public String quit() {
		
		ServletActionContext.getRequest().getSession().invalidate();
		return "quit";
	}

	
	
	public String updateInfo() throws IOException {

		System.out.print("用户ID"+user.getUid());
		User existUser = userService.findByUsername(user.getUsername());
		if(existUser!=null){
			if(user.getUid()!=existUser.getUid()){
				return "showInfo";
			} 
		}
		
		 
		User user1=userService.findByUid(usid);	
		System.out.println("updateInfo77: "+user.getName());
		
		user1.setState(1);
		user1.setUsername(user.getUsername());
		user1.setPassword(user.getPassword());
		user1.setName(user.getName());
		user1.setEmail(user.getEmail());
		user1.setPhone(user.getPhone());
		user1.setAddr(user.getAddr());
		 
		userService.update(user1);
		
		
		ServletActionContext.getRequest().getSession()
					.setAttribute("existUser", user1);
			
		return "showInfo";
	}

	
	public String show() {
		
        
        return "showInfo";
	}
	
	 
}

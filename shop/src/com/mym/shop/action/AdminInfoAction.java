package com.mym.shop.action;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.mym.shop.service.InfoService;
import com.mym.shop.uitls.PageBean;
import com.mym.shop.vo.Info;
import com.mym.shop.vo.Product;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.sun.org.apache.bcel.internal.generic.NEW;

public class AdminInfoAction extends ActionSupport implements ModelDriven<Info>{
	
	private Info info=new Info(); 
	private String adminName;
	private Integer page;
	
	private InfoService infoService=new InfoService();
	
	public Info getModel() {
		 
		return info;
	}


    


	public Info getInfo() {
		return info;
	}





	public void setInfo(Info info) {
		this.info = info;
	}



	public String getAdminName() {
		return adminName;
	}





	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}





	public Integer getPage() {
		return page;
	}


	public void setPage(Integer page) {
		this.page = page;
	}


	public InfoService getInfoService() {
		return infoService;
	}

	public void setInfoService(InfoService infoService) {
		this.infoService = infoService;
	}

	public String addPage(){
		
		return "addPage";
	}
	
	public String editPage(){
		
		
		Info inf=infoService.findById(info.getInfo_id());
		ActionContext.getContext().getValueStack().set("inf", inf);
		return "editPage";
	}
	
	public String saveInfo(){
		
	    
        Date date = new Date();
        
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        
        String createdate = sdf.format(date);
        
		info.setPub_time(createdate);
		info.setPublisher(adminName);
		
		
		infoService.saveInfo(info);
 
		
		PageBean<Info> pageBean = infoService.findByPage(page);
		
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		
		
		return "saveInfo";
	}
	
	public String findAll(){
		
		
		PageBean<Info> pageBean = infoService.findByPage(page);
		
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		
		return "findAll";
	}
	
	public String delInfo(){
		
		
		Info inf=infoService.findById(info.getInfo_id());
		infoService.delInfo(inf);
		return "delInfo";
	}
	
	public String editInfo(){
		
		
		Info inf=infoService.findById(info.getInfo_id());
		infoService.delInfo(inf);
		return "editInfo";
	}
	
	public String updateInfo(){
		
		
        Date date = new Date();
        
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        
        String createdate = sdf.format(date);
        
		info.setPub_time(createdate);
		info.setPublisher(adminName);

		infoService.updateInfo(info);
		PageBean<Info> pageBean = infoService.findByPage(page);
		
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		
		 
		return "updateInfo";
	}
	
}

package com.mym.shop.action;

import com.mym.shop.service.InfoService;
import com.mym.shop.uitls.PageBean;
import com.mym.shop.vo.Info;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.sun.org.apache.bcel.internal.generic.NEW;

public class InfoAction extends ActionSupport implements ModelDriven<Info>{
	
	private InfoService infoService =new InfoService();
	private Info info =new Info();
	
	private Integer page;

	public InfoService getInfoService() {
		return infoService;
	}

	public void setInfoService(InfoService infoService) {
		this.infoService = infoService;
	}
	
	
	
    public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public String findAll(){
    	
		System.out.print("page: "+page);
		PageBean<Info> pageBean = infoService.findByPage(page);
		
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		
		return "findAll";
    	 
    }
	
	public String infoDetails(){
		
		System.out.println("公告ID："+info.getInfo_id());
		Info infoma=infoService.findById(info.getInfo_id());
		ActionContext.getContext().getValueStack().set("infoma", infoma);
		return "infoDetails";
	}

	public Info getModel() {
		 
		return info;
	}
	
	
	
	

}

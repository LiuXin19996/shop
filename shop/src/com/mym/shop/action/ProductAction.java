package com.mym.shop.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.mym.shop.service.CategoryService;
import com.mym.shop.service.ProductService;
import com.mym.shop.uitls.CustomUtils;
import com.mym.shop.uitls.PageBean;
import com.mym.shop.vo.OrderItem;
import com.mym.shop.vo.Product;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class ProductAction extends ActionSupport implements ModelDriven<Product>  {

	
	private Product product = new Product();
	
	private ProductService productService;
	
	private Integer cid;
	
	private Integer csid;
	
	private int page;
    
	
	private String proname="123";
	
	
	private int colorState;
	
	
	private  int  sizeState;
	
	
	private List<String> colorList;
	
	
	private List<String> sizeList;
	
	
	
   
	public void setColorList(List<String> colorList) {
		this.colorList = colorList;
	}



	public void setSizeList(List<String> sizeList) {
		this.sizeList = sizeList;
	}



	public int getColorState() {
		return colorState;
	}



	public void setColorState(int colorState) {
		this.colorState = colorState;
	}



	public int getSizeState() {
		return sizeState;
	}



	public void setSizeState(int sizeState) {
		this.sizeState = sizeState;
	}



	public void setProname(String proname) {
		this.proname = proname;
		 
	}
	
	

	public String getProname() {
		return proname;
	}

	
	private int statusCode=1;
	
	private int evalCode=1;
	
	
	private int proId;


	

	public void setEvalCode(int evalCode) {
		this.evalCode = evalCode;
	}


	


	public int getStatusCode() {
		return statusCode;
	}



	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}



	public void setProId(int proId) {
		this.proId = proId;
	}

	


	public int getProId() {
		return proId;
	}

	
	private CategoryService categoryService;
	
	 
	
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

 

	public void setPage(int page) {
		this.page = page;
	}

 

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	

	public Integer getCid() {
		return cid;
	}



	public Integer getCsid() {
		return csid;
	}



	public void setCsid(Integer csid) {
		this.csid = csid;
	}



	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public Product getModel() {
		return product;
	}

	
	public String findByPid() {
		proId=product.getPid();
		System.out.println("proId: "+proId);
		
		productService.updateVisits(proId);
		
		colorState=colorState(proId);
		sizeState=sizeState(proId);
		ActionContext.getContext().getValueStack().set("colorState", colorState);
		ActionContext.getContext().getValueStack().set("sizeState", sizeState);
		ActionContext.getContext().getValueStack().set("proId", proId);
		if(colorState==1){
			colorList=colorList(proId);
			System.out.println("打印颜色列表：");
			for(String c:colorList){
				System.out.println(c);
			}
			ActionContext.getContext().getValueStack().set("colorList", colorList);
		}
		if(sizeState==1){
			sizeList=sizeList(proId);
			System.out.println("打印size列表：");
			for(String s:sizeList){
				System.out.println(s);
			}
			ActionContext.getContext().getValueStack().set("sizeList", sizeList);
		}
		
		product = productService.findByPid(product.getPid());
		ActionContext.getContext().getValueStack().set("product", product);
		return "findByPid";
	}
	
	
	public String findByCid() {
		
		
		PageBean<Product> pageBean = productService.findByPageCid(cid, page);
		
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findByCid";
	}

	
	public String findByCsid() {
		
		PageBean<Product> pageBean = productService.findByPageCsid(csid, page);
		
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findByCsid";
	}
	
	
	public String findByPname() {
		
		System.out.println(proname);
		
		PageBean<Product> pageBean = productService.findByPagePname(proname, page);
	 
		
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		
		System.out.print(proname);
		return "findByPname";
	}

	
	public String  showComments(){
		String str="red-green-blue";
		CustomUtils.splitStr(str);
		colorState=colorState(proId);
		sizeState=sizeState(proId);
		ActionContext.getContext().getValueStack().set("colorState", colorState);
		ActionContext.getContext().getValueStack().set("sizeState", sizeState);
		System.out.println("showComments  proId: "+proId);
		
		if(colorState==1){
			colorList=colorList(proId);
			System.out.println("打印颜色列表：");
			for(String c:colorList){
				System.out.println(c);
			}
			ActionContext.getContext().getValueStack().set("colorList", colorList);
		}
		if(sizeState==1){
			sizeList=sizeList(proId);
			System.out.println("打印size列表：");
			for(String s:sizeList){
				System.out.println(s);
			}
			ActionContext.getContext().getValueStack().set("sizeList", sizeList);
		}
		
		product =productService.findByPid(proId);
		PageBean<OrderItem> pageBean=productService.showComments(proId,page,evalCode);
		ActionContext.getContext().getValueStack().set("product", product);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "showComments";
	}
	
	
	public  String introProduct(){
		colorState=colorState(proId);
		sizeState=sizeState(proId);
		ActionContext.getContext().getValueStack().set("colorState", colorState);
		ActionContext.getContext().getValueStack().set("sizeState", sizeState);
		System.out.println("introProduct proId: "+proId);
		if(colorState==1){
			colorList=colorList(proId);
			System.out.println("打印颜色列表：");
			for(String c:colorList){
				System.out.println(c);
			}
			ActionContext.getContext().getValueStack().set("colorList", colorList);
		}
		if(sizeState==1){
			sizeList=sizeList(proId);
			System.out.println("打印size列表：");
			for(String s:sizeList){
				System.out.println(s);
			}
			ActionContext.getContext().getValueStack().set("sizeList", sizeList);
		}
		
		product = productService.findByPid(proId);
		ActionContext.getContext().getValueStack().set("product", product);
		return "introProduct";
	}

	
	
	
	private int colorState(int proId){
		colorState=productService.colorState(proId);
		return colorState;
	}
	

	
	private int sizeState(int proId){
		 
		sizeState=productService.sizeState(proId);
		return sizeState;
	}
	
	
	private List<String> colorList(int proId){
		List<String> colorList=productService.colorList(proId);
		return colorList;
	}
	 
	
	private List<String> sizeList(int proId){
		List<String> sizeList=productService.sizeList(proId);
		return sizeList;
	}
	
	private void updateVisits(int proId){
		productService.updateVisits(proId);
	}
	
 
	
	 
}

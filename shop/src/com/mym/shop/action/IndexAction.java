package com.mym.shop.action;

import java.util.List;

import com.mym.shop.service.CategoryService;
import com.mym.shop.service.ProductService;
import com.mym.shop.vo.Category;
import com.mym.shop.vo.Product;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class IndexAction extends ActionSupport{

	
	private CategoryService categoryService;

	private ProductService productService;
	
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	 
	public String execute(){
		
		List<Category> cList = categoryService.findAll();
		
		ActionContext.getContext().getSession().put("cList", cList);
		
		List<Product> hList = productService.findHot();
		
		ActionContext.getContext().getValueStack().set("hList", hList);
		
		List<Product> nList = productService.findNew();
		
		ActionContext.getContext().getValueStack().set("nList", nList);
		return "index";
	}
	

}

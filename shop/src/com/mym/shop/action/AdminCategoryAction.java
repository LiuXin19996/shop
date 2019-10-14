package com.mym.shop.action;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.mym.shop.service.CategorySecondService;
import com.mym.shop.service.CategoryService;
import com.mym.shop.service.ProductService;
import com.mym.shop.vo.Category;
import com.mym.shop.vo.CategorySecond;
import com.mym.shop.vo.Product;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminCategoryAction extends ActionSupport implements ModelDriven<Category>{

	
	private Category category = new Category();
	public Category getModel() {
		return category;
	}
	
	public CategoryService categoryService;
	public CategorySecondService  categorySecondService;
	public ProductService  productService;
	
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public void setCategorySecondService(CategorySecondService categorySecondService) {
		this.categorySecondService = categorySecondService;
	}

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	
	
	public String findAll(){
		
		List<Category> cList = categoryService.findAll();
		
		ActionContext.getContext().getValueStack().set("cList", cList);
		return "findAll";
	}
	
	
	public String save(){
		
		categoryService.save(category);
		
		return "saveSuccess";
	}
	
	
		public String delete(){
			
			
			category = categoryService.findByCid(category.getCid());

	        
			categoryService.delete(category);
			
			return "deleteSuccess";
		}
		
		
		public String edit(){
			
			
			category = categoryService.findByCid(category.getCid());
			
			return "editSuccess";
		}
		
		
		public String update(){
			
			categoryService.update(category);
			
			return "updateSuccess";
		}

}

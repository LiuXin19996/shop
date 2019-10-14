package com.mym.shop.action;

import java.util.List;

import com.mym.shop.service.CategorySecondService;
import com.mym.shop.service.CategoryService;
import com.mym.shop.uitls.PageBean;
import com.mym.shop.vo.Category;
import com.mym.shop.vo.CategorySecond;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminCategorySecondAction extends ActionSupport implements ModelDriven<CategorySecond>{
	   
		private CategorySecond categorySecond = new CategorySecond();
		
		private Integer page;
		
		private CategorySecondService categorySecondService;
		
		private CategoryService categoryService;
	
		
	
	    public void setCategorySecond(CategorySecond categorySecond) {
			this.categorySecond = categorySecond;
		}



		public void setPage(Integer page) {
			this.page = page;
		}



		public void setCategorySecondService(CategorySecondService categorySecondService) {
			this.categorySecondService = categorySecondService;
		}



		public void setCategoryService(CategoryService categoryService) {
			this.categoryService = categoryService;
		}



	    public CategorySecond getModel() {
		
		return categorySecond;
	    }
	    
		
		public String findAll() {
			
			PageBean<CategorySecond> pageBean = categorySecondService
					.findByPage(page);
			
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			return "findAll";
		}
		
		
		public String addPage() {
			
			List<Category> cList = categoryService.findAll();
			
			ActionContext.getContext().getValueStack().set("cList", cList);
			
			return "addPage";
		}
		
		
		public String save() {
			categorySecondService.save(categorySecond);
			return "saveSuccess";
		}
		
		
		public String delete() {
			categorySecond=categorySecondService.findByCsid(categorySecond.getCsid());
			categorySecondService.delete(categorySecond);
			return "deleteSuccess";
		}
		
		
		public String edit() {
			
			categorySecond = categorySecondService.findByCsid(categorySecond
					.getCsid());
			
			List<Category> cList = categoryService.findAll();
			
			ActionContext.getContext().getValueStack().set("cList", cList);
			
			return "editSuccess";
		}
		
		
		public String update(){
			categorySecondService.update(categorySecond);
			return "updateSuccess";
		}

	
}

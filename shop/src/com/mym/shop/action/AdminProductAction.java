package com.mym.shop.action;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import com.mym.shop.service.CategorySecondService;
import com.mym.shop.service.ProductService;
import com.mym.shop.uitls.PageBean;
import com.mym.shop.vo.CategorySecond;
import com.mym.shop.vo.Product;
 

public class AdminProductAction extends ActionSupport implements ModelDriven<Product> {

	
	private Product product = new Product();

	private String proname="123";
	
	

	public void setProname(String proname) {
		this.proname = proname;
	}
	
	

	public String getProname() {
		return proname;
	}



	public Product getModel() {
		return product;
	}
	 
	
	private Integer page;

	public void setPage(Integer page) {
		this.page = page;
	}

	
	private ProductService productService;

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	
	private CategorySecondService categorySecondService;

	public void setCategorySecondService(
			CategorySecondService categorySecondService) {
		this.categorySecondService = categorySecondService;
	}
	
	
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
	
	public String findAll() {
		
		System.out.println(proname+"zg");
		PageBean<Product> pageBean = productService.findByPage(page);
		
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		
		return "findAll";
	}
	
	
	public String addPage() {
		
		List<CategorySecond> csList = categorySecondService.findAll();
		
		ActionContext.getContext().getValueStack().set("csList", csList);
		
		return "addPageSuccess";
	}


	
	public String save() throws IOException {
		
		product.setPdate(new Date());
		
		if(upload != null){
			
			
			
			String path = ServletActionContext.getServletContext().getRealPath(
					"/products");

			File diskFile = new File(path + "//" + uploadFileName);
			FileUtils.copyFile(upload, diskFile);
	
			product.setImage("products/" + uploadFileName);
		}
		productService.save(product);
		return "saveSuccess";
	}
	
	
	public String delete() {
		
		product = productService.findByPid(product.getPid());
		
		String path = ServletActionContext.getServletContext().getRealPath(
				"/" + product.getImage());
		File file = new File(path);
		file.delete();
		
		productService.delete(product);
		
		return "deleteSuccess";
	}
	
	
	public String edit() {
		
		product = productService.findByPid(product.getPid());
		
		List<CategorySecond> csList = categorySecondService.findAll();
		ActionContext.getContext().getValueStack().set("csList", csList);
		
		return "editSuccess";
	}
	
	
	public String update() throws IOException {
		
		product.setPdate(new Date());
		
		
		if(upload != null ){
			String delPath = ServletActionContext.getServletContext().getRealPath(
					"/" + product.getImage());
			File file = new File(delPath);
			file.delete();
			
			String path = ServletActionContext.getServletContext().getRealPath(
					"/products");
		
			File diskFile = new File(path + "//" + uploadFileName);
		
			FileUtils.copyFile(upload, diskFile);

			product.setImage("products/" + uploadFileName);
		}
		productService.update(product);
		
		return "updateSuccess";
	}
	
	
	public String findByPname() {
		
		PageBean<Product> pageBean = productService.findByPagePname(proname, page);
		
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		
		System.out.print(proname);
		return "findByPname";
	}
	
	
	public String findAllByVisits() {
		
		PageBean<Product> pageBean = productService.findByPageVisits(page);
		
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		
		return "findAllByVisits";
	}
	
	
	public String findAllBySales() {
		
		PageBean<Product> pageBean = productService.findByPageSales(page);
		
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		
		return "findAllBySales";
	}
}

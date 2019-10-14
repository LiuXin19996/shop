package com.mym.shop.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.mym.shop.vo.OrderItem;
import com.mym.shop.dao.ProductDao;
import com.mym.shop.uitls.PageBean;
import com.mym.shop.vo.Product;

@Transactional
public class ProductService {

	
	private ProductDao productDao;

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	
	
	public void save(Product product) {
		productDao.save(product);
	}

	
	public void delete(Product product) {
		productDao.delete(product);
	}

	
	public void update(Product product) {
		productDao.update(product);
	}


	
	public List<Product> findHot() {
		return productDao.findHot();
	}

	
	public List<Product> findNew() {
		return productDao.findNew();
	}

	
	public Product findByPid(Integer pid) {
		return productDao.findByPid(pid);
	}


	
	public PageBean<Product> findByPageCid(Integer cid, int page) {
		PageBean<Product> pageBean = new PageBean<Product>();
		
		pageBean.setPage(page);
		
		int limit = 8;
		pageBean.setLimit(limit);
		
		int totalCount = 0;
		totalCount = productDao.findCountCid(cid);
		pageBean.setTotalCount(totalCount);
		
		int totalPage = 0;
		
		if (totalCount % limit == 0) {
			totalPage = totalCount / limit;
		} else {
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		
		
		int begin = (page - 1) * limit;
		List<Product> list = productDao.findByPageCid(cid, begin, limit);
		pageBean.setList(list);
		return pageBean;
	}

	
	public PageBean<Product> findByPageCsid(Integer csid, int page) {
		PageBean<Product> pageBean = new PageBean<Product>();
		
		pageBean.setPage(page);
		
		int limit = 8;
		pageBean.setLimit(limit);
		
		int totalCount = 0;
		totalCount = productDao.findCountCsid(csid);
		pageBean.setTotalCount(totalCount);
		
		int totalPage = 0;
		
		if (totalCount % limit == 0) {
			totalPage = totalCount / limit;
		} else {
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		
		
		int begin = (page - 1) * limit;
		List<Product> list = productDao.findByPageCsid(csid, begin, limit);
		pageBean.setList(list);
		return pageBean;
	}

	
	public PageBean<Product> findByPage(Integer page) {
		PageBean<Product> pageBean = new PageBean<Product>();
		
		pageBean.setPage(page);
		
		int limit = 10;
		pageBean.setLimit(limit);
		
		int totalCount = 0;
		totalCount = productDao.findCount();
		pageBean.setTotalCount(totalCount);
		
		int totalPage = 0;
		
		if (totalCount % limit == 0) {
			totalPage = totalCount / limit;
		} else {
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		
		
		int begin = (page - 1) * limit;
		List<Product> list = productDao.findByPage(begin, limit);
		pageBean.setList(list);
		return pageBean;
	}
	

	public PageBean<Product> findByPagePname(String pname, int page) {
		
		PageBean<Product> pageBean = new PageBean<Product>();
		
		pageBean.setPage(page);
		
		int limit = 8;
		pageBean.setLimit(limit);
		
		int totalCount = 0;
		totalCount = productDao.findCountPname(pname);
		pageBean.setTotalCount(totalCount);
		
		int totalPage = 0;
		
		if (totalCount % limit == 0) {
			totalPage = totalCount / limit;
		} else {
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		
		
		int begin = (page - 1) * limit;
		List<Product> list = productDao.findByPagePname(pname, begin, limit);
		pageBean.setList(list);
		return pageBean;
	}

  public  PageBean<OrderItem> showComments(int proId,int page,int evalCode) {
		
		PageBean<OrderItem> pageBean = new PageBean<OrderItem>();
		
		pageBean.setPage(page);
		
		int limit = 8;
		pageBean.setLimit(limit);
		
		int totalCount = 0;
		totalCount = productDao.findCountCommentsByPid(proId,evalCode);
		pageBean.setTotalCount(totalCount);
		
		int totalPage = 0;
		
		if (totalCount % limit == 0) {
			totalPage = totalCount / limit;
		} else {
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		
		
		int begin = (page - 1) * limit;
		List<OrderItem> list = productDao.findCommentsByPagePid(proId,evalCode,begin, limit);
		pageBean.setList(list);
		return pageBean;
	 
	}
 
	public int colorState(int proId) {
		
		int colorState=productDao.colorState(proId);
		return colorState;
	}

	public int sizeState(int proId) {
		
		int sizeState=productDao.sizeState(proId);
		return sizeState;
	}

	public List<String> colorList(int proId) {
		List<String> colorList=productDao.colorList(proId);
		return colorList;
	}

	public List<String> sizeList(int proId) {
		List<String> sizeList=productDao.sizeList(proId);
		return sizeList;
	}

	public void updateVisits(int proId) {
		 
		productDao.updateVisits(proId);
		
	}

	public PageBean<Product> findByPageVisits(Integer page) {
			PageBean<Product> pageBean = new PageBean<Product>();
			
			pageBean.setPage(page);
			
			int limit = 10;
			pageBean.setLimit(limit);
			
			int totalCount = 0;
			totalCount = productDao.findCount();
			pageBean.setTotalCount(totalCount);
			
			int totalPage = 0;
			
			if (totalCount % limit == 0) {
				totalPage = totalCount / limit;
			} else {
				totalPage = totalCount / limit + 1;
			}
			pageBean.setTotalPage(totalPage);
			
			
			int begin = (page - 1) * limit;
			List<Product> list = productDao.findByPageVisits(begin, limit);
			pageBean.setList(list);
			return pageBean;
		}

	public PageBean<Product> findByPageSales(Integer page) {
		PageBean<Product> pageBean = new PageBean<Product>();
		
		pageBean.setPage(page);
		
		int limit = 10;
		pageBean.setLimit(limit);
		
		int totalCount = 0;
		totalCount = productDao.findCount();
		pageBean.setTotalCount(totalCount);
		
		int totalPage = 0;
		
		if (totalCount % limit == 0) {
			totalPage = totalCount / limit;
		} else {
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		
		
		int begin = (page - 1) * limit;
		List<Product> list = productDao.findByPageSales(begin, limit);
		pageBean.setList(list);
		return pageBean;
	}
	 

 
 
}

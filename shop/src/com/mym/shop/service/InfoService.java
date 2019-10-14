package com.mym.shop.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.mym.shop.dao.InfoDao;
import com.mym.shop.uitls.PageBean;
import com.mym.shop.vo.Info;
import com.mym.shop.vo.Product;
import com.sun.org.apache.bcel.internal.generic.NEW;

@Transactional
public class InfoService {
	
	
	private InfoDao infoDao=new InfoDao();

	public InfoDao getInfoDao() {
		return infoDao;
	}

	public void setInfoDao(InfoDao infoDao) {
		this.infoDao = infoDao;
	}

	public void saveInfo(Info info) {
		 infoDao.saveInfo(info);
		
	}

	public PageBean<Info> findByPage(Integer page) {
		
		PageBean<Info> pageBean = new PageBean<Info>();
		
		pageBean.setPage(page);
		
		int limit = 10;
		pageBean.setLimit(limit);
		
		int totalCount = 0;
		totalCount = infoDao.findCount();
		pageBean.setTotalCount(totalCount);
		
		int totalPage = 0;
		
		if (totalCount % limit == 0) {
			totalPage = totalCount / limit;
		} else {
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		
		
		int begin = (page - 1) * limit;
		List<Info> list = infoDao.findByPage(begin, limit);
		pageBean.setList(list);
		return pageBean;
		
	}

	public Info findById(Integer info_id) {
		Info info=infoDao.findById(info_id);
		return info;
	}

	public void delInfo(Info inf) {
		infoDao.delInfo(inf);
	}

	public void updateInfo(Info info) {
		 infoDao.updateInfo(info);
		 
		
	}
	

}

package com.mrliu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mrliu.dao.CategoryDao;
import com.mrliu.po.Category;
import com.mrliu.service.CategoryService;
@Service
public class CategoryServiceImpl implements CategoryService{
	@Autowired
	private CategoryDao catesDao;
	@Override
	public List<Category> findCates() {
		 List<Category> cates=catesDao.selectCates();
		return cates;
	}

}

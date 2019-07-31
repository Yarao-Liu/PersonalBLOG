package com.mrliu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mrliu.dao.ArticleDao;
import com.mrliu.po.Category;
import com.mrliu.service.ArticleService;
@Service
public class ArticleServiceImpl implements ArticleService{
	@Autowired
	private ArticleDao articleDao;
	@Override
	public List<Category> findCates() {
		 List<Category> cates=articleDao.selectCates();
		return cates;
	}

}

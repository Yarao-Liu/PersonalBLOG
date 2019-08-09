package com.mrliu.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mrliu.dao.ArticleDao;
import com.mrliu.po.Article;
import com.mrliu.service.ArticleService;
@Service
public class ArticleServiceImpl implements ArticleService{
	@Autowired
	private ArticleDao articleDao;
	@Override
	public List<Article> getAllArticles() {
		// TODO Auto-generated method stub
		return articleDao.findAllArticles();
	}
	@Override
	public Article findArticleById(Integer id) {
		// TODO Auto-generated method stub
		Article article = articleDao.findArticleById(id);
		return article;
	}
	@Override
	public Boolean updateArticleById(Article article) {
		// TODO Auto-generated method stub
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String createtime = df.format(date);
		article.setUpdatetime(createtime);
		return articleDao.updateArticleById(article);
	}
	@Override
	public Boolean deleteArticleById(Integer id) {
		// TODO Auto-generated method stub
		return articleDao.deleteArticleById(id);
	}
	@Override
	public boolean addArticle(Article article) {
		// TODO Auto-generated method stub
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String createtime = df.format(date);
		article.setUpdatetime(createtime);
		return articleDao.addArticle(article);
	}
	@Override
	public Integer countArticle() {
		// TODO Auto-generated method stub
		return articleDao.countArticle();
	}
	@Override
	public List<Article> getArticleByPage(Integer from, Integer to) {
		// TODO Auto-generated method stub
		return articleDao.getArticleByPage(from,to);
	}

}

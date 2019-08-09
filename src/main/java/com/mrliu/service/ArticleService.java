package com.mrliu.service;

import java.util.List;

import com.mrliu.po.Article;

public interface ArticleService {

	public List<Article> getAllArticles();

	public Article findArticleById(Integer id);

	public Boolean updateArticleById(Article article);

	public Boolean deleteArticleById(Integer id);

	public boolean addArticle(Article article);

	public Integer countArticle();

	public List<Article> getArticleByPage(Integer from, Integer to);

}

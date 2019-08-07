package com.mrliu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mrliu.po.Article;
import com.mrliu.service.ArticleService;

@Controller
public class ArticleController {
	@Autowired
	private ArticleService articleService;
	@ResponseBody
	@RequestMapping("/getAllArticles")
	public List<Article> getAllArticles()
	{
		List<Article> allArticles = articleService.getAllArticles();
		for (Article article : allArticles) {
			System.out.println(article);
		}
		return allArticles;
	}
	@ResponseBody
	@RequestMapping("/findArticleById")
	public Article findArticleById(Integer id)
	{
		Article article = articleService.findArticleById(id);
		return article;
	}
	@ResponseBody
	@RequestMapping("/updateArticleById")
	public boolean updateArticleById(Article article)
	{
		System.out.println(article);
		Boolean result=articleService.updateArticleById(article);
		return result;
	}
	@ResponseBody
	@RequestMapping("/deleteArticleById")
	public boolean deleteArticleById(Integer id)
	{
		Boolean result=articleService.deleteArticleById(id);
		return result;
	}
	@ResponseBody
	@RequestMapping("/addArticle")
	public boolean addArticle(Article article)
	{
		System.out.println(article);
		boolean result=articleService.addArticle(article);
		return result;
	}
}

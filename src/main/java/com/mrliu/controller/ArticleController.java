package com.mrliu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	@RequestMapping("/countArticle")
	public Integer countArticle() {
		Integer sum=articleService.countArticle();
		System.out.println(sum);
		return sum;
	}
	@ResponseBody
	@RequestMapping("/getArticleByPage")
	public List<Article> getArticleByPage(Integer from, Integer to)
	{
		System.out.println(from+"------->"+to);
		List<Article>articles=articleService.getArticleByPage((from-1)*to,to);
		for (Article article : articles) {
			System.out.println(article);
		}
		return articles;
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
	@ResponseBody
	@RequestMapping("/deleteAllArticles")
	public boolean deleteAllArticles(@RequestParam("list")String idString)
	{
		Integer num=0;
		System.out.println(idString);
		String[] ids = idString.split(",");
		for (String id : ids) {
			boolean result = articleService.deleteArticleById(Integer.valueOf(id));
			if(result==true) {
				num+=1;
			}
		}
		if (num==ids.length) {
			return true;
		}else {
			return false;
		}
	}
}

package com.mrliu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mrliu.po.Category;
import com.mrliu.service.ArticleService;

@Controller
public class ArticleController {
	@Autowired
	private ArticleService articleService;
	@ResponseBody
	@RequestMapping("/findCates")
	public List<Category>findCates(){
		List<Category>cates=articleService.findCates();
		return cates;
	}
}

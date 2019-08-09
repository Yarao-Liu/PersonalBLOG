package com.mrliu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.mrliu.po.Article;

public interface ArticleDao {
//	@Select("select * from article")
	public List<Article> findAllArticles();
	@Select("select * from article where art_id=#{id}")
	public Article findArticleById(Integer id);
	@Update("update article set art_name=#{art_name},art_body=#{art_body},cate_id=#{cate_id}where art_id=#{art_id}")
	public Boolean updateArticleById(Article article);
	@Delete("delete from article where art_id=#{id}")
	public Boolean deleteArticleById(Integer id);
	@Insert("insert into article(art_name,art_body,cate_id,author_id,updatetime)"
			+ "values(#{art_name},#{art_body},#{cate_id},#{author_id},#{updatetime})")
	public boolean addArticle(Article article);
	@Select("select count(*) from article")
	public Integer countArticle();
	
	public List<Article> getArticleByPage(Integer from, Integer to);

}

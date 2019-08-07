package com.mrliu.po;

public class Article {
	private Integer art_id;
	private String art_name;
	private String cate_id;
	private String author_id;
	private String art_body;
	private String updatetime;
	public Integer getArt_id() {
		return art_id;
	}
	public void setArt_id(Integer art_id) {
		this.art_id = art_id;
	}
	public String getArt_name() {
		return art_name;
	}
	public void setArt_name(String art_name) {
		this.art_name = art_name;
	}
	public String getCate_id() {
		return cate_id;
	}
	public void setCate_id(String cate_id) {
		this.cate_id = cate_id;
	}
	public String getAuthor_id() {
		return author_id;
	}
	public void setAuthor_id(String author_id) {
		this.author_id = author_id;
	}
	public String getArt_body() {
		return art_body;
	}
	public void setArt_body(String art_body) {
		this.art_body = art_body;
	}
	public String getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(String updatetime) {
		this.updatetime = updatetime;
	}
	@Override
	public String toString() {
		return "Article [art_id=" + art_id + ", art_name=" + art_name + ", cate_id=" + cate_id + ", author_id="
				+ author_id + ", art_body=" + art_body + ", updatetime=" + updatetime + "]";
	}
	
}

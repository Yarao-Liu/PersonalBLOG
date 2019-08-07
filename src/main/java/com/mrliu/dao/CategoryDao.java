package com.mrliu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.mrliu.po.Category;

public interface CategoryDao {
	@Select("select * from category")
	public List<Category>selectCates();
}

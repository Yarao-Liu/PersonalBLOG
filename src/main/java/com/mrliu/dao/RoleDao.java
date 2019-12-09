package com.mrliu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.mrliu.po.Role;

public interface RoleDao {
	@Select("select * from role")
	public List<Role>getAllRoles(); 
}

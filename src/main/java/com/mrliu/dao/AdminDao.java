package com.mrliu.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.mrliu.po.Admin;

@Mapper
public interface AdminDao {
	@Select("select * from admin where username=#{username} and password=#{password} and status='1'")
	public Admin getAdmin(Admin admin);
	@Select("select * from admin")
	public List<Admin> getAdmins();
	@Select("select * from admin where id=#{id}")
	public Admin getAdminById(Integer id);
	@Update("update admin set username=#{username},password=#{password},phone=#{phone},email=#{email},roleid=#{roleid} where id=#{id}")
	public Boolean updateAdmin(Admin admin);
	@Update("update admin set status='0' where id=#{id}")
	public Boolean downStatusById(Integer id);
	@Update("update admin set status='1' where id=#{id}")
	public Boolean upStatusById(Integer id);
	@Delete("delete from admin where id=#{id}")
	public Boolean delAdminById(Integer id);
	@Insert("insert into admin(username,password,phone,email,roleid,createtime,status)"
					+ "values(#{username},#{password},#{phone},#{email},#{roleid},#{createtime},#{status})")
	public Boolean insertAdmin(Admin admin);
	@Select("select count(*) from admin")
	public Integer countAdmin();
	//SELECT * FROM admin  LIMIT 0,10
//	@Select("select * from admin ORDER BY createtime DESC limit #{from},#{to}")
	public List<Admin> getAdminByPage(Integer from, Integer to);
	
	public List<Admin> fuzzySelect(Map<String, Object>conditonMap);
	
	public Integer CountfuzzySelect(Admin admin);
}

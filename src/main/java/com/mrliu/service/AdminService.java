package com.mrliu.service;

import java.util.List;
import java.util.Map;

import com.mrliu.po.Admin;

public interface AdminService {
	
	public Admin findAdminByNameAndPwd(Admin admin);

	public List<Admin>getAdmins();

	public Admin getAdminById(Integer id);

	public Boolean updateAdmin(Admin admin);

	public boolean downStatus(Integer id);

	public boolean upStatus(Integer id);

	public boolean delAdminById(Integer id);

	public boolean addAdmin(Admin admin);

	public Integer countAdmin();

	public List<Admin> getAdminByPage(Integer from, Integer to);

	public List<Admin> fuzzySearch(Map<String, Object>conditonMap);

	public Integer Countfuzzy(Admin admin);
}

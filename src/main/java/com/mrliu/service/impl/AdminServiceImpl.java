package com.mrliu.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mrliu.dao.AdminDao;
import com.mrliu.po.Admin;
import com.mrliu.service.AdminService;
@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDao adminDao;
	@Override
	public Admin findAdminByNameAndPwd(Admin admin) {
		Admin result = adminDao.getAdmin(admin);	
		return result;
	}
	@Override
	public List<Admin> getAdmins() {
		// TODO Auto-generated method stub
		List<Admin> admins = adminDao.getAdmins();
		return admins;
	}
	@Override
	public Admin getAdminById(Integer id) {
		Admin admin = adminDao.getAdminById(id);
		return admin;
	}
	@Override
	public Boolean updateAdmin(Admin admin) {
		Boolean result=adminDao.updateAdmin(admin);
		return result;
	}
	@Override
	public boolean downStatus(Integer id) {
		Boolean result=adminDao.downStatusById(id);
		return result;
	}
	@Override
	public boolean upStatus(Integer id) {
		// TODO Auto-generated method stub
		Boolean result = adminDao.upStatusById(id);
		return result;
	}
	@Override
	public boolean delAdminById(Integer id) {
		Boolean result=adminDao.delAdminById(id);
		return result;
	}
	@Override
	public boolean addAdmin(Admin admin) {
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String createtime = df.format(date);
		admin.setCreatetime(createtime);
		admin.setStatus("0");
		Boolean result=adminDao.insertAdmin(admin);
		return result;
	}
	@Override
	public Integer countAdmin() {
		Integer count=adminDao.countAdmin();
		return count;
	}
	@Override
	public List<Admin> getAdminByPage(Integer from, Integer to) {
		List<Admin> admins=adminDao.getAdminByPage(from,to);
		return admins;
	}

}

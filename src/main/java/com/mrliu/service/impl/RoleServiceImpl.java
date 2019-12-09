package com.mrliu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mrliu.dao.RoleDao;
import com.mrliu.po.Role;
import com.mrliu.service.RoleService;
@Service
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleDao roleDao;
	@Override
	public List<Role> selectRoles() {
		// TODO Auto-generated method stub
		return roleDao.getAllRoles();
	}

}

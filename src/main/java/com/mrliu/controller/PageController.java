package com.mrliu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {
	@RequestMapping("/admin-index")
	public String admin_index()
	{
		return "admin/admin-index";
	}
	@RequestMapping("/admin-welcome")
	public String admin_welcome()
	{
		return "admin/admin-welcome";
	}
	@RequestMapping("/admin-login")
	public String admin_login()
	{
		return "admin/admin-login";
	}
	@RequestMapping("/admin-edit")
	public String admin_edit()
	{
		return "admin/admin-edit";
	}
	@RequestMapping("/admin-add")
	public String admin_add()
	{
		return "admin/admin-add";
	}
	@RequestMapping("/order-list")
	public String order_list()
	{
		return "order/order-list";
	}
	@RequestMapping("/admin-list")
	public String admin_list()
	{
		return "admin/admin-list";
	}
	@RequestMapping("/unicode")
	public String unicode()
	{
		return "admin/unicode";
	}
	@RequestMapping("/admin-info")
	public String admin_info()
	{
		return "admin/admin-info";
	}
}

package com.mrliu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mrliu.po.Admin;
import com.mrliu.response.SimpleResponse;
import com.mrliu.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	@ResponseBody
	@RequestMapping("/countfuzzy")
	public Integer  Countfuzzy(Admin admin)
	{
		
		admin.setUsername(StringUtils.trimToNull(admin.getUsername()));
		//目前只用到这三个属性
		admin.setEmail(StringUtils.trimToNull(admin.getEmail()));
		admin.setPhone(StringUtils.trimToNull(admin.getPhone()));
		Integer count=adminService.Countfuzzy(admin);
		System.out.println("-->"+admin);
		System.out.println("-->"+count);
		return count;
	}
	
	@ResponseBody
	@RequestMapping("/fuzzySearch")
	public SimpleResponse fuzzySearch(@RequestParam("username")String username,
			@RequestParam("phone")String phone,@RequestParam("email")String email,
			@RequestParam("from")Integer from,@RequestParam("to")Integer to)
	{
		SimpleResponse simpleResponse = new SimpleResponse();
		//目前只用到这三个属性
		username = StringUtils.trimToNull(username);
		phone = StringUtils.trimToNull(phone);
		email= StringUtils.trimToNull(email);
		Map<String, Object>conditonMap=new HashMap<String, Object>();
		conditonMap.put("username", username);
		conditonMap.put("phone",phone);
		conditonMap.put("email",email);
		conditonMap.put("from",(from-1)*to);
		conditonMap.put("to",to);
		List<Admin>admins=adminService.fuzzySearch(conditonMap);
		System.out.println(admins);
		simpleResponse.setResult(admins);
		return simpleResponse;
	}
	@RequestMapping("/login")
	public String login(HttpServletRequest request,@RequestParam("username")String username,
						@RequestParam("password")String password)
	{
		Properties properties = System.getProperties(); 
		String osinfo = properties.getProperty("os.name")+"("+properties.getProperty("os.arch")+")";
		String javaVersion = properties.getProperty("java.version");
		String runtime = properties.getProperty("java.runtime.name");
		request.getSession().setAttribute("osinfo",osinfo);
		request.getSession().setAttribute("javaVersion",javaVersion);
		request.getSession().setAttribute("runtime",runtime);
		try {
			Thread.currentThread();
			Thread.sleep(500);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getSession().removeAttribute("msg");
		Admin admin=new Admin(username,password);
		Admin result = adminService.findAdminByNameAndPwd(admin);
		if (result!=null) {
			request.getSession().removeAttribute("admin");
			request.getSession().setAttribute("admin", result);
			return "redirect:/admin-index";
		}else {
			request.getSession().setAttribute("msg", "密码错误或被超级管理冻结!");
			request.getSession().setAttribute("username","用户名:"+username);
			return "redirect:/admin-login";
		}
	}
	@ResponseBody
	@RequestMapping("/logout")
	public boolean logout(HttpSession session)
	{
		session.removeAttribute("admin");
		return true;
	}
	@ResponseBody
	@RequestMapping("/getAdmins")
	public List<Admin> getAdmins()
	{
		List<Admin> admins = adminService.getAdmins();	
		return admins;
	}
	@ResponseBody
	@RequestMapping("/getAdminByPage")
	public List<Admin> getAdminByPage(@RequestParam("from")Integer from,@RequestParam("to")Integer to)
	{
		System.out.println(from);
		System.out.println(to);
		List<Admin>admins=adminService.getAdminByPage((from-1)*to,to);
		return admins;
	}
	@ResponseBody
	@RequestMapping("/getinfo")
	public Admin getAdminInfo(Integer id)
	{
		System.out.println(id);
		Admin admin = adminService.getAdminById(id);
		return admin;
	}
	@ResponseBody
	@RequestMapping("/updateadmin")
	public boolean updateAdmin(Admin admin)
	{
		System.out.println("----->"+admin);
		Boolean result=adminService.updateAdmin(admin);
		return result;
	}
	@ResponseBody
	@RequestMapping("/downstatus")
	public boolean downStatus(Integer id)
	{
		System.out.println("id:"+id);
		boolean result=adminService.downStatus(id);
		return result;
	}
	@ResponseBody
	@RequestMapping("/upstatus")
	public boolean upStatus(Integer id)
	{
		System.out.println("id:"+id);
		boolean result=adminService.upStatus(id);
		return result;
	}
	@ResponseBody
	@RequestMapping("/deladmin")
	public boolean delAdminById(Integer id)
	{
		System.out.println("id:"+id);
		boolean result=adminService.delAdminById(id);
		return result;
	}
	@ResponseBody
	@RequestMapping("/deladmins")
	public boolean deladmins(@RequestParam("list") String idString) {
//		System.out.println("/deladmins");
		Integer num=0;
		System.out.println(idString);
		String[] ids = idString.split(",");
		for (String id : ids) {
			boolean result = adminService.delAdminById(Integer.valueOf(id));
			if(result==true) {
				num+=1;
			}
		}
		if (num==ids.length) {
			return true;
		}else {
			return false;
		}
		
	}
	@ResponseBody
	@RequestMapping("/addadmin")
	public boolean addadmin(Admin admin)
	{
//		System.out.println(admin);
		boolean result=adminService.addAdmin(admin);
		return result;
	}
	@ResponseBody
	@RequestMapping("/countAdmin")
	public Integer countAdmin()
	{
		Integer count=adminService.countAdmin();
		System.out.println(count);
		return count;
	}
}

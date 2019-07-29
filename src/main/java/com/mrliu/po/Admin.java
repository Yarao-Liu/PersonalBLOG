package com.mrliu.po;

public class Admin {
	private Integer id;
	private String username;
	private String password;
	private String phone;
	private String email;
	private String roleid;
	private String createtime;
	private String status;
	
	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Admin(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	
	
	public String getRoleid() {
		return roleid;
	}
	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Admin [id=" + id + ", username=" + username + ", password=" + password + ", phone=" + phone + ", email="
				+ email + ", roleid=" + roleid + ", createtime=" + createtime + ", status=" + status + "]";
	}

	
}

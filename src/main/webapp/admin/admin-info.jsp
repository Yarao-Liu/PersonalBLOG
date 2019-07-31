<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String PATH=request.getContextPath(); %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String nowtime = df.format(date);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>个人信息-个人博客</title>
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8" />
        <link rel="shortcut icon" href="<%=PATH%>/favicon.ico" type="image/x-icon" />
        <link rel="stylesheet" href="<%=PATH%>/css/font.css">
        <link rel="stylesheet" href="<%=PATH%>/css/xadmin.css">
    </head>
    <body>
    <div class="x-body layui-anim layui-anim-up">
        <blockquote class="layui-elem-quote">欢迎管理员：
            <span class="x-red">${admin.username}</span>!当前时间:<%=nowtime %></blockquote>
        <fieldset class="layui-elem-field">
            <legend>个人信息</legend>
            <div class="layui-field-box">
                <table class="layui-table">
                    <tbody>
                        <tr>
                            <td>用户名</td>
                            <td>${admin.username}</td></tr>
                        <tr>
                            <td>密码</td>
                            <td>***********</td></tr>
                        <tr>
                            <td>联系电话</td>
                            <td>${admin.phone}</td></tr>
                        <tr>
                            <td>电子邮箱</td>
                            <td>${admin.email}</td></tr>
                        <tr>
                            <td>用户角色</td>
                            <td>${admin.roleid}</td></tr>
                        <tr>
                        <tr>
                            <td>注册时间</td>
                            <td>${admin.createtime}</td></tr>
                        <tr>
                            <td>操作系统</td>
                            <td>${osinfo}</td></tr>
                        <tr>
                            <td>版本号</td>
                            <td>1.0</td></tr>
                    </tbody>
                </table>
            </div>
        </fieldset>
    </div>
    </body>
</html>
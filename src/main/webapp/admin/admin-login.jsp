<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String PATH= request.getContextPath();%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>后台登录-个人博客</title>
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="<%=PATH%>/css/font.css">
	<link rel="stylesheet" href="<%=PATH%>/css/xadmin.css">
	<link rel="stylesheet" href="<%=PATH%>/css/custom.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="<%=PATH%>/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=PATH%>/js/xadmin.js"></script>
</head>
<body class="login-bg"> 
    <div class="login layui-anim layui-anim-up">
        <div class="message">个人博客-管理员登录</div>
        <div id="darkbannerwrap"></div>
        <form method="post" class="layui-form" action="<%=PATH%>/login">
            <input id="username" name="username" placeholder="管理员账号"  type="text" lay-verify="required" class="layui-input" >
            <hr class="hr15">
            <input name="password" placeholder="管理员密码"  type="password" lay-verify="required" class="layui-input">
            <hr class="hr15">
            <span class="errMsg">${username}<br/>${msg}</span>
            <hr class="hr10">
            <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
            <hr class="hr20" >    
        </form>
    </div>
</body>
    <script>
    $(function() {
        layui.use('form', function(){
          var form = layui.form;
          //监听提交
          form.on('submit(login)', function(data){              
            layer.msg('正在核对登录信息...', {icon: 1,time: 2000 //2秒关闭（如果不配置，默认是3秒）
			});   
          });
        });
    })  
    </script>
</html>
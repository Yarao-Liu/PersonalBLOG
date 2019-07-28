<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String PATH=request.getContextPath(); %>
<!doctype html>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>错误页面-个人博客</title>
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8" />
        <meta http-equiv="Cache-Control" content="no-siteapp" />

        <link rel="stylesheet" href="<%=PATH%>/css/font.css">
        <link rel="stylesheet" href="<%=PATH%>/css/xadmin.css">
        <style type="text/css">
        	.fly-panel {
    			margin-bottom: 15px;
   				border-radius: 2px;
    			box-shadow: 0 1px 2px 0 rgba(0,0,0,.05);
				}
			.fly-none {
    			min-height: 600px;
   				text-align: center;
    			padding-top: 50px;
    			color: #999;
				}
			.fly-none .layui-icon {
    			line-height: 300px;
    			font-size: 300px;
   				color: #393D49;
				}
			.fly-none p {
    			margin-top: 50px;
    			padding: 0 15px;
    			font-size: 20px;
    			color: #999;
    			font-weight: 300;
				}
        </style>
    </head>
    <body style="background:#f1f1f1;">
          <div class="layui-container">
           <div class="fly-panel"> 
            <div class="fly-none"> 
             <h2><i class="layui-icon layui-icon-404"></i></h2> 
             <p>页面或者数据被<a href=""> 纸飞机 </a>运到火星了，啥都看不到了…</p> 
             <%=PATH%>
            </div>
           </div>
          </div>
    </body>
</html>
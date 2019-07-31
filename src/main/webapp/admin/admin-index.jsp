<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String PATH= request.getContextPath();%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>后台管理</title>
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="<%=PATH%>/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="<%=PATH%>/css/font.css">
	<link rel="stylesheet" href="<%=PATH%>/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="<%=PATH%>/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=PATH%>/js/xadmin.js"></script>

</head>
<body>
    <!-- 顶部开始 -->
    <div class="container">
        <div class="logo"><a href="<%=PATH%>>/admin-index.jsp">后台管理</a></div>
        <div class="left_open">
            <i title="展开左侧栏" class="iconfont">&#xe699;</i>
        </div>
        <ul class="layui-nav right" lay-filter="">
          <li class="layui-nav-item">
            <a href="javascript:;">${admin.username}</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
              <dd><a onclick="x_admin_show('个人信息','<%=PATH%>/admin-info')">个人信息</a></dd>
              <dd><a class="logoutBtn">切换帐号</a></dd>
            </dl>
          </li>
          <li class="layui-nav-item to-index"><a href="#">前台首页(待开发)</a></li>
        </ul>      
    </div>
    <!-- 顶部结束 -->
    <!-- 中部开始 -->
     <!-- 左侧菜单开始 -->
    <div class="left-nav">
      <div id="side-nav">
        <ul id="nav">
        	<li>
        	<a href="javascript:;">
        	<img style="height:100px;width:180px;margin:0 auto;" alt="logo" src="<%=PATH%>/images/icon.jpg"/>
        	</a>	
        	</li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe723;</i>
                    <cite>文章管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="<%=PATH%>/article-list">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>文章列表</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe726;</i>
                    <cite>人员管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="<%=PATH%>/admin-list">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>管理员列表</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6b4;</i>
                    <cite>图标字体</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="<%=PATH %>/unicode">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>图标对应字体</cite>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="其它页面">&#xe6b4;</i>
                            <cite>其它页面</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="x_admin_show('登录页面','<%=PATH%>/admin-login')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>登录页面</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('错误页面','<%=PATH%>/error')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>错误页面</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('系统日志','log.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>系统日志</cite></a>
                            </li>
                        </ul>
                    </li>
        </ul>
      </div>
    </div>
    <!-- <div class="x-slide_left"></div> -->
    <!-- 左侧菜单结束 -->
    <!-- 右侧主体开始 -->
    <div class="page-content">
        <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
          <ul class="layui-tab-title">
            <li class="home"><i class="layui-icon">&#xe68e;</i>我的桌面</li>
          </ul>
          <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='<%=PATH%>/admin-welcome' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
            </div>
          </div>
        </div>
    </div>
    <div class="page-content-bg"></div>
    <!-- 右侧主体结束 -->
    <!-- 中部结束 -->
    <!-- 底部开始 -->
    <div class="footer">
        <div class="copyright">Copyright @mrliu All Rights Reserved</div>  
    </div>
    <!-- 底部结束 -->
    <script type="text/javascript">
		$(function(){
			$(".logoutBtn").click(function(){
				layer.confirm('确定要退出登录吗?',function(index){
		              //发异步移除session
		              $(function(){
							$.ajax({
								type:"POST",
								url:"<%=PATH%>/logout",
								success:function(result){
									layer.msg('注销成功,回到登录页...', {icon: 1,time:2000 //2秒关闭（如果不配置，默认是3秒）
									}); 
									setTimeout(function(){
										location.href="<%=PATH%>/admin-login";
										},2000);	
								}	
							})
		              })             
		          });
				})
			})

    </script>
</body>
</html>
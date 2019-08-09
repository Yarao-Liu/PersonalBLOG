<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String PATH=request.getContextPath(); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>欢迎页面-文章列表</title>
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8" />
    <link rel="shortcut icon" href="<%=PATH%>/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="<%=PATH%>/css/font.css">
    <link rel="stylesheet" href="<%=PATH%>/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="<%=PATH%>/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=PATH%>/js/xadmin.js"></script>
  </head>
  <style>
  	th{
  		width: 120px;
  	}
  	.article{
  		width: 400px;
  	}
  	p{	
  		overflow:hidden;
  		text-overflow: ellipsis;
  		display: -webkit-box;
  		-webkit-line-clamp: 3;
  		-webkit-box-orient: vertical;
  	}
  </style>
  <body>
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">文章管理</a>
        <a>
          <cite>文章列表</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
      <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="x_admin_show('添加文章','<%=PATH%>/article-add')"><i class="layui-icon"></i>添加</button>
        <span class="x-right" style="line-height:40px" id="sumArticle"><!--共有数据：88 条--></span>
      </xblock>
      <table class="layui-table">
        <thead>
          <tr>
            <th>
              <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>文章编号</th>
            <th>文章标题</th>
            <th>标签名称</th>
            <th>文章来源</th>
            <th class="article">文章正文</th>
            <th>更新时间</th>
            <th>文章操作</th>
            </tr>
        </thead>
        <!-- 表格内容占位符 -->
        <tbody id="articles">
        </tbody>
      </table>
      <!-- 分页标签占位符 -->
      <div class="page" id="pages"></div>
    </div> 
  </body>
   <script>
      /*用户-删除*/
      function article_del(obj,id){
          layer.confirm('确认要删除吗？',function(index){
              $(function(){
					$.ajax({
							type:'POST',
							url:'<%=PATH%>/deleteArticleById',
							data:{id:id},
							success:function(result)
							{
								 if(result=true)
								 {
									 $(obj).parents("tr").remove();
						             layer.msg('已删除!',{icon:1,time:1000});	
								 }
							}
						})
                  })  
          });
      }
      function delAll (argument) {
        var data = tableCheck.getData();
        layer.confirm('确认要删除吗？'+data,function(index){
            //捉到所有被选中的，发异步进行删除
            $(function(){
				$.ajax({
						type:'POST',
						url:'<%=PATH%>/deleteAllArticles',
						data:{list:data.toString()},
						success:function(result){
							console.log(result);
							if(result==true)
							{
								layer.msg('删除成功', {icon: 1});
						        $(".layui-form-checked").not('.header').parents('tr').remove();
							}
						}
					})
                })
        });
      }
	$(function(){
    	  $.ajax({
				type:"POST",
				url:"<%=PATH %>/countArticle",
				success:function(count){
					$("#sumArticle").html("共有数据:"+count+"条");
					layui.use('laypage',function(){
						var laypage=layui.laypage;		
						laypage.render({
						    elem: 'pages'
						    ,count: count
						    ,layout: ['count', 'prev', 'page', 'next','refresh', 'skip']
						    ,jump: function(obj){
						      console.log(obj.curr);
						      console.log(obj.limit);
						      $.ajax({
								type:"POST",
								url:"<%=PATH%>/getArticleByPage",
								data:{from:obj.curr,to:obj.limit},
								success:function(articles){
									var tableContent="";
									$("#articles").html("");
									$.each(articles,function(i,article){
					                     tableContent+='<tr>';
					                     tableContent+='<td>';
					                     tableContent+='<div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='+article.art_id+'><i class="layui-icon">&#xe605;</i></div>';
					                     tableContent+='</td>';
					                     tableContent+='<td>'+article.art_id+'</td>';
					                     tableContent+='<td>'+article.art_name+'</td>';
					                     tableContent+='<td>'+article.cate_id+'</td>';
					                     tableContent+='<td>'+article.author_id+'</td>';
					                     tableContent+='<td><p>'+article.art_body+'</p></td>';
					                     tableContent+='<td>'+article.updatetime+'</td>';
					                     tableContent+='<td class="td-manage">';
					                     tableContent+='<a title="编辑"  onclick="x_admin_show(&apos;文章编辑&apos;,&apos;<%=PATH%>/article-edit?id='+article.art_id+'&apos;)" href="javascript:;">';
					                     tableContent+='<i class="layui-icon">&#xe642;</i>';
					                     tableContent+='</a>';
					                     tableContent+='<a title="删除" onclick="article_del(this,&apos;'+article.art_id+'&apos;)" href="javascript:;">';
					                     tableContent+='<i class="layui-icon">&#xe640;</i>';
					                     tableContent+='</a>';
					                     tableContent+='</td>';
					                     tableContent+='</tr>';
					 					$("#articles").html(tableContent);
					                   });
									}
							      });
						    	}
						  });
			       	 }); 
					}
				});
          });
    </script>
</html>
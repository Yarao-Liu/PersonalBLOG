<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String PATH= request.getContextPath();%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>欢迎页面-个人博客</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8" />
    <link rel="shortcut icon" href="<%=PATH%>/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="<%=PATH%>/css/font.css">
    <link rel="stylesheet" href="<%=PATH%>/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="<%=PATH%>/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=PATH%>/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="<%=PATH%>/admin-index">首页</a>
        <a href="">人员管理</a>
        <a><cite>管理员列表</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
      <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so">
          <input type="text" name="username"  placeholder="请输入用户名" autocomplete="off" class="layui-input">
          <input type="text" name="phone"   placeholder="请输入联系电话" autocomplete="off" class="layui-input">
          <input type="text" name="email"   placeholder="请输入邮箱" autocomplete="off" class="layui-input">
          <button class="layui-btn"  lay-submit="search" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
        </form>
      </div>
      <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="x_admin_show('添加用户','<%=PATH%>/admin-add')"><i class="layui-icon"></i>添加</button>
        <span class="x-right" style="line-height:40px" id="sumAdmin"><!--共有数据:88 条--></span>
      </xblock>
      <table class="layui-table">
        <thead>
          <tr>
            <th>
              <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>ID</th>
            <th>登录名</th>
            <th>手机</th>
            <th>邮箱</th>
            <th>角色</th>
            <th>加入时间</th>
            <th>状态</th>
            <th>操作</th>
        </thead>
        <tbody id="admins"></tbody>
      </table>
      <div class="page" id="page"></div>
    </div>
    <script>
    layui.use('form', function(){
    	  var form = layui.form;
    	  //各种基于事件的操作，下面会有进一步介绍
    	  form.on('submit(search)', function(data){
        	  //console.log(data.elem); //被执行事件的元素DOM对象，一般为button对象
        	  //console.log(data.form); //被执行提交的form对象，一般在存在form标签时才会返回
        	  console.log(data.field); //当前容器的全部表单字段，名值对形式：{name: value}
        	  var args=data.field;
        	  var params={
					username:args.username.trim(),
					phone:args.phone.trim(),
					email:args.email.trim(),
					//roleid:args.roleid,
					//status:args.status
          		}
        	  $(function(){
            	  $.ajax({
        				type:"POST",
        				data:params,
        				url:"<%=PATH %>/countfuzzy",
        				success:function(count){
        					$("#sumAdmin").html("共有数据:"+count+"条");
        					$("#admins").html("");
        					layui.use('laypage',function(){
        						var laypage=layui.laypage;		
        						laypage.render({
        						    elem: 'page'
        						    ,count: count
        						    ,layout: ['count', 'prev', 'page', 'next','refresh', 'skip']
        						    ,jump: function(obj){
            						    params.from=obj.curr;
            						    params.to=obj.limit;
        						      $.ajax({
        								type:"POST",
        								url:"<%=PATH%>/fuzzySearch",
        								data:params,
        								success:function(result){
            								console.log(result);
            								var admins=result.result;
        									var tableContent="";
        									
        									$.each(admins,function(i,admin){
        					                    tableContent+='<tr>';
        					                    tableContent+='<td>';
        					                    tableContent+='<div type="checkbox" class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id="'+admin.id+'"><i class="layui-icon">&#xe605;</i></div>';
        					                    tableContent+='</td>';
        					                 	tableContent+='<td>'+admin.id+'</td>';
        					                    tableContent+='<td>'+admin.username+'</td>';
        					                    tableContent+='<td>'+admin.phone+'</td>';
        					                    tableContent+='<td>'+admin.email+'</td>';
        					                    tableContent+='<td>'+admin.roleid+'</td>';
        					                    tableContent+='<td>'+admin.createtime+'</td>';
        					                    if(admin.status=='1')
        					                    {
        					                    	tableContent+='<td class="td-status">';
        					                        tableContent+='<span class="layui-btn layui-btn-normal layui-btn-mini">已启用</span></td>';
        					                        tableContent+='<td class="td-manage">';
        					                        tableContent+='<a onclick="member_stop(this,'+admin.id+')" href="javascript:;"  title="停用">';
        					                        tableContent+='<i class="layui-icon">&#xe601;</i></a>';
        					                    }else if(admin.status=='0'){
        					                    	tableContent+='<td class="td-status">';
        					                        tableContent+='<span class="layui-btn layui-btn-normal layui-btn-disabled layui-btn-mini">已停用</span></td>';
        					                        tableContent+='<td class="td-manage">';
        					                        tableContent+='<a onclick="member_stop(this,'+admin.id+')" href="javascript:;"  title="启用">';
        					                        tableContent+='<i class="layui-icon">&#xe62f;</i></a>';
        										}
        					                    tableContent+='<a title="编辑"  onclick="x_admin_show(&apos;编辑&apos;,&apos;<%=PATH%>/admin-edit?id='+admin.id+'&apos;)">';
        					                    tableContent+='<i class="layui-icon">&#xe642;</i></a>';
        					                    tableContent+='<a title="删除" onclick="member_del(this,&apos;'+admin.id+'&apos;)" href="javascript:;">';
        					                    tableContent+='<i class="layui-icon">&#xe640;</i></a>';
        					                    tableContent+='</td>';
        					                    tableContent+='</tr> ';
        										$("#admins").html(tableContent);
        					                  }); 
        									}
        							      });
        						    	}
        						  });
        			       	 }); 
        					}
        				});
                  });
        	  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        	});
    	});
	window.onload=function(){
    	//alert('所有资源加载完毕！');
    	selectAll();
    	}

    
       /*用户-停用*/
      function member_stop(obj,id){
          layer.confirm('确认要更改状态吗？',function(index){
				var i=Number(id);
              if($(obj).attr('title')=='启用'){
                //发异步把用户状态进行更改
                $(function(){
					$.ajax({
						type:"POST",
						url:"<%=PATH%>/upstatus",
						data:{id:i},
						success:function(){
							$(obj).attr('title','停用')
  			                $(obj).find('i').html('&#xe601;');
  			                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
  			                layer.msg('已启用!',{icon: 6,time:1000});
						}	
					})
                })
              }else{
            	  $(function(){
  					$.ajax({
  						type:"POST",
  						url:"<%=PATH%>/downstatus",
  						data:{id:i},
  						success:function(){	
  			              	$(obj).attr('title','启用')
			                $(obj).find('i').html('&#xe62f;');
			                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
			                layer.msg('已停用!',{icon: 5,time:1000});
  						}	
  					})
                  })
              }   
          });
      }
      /*用户-删除*/
      function member_del(obj,id){
          layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据
              console.log(id);
              $(function(){
					$.ajax({
						type:"POST",
						url:"<%=PATH%>/deladmin",
						data:{id:id},
						success:function(result){
							if(result==true)
							{
	 							$(obj).parents("tr").remove();
		 			            layer.msg('已删除!',{icon:1,time:1000});
							}else{
								layer.msg('删除失败!',{icon:1,time:1000});
								}
						}	
					})
              })             
          });
      }
      function delAll (argument) {
        var data = tableCheck.getData();  
        console.log(data);
        layer.confirm('确认要删除吗？'+data,function(index){
//             console.log(data);
            //捉到所有被选中的，发异步进行删除
            $.ajax({
				type:"POST",
				url:"<%=PATH%>/deladmins",
				data:{list:data.toString()},
				success:function(result){
				    if(result==true)	
				    layer.msg('删除成功', {icon: 1});
		            $(".layui-form-checked").not('.header').parents('tr').remove();
		            window.location.reload();
					}
                })
        });
      }
      function selectAll()
      {
    	  $(function(){
        	  $.ajax({
    				type:"POST",
    				url:"<%=PATH %>/countAdmin",
    				success:function(count){
    					$("#sumAdmin").html("共有数据:"+count+"条");
    					layui.use('laypage',function(){
    						var laypage=layui.laypage;		
    						laypage.render({
    						    elem: 'page'
    						    ,count: count
    						    ,layout: ['count', 'prev', 'page', 'next','refresh', 'skip']
    						    ,jump: function(obj){
    						      $.ajax({
    								type:"POST",
    								url:"<%=PATH%>/getAdminByPage",
    								data:{from:obj.curr,to:obj.limit},
    								success:function(admins){
    									var tableContent="";
    									$("#admins").html("");
    									$.each(admins,function(i,admin){
    					                    tableContent+='<tr>';
    					                    tableContent+='<td>';
    					                    tableContent+='<div type="checkbox" class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id="'+admin.id+'"><i class="layui-icon">&#xe605;</i></div>';
    					                    tableContent+='</td>';
    					                 	tableContent+='<td>'+admin.id+'</td>';
    					                    tableContent+='<td>'+admin.username+'</td>';
    					                    tableContent+='<td>'+admin.phone+'</td>';
    					                    tableContent+='<td>'+admin.email+'</td>';
    					                    tableContent+='<td>'+admin.roleid+'</td>';
    					                    tableContent+='<td>'+admin.createtime+'</td>';
    					                    if(admin.status=='1')
    					                    {
    					                    	tableContent+='<td class="td-status">';
    					                        tableContent+='<span class="layui-btn layui-btn-normal layui-btn-mini">已启用</span></td>';
    					                        tableContent+='<td class="td-manage">';
    					                        tableContent+='<a onclick="member_stop(this,'+admin.id+')" href="javascript:;"  title="停用">';
    					                        tableContent+='<i class="layui-icon">&#xe601;</i></a>';
    					                    }else if(admin.status=='0'){
    					                    	tableContent+='<td class="td-status">';
    					                        tableContent+='<span class="layui-btn layui-btn-normal layui-btn-disabled layui-btn-mini">已停用</span></td>';
    					                        tableContent+='<td class="td-manage">';
    					                        tableContent+='<a onclick="member_stop(this,'+admin.id+')" href="javascript:;"  title="启用">';
    					                        tableContent+='<i class="layui-icon">&#xe62f;</i></a>';
    										}
    					                    tableContent+='<a title="编辑"  onclick="x_admin_show(&apos;编辑&apos;,&apos;<%=PATH%>/admin-edit?id='+admin.id+'&apos;)">';
    					                    tableContent+='<i class="layui-icon">&#xe642;</i></a>';
    					                    tableContent+='<a title="删除" onclick="member_del(this,&apos;'+admin.id+'&apos;)" href="javascript:;">';
    					                    tableContent+='<i class="layui-icon">&#xe640;</i></a>';
    					                    tableContent+='</td>';
    					                    tableContent+='</tr> ';
    										$("#admins").html(tableContent);
    					                  }); 
    									}
    							      });
    						    	}
    						  });
    			       	 }); 
    					}
    				});
              });
          }
    </script>
  </body>
</html>
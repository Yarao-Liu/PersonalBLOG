<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String PATH= request.getContextPath();%>
<!DOCTYPE html>
<html> 
  <head>
    <meta charset="UTF-8">
    <title>欢迎页面-个人博客</title>
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8" />
    <link rel="shortcut icon" href="<%=PATH%>/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="<%=PATH%>/css/font.css">
    <link rel="stylesheet" href="<%=PATH%>/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="<%=PATH %>/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=PATH %>/js/xadmin.js"></script>
  </head>
  
  <body>
    <div class="x-body">
        <form class="layui-form">
          <input id="id" name="id" value="${param.id}" type="hidden"/>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>登录名
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="username" name="username" required="" lay-verify="required"
                  autocomplete="off" value="admin" class="layui-input">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>将会成为您唯一的登入名
              </div>
          </div>
          <div class="layui-form-item">
              <label for="phone" class="layui-form-label">
                  <span class="x-red">*</span>手机
              </label>
              <div class="layui-input-inline">
                  <input type="text" value="18925139194" id="phone" name="phone" required="" lay-verify="phone"
                  autocomplete="off" class="layui-input">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>将会成为您唯一的登入名
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>邮箱
              </label>
              <div class="layui-input-inline">
                  <input type="text" value="113664000@qq.com" id="L_email" name="email" required="" lay-verify="email"
                  autocomplete="off" class="layui-input">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>
              </div>
          </div>
          <div class="layui-form-item">
              <label class="layui-form-label"><span class="x-red">*</span>角色</label>
              <div class="layui-input-block">
                <input type="radio" name="roleid" value="1" lay-skin="primary" title="超级管理员"/>
                <input type="radio" name="roleid" value="2" lay-skin="primary" title="编辑人员"/>
                <input type="radio" name="roleid" value="3" lay-skin="primary" title="宣传人员"/>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_pass" class="layui-form-label">
                  <span class="x-red">*</span>密码
              </label>
              <div class="layui-input-inline">
                  <input type="password" id="L_pass" name="pass" required="" lay-verify="pass"
                  autocomplete="off" class="layui-input">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  6到16个字符
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
                  <span class="x-red">*</span>确认密码
              </label>
              <div class="layui-input-inline">
                  <input type="password" id="L_repass" name="repass" required="" lay-verify="repass"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <button  class="layui-btn" lay-filter="update" lay-submit="">
                  提交更改
              </button>
          </div>
      </form>
    </div>
    <script>
        layui.use(['form','layer'], function(){
            $ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer;
        
          //自定义验证规则
          form.verify({
            nikename: function(value){
              if(value.length < 5){
                return '昵称至少得5个字符';
              }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,repass: function(value){
                if($('#L_pass').val()!=$('#L_repass').val()){
                    return '两次密码不一致';
                }
            }
          });

          //监听提交
          form.on('submit(update)', function(info){
//         	  console.log(info.field);
        	  var admin=info.field;
			  var data={
                   		id:$("#id").val(),
                  		username:admin.username,
                   		phone:admin.phone,
                   		email:admin.email,
                  		roleid:admin.roleid,
                   		password:admin.pass
                   	};
// 			  console.log(data);
			  $(function(){ 
					$.ajax({
						type:"POST",
						url:"<%=PATH %>/updateadmin",
						data:data,
						dataType:"JSON",
						success:function(result){
							if(result==true)
							{
								layer.alert("提交成功", {icon: 6},function () {
					                  // 获得frame索引
					                  var index = parent.layer.getFrameIndex(window.name);
					                  //关闭当前frame
					                  
					                  parent.layer.close(index);    
					              });
							}else{layer.alert("提交失败", {icon: 2});}
						}
					})	
	             })            
              return false;
          });    
        });
    </script>
  </body>
  <script type="text/javascript">
		$(function(){
			var id=$("#id").val(); 
			$.ajax({
				type:"GET",
				url:"<%=PATH%>/getinfo",
				data:{id:id},
					success:function(admin){
						//alert(msg);
						console.log(admin.roleid);
						$("#username").val(admin.username);
						$("#phone").val(admin.phone);
						$("#L_email").val(admin.email);
						$(":radio[name=roleid][value='"+admin.roleid+"']").attr("checked","true");
						$("#L_pass").val(admin.password);
						$("#L_repass").val(admin.password);
					}
				});
		})
   </script>
</html>
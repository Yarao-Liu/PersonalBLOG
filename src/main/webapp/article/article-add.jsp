<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String PATH=request.getContextPath(); %>
<!DOCTYPE html>
<html>
    
    <head>
        <meta charset="utf-8">
        <title>
            	文章添加-文章管理
        </title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="format-detection" content="telephone=no">
        <script src="<%=PATH%>/lib/layui/layui.js" charset="utf-8"></script>
        <script src="<%=PATH%>/js/x-layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="<%=PATH%>/css/x-admin.css" media="all">
    </head>
    
    <body>
        <div class="x-body">
            <form class="layui-form layui-form-pane">
            	<input id="author_id" value='${admin.id}'  type="hidden"/>
                <div class="layui-form-item">
                    <label for="L_title" class="layui-form-label">
                       	 标题
                    </label>
                    <div class="layui-input-block">
                        <input type="text" id="L_title" name="title" required lay-verify="title"
                        autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <div class="layui-input-block">
                        <textarea id="L_art_body" name="art_body" 
                        placeholder="请输入内容" class="layui-textarea fly-editor" style="height: 260px;"></textarea>
                    </div>
                    <label for="L_art_body" class="layui-form-label" style="top: -2px;">
                      	  描述
                    </label>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">
                           	 所在类别
                        </label>
                        <div class="layui-input-block">
                            <select lay-verify="required" name="cid" id="cates"></select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <button class="layui-btn" lay-filter="add" lay-submit>
                       	 立即发布
                    </button>
                </div>
            </form>
        </div>
  
    </body>
         <script type="text/javascript">
				$(function(){
					$.ajax({
						type:"POST",
						url:"<%=PATH%>/findCates",
						success:function(results){
							var tableContent="";
							tableContent+="<option></option>";
							$.each(results,function(i,result){
								tableContent+="<option value='"+result.id+"'>"+result.cateName+"</option>";
								$("#cates").html(tableContent);	
							});
						}
					})
				})
         </script> 
        <script>
            layui.use(['form','layer','layedit'], function(){
                $ = layui.jquery;
              var form = layui.form
              ,layer = layui.layer
              ,layedit = layui.layedit;
  
            //创建一个编辑器
            //创建一个编辑器
            editIndex = layedit.build('L_art_body',
                    {tool:
                        ['left','center','right','|','strong',
						 'italic','underline','del','|',
						 'link','unlink','face']});

              //监听提交
              form.on('submit(add)', function(data){
                console.log(data.field);
                var article=data.field;
                var msg=layedit.getText(editIndex);
                //发异步，把数据提交给后台
                $(function(){
					$.ajax({
						type:'POST',
						url:'<%=PATH%>/addArticle',
						data:{
								art_name:article.title,
								cate_id:article.cid,
								author_id:$("#author_id").val(),
								art_body:msg
							},
						success:function(result)
						{
							if(result==true)
							{
								 layer.alert("增加成功", {icon: 6},function () {
					                    // 获得frame索引
					                    var index = parent.layer.getFrameIndex(window.name);
					                    //关闭当前frame
					                    parent.layer.close(index);
					             });
							}
						}
					})	
                })
               
                return false;
              });       
            });
        </script>
</html>
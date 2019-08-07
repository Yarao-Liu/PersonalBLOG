<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String PATH=request.getContextPath(); %>
<!DOCTYPE html>
<html>
    
    <head>
        <meta charset="utf-8">
        <art_name>
            	文章编辑-文章管理
        </art_name>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="format-detection" content="telephone=no">
                <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
        <script src="<%=PATH%>/lib/layui/layui.js" charset="utf-8"></script>
        <script src="<%=PATH%>/js/x-layui.js" charset="utf-8"></script>
        <link rel="stylesheet" href="<%=PATH%>/css/x-admin.css" media="all">
    </head>
    
    <body>
        <div class="x-body">
            <form class="layui-form layui-form-pane">
            <input id="id" name="art_id" value="${param.id}" type="hidden"/>
                <div class="layui-form-item">
                    <label for="L_art_name" class="layui-form-label">
                        标题
                    </label>
                    <div class="layui-input-block">
                        <input type="text" id="L_art_name" name="art_name" required lay-verify="art_name" value="layDate如何设置最小时间为当前" 
                        autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <div class="layui-input-block">
                        <textarea id="L_art_body" name="art_body" 
                        placeholder="请输入内容" class="layui-textarea fly-editor" style="height: 260px;"></textarea>
                    </div>
                    <label for="L_art_body" class="layui-form-label" style="top: -2px;">
                      		  正文描述
                    </label>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">
                            	所在类别
                        </label>
                        <div class="layui-input-block">
                            <select lay-verify="required" name="cate_id" id="cates">
                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <button class="layui-btn" lay-filter="update" lay-submit>
                       	 保存更改
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
				$("#cates").html("");
				var tableContent="";
				tableContent+="<option></option>";
				$.each(results,function(i,result){
					tableContent+="<option value='"+result.id+"'>"+result.cateName+"</option>";
					$("#cates").html(tableContent);	
				});
			}
		})
		$.ajax({
			type:"POST",
			url:"<%=PATH%>/findArticleById",
			data:{id:$("#id").val()},
			success:function(article){
// 				console.log(article);
				$("#L_art_name").val(article.art_name);
				$("#L_art_body").val(article.art_body);
				$("#cates").val(article.cate_id);
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
            editIndex = layedit.build('L_art_body',
                    {tool:
                        ['left','center','right','|','strong',
						 'italic','underline','del','|',
						 'link','unlink','face']});

              //监听提交
              form.on('submit(update)', function(data){
				  var msg=layedit.getText(editIndex);
				  console.log(msg);
                  var article=data.field;
                 $(function(){
					$.ajax({
							type:'POST',
							url:'<%=PATH%>/updateArticleById',
							data:{
								art_id:article.art_id,
								art_name:article.art_name,
								art_body:msg,
								cate_id:article.cate_id,
								},
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
</html>
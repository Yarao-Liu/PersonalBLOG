PersonalBLOG是一个自主开发的个人博客管理系统，是本人技术学以致用的一个体现。

前端页面主要是基于开源后端模板X-admin实现的，还有layui的插件，话说layui插件是真的好用哦！

后端是基于springboot+Mybatis+druid实现的，本人最近新学的springboot，拿这个博客来练练手...

目前只实现后台的admin用户的基本管理，包括新增、修改、删除、批量删除、分页查询等等。

角色管理以及表关联查询正在持续开发中.

项目中肯定会存在不少BUG，希望有心的朋友加以指正，我们共同进步....

后面持续更新.....


SQL.sql 为数据库脚本文件
PersonalBLOG.war是Maven打包项目，可以直接放到tomcat下运行。
用户名：liuyarao
密码：  liu134392

2019/07/29 更新
修复BUG：
	查询结果角色一栏由数字改为角色名称（字符串）
	admin的属性roleid也由Integer更改为String。
完成模块：
	admin和role表关联查询
修复BUG：
	用户角色修改时不能成功回显的问题

2019/07/31 更新
准备文章模块的编写：
         新增class:Category、Article、ArticleDao、ArticleService、
            ArticleServiceImpl、ArticleController等等
         完成ajax异步查询选择的文章类别      
         新增JSP页面:article-list.jsp、article-add.jsp、article-edit.jsp等等

2019/08/07 更新
完成大部分文章模块的编写：
          重新编写了 Category和Article的相关接口和实现类
          完成ajax异步请求&&表关联查询文章article实体&&展示查询结果。
          完成ajax异步请求新增和根据id删除文章
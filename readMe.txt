PersonalBLOG是一个自主开发的个人博客管理系统，是本人技术学以致用的一个体现。

前端页面主要是基于开源后端模板X-admin实现的，还有layui的插件，话说layui插件是真的好用哦！

后端是基于springboot+Mybatis+druid实现的，本人最近新学的springboot，拿这个博客来练练手...

开发环境：JDK1.8,Tomcat8.5,Maven3.3.9,Springboot2.1.6,MySQL5.5,Spring Tools 4等等。

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
          
2019/08/09 更新
修复BUG：
         新增文章或修改文章时从数据库查询出的内容不能及时回显。
         原因可能与ajax的特性有关,当有多个ajax请求时返回的结果次序具有不确定性，而且数据库查询本身就比较
慢，有的查询结果还没来得及返回，有的就将页面渲染完成了。
优化Article的展示：
        使用ajax重写了列表信息的请求&&分页查询,使展示页面更加简洁。
2019/12/06 更新
新增 组合查询：
	用户可以根据用户名、邮箱以及手机号进行组合查询过滤信息。
修复 BUG：
	将返回值部分修改为SimpleResponse，方便返回data和status.
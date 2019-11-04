<%--
  Created by IntelliJ IDEA.
  User: xxy
  Date: 2019/5/5
  Time: 17:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/head.jsp"%>
<html>
<head>
    <title>项目介绍</title>
    <style>
        .box{
            width: 70%;
            margin: auto;
            background-color: white;
            margin-top: 10px;
        }
        .center{
            text-align: center;
        }
        .text-left{
            text-align: left;
            width: 25%;
            margin: auto;
        }
    </style>
</head>
<body>
<div class="box">
    <br>
    <h5>项目介绍</h5>
    <hr style="height:2px;border:none;border-top:2px dotted  #FFCCFF;" />
    <div class="center">
        <h5><b>所用技术</b></h5>
          项目由Maven管理<br>
          后台：SSM框架+Mysql+redis<br>
          前端：bookstrap+jq<br>
        <br>
        <h5><b>项目功能</b></h5>
        <div class="text-left">
        1. 使用springmvc拦截器实现权限管理<br><br>
        ①游客可以观看文章和评论,但不可以回复文章和评论及下载资源<br><br>
        ②登陆后才可以下载资源，文章点赞等<br><br>
        </div>
        2. 评论及用户昵称做了违禁词处理（如fuck、死...）<br><br>
        3. REST风格url
        4. 异步提交评论，局部更新评论内容<br><br>
        待完善：数据库事务管理及多线程访问<br>
        <center>
        <img src="<%=path%>/static/img/jieshao.png">
        </center>
    </div>
    <br>
</div>
</body>
</html>

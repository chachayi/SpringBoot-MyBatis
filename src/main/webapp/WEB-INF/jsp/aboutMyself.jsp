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
    <title>关于自己</title>
    <style>
        .personbox{
            width: 70%;
            margin: auto;
            background-color: white;
            margin-top: 10px;
        }
        .center{
            text-align: center;
        }
    </style>
</head>
<body>
<div class="personbox">
    <br>
    <h5>关于自己</h5>
    <hr style="height:2px;border:none;border-top:2px dotted  #FFCCFF;" />
    <div class="center">
        <h5><b>个人简介</b></h5>
        <img src="<%=path%>/static/img/aboutMyself/头像.png"/><br>
        叉叉熠<br>
        爱生活、爱编程<br><br>
        <h5><b>目前所学技能</b></h5><br>
        <img src="<%=path%>/static/img/aboutMyself/知识结构.png"/>
    </div>
</div>
</body>
</html>

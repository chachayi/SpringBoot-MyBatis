<%--
  Created by IntelliJ IDEA.
  User: xxy
  Date: 2019/5/7
  Time: 18:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/head.jsp"%>
<html>
<head>
    <title>生活笔记</title>
    <style>
        .listbox{
            margin: auto;
            width: 70%;
            background-color: white;
            margin-top: 10px;
        }
        .dibu{
            color:#CCC;
            font-size:12px;
        }
        .shangbu{
            font-size:20px;
            font-weight:bold
        }
        .articlelistTop{
            width: 60%;
            background-color: whitesmoke;
            margin: auto;
        }
    </style>
</head>
<body>
<br>
<!--文章列表-->
<c:forEach items="${articleList}" var="article" end = "4"  varStatus="index">
    <div class="articlelistTop">
    <div class="shangbu"><a href="<%=basePath%>article/details/${article.articleId}" target="_blank">${article.articleTitle}</a></div><br>
    <div class="limit">${article.articleContent}</div><br>
    <div class="dibu">发布时间: <c:out value="${article.articleTime}"/> &nbsp;阅读数：<c:out value="${article.articleCount}"/> &nbsp;评论数：暂无</div>
    <hr style="height:2px;border:none;border-top:2px dotted  #FFCCFF;" />
    </div>
    <br>
</c:forEach>

<center><b>暂无更多```</b></center>

</body>
</html>

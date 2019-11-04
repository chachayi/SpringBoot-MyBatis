<%--
  Created by IntelliJ IDEA.
  User: xxy
  Date: 2019/4/8
  Time: 16:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/head.jsp"%>
<html>
<head>
    <title>叉叉熠|的个人博客</title>
    <style>
        .bottomBox{
            width: 70%;
            margin: auto;
        }
        .lunbotubox{
            width: 60%;
            height: 40%;
            margin-top: 10px;
            float: left;
        }
        .carousel-inner img {
            width: 100%;
            height: 100%;
        }
        .remenpaihang{
            margin-top: 10px;
            background-color: white;
            width: 60%;
            float: left;
        }
        .rementop{
            background-color:#F5F5DC;
            color: blue;
            padding-top: 15px;
        }
        .imgText{
            margin-top: -30px;
            color:rgba(75,0,130, 0.7);
            margin-left: 20px;
        }
        .left{
            width: 37%;
            height: 36%;
            position: relative;
            margin-left: 20px;
            margin-top: 10px;
            float: left;
        }
        .left1{
            background-image: url(<%=path%>/static/img/shouye/黑板.jpg);
            background-repeat: no-repeat;
            margin-top: 20px;
        }
        .left2{
            margin-top: 0px;
        }
        .wenzhangtuijian{
            background-color: white;
            width: 100%;
            float: left;
        }
        .tuijiantop{
            background-color:gray;
            color: greenyellow;
            padding-top: 15px;
        }
        .dibu{
            color:#CCC;
            font-size:12px;
        }
        .shangbu{
            font-size:20px;
            font-weight:bold
        }
        .articlelist2{
            width: 60%;
            background-color: whitesmoke;
            margin-top: -5px;

        }
        .articlelist1{
            width: 60%;
            background-color: whitesmoke;
            margin-top: -20px;
        }
        .clear{ clear:both}
    </style>
</head>
<body>
<div class="bottomBox"><!--最大容器-->
    <!--轮播图-->
    <div class="lunbotubox">
        <div id="demo" class="carousel slide" data-ride="carousel">

            <!-- 指示符 -->
            <ul class="carousel-indicators">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <li data-target="#demo" data-slide-to="1"></li>
                <li data-target="#demo" data-slide-to="2"></li>
            </ul>

            <!-- 轮播图片 -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <a href="<%=basePath%>article/details/18" target="_blank"><img src="<%=path%>/static/img/shouye/工具推荐.jpg" alt=""/></a>
                    <div class="banner_text imgText">
                        <span class="font-weight-light"><h5>西湖游玩记录</h5></span>
                    </div>
                </div>
                <div class="carousel-item">
                    <a href="<%=basePath%>life_notes"><img src="<%=path%>/static/img/shouye/西湖.jpg"/></a>
                    <div class="banner_text imgText">
                        <span class="font-weight-light"><h5>个人笔记</h5></span>
                    </div>
                </div>
                <div class="carousel-item">
                    <a href="<%=basePath%>article/all_articles/reading_time/0"><img src="<%=path%>/static/img/shouye/java.jpg"/></a>
                    <div class="banner_text imgText">
                        <span class="font-weight-light"><h5>Java学习</h5></span>
                    </div>
                </div>
            </div>

            <!-- 左右切换按钮 -->
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
                <span class="carousel-control-next-icon"></span>
            </a>
        </div>
    </div>

    <!--热门排行-->
    <div class="left left1"></div>
    <div class="remenpaihang">
        <div class="rementop">热门排行
            <hr style="height:1px;border:none;border-top:1px dotted  green;" />
        </div>
        <c:forEach items="${articleList2}" var="article" end = "4"  varStatus="index">
        <h6><a href="<%=basePath%>article/details/${article.articleId}" target="_blank">${article.articleTitle}</a> <span class="right">💗${(6-index.count)*17+3}喜欢</span></h6>
        </c:forEach>
    </div>

    <!--文章推荐-->
    <div class="left left2">
        <div class="wenzhangtuijian">
            <div class="tuijiantop">推荐文章
                <hr style="height:1px;border:none;border-top:1px dotted  blueviolet;" />
            </div>
            <h6><a href="https://www.cnblogs.com/hackyo/p/6646051.html" target="_blank">使用idea2017搭建SSM框架</a> </h6>
            <h6><a href="https://www.cnblogs.com/selene/p/5860067.html" target="_blank">编写高质量代码:改善Java程序的151个建议</a> </h6>
            <h6><a href="https://www.cnblogs.com/chiangchou/p/idea-debug.html" target="_blank">在Intellij IDEA中使用Debug</a> </h6>
            <h6><a href="https://www.jianshu.com/p/503c8b46c164" target="_blank">知识解析</a> </h6>
            <h6><a href="https://www.jianshu.com/p/2604e53a7f6a?from=singlemessage" target="_blank">阿里云ECS建网站</a> </h6>
            <h6><a href="https://blog.csdn.net/jackfrued/article/details/44921941" target="_blank">Java面试题全集（上）</a> </h6>
            <h6><a href="https://blog.csdn.net/jackfrued/article/details/44931137" target="_blank">Java面试题全集（中）</a> </h6>
            <h6><a href="https://blog.csdn.net/jackfrued/article/details/44931161" target="_blank">Java面试题全集（下）</a> </h6>
        </div>
    </div>
    <div class="clear"></div>
    <!--文章列表-->
   <c:forEach items="${articleList1}" var="article" end = "4"  varStatus="index">
    <div class="articlelist1">
        <div class="shangbu"><a href="<%=basePath%>article/details/${article.articleId}" target="_blank">${article.articleTitle}</a></div><br>
        <div class="limit">${article.articleContent}</div><br>
        <div class="dibu">发布时间: <c:out value="${article.articleTime}"/> &nbsp;阅读数：<c:out value="${article.articleCount}"/> &nbsp;评论数：暂无</div>
        <hr style="height:2px;border:none;border-top:2px dotted  #FFCCFF;" />
    </div>
       <br>
   </c:forEach>
</div>
</body>
</html>

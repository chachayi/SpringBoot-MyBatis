<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/head.jsp"%>
<html>
 <head>
    <meta charset="utf-8">
    <style type="text/css">
       .clear{ clear:both}
       .vertical{
          transform: translateY(50%);
          width: 80%;
          margin:auto;
       }
	   .main-box{
		    width:70%;
		   margin:auto;
		   margin-top:10px;
		  position:relative;
		   }
       .left-box{
			   width:30%;
			   height:auto;
          border: 1px solid yellow;
               margin-right:50px;
			   float:left;
			   background-color:#FFF;
		   }
          .right-box{
			   width:65%;
			   height:auto;
               float:left;
			    border: 1px solid yellow;
                background-color:#FFF;
             box-sizing:border-box;
          }
       @media screen and (max-width: 1433px) {
          .right-box {
             width:55%;
             height:auto;
             float:left;
             border: 1px solid yellow;
             background-color:#FFF;
             box-sizing:border-box;
          }
       }
       .article-color{
          color: #eea236;
          font-weight: bold;
       }
	   .dibu{
	color:#CCC;
	font-size:12px;
}
.shangbu{
	font-size:20px;
	font-weight:bold
}
.toubu{
	font-size:16px;
	 font-family:"宋体";
	 margin-top:15px;
	 color:#C9C;
	   position:relative;
}
       .articleTitle{
          font-weight: bold;
       }
       .juzhong{
          margin: auto;
       }
    </style>
    <script>
        $(document).ready(function(){
            document.body.clientWidth;
            paixu();
        });
        function paixu() {
            var path = window.location.pathname;
            if (path.indexOf("reading_quantity")>-1) {
                $("#fangwenliang").css("color","red");
                fenye("fangwenliang");
            }
            else {
                $("#gengxinshijian").css("color","red");
                fenye("gengxinshijian");
            }
        }
        function fenye(twoPaixu) {
            var index = $(".pagination");
            var currentPage = '${index}';
            var data = 17;
            var allPage = Math.ceil(data / 10);
            index.empty();
            index.append("<li class=\"page-item\"><a class=\"page-link\" href='javascript:volid(0);'>&laquo;</a></li>");
            if (twoPaixu=="fangwenliang"){
                for (var i = 1; i <= allPage; i++) {
                    var yemian = (i - 1) * 10;
                    index.append("<li class=\"page-item\" id=index" + i + "><a class=\"page-link\" href='<%=basePath%>article/all_articles/reading_quantity/" + yemian + "'>" + i + "</a></li>");
                }
            }
            else{
                for (var i = 1; i <= allPage; i++) {
                    var yemian = (i - 1) * 10;
                    index.append("<li class=\"page-item\" id=index" + i + "><a class=\"page-link\" href='<%=basePath%>article/all_articles/reading_time/" + yemian + "'>" + i + "</a></li>");
                }
            }
                $("#index" + currentPage).addClass("active");
                index.append("<li class=\"page-item\"><a class=\"page-link\" href='javascript:volid(0);'>&raquo;</a></li>");
        }
    </script>
</head>
    
<body>

<div class="main-box">
   <!--左侧文章列表-->
<div class="left-box">
<br>
   ⭐ &nbsp;<span class="articleTitle">个人分类</span>
   <li><a href="<%=basePath%>article/article_type/Java"> 1. Java  &nbsp;    &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; <span class="dibu">2篇</span></a></li>
   <li><a href="<%=basePath%>article/article_type/Servlet_Jsp">2. Servlet_Jsp &nbsp; &nbsp;<span class="dibu">3篇</span></a></li>
   <li><a href="<%=basePath%>article/article_type/Mysql">3. Mysql  &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;<span class="dibu">4篇</span></a></li>
   <li><a href="<%=basePath%>article/article_type/SSM">4. SSM  &nbsp; &nbsp; &nbsp;  &nbsp;  &nbsp; &nbsp;&nbsp;<span class="dibu">3篇</span></a></li>
   <li><a href="<%=basePath%>article/article_type/Http">5. Http &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class="dibu">5篇</span></a></li>

   <hr style="height:2px;border:none;border-top:2px dotted  #FFCCFF;" />
   ⭐ &nbsp;<span class="articleTitle">热门文章</span>
<c:forEach items="${sessionScope.articleList}" var="article" end = "18">
<li class="article-color"><a href="<%=basePath%>article/details/${article.articleId}" target="_blank">${article.articleTitle}</a><br>
   <span class="dibu"> 阅读数:${article.articleCount}</span>
</li>
</c:forEach>

   <hr style="height:2px;border:none;border-top:2px dotted  #FFCCFF;" />
   ⭐ &nbsp;<span class="articleTitle">归档</span>
   <li><a href="<%=basePath%>article/time_articles/20181101">1. 2018年11月</a></li>
   <li><a href="<%=basePath%>article/time_articles/20181201">2. 2018年12月</a></li>
   <li><a href="<%=basePath%>article/time_articles/20190101">3. 2019年1月</a></li>
   <li><a href="<%=basePath%>article/time_articles/20190201">4. 2019年2月</a></li>
   <li><a href="<%=basePath%>article/time_articles/20190301">5. 2019年3月</a></li>
   <li><a href="<%=basePath%>article/time_articles/20190401">6. 2019年4月</a></li>
</div>

   <!--右侧文章列表-->
<div class="right-box">
    <div class="toubu">排序:&nbsp; <a href="<%=basePath%>article/all_articles/reading_quantity/0"><span id="fangwenliang">按访问量</span></a> &nbsp;&nbsp;   <a href="<%=basePath%>article/all_articles/reading_time/0"><span id="gengxinshijian">按更新时间</span></a></div>
<hr style="height:2px;border:none;border-top:2px dotted  #FFCCFF;" />
   <c:forEach items="${articleList}" var="article" ><!--遍历list-->
   <div class="shangbu"><a href="<%=basePath%>article/details/${article.articleId}" target="_blank"> <c:out value="${article.articleTitle}"/></a></div><br>
   <div class="limit"><c:out value="${article.articleContent}"/>.</div><br>
   <div class="dibu">发布时间: <c:out value="${article.articleTime}"/> &nbsp;阅读数：<c:out value="${article.articleCount}"/> &nbsp;评论数：暂无</div>
   <hr style="height:2px;border:none;border-top:2px dotted  #FFCCFF;" />
   </c:forEach>
   <!--页码-->
   <div class="juzhong">
    <ul class="pagination">
    </ul>
   </div>

</div>
   <div class="clear"></div>
</div>
</body>
</html>

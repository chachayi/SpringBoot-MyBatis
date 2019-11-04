<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="head.jsp"%>
<html>
 <head>
    <meta charset="utf-8">
    <title>Bootstrap 实例 - 默认的导航栏</title>
    <script src="<%=path%>/static/js/jquery.min.js"></script>
    <style type="text/css">

	   body{
		   background-color:#CFF;	 
		   height:auto;
	   }
	   .top-box{
		   height:auto;
		   width:80%;
		   border: 2px solid lightgrey;	 
			margin:auto;
			
	   }
	   .main-box{
		    width:80%;
		 height:100%;
		   border: 2px solid lightgrey;
		   margin:auto;
		   margin-top:20px;
		  position:relative;

		   }
       .left-box{
			   width:30%;
			   height:auto;
			    border: 2px solid red;
				margin-right:50px;
			   float:left;
			   background-color:#FFF;
		   }
       .right-box{
			   width:65%;
			   heigh:auto;
               float:right;
			    border: 2px solid yellow;
                background-color:#FFF;
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
       .neirong{  /*多余字体不显示*/
          text-overflow:ellipsis;
          overflow:hidden;
          white-space:nowrap;
       }
    </style>
    
</head>
    
<body>
​
<div class="top-box">
叉叉熠<br>
Web开发者
</div>

<div class="main-box">

<div class="left-box">
<br>

个人分类
<li><a href="learn/"> 1. Java         2篇</a></li>
   <li><a href="">2. Servlet_Jsp</a></li>
<li><a href="">3. Mysql</a></li>
<li><a href="">4. Redis</a></li>
<li><a href="">5. SSM</a></li>
<li><a href="">6. Http</a></li>



热门文章
<li>1. aaaaaaaaaaaaaa</li>
<li>1. aaaaaaaaaaaaaa</li>
<li>1. aaaaaaaaaaaaaa</li>
<li>1. aaaaaaaaaaaaaa</li>
<li>1. aaaaaaaaaaaaaa</li>
<li>1. aaaaaaaaaaaaaa</li>
<li>1. aaaaaaaaaaaaaa</li>
<li>1. aaaaaaaaaaaaaa</li>
<li>1. aaaaaaaaaaaaaa</li>

归档
<li>1. 2018年11月</li>
<li>2. 2018年12月</li>
<li>3. 2019年1月</li>
<li>4. 2019年2月</li>
<li>5. 2019年3月</li>
<li>6. 2019年4月</li>
</div>

<div class="right-box">
<div class="toubu">排序:&nbsp;  默认&nbsp;&nbsp;  按访问量&nbsp;&nbsp;   按更新时间</div>
<hr style="height:2px;border:none;border-top:2px dotted  #FFCCFF;" />

   <div class="shangbu">西交大：30年培养</div><br>
   <div>研究生教育是培养我国高层次人才的主要途径，是建设创新型国家的核心要素，如何进一步提升人才培养质量，为创办一流大学、培养具有创新能力和国际化视野的高水平研究生探索一条行之有效...</div><br>
   <div class="dibu">作者: 叉叉熠&nbsp; 来源:新闻网&nbsp; 发布时间: 2019/3/4</div>
   <hr style="height:2px;border:none;border-top:2px dotted  #FFCCFF;" />

<div class="shangbu">西交大：30年培养</div><br>
<div>研究生教育是培养我国高层次人才的主要途径，是建设创新型国家的核心要素，如何进一步提升人才培养质量，为创办一流大学、培养具有创新能力和国际化视野的高水平研究生探索一条行之有效...</div><br>
<div class="dibu">作者: 叉叉熠&nbsp; 来源:新闻网&nbsp; 发布时间: 2019/3/4</div>
<hr style="height:2px;border:none;border-top:2px dotted  #FFCCFF;" />

<div class="shangbu">西交大：30年培养</div><br>
<div>研究生教育是培养我国高层次人才的主要途径，是建设创新型国家的核心要素，如何进一步提升人才培养质量，为创办一流大学、培养具有创新能力和国际化视野的高水平研究生探索一条行之有效...</div><br>
<div class="dibu">作者: 叉叉熠&nbsp; 来源:新闻网&nbsp; 发布时间: 2019/3/4</div>
<hr style="height:2px;border:none;border-top:2px dotted  #FFCCFF;" />

<div class="shangbu">西交大：30年培养</div><br>
<div>研究生教育是培养我国高层次人才的主要途径，是建设创新型国家的核心要素，如何进一步提升人才培养质量，为创办一流大学、培养具有创新能力和国际化视野的高水平研究生探索一条行之有效...</div><br>
<div class="dibu">作者: 叉叉熠&nbsp; 来源:新闻网&nbsp; 发布时间: 2019/3/4</div>
<hr style="height:2px;border:none;border-top:2px dotted  #FFCCFF;" />

<div class="shangbu">西交大：30年培养</div><br>
<div>研究生教育是培养我国高层次人才的主要途径，是建设创新型国家的核心要素，如何进一步提升人才培养质量，为创办一流大学、培养具有创新能力和国际化视野的高水平研究生探索一条行之有效...</div><br>
<div class="dibu">作者: 叉叉熠&nbsp; 来源:新闻网&nbsp; 发布时间: 2019/3/4</div>
<hr style="height:2px;border:none;border-top:2px dotted  #FFCCFF;" />

<div class="shangbu">西交大：30年培养</div><br>
<div>研究生教育是培养我国高层次人才的主要途径，是建设创新型国家的核心要素，如何进一步提升人才培养质量，为创办一流大学、培养具有创新能力和国际化视野的高水平研究生探索一条行之有效...</div><br>
<div class="dibu">作者: 叉叉熠&nbsp; 来源:新闻网&nbsp; 发布时间: 2019/3/4</div>
<hr style="height:2px;border:none;border-top:2px dotted  #FFCCFF;" />
</div>

</div>

</body>
</html>

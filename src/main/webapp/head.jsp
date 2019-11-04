<%--
  Created by IntelliJ IDEA.
  User: xxy
  Date: 2019/4/8
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";//获取项目当前路径
%>
<html>
<head>
    <title>叉叉熠的专栏</title>
    <script src="<%=path%>/static/js/jquery.min.js"></script>
    <script src="<%=path%>/static/js/bootstrap4.min.js"></script>
    <link rel="stylesheet" href="<%=path%>/static/css/bootstrap4.min.css">
    <script src="<%=path%>/static/js/form_validate/jquery.validate.min.js"></script>
    <script src="https://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
    <style type="text/css">
    body{
        background-color: #CCCCCC;
        height: 100%;
    }
    .north li{
        font-size:18px;
        margin-left:30px;
        position:relative;
    }
    li{
        list-style-type:none;
        line-height: 25px;
    }
    a:hover {
        color: #eea236;
        text-decoration:none;
    } /* 鼠标移动到链接上 */
    .juzhong{
        display: flex;
        justify-content: space-around;
    }
    .denglu{
        background-color: white;
        font-size: 16px;
        height: 27px;
        width: 70%;
        margin: auto;
    }
    .right{
        float: right;
        margin-right: 2%;
    }
    .error{
        color:red;
    }
    .limit{
         overflow: hidden;
         text-overflow: ellipsis;
         display: -webkit-box;
         -webkit-line-clamp: 2;
         -webkit-box-orient: vertical;
     }
        .text{
            font-weight: bold;
            color: #6f42c1;
        }
    </style>
    <script>
        setInterval("currentTime.innerHTML=new Date().toLocaleString()",1000);<!--显示当前时间-->
        $.post("<%=basePath%>article/popular_articles", function(data) {
        })
        $(document).ready(function(){
            $("#sousuo").validate();
            if('${sessionScope.userName}'!=''){
                $("#login").remove();
            }
        });
        $.validator.setDefaults({
            submitHandler: function() {
                $("#sousuo").submit();
            }
        });<!--表单验证提交-->
        function cancellation() {
            if (confirm("确定注销吗")) {
                $.post("<%=basePath%>user/cancellation", function(data) {
                });
                window.location.reload();
            }else{
                return false;
            }
        }
    </script>
</head>
<body>

<img src="<%=path%>/static/img/shouye/top.png" width="100%"/>

<!--导航栏-->
<nav class="navbar navbar-expand-sm bg-dark navbar-dark north juzhong">
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" href="<%=basePath%>shouye">首页</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<%=basePath%>article/all_articles/reading_time/0">学习笔记</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<%=basePath%>life_notes">生活笔记</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<%=basePath%>resources">资源分享</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<%=basePath%>myself">关于自己</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<%=basePath%>leave_message">给我留言</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<%=basePath%>jieshao">项目简介</a>
        </li>
    </ul>
</nav>

<!--登陆-->
<div class="denglu font-weight-light">欢迎观看<span class="text">${sessionScope.userName}</span> &nbsp;现在时间是:<span id="currentTime"></span>
    <span class="right">
        <form action="<%=basePath%>article/required_articles" id="sousuo" method="post">
         <fieldset>
      <input type="text" name="title" required/>
      <button type="submit">搜索</button>&nbsp; &nbsp; &nbsp;
             <a href="<%=path%>/login" id="login"><b>登陆</b></a>
             <a href="javascript:void(0);" onclick="cancellation();"><b>注销</b></a>
         </fieldset>
        </form>
    </span>
</div>

</body>
</html>

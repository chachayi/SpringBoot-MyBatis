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
    <title>资源下载</title>
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
        .img{
            width: 150px;
            height: 150px;
        }
        .box{
            width: 200px;
            height: 200px;
            float: left;
        }
        .wuxiao{
            user-select:none;
            pointer-events: none;
        }
    </style>
    <script>
        $(document).ready(function(){
            if('${sessionScope.userName}'!=""){
                $("#text").html("欢迎下载");
            }
        });
    </script>
</head>
<body>
<div class="personbox">
    <br>
    <h5><b><span id="text">资源下载(登陆可下载)</span></b></h5>
    <hr style="height:2px;border:none;border-top:2px dotted  #FFCCFF;" />

    <div class="box">
        <img class="img" src="<%=path%>/static/img/resources-download/SpringMVC4.jpg"><br>
    <a href="<%=basePath%>resources_download?fileName=SpringMVC4.pdf">SpringMVC4下载</a>
    </div>

    <div class="box">
        <img class="img" src="<%=path%>/static/img/resources-download/redis-desktop.jpg"><br>
    <a href="<%=basePath%>resources_download?fileName=redis-desktop-manager.exe">Redis可视化工具下载</a>
    </div>


</div>
</body>
</html>

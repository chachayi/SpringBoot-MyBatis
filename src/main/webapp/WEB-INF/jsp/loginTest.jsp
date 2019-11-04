<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";//获取项目当前路径
%>
<html>
<head>
    <title>管理页面</title>
    <%--引入网页插件--%>
    <script src="static/jquery-3.3.1/jquery-3.3.1.min.js"></script>
    <link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<style>
    #from
    {
        background-color: #96b97d;
    }
    .mycenter
    {
        margin-top: 100px;
        margin-left: auto;
        margin-right: auto;
        height: 350px;
        width: 500px;
        padding: 5%;
        padding-left: 5%;
        padding-right: 5%;
    }
    .mycenter mysign
    {
        width: 440px;
    }
    .mycenter input, checkbox, button
    {
        margin-top: 2%;
        margin-left: 10%;
        margin-right: 10%;
    }
    .mycheckbox
    {
        margin-top: 10px;
        margin-left: 40px;
        margin-bottom: 10px;
        height: 10px;
    }
</style>
<script type="text/javascript">

</script>

</head>
<body>
<form  method="post" action="<%=basePath%>user/register">
    <table>
        <tr>
            <td>用户名:</td>
            <td><input id="username" name="username" type="text"></td>
        </tr>
        <tr>
            <td>密码:</td>
            <td><input id="password" name="password" type="password"></td>
        </tr>
        <tr >
            <td><input type="submit" value="登录"  ></td>
        </tr>
    </table>
</form>
</body>
</html>

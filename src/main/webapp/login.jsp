<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";//获取项目当前路径
%>
<!DOCTYPE html>
<html>
<head>
    <title>登陆页面</title>
    <link href="static/css/verify.css" rel="stylesheet">
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
    <script src="static/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="jquery.min.js" type="text/javascript"></script>
    <script src="verify.js" type="text/javascript"></script>
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

</style>
</head>
<body>
<form id="from" method="post" action="<%=basePath%>user/checkLogin">
    <div class="mycenter">
        <div class="mysign">
            <div class="col-lg-11 text-center text-info">
                <h2>
                    用户登录</h2>
            </div>
            <div class="col-lg-10">
                <input type="text" class="form-control" name="username" placeholder="请输入账户名" required
                       autofocus />
            </div>
            <div class="col-lg-10">
            </div>
            <div class="col-lg-10">
                <input type="password" class="form-control" name="password" placeholder="请输入密码" required
                       autofocus />
            </div>
            <div class="col-lg-10">
            </div>
            <div class="col-lg-10">
            </div>
            <div class="col-lg-10">
                <button type="submit" id="btn" class="btn btn-success col-lg-12">
                    登录</button>
            </div>
        </div>
    </div>
</form>
<div id="mpanel2" >
</div>

<script type="text/javascript">
    $('#mpanel2').codeVerify({
        type : 1,
        width : '400px',
        height : '50px',
        fontSize : '30px',
        codeLength : 6,
        btnId : 'check-btn',
        ready : function() {
        },
        success : function() {
            alert('验证匹配！');
        },
        error : function() {
            alert('验证码不匹配！');
        }
    });
</script>
</body>
</html>

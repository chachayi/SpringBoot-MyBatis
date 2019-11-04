<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/4/8
  Time: 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <script src="static/js/jquery.min.js" type="text/javascript"></script>
    <script src="static/js/verify.js" type="text/javascript"></script>

    <title>Title</title>

</head>
<body>
<div id="mpanel2" >

</div>
<button type="button" id="check-btn" class="verify-btn">确定</button>
<script>

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

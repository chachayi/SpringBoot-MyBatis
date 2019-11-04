<%--
  Created by IntelliJ IDEA.
  User: xxy
  Date: 2019/5/15
  Time: 19:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/head.jsp"%>
<html>
<head>
    <title>登陆</title>
    <style>
        .error{
            color:red;
            display:inline;
        }
        .button { /* 按钮美化 */
            width: 270px; /* 宽度 */
            height: 40px; /* 高度 */
            border-width: 0px; /* 边框宽度 */
            border-radius: 3px; /* 边框半径 */
            background:gray; /* 背景颜色 */
            cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
            outline: none; /* 不显示轮廓线 */
            font-family: Microsoft YaHei; /* 设置字体 */
            color: white; /* 字体颜色 */
            font-size: 17px; /* 字体大小 */
            float:right;
        }
        .button:active {
            background: #f47c20;
        }
        .person-information{
            width:700px;
            height:100px;
            margin-top:50px;
        }
        .left-box{
            margin-left: 5%;
            margin-top: 3%;
            float:left;
        }
        .right-box{
            height:50%;
            width:55%;
            float:left;
            margin-left: 9%;
            transform: translate(0%,0%);
        }
        .centerdiv{
            float:left;
            width:30px;
            margin-top: -10px;
            border-right: 1px dashed #EEAD0E;
            padding-bottom:100px;  /*关键*/
            margin-bottom:-100px;  /*关键*/
        }
        .message{
            background-color: beige;
            margin-top: 10px;
        }
        .center{
            margin: auto;
            width: 70%;
        }
        .clear{ clear:both}
        #left{
            margin-right: -250px;
        }
    </style>
    <script>
        $.validator.setDefaults({
            submitHandler: function() {
               $("#commentForm").submit();
            }
        });<!--表单验证提交-->

        var prevLink;
        $(document).ready(function(){
            prevLink = document.referrer;
            $("#preLink").attr("value",prevLink);
            $("#commentForm").validate();
        });
    </script>
</head>
<body>
<div class="center">
<div class="message">
<form method="post" action="/user/login" id="commentForm">
    <fieldset>
        <div class="person-information">
            <span class="left-box">Hi，您需要填写昵称和邮箱！</span>
            <div class="centerdiv"></div>
            <div class="right-box">
                <div>昵称 (必填) &nbsp; &nbsp;<input type="text" width="100%"  placeholder="昵称" name="username" id="commentsNickname" minlength="3" required/> </div>

                <br>
                <input type="hidden" name="preLink" value="" id="preLink"/>
                <div>邮箱 (必填) &nbsp; &nbsp;
                    <input type="hidden" name="password"  id="password" value="123">
                    <input type="email" width="100%" placeholder="邮箱" name="userEmail" id="commentsEmail" required/>
                </div>
            </div>
            <div class="clear"></div>
            <input  id="left" class="button" type="submit" value="提交" />
        </div>
    </fieldset>
</form>
    <br>
</div>
</div>
</body>
</html>

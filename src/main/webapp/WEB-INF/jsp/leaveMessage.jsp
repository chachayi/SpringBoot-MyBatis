<%--
  Created by IntelliJ IDEA.
  User: xxy
  Date: 2019/5/6
  Time: 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/head.jsp"%>
<html>
<head>
    <title>给我留言</title>
    <style>
        body{
            height:100%;
        }
        .clear{ clear:both}
        .bottomComment{
            margin: auto;
            width: 70%;
        }
        .message{
            background-color: beige;
            margin-top: 10px;
        }
        .comment-top{
            height:60px;
            width: 100%;
            background-color:grey;
        }
        .commentText{
            position:relative;
            top:10%;
        }
        textarea{
            width:96%;
            margin-left: 2%;
            margin-top: -10px;
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
        .img{
            height:45px;
            width:45px;
            margin-left: 5px;
            transform: translate(0%,15%);
            vertical-align:middle;
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
            width:50%;
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
        .commentBox{
            margin-top:-5px;
            margin-bottom: 20px;
        }
        .commentBox2{
            margin-top:-20px;
            margin-bottom: 20px;
        }
        .left-box-comment{
            margin-left: 5%;
            margin-top: 3%;
            float:left;
        }
        .right-box-comment{
            font-size: 20px;
            margin-top: 10px;
            width:80%;
            float:left;
            transform: translate(5%,40%);
            border:1px solid #e3e197;
            background:#ffffdd;
        }
        .bottomziti{
            color: gray;
            font-size: 15px;
        }
        .huifu-comment{
            width: 80%;
            margin: auto;
        }
        #comment2{
            width:90%;
            margin-left: 5%;
            border: 1px solid #e3e197;
            margin-top: 20px;
            display: none;
        }
        .error{
            color:red;
        }
    </style>
    <script>
        $.validator.setDefaults({
            submitHandler: function() {
                if (confirm("确定提交吗")) {
                    if($("#commentForm").length>0){
                        putComment(1);
                    }else{
                        putComment(2);
                    }
                }else{
                    return false;
                }
            }
        });<!--表单验证提交-->
        var commentsNickname ='';
        var commentsEmail ='';

        $(document).ready(function(){
            if('${sessionScope.userName}'!=""){
                $(".person-information").hide();
                commentsNickname = '${sessionScope.userName}';
                commentsEmail = '${sessionScope.userEmail}';
            }
            $("#commentForm").validate();
            if('${replyCommentList}' == 'null'){
                return 0;
            }
            var json = ${replyCommentList};
            $.each(json, function(index, obj) {
                var location = "#"+obj.commentsId;
                $(location).after(insertReplyComment(obj));
            });
        });

        var commentsId = '';
        var currentDate = getCurrentTime();
        var code = '<div id="comment2">'+
            '<div class="comment-top">'+

            '<img class="img" src="<%=path%>/static/img/visitor.png" /> &nbsp;' +
            '<span class="commentText">发表我的评论</span>'+
            '</div><br>'+

            '<form method="post" action="<%=basePath%>comment/data" id="commentForm2">'+
            '  <fieldset><div class="wenbenyu">'+
            '<textarea rows="3" placeholder="欢迎评论..." name="commentsContent" id="commentsContent" minlength="5" required>'+
            '</textarea>'+
            '<br />'+
            '<input  class="button" type="submit" value="提交" />'+
            '</div>'+
            '<br>'+
            '<div class="person-information">'+
            '<span class="left-box">Hi，您需要填写昵称和邮箱！</span>'+
            '<div class="centerdiv"></div>'+
            '<div class="right-box">'+
            '<div>昵称 (必填) &nbsp; &nbsp;<input type="text" width="100%"  placeholder="昵称" name="commentsNickname" id="commentsNickname" minlength="3" required /></div>'+
            '<br>'+
            '<input type="hidden" name="articleId" value=" ${articleDetails.articleId}" id="articleId"/>'+
            '<div>邮箱 (必填) &nbsp; &nbsp;<input type="email" width="100%" placeholder="邮箱" name="commentsEmail" id="commentsEmail"  required/></div>'+
            '</div>'+
            '</div>'+
            '</form></fieldset><br>'+
            '</div>';

        function getCurrentTime() {
            var myDate = new Date;
            var year = myDate.getFullYear(); //获取当前年
            var mon = myDate.getMonth() + 1; //获取当前月
            var date = myDate.getDate();
            var currentDate = year+"-"+mon+"-"+date;
            return currentDate;
        }

        function insertReplyComment(obj){
            var replyCode = '<div class="commentBox2">'+
                '<div class="huifu-comment">'+
                '<div class="left-box-comment"><img src="<%=path%>/static/img/visitor.png" class="img"/></div>'+
                '<div class="right-box-comment">'+
                '<div>'+obj.commentsContent+'</div>'+
                '<span class="bottomziti">' +obj.commentsNickname+'&nbsp; '+currentDate+'  &nbsp; <a href="javascript:void(0);" onclick="pop_comment();"></a></span>'+
                '</div> <div class="clear"></div> </div> </div>;';
            return replyCode;
        }

        function putComment(type) {
            var url = "";
            if($("#commentsEmail").val()!=""){
                commentsEmail = $("#commentsEmail").val();
            }
            if($("#commentsNickname").val()!=""){
                commentsNickname = $("#commentsNickname").val();
            }
            var comment = {
                "commentsContent":$("#commentsContent").val(),
                "commentsEmail":commentsEmail,
                "commentsNickname":commentsNickname,
                "articleId":20
            };
            var replyComment = {
                "commentsContent":$("#commentsContent").val(),
                "commentsEmail":commentsEmail,
                "commentsNickname":commentsNickname,
                "commentsId":commentsId
            };

            if(type==1){
                url = "<%=basePath%>comment/comment_data";
                $.ajax({
                    type:'post',
                    url:url,
                    dataType:"json",
                    contentType:"application/json",
                    async: true,
                    data: JSON.stringify(comment),
                    success:function(data){
                        var obj = eval(data);
                        $(obj).each(function (index) {
                            var commentCode = '<div class="commentBox" id='+obj.commentsId+'>'+
                                '<div class="left-box-comment"><img src="<%=path%>/static/img/visitor.png" class="img"/></div>'+
                                '<div class="right-box-comment">'+
                                '<div>'+obj.commentsContent+'</div>'+
                                '<span class="bottomziti">  '+obj.commentsNickname+' &nbsp; '+currentDate+' &nbsp; '+
                                '<a href="javascript:void(0);" onclick="insert_comment(&quot;#&quot;+'+obj.commentsId+');">回复</a></span> </div>'+
                                '<input type="hidden" name="commentsId" value="'+obj.commentsId+'" id="'+obj.articleId+'"/>'+
                                '  <div class="clear"></div> </div>';
                            $("#index").after(commentCode);
                        });
                        $("#comment1").fadeOut("slow");
                    }
                });
            }else {
                url = "<%=basePath%>comment/reply_comment_data"
                $.ajax({
                    type:'post',
                    url:url,
                    dataType:"json",
                    contentType:"application/json",
                    async: true,
                    data: JSON.stringify(replyComment),
                    success:function(data){
                        var obj = eval(data);
                        $(obj).each(function (index) {
                            var location = obj.commentsId;
                            $("#comment2").fadeOut("slow");
                            $("#comment2").remove();
                            $("#"+location).after(insertReplyComment(obj));
                        });
                        $("#comment2").fadeOut("slow");
                    }
                });
            }
        }
        function insert_comment(location){
            $("#comment1").remove();
            $("#comment2").remove();
            $(location).append(code);
            if(commentsNickname!=""){
                $(".person-information").hide();
            }
            $("#comment2").fadeIn("slow");
            $("#commentForm2").validate();
            commentsId = $("#comment2").parent().attr('id');
        }
    </script>
</head>
<body>
<div class="bottomComment"><!--最大容器-->

    <div class="message">
        <br>
        <h4>给我留言</h4>
        <hr style="height:2px;border:none;border-top:2px dotted  #FFCCFF;" />

        <div id="comment1">
            <div class="comment-top">

                <img class="img" src="<%=path%>/static/img/visitor.png" />&nbsp;
                <span class="commentText">发表我的评论</span>
            </div><br>
            <form method="post" action="<%=basePath%>comment/data" id="commentForm">
                <fieldset>
                    <div class="wenbenyu">
                        <textarea rows='3' placeholder="欢迎评论..." name="commentsContent" id="commentsContent" minlength="5" required></textarea>
                        <br />
                        <input  class="button" type="submit" value="提交" />
                    </div>
                    <br>
                    <div class="person-information">
                        <span class="left-box">Hi，您需要填写昵称和邮箱！</span>
                        <div class="centerdiv"></div>
                        <div class="right-box">
                            <div>昵称 (必填) &nbsp; &nbsp;<input type="text" width="100%"  placeholder="昵称" name="commentsNickname" id="commentsNickname" minlength="3" required/> </div>
                            <br>
                            <input type="hidden" name="articleId" value=" ${articleDetails.articleId}" id="articleId"/>
                            <div>邮箱 (必填) &nbsp; &nbsp;<input type="email" width="100%" placeholder="邮箱" name="commentsEmail" id="commentsEmail" required/></div>
                        </div>
                    </div>
                </fieldset>
            </form>
            <br>
        </div>

        吐槽一下
        <hr id="index" style="height:2px;border:none;border-top:1px dotted  green;" />

        <c:forEach items="${leave_message_commentList}" var="comment" ><!--遍历文章评论-->
        <div class="commentBox" id=${comment.commentsId}>
            <div class="left-box-comment"><img src="<%=path%>/static/img/visitor.png" class="img"/></div>
            <div class="right-box-comment">
                <div>${comment.commentsContent}</div>
                <span class="bottomziti">  ${comment.commentsNickname} &nbsp; ${comment.commentsTime}  &nbsp; <a href="javascript:void(0);" onclick="insert_comment('#'+${comment.commentsId});">回复</a></span>
            </div>
            <input type="hidden" name="commentsId" value=" ${comment.commentsId}" id="articleId"/>
            <div class="clear"></div>
        </div>
        </c:forEach>
        <hr style="height:2px;border:none;border-top:1px dotted  white;" />
    </div>
    </div>


</body>
</html>

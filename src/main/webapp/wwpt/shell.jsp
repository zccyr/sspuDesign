<%@ page import="com.zcc.manager.usermanager.entity.UserInfoEntity" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    UserInfoEntity currentPerson =(UserInfoEntity) session.getAttribute("currentPerson");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>事件治理平台</title>
    <%@include file="./common/w_include_header.jsp"%>
    <script type="text/javascript" src="./common/w_common_method.js"></script>
    <style>
        .main iframe{
            display: block;
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            overflow-y:scroll;
        }
        .pop{
            position:fixed;
            left:0;
            right:0;
            top:0;
            bottom:0;
            z-index:999;
            background-image:url(../images/pop_bg.png);
        }
        .pop-box{
            position:absolute;
            left:50%;
            top:0;
            width:850px;
            margin-left:-425px;
            background-color:#fff;
            opacity:0;
            border:#9a9a9a 1px solid;
            -moz-box-shadow:0 0 10px #777;
            -webkit-box-shadow:0 0 10px #777;
            box-shadow:0 0 10px #777;
        }
        .pop-box iframe{
            display:block;
        }
        .pop-box div.move{
            position:absolute;
            left:0;
            top:0;
            z-index:99;
            width:100%;
            height:44px;
            background-color:transparent;
            cursor:move;
        }
        .pop-box div.move span.pop-close{
            position:absolute;
            right:15px;
            top:0;
            font-size:34px;
            text-align:center;
            line-height:44px;
            cursor:pointer;
        }
    </style>
    <script type="text/javascript">


        function goUrl(url) {
            openNewWindow(url,"main_frame");
        }

        $(function () {

            /*导航切换*/
            $(".header-nav a").click(function () {
                $(".header-nav a").removeClass("active");
                $(this).addClass("active");
            });
            /*下拉链接*/
            $(".dropdown-link").click(function () {
                if ($(this).children("ul").is(":hidden")) {
                    $(this).children("ul").fadeIn(100);
                } else {
                    //$(this).children("ul").fadeOut(100);
                }
            });
            $(".dropdown-link").mouseleave(function () {
                $(this).children("ul").fadeOut(100);
            });
            /*消息提醒下拉切换*/
            $('.dropdown-notice').click(function () {
                if ($(this).find(".notice-box").is(":hidden")) {
                    $(this).find(".notice-box").fadeIn(100);
                } else {
                    $(this).find(".notice-box").fadeOut(100);
                }
            });
            $(".dropdown-notice").mouseleave(function () {
                $(this).children(".notice-box").fadeOut(100);
            });
            /*header-hover*/
            $(".header-box").hover(function () {
                $(this).addClass("hover");
            }, function () {
                $(this).removeClass("hover");
            });

            // 输入框控件调用
            vVsub();
        });

        function logOut() {
            $.ajax({
                type: "get",
                url: "/login/userLogout",
                success: function () {
                    window.location.href = "/login"
                }
            });
        }

        function toManager() {
            top.location.href = '/systemManager/shell';
        }

    </script>

</head>
<body>
<input id="warningid" type="hidden">
<div class="header">
    <div class="logo">
        <a><img src="./images/logo.png"></a>
        <h5>事件治理平台</h5>
    </div>
    <div class="dropdown-link header-box">
        <h1><%=currentPerson.getUserName()%><span></span></h1>
        <ul>
            <%
                if (currentPerson.getType().equals("1")) {
            %>
            <li><a onclick="toManager()">后台管理</a></li>
            <%
                }
            %>
            <li><a onclick="logOut()">退出登录</a></li>
        </ul>
    </div>
    <ul class="header-nav">
        <li><a class="active" href="./event/eventList" target="main_frame">事件处理</a></li>
        <li><a href="./person/personList" target="main_frame">人员管理</a></li>
        <li><a href="./unit/unitList" target="main_frame">单位管理</a></li>
        <li><a href="./riskwarning/warningList" target="main_frame">风险洞察</a></li>
        <li><a href="./riskwarning/warningMap" target="main_frame">态势分析</a></li>

    </ul>
</div>

<div class="iframeBox">
    <iframe src="./event/eventList" id="main_frame" name="main_frame" frameborder="0" width="100%"
            height="100%" class="iframeMain"></iframe>
</div>

<div id="hiddenDiv" style="visibility:hidden;">
    <div class="pop inuse newDiv-3">
        <div class="pop-box">
            <div class="move"><span class="pop-close">&times;</span></div>
        </div>
    </div>
</div>
</body>
</html>
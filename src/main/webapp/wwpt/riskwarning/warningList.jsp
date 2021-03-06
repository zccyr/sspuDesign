<%@ taglib prefix="tag" uri="object_tag" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html class="html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <name></name>

    <%@include file="/wwpt/common/w_include_header.jsp"%>
    <script result="text/javascript" src="../common/w_common_method.js"></script>
    <script result="text/javascript" src="../js/warningUtil.js" ></script>

      <style result="text/css">
        .windowBtn{
            background-color: #2c9beb;
            border: solid 1px #2c9beb;
            color: #fff;
            margin-right: 8px;
            display: inline-block;
            width: 60px;
            height: 25px;
            border-radius: 4px;
        }
        .vV-slider.off:before{
            left: 21px;
        }
        .vV-slider.off{
            background-color: #999;
        }
        .vV-slider{
            display: inline-block;
            position: relative;
            width: 40px;
            height: 20px;
            background-color: #12ce66;
            border-radius: 20px;
            cursor: pointer;
            vertical-align: middle;
            -webkit-transition: all .5s;
            transition: all .5s;
        }
        .vV-slider:before{
            display: block;
            content: "";
            position: absolute;
            top: 1px;
            left: 1px;
            width: 18px;
            height: 18px;
            background-color: #fff;
            border-radius: 18px;
            -webkit-transition: all .5s;
            transition: all .5s;
        }
        .labelLine{
            height: 26px;
            text-align: right;
            width: 600px;
            /*white-space: nowrap;*/
            /* text-overflow: ellipsis; */
            overflow: hidden;
            word-break: break-all;
        }
        .zwsj{
            background: url('/wwpt/images/zwsj.png') no-repeat center;
        }
        .tabCon > div.tabConSon2{
            height: 180px;
            position: relative;
            overflow: hidden;
        }
    </style>
    <script result="text/javascript">
        $(function () {

            jeDate("#noticeDate", {
                theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
                format: "YYYY-MM-DD hh:mm:ss",
                zIndex: 3000,
            });
            tagfind();
            $(".tabConSon2").perfectScrollbar();
            // ?????????????????????
            vVsub();

            //???????????????
            $("body").click(function () {
                $(".fuzzyData").fadeOut();
            });

            //??????????????????
            $(".spanItem").hover(function () {
                $(this).css('background-color', '#dbf1fc');
            }, function () {
                $(this).css('background-color', 'white');
            });


            //?????????
            var labelArr = [];
            var labelAllH = 0;
            var labelTop = 0;
            $(".spanItem").on("click", function () {
                var textCon = $(this).text();
                if (labelArr.indexOf(textCon) != -1) {
                    return
                }
                labelArr.push(textCon);
                // ???????????????
                $(".fuzzyBox").css("display", "none");
                // $("#txt1").val(textCOn);
                $(".labelAll").prepend('<span>\n' +
                    '                <strong>' + textCon + '</strong>\n' +
                    '                <i class="labelClose">??</i>\n' +
                    '            </span>');
                clickHandle();
                eventList(true,1)
                $(".labelCloseBtn").click()
            });
            $(".tabCon .span").on("click", function () {
                var textHtml = $(this).html();
                if (labelArr.indexOf(textHtml) != -1) {
                    return
                }
                labelArr.push(textHtml);
                $(".fuzzyBox").css("display", "none");
                //???????????????
                $("#txt1").val("");
                $("#txt1").keyup();

                $(".labelAll").prepend('<span>\n' +
                    '                        <strong>' + textHtml + '</strong>\n' +
                    '                        <i class="labelClose">??</i>\n' +
                    '                    </span>');
                clickHandle();
                eventList(true,1)
                $(".labelCloseBtn").click()
            });
            // ????????????
            $('.labelAll').on("click", ".labelClose", function () {
                var removeStr = $(this).parent().find("strong").text();
                removeByValue(labelArr, removeStr);
                $(this).parent().remove();
                clickHandle();
                eventList(true,1)
                $(".labelCloseBtn").click()
            });

        })

    </script>
    <script result="text/javascript">
        var searchonOff = true;
        $(function(){
            // ?????????
            $(".y-selectbox-item").hover(function() {
                $(this).children(".y-selectbox-item-name").show(200);
            }, function() {
                $(this).children(".y-selectbox-item-name").hide(200);
            })
            /*????????????*/
            $(".header-nav a").click(function () {
                $(".header-nav a").removeClass("active");
                $(this).addClass("active");
            });
            /*????????????*/
            $(".dropdown-link").click(function () {
                if ($(this).children("ul").is(":hidden")) {
                    $(this).children("ul").fadeIn(100);
                } else {
                    $(this).children("ul").fadeOut(100);
                }
            });
            $(".dropdown-link").mouseleave(function () {
                $(this).children("ul").fadeOut(100);
            });
            /*????????????????????????*/
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


            // ?????????????????????
            vVsub();

            $("#date01").jeDate({
                isinitVal: false,
                festival: false,
                ishmsVal: false,
                minDate: '2016-06-16 23:59:59',
                maxDate: $.nowDate(0),
                format: "YYYY-MM-DD",
                zIndex: 3000,
            })
            $("#date02").jeDate({
                isinitVal: false,
                festival: false,
                ishmsVal: false,
                minDate: '2016-06-16 23:59:59',
                maxDate: $.nowDate(0),
                format: "YYYY-MM-DD",
                zIndex: 3000,
            })
            $("#date03").jeDate({
                isinitVal: false,
                festival: false,
                ishmsVal: false,
                minDate: '2016-06-16 23:59:59',
                maxDate: $.nowDate(0),
                format: "YYYY-MM-DD",
                zIndex: 3000,
            });

            // ????????????
            $(".statusList li").click(function(){
                $(this).addClass("active").siblings().removeClass("active");
            })
            var sortflag=true;
            var sortHtml = "";
            $(".sortMethod").click(function(){
                if (sortflag){
                    $(".sortText").slideDown();
                }else {
                    $(".sortText").slideUp();
                }
                sortflag=!sortflag;
            });
            $(".sortText p").click(function(){
                $(this).parent().slideUp();
                sortHtml = $(this).html();
                $(".sortMethod").html(sortHtml);
                $(".sortMethod").attr("id",$(this).attr("id"));
                eventList(true,1);
                sortflag=!sortflag;
            });


            // ????????????
            $(".kuang i.close").click(function () {
                $(".tanBox").fadeOut();
            })
            // ???????????????
            $(".titleCon").perfectScrollbar();
        })


        function update() {
            $.ajax({
                type: 'get',
                url: "/warnings/auto",
                success: function (result) {
                    if (result.message == 'success') {
                        eventList(true, 1, '');
                    }
                }
            })
        }
    </script>
</head>
<body>
<input id="warningid" type="hidden">


<div class="index-main">
    <div class="fx-left" style="right: 15px;">
        <div class="searchBox">
            <div class="bear-tit">
                <h5>????????????</h5>
            </div>
            <div class="searchWrap">
                <!-- ???????????? -->
                <div class="advanceBox">
                    <div class="searchInp">
                        <div class="inpBox">
                            <input id="keyWord" type="text" placeholder="????????????/??????????????????"
                                   onkeypress="if(event.keyCode==13){eventList(true,1,'')}">
                        </div>
                        <button class="btn1" onclick="eventList(true,1,'')">??????</button>
                        <button class="btn2" onclick="chongzhi()">??????</button>
                        <button class="btn2" onclick="update()">????????????</button>
                    </div>
                </div>
                <div class="labelSearch">
                    <div class="clearfix">
                        <span class="labelText v-fl">??????</span>
                        <div class="labelAdd v-fl">
                            <!-- ???????????? -->
                            <div class="labelAll">
                                <!-- input??? -->
                                <div class="fuzzyBox">
                                    <input class="vV-ipt w-200" id="txt1" result="text" value=""  placeholder="????????????????????????" autocomplete="off">

                                </div>
                                <!-- ?????? -->
                                <strong class="addBtn">+</strong>
                            </div>
                        </div>
                    </div>
                    <!-- ??????label -->
                    <div class="labelDown">
                        <i class="labelCloseBtn">??</i>
                        <tag:tag clazz="tabName" id="tag" style="" type="tagDiv"/>

                    </div>
                </div>
            </div>
        </div>
        <div class="searchReault">
            <div class="searchNum">
                    <span>
                        ???????????????????????????
                        <strong id="totle">0</strong>
                        ???
                    </span>

            </div>
            <div class="sortBox clearfix">
                <ul class="statusList v-fl" style="width: 400px" id="objectType">
                    <li onclick="eventList(true,1,'')" class="active">??????</li>
                    <li onclick="eventList(true,1,'event')">????????????</li>
                    <li onclick="eventList(true,1,'unit')">????????????</li>
                    <li onclick="eventList(true,1,'person')">????????????</li>
                </ul>
                <%--                <div class="sortList v-fr">--%>
                <%--                    <a href="javascript:;" class="sort sortMethod" id="">????????????</a>--%>
                <%--                    <div class="sortDown sortText">--%>
                <%--                        <p id="noticeLevel">???????????????</p>--%>
                <%--                        <p id="noticeDate">???????????????</p>--%>
                <%--                    </div>--%>
                <%--                </div>--%>
            </div>
            <div class="searchCon">
                <ul id="contentUl">

                </ul>
            </div>
            <div id="pagination" class="pagination"></div>
        </div>
    </div>
</div>


<div class="tanBox" id="addEvent" style="display: none">
    <div class="pubBlock kuang">
        <i class="close">??</i>
        <div class="bear-tit">
            <h5>????????????</h5>
        </div>
        <div class="titleCon" style="height: 330px;">
            <div class="baseTable">
                <table border="0" style="width: 700px;">
                    <div class="bear-tit bear-tit2 point">
                        <h5>????????????</h5>
                    </div>
                    <tr>
                        <td width="20%" class="center">????????????</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="noticeName" style="width: 200px;">
                        </td>

                        <td width="20%" class="center">????????????</td>
                        <td width="30%">
                            <input id="noticeDate" class="vV-ipt date w-246 Time" type="text" value=""
                                   placeholder="???????????????"
                                   readonly="readonly" required style="width: 200px;">
                        </td>
                    </tr>
                    <tr>
                        <td class="center">????????????</td>
                        <td colspan="3">
                            <textarea class="vV-area w-400 m8" style="width: 550px;" id="noticeContent"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">????????????</td>
                        <td width="30%">
                            <select class="vV-drop" id="noticeLevel" style="width: 200px;">
                                <option value="4" selected>??????</option>
                                <option value="3">?????????</option>
                                <option value="2">??????</option>
                                <option value="1">??????</option>
                            </select>
                        </td>
                        <td width="20%" class="center">??????????????????</td>
                        <td width="30%">
                            <select class="vV-drop" id="noticeObjectType" style="width: 200px;" disabled="true">
                                <option value="event" selected>????????????</option>
                                <option value="person">????????????</option>
                                <option value="unit">????????????</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="center">??????????????????</td>
                        <td colspan="3">
                            <textarea class="vV-area w-400 m8" style="width: 550px;height: 30px;"
                                      id="noticeObjectName" readonly></textarea>
                        </td>
                    </tr>
                </table>
                <table border="0" style="width: 700px;">
                    <tr id="update">
                        <td colspan="4" height="60" align="center">
                            <button class="alertBtn" onclick="save()">??????</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        f
    </div>
</div>
<!-- ????????? -->
<%--<div class="y-selectbox">
    <div onclick="topage('warningMap.jsp')" class="y-selectbox-item y-selectbox-item_sty2">
        <div class="y-selectbox-item-img2"></div>
        <div class="y-selectbox-item-name y-selectbox-item-name_pos2">????????????</div>
    </div>
    <div class="y-selectbox-item y-selectbox-item_sty3">
        <div class="y-selectbox-item-img3"></div>
        <div class="y-selectbox-item-name y-selectbox-item-name_pos3">????????????</div>
    </div>
</div>--%>
<script type="text/javascript">
    function topage(jsp) {
        location_href("/wwpt/riskwarning/"+jsp);
    }


    var num;
    var sethover;
    var noticeIds='';
    var labelArr = [];
    var labelAllH = 0;
    var labelTop = 0;
    var eventtag='';
    var onchangeFlag=true;
    $(function () {
        eventList(true, 1, '');

    });


    function eventList(flag, page, noticeObjectType) {

        $("#contentUl").html("")
        var data={};
        var tags = '';
        $(".labelAll span strong").each(function(){tags+=$(this).text()+','})
        if (tags){
            tags=tags.substring(0,tags.length-1);
            data.tagName=tags;
        }
        data.noticeName = $("#keyWord").val();
        data.noticeObjectType = noticeObjectType;
        data.tags = tags;
        data.page=page;
        data.pageSize = 5;


        $("#contentUl").mLoading("show");
        var starDate = new Date()
        var timerl=window.setTimeout(function () {
            $.ajax({
                type: "POST",
                url: "/warnings/find",
                dataType:"json",
                data:data,
                success:function (result) {
                    $("#totle").text(result.data.total);
                    if (flag) {
                        // ??????
                        var pageTotal;
                        if (result.data.total <= 5) {
                            pageTotal=1;
                        } else {
                            pageTotal = Math.ceil(result.data.total / 5);
                        }
                        $("#totle").text(result.data.totalElements)

                            new Page({
                                id: 'pagination',
                                pageTotal: pageTotal, //??????,?????????
                                pageAmount: 5,  //???????????????
                                dataTotal: result.data.total, //?????????????????????
                                curPage: 1, //????????????,???????????????1
                                pageSize: 5, //????????????,???????????????5
                                showPageTotalFlag: true, //????????????????????????,?????????????????????
                                showSkipInputFlag: true, //??????????????????,?????????????????????
                                getPage: function (page) {
                                    //??????????????????
                                    eventList(false, page, noticeObjectType);
                                }
                            });


                    }
                    loadContent(result.data.data);
                    // ????????????
                    var dropSort = true;
                    $(".searchCon ul li .sort").click(function(){
                        if(dropSort){
                            $(this).next().fadeIn();
                        }else{
                            $(this).next().fadeOut();
                        }
                        dropSort = !dropSort;
                    })
                    $(".sortDown2 p").click(function(){
                        $(this).parent().fadeOut();
                        dropSort = !dropSort;
                    })
                    $(".sortDown").mouseleave(function(){
                        $(this).fadeOut(200);
                        dropSort = !dropSort;
                    });
                    //slider
                    $(".vV-slider:not(.dis)").click(function(){
                        $(this).toggleClass("off");
                    });

                }
            })
            $("#contentUl").mLoading("hide");
            window.clearTimeout(timerl)
        },new Date()-starDate)

    }
    function  loadContent(data) {
        noticeIds='';
        if (data.length == 0) {
           var  str1="<img src=\"../images/noImage.png\" style=\"margin-left: 400px;\">";
            $("#contentUl").append(str1);
        }
        else{
        for (var i = 0;i<data.length;i++){
            if (i==data.length-1){
                noticeIds+=data[i].noticeId
            } else {
                noticeIds+=data[i].noticeId+",";
            }

            // getEvents(data[i].noticeId);

            var tagStr='';
            var leavestr='';
            var tags = JSON.parse(data[i].warningTags);
            if (tags){
                for (var t =0;t<tags.length;t++) {
                    tagStr += '<span name="' + tags[t].tagName + '" style="background: ' + tags[t].tagCssCode.color + '" class="green">' + tags[t].tagName + '</span>';
                }
            }
            var noticeContent='??????';
            if(data[i].noticeContent&&data[i].noticeContent!='null'){
                noticeContent=data[i].noticeContent;
            }
            var str = '<li>\n' +
                '                            <div class="pubBox waitPG">\n';
            if (data[i].noticeLevel == '4') {
                leavestr="??????";
                str+='                                <i style="background:url(../../images/icon-red.png) no-repeat;" class="icon">\n';
            } else if (data[i].noticeLevel == '3') {
                leavestr = "?????????";
                str += '                                <i style="background:url(../../images/icon-orange.png) no-repeat;" class="icon">\n';
            } else if (data[i].noticeLevel == '2') {
                leavestr = "??????";
                str += '                                <i style="background:url(../../images/icon-green.png) no-repeat;" class="icon">\n';
            }else {
                leavestr = "??????";
                str+='                                <i style="background:url(../../images/icon-green.png) no-repeat;" class="icon">\n';
            }

            str+='                                    <span>'+leavestr+'</span>\n' +
                '                                </i>\n' +
                // '                                            <p style="cursor: pointer" class="proName" onclick="todetail(\''+data[i].noticeId+'\')">'+data[i].noticeName+'</p>\n' +
                '                                            <p style="cursor: pointer" class="proName" onclick="todetail(\''+data[i].noticeId+'\',\''+data[i].noticeObjectType+'\',\''+data[i].noticeObjectId+'\')">'+data[i].noticeName+'</p>\n' +
                '                                <p style="overflow: hidden;white-space: nowrap;text-overflow: ellipsis;" name="'+noticeContent+'" class="proInfo">'+noticeContent+'</p>\n' +
                '                                <div class="infoBox">\n' +
                '                                    <div class="item" style="width: 175px">\n' +
                '                                        <i></i>\n' +
                '                                        <span>' + judgeNull(new Date(data[i].noticeDate).format("yyyy-MM-dd hh:mm:ss")) + '</span>\n' +
                '                                    </div>\n' +
                '                                    <div class="item">\n' +
                '                                        <i></i>\n' +
                '                                        <span style="cursor: pointer">???????????????' + judgeNull(data[i].noticeType) + '</span>\n' +
                '                                    </div>\n' +
                '                                    <div class="item">\n' +
                '                                        <i></i>\n' +
                '                                        <span style="cursor: pointer">???????????????' + judgeNull(data[i].noticeObjectName) + '</span>\n' +
                '                                    </div>\n' +
                '                                    <div style="position: absolute" class="item">\n';

            str+='                                    </div>\n' +
                '                                </div>\n' +
                '                                <div class="labelBox labelLine" style="height: 26px">\n' +tagStr+
                '                                </div>\n' +
                '                                <div class="btnGroup">\n' +
                '                                    <div class="sortList sortList2 v-fr">\n' +
                '                                        <a href="javascript:;" class="sort">??????</a>\n' +
                '                                        <div class="sortDown sortDown2">\n' +
                '                                            <p onclick="todetail(\''+data[i].noticeId+'\',\''+data[i].noticeObjectType+'\',\''+data[i].noticeObjectId+'\')">??????</p>\n' +
                '                                            <p onclick="updateEvent(\''+data[i].noticeId+'\')">??????</p>\n' +
                '                                            <p onclick="conFrimDel(\''+data[i].noticeId+'\')">??????</p>\n' +
                '                               </div>\n' +
                '                                    </div>\n' +
                '                                </div>\n' +
                '                            </div>\n' +
                '                        </li>';


            $("#contentUl").append(str);
        }
        }
    }

    function updateEvent(id) {
        $("#warningid").val(id);
        showMsg()
        $('.tanBox').show();
    }


    function showMsg() {
        var id = $("#warningid").val();
        $.ajax({
            type: "GET",
            url: "/warnings/" + id,
            dataType: "json",
            success:function (result) {
                if(result.message="success"){
                    var warning = result.data;
                    $("#warningid").val(warning.noticeId);
                    $("#noticeName").val(warning.noticeName);
                    $("#noticeDate").val(new Date(warning.noticeDate).format("yyyy-MM-dd hh:mm:ss"));
                    $("#noticeContent").val(warning.noticeContent);
                    $("#noticeLevel").val(warning.noticeLevel);
                    $("#noticeObjectType").val(warning.noticeObjectType);
                    $("#noticeObjectName").val(warning.noticeObjectName);
                }
            }
        })
    }

    function save() {
        var data = {};
        data.noticeId = $("#warningid").val();
        data.noticeName = $("#noticeName").val();
        data.noticeDate = parserDate($("#noticeDate").val());
        data.noticeContent = $("#noticeContent").val();
        data.noticeLevel = $("#noticeLevel").val();
        $.ajax({
            type: 'post',
            url: '/warnings/save',
            dataType: 'json',
            data: data,
            success:function (result) {
                if (result.message == 'success') {
                    $('.tanBox').hide();
                    successOperator();
                    eventList(true, 1, '');
                }
            }
        })
    }

    function successOperator() {
        $.messager.alert("????????????", "????????????!");
    }

    var parserDate = function (date) {
        var t = Date.parse(date);
        if (!isNaN(t)) {
            return new Date(Date.parse(date.replace(/-/g, "/")));
        } else {
            return new Date();
        }
    };
    function conFrimDel(noticeId){
        $.messager.confirm({
            width: 380,
            height: 160,
            name: '????????????',
            msg: '???????????????',
            ok: "???", cancel: "???",
            fn: function (r) {
                if (r){
                    $.ajax({
                        type: "post",
                        url: "/warnings/del",
                        data: {
                            noticeId: noticeId
                        },
                        dataType: "json",
                        success: function (result) {
                            successOperator();
                            eventList(true, 1, '');
                        }
                    });
                }
            }
        });

    }

    function chongzhi() {

        $(".drop a").removeClass("act");
        $("#noticeName").val("");
        $("#noticeContent").val("");
        $("#keyWord").val("");
        $(".labelAll .labelClose").click();

        $("#objectType").find("li").removeClass("active");
        $("#objectType").find("li").eq(0).addClass("active");
        eventList(true, 1, '');
    }

    function todetail(id,result,objectId) {
        openNewWindow('/wwpt/riskwarning/warningDetail?noticeId=' + id);
    }


    function clickHandle(){
        labelAllH = $(".labelAll").outerHeight(true);
        if(labelAllH == "76"){
            $(".searchWrap").css({"height":"200px"});
            $(".labelDown").css("top","84px");
        }else if(labelAllH == "114"){
            $(".searchWrap").css({"height":"240px"});
            $(".labelDown").css("top","124px");
        }else{
            $(".searchWrap").css({"height":"152px"});
            $(".labelDown").css("top","44px");
        }
    }
</script>
</body>
</html>
<%@ taglib prefix="tag" uri="object_tag" %>
<%@ taglib prefix="gov" uri="gov_unit" %>
<%@ taglib prefix="object" uri="object" %>
<%--
  Created by IntelliJ IDEA.
  User: zcc
  Date: 2019-11-02
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <name></name>
    <%@include file="../common/w_include_header.jsp" %>
    <link rel="stylesheet" href="../../css/icon.css"><!--easyui-->
    <link rel="stylesheet" href="../../css/newreset.css">
    <link rel="stylesheet" href="../../css/newstyle.css">
    <link rel="stylesheet" href="../../css/myselect.css">
    <script src="../../js/ajaxfileupload.js" result="text/javascript"></script>
    <script result="text/javascript" src="../common/w_common_method.js"></script>
    <script type="text/javascript" src="../../js/myselect.js"></script>
    <style result="text/css">
        .tabCon > div.tabConSon2 {
            height: 180px;
            position: relative;
            overflow: hidden;
        }

        .backG {
            background: url('../images/noImage.png') no-repeat bottom center;
        }

        .topCot {
            position: relative;
            top: 0px;
        }

        .close1 {
            display: block;
            width: 24px;
            height: 24px;
            line-height: 24px;
            background: #eaedf1;
            border-radius: 50%;
            font-size: 18px;
            color: #333;
            text-align: center;
            position: absolute;
            top: 18px;
            right: 20px;
            cursor: pointer;
            z-index: 10;
        }

        .pageStyle ul li {
            width: 36px;
            height: 26px;
            line-height: 26px;
            background: #eaedf1;
            border: 1px solid #eaedf1;
            text-align: center;
            border-radius: 4px;
            cursor: pointer;
            float: left;
            margin: 0 4px;
            transition: .3s linear;
        }

        input:-webkit-autofill, textarea:-webkit-autofill, select:-webkit-autofill {
            -webkit-box-shadow: 0 0 0px 1000px #ffffff inset
        }
    </style>
</head>
<body>
<div class="index-main">
    <div class="fx-left">
        <div class="searchBox">
            <div class="bear-tit">
                <h5>????????????</h5>
            </div>
            <div class="searchWrap">
                <div class="advanceBox">
                    <div class="searchInp">
                        <div class="inpBox" style="width: 474px">
                            <input type="text" placeholder="????????????/????????????/????????????/????????????" id="searchParam"
                                   onkeypress="if(event.keyCode==13){findEvent('',true,1)}">
                        </div>
                        <button class="btn1" onclick="findEvent('',true,1)">??????</button>
                        <button class="btn2" onclick="reset()">??????</button>
                    </div>
                </div>
                <div class="labelSearch" style="z-index: 1">
                    <div class="clearfix">
                        <span class="labelText v-fl">??????</span>
                        <div class="labelAdd v-fl">
                            <!-- ???????????? -->
                            <div class="labelAll">
                                <!-- input??? -->
                                <div class="fuzzyBox">
                                    <input class="vV-ipt w-200" id="txt1" result="text" value="" placeholder="????????????????????????"
                                           autocomplete="off">
                                    <div class="fuzzyData">
                                        <div id="allTags">
                                        </div>
                                    </div>
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
                        <strong id="totalEvent">0</strong>
                        ???
                    </span>
                <div class="btnGroup" style="width: 105px">
                    <a class="active" onclick="addShow()">??????</a>
                </div>
            </div>
            <div class="sortBox clearfix">
                <ul class="statusList v-fl" id="handleResolve">
                    <li class="active" onclick="findEvent('',true,1)">??????</li>
                    <li onclick="findEvent('1',true,1)">?????????</li>
                    <li onclick="findEvent('0',true,1)">?????????</li>
                </ul>
            </div>
            <div class="searchCon" style="position: relative">
                <div id="loading"
                     style="position: absolute;z-index:5;top: 50%;left: 50%;margin-top: -100px;margin-left: -100px;height: 500px">
                </div>
                <ul id="eventList">
                </ul>
            </div>
            <div id="pagination" class="pagination" style="margin-left: 100px"></div>
        </div>
    </div>

    <div class="fx-right">
        <div class="bear-block">
            <div class="bear-tit">
                <h5>????????????</h5>
            </div>
            <div class="assessBox">
                <div id="handleLoading"></div>
                <div class="item item1">
                    <i></i>
                    <p class="num" id="onStatus">0???</p>
                    <p class="name">?????????</p>
                </div>
                <div class="line"></div>
                <div class="item item2">
                    <i></i>
                    <p class="num" id="unStatus">0???</p>
                    <p class="name">?????????</p>
                </div>
            </div>
        </div>
        <div class="bear-block">
            <div class="bear-tit">
                <h5>???????????????<span id="dataTogetherCount">0</span>???</h5>
                <a href="dataTogether?Type=unit" target="_blank">??????>></a>
            </div>
            <div class="dataBox">
                <div id="dataBoxLoading"></div>
                <div class="dataList marquee1">
                    <div class="view" id="dataTogether">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="tanBox" id="warningInfo" style="display: none">
    <div class="pubBlock kuang">
        <i class="close">??</i>
        <div class="bear-tit">
            <h5>????????????</h5>
        </div>
        <div class="titleCon" style="height: 330px;">
            <div class="baseTable">
                <table border="0" style="width: 700px;">
                    <tr>
                        <td width="20%" class="center">????????????</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="noticeName" style="width: 200px;"
                                   autocomplete="no">
                        </td>
                        <td width="20%" class="center">????????????</td>
                        <td width="30%">
                            <select class="vV-drop" id="noticeLevel" style="width: 200px;">
                                <option value="4" selected>??????</option>
                                <option value="3">?????????</option>
                                <option value="2">??????</option>
                                <option value="1">??????</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="center">????????????</td>
                        <td colspan="3">
                            <textarea class="vV-area w-400 m8" style="width: 550px;height: 200px"
                                      id="noticeContent"></textarea>
                        </td>
                    </tr>
                </table>
                <table border="0" style="width: 700px;">
                    <tr>
                        <td colspan="4" height="60" align="center">
                            <button class="alertBtn" onclick="saveWarning()">??????</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="tanBox" id="addPoints" style="display: none;z-index: 1000000">
    <div class="pubBlock kuang">
        <i class="close">??</i>
        <div class="bear-tit">
            <h5>????????????</h5>
        </div>
        <div class="titleCon" style="height: 430px;">
            <iframe src="../event/map.jsp" id="main_frame" name="main_frame" frameborder="0" width="100%"
                    height="100%" class="iframeMain"></iframe>
        </div>
    </div>
</div>

<div class="tanBox" id="addEvent" style="display: none">
    <div class="pubBlock kuang">
        <i class="close">??</i>
        <div class="bear-tit">
            <h5 id="addEventTitle">????????????</h5>
            <h5 id="updateEventTitle">????????????</h5>
        </div>
        <div class="titleCon" id="unitDiv" style="height: 500px;">
            <div class="baseTable" style="height: 700px;">
                <table border="0" style="width: 700px;">
                    <div class="bear-tit bear-tit2 point">
                        <h5>????????????</h5>
                    </div>
                    <tr>
                        <td width="20%" class="center">????????????</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="unitName" style="width: 200px;">
                        </td>

                        <td width="20%" class="center">????????????</td>
                        <td width="30%">
                            <input id="registerTime" class="vV-ipt date w-246 Time" result="text" value=""
                                   placeholder="???????????????"
                                   readonly="readonly" required style="width: 200px;">
                        </td>
                    </tr>
                    <tr>
                        <td class="center">????????????</td>
                        <td colspan="3">
                            <textarea class="vV-area w-400 m8" style="width: 550px;" id="unitDetail"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="center">?????????????????????</td>
                        <td colspan="3">
                            <textarea class="vV-area w-400 m8" style="width: 550px;height: 30px;"
                                      id="usccCode"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">????????????</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="unitLegalPerson" style="width: 200px;">
                        </td>
                        <td width="20%" class="center">????????????</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="industry" style="width: 200px;">
                        </td>
                    </tr>

                    <tr>
                        <td width="20%" class="center">????????????</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="addr" style="width: 200px;">
                        </td>
                        <td width="20%" class="center">????????????</td>
                        <td width="30%">
                            <select class="vV-drop" id="status" style="width: 200px;">
                                <option value="1" selected>?????????</option>
                                <option value="0">?????????</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">??????????????????</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="longti" style="width: 200px;"
                                   autocomplete="off" placeholder="????????????????????????" ondblclick="choicePoint()">
                        </td>
                        <td width="20%" class="center">??????????????????</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="lati" style="width: 200px;"
                                   autocomplete="off" ondblclick="choicePoint()">
                        </td>
                    </tr>
                </table>
                <table border="0" style="width: 700px;">
                    <div class="bear-tit bear-tit2 point">
                        <h5>????????????</h5>
                    </div>

                    <tr>
                        <td class="center">????????????</td>
                        <td colspan="3">
                            <tag:tag clazz="vV-drop" style="width:550px;height:28px;" id="linkTag" type="tagSelect"/>
                        </td>
                    </tr>

                    <tr>
                        <td width="20%" class="center"></td>
                        <td width="30%">
                        </td>
                    </tr>
                    <tr id="add">
                        <td colspan="4" height="60" align="center">
                            <button class="alertBtn" onclick="save('add')">??????</button>
                        </td>
                    </tr>
                    <tr id="update">
                        <td colspan="4" height="60" align="center">
                            <button class="alertBtn" onclick="save('update')">??????</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>

<input type="hidden" id="addedTagNames">
<input type="hidden" id="toUpdateEventId">
<input type="hidden" id="toUpdateHandleLogId">
<input type="hidden" id="editEventHandLogFlag">
<input type="hidden" id="toUpdateWarningId">
<input type="hidden" id="toUpdateUnitId">
</body>

<script result="text/javascript">
    var eventDateTogetherCount = 0;
    var unittag;
    var tagsJson = [];

    var initpersontagflag = false;
    var initunittagflag = false;
    var initeventtagflag = false;
    //??????????????????
    var searchonOff = true;

    function initSelect() {
        if (initpersontagflag && initeventtagflag && initunittagflag) {

            // ????????????
            treeBox({
                el: '$(".focusEl")', //????????????DOM ??????
                width: { // ?????????????????? ?????? ????????????????????? 160???160???160???200
                    lv1: 80,
                    lv2: 100,
                    lv3: 160,
                    selected: 200
                },
                // selectedNum:3,// ???????????????????????????????????? ?????? ????????????3
                height: 260, //?????? ??????????????? 280

                selectedNum: 20,
                // data: jobs.info, //?????? ??????
                data: tagsJson,
                confirm: function (res) { //???????????? ?????? ??????json?????????????????????????????????
                    for (var k in res) {
                        $(".jobType").eq(k).val(res[k].value);
                        $(".jobType").eq(k).attr('name', 'jobType[' + res[k].uid + ']');
                    }
                }
            });
        }
    }

    function choicePoint() {
        $("#main_frame")[0].contentWindow.showPoint($("#longti").val(), $("#lati").val());
        $("#addPoints").show();
    }

    $(function () {
        //???????????????
        $("body").click(function () {
            $(".fuzzyData").fadeOut();
        });


        //?????????
        var labelArr = [];
        var labelAllH = 0;
        var labelTop = 0;


        //???????????????????????????????????????
        $(".tabCon .span").on("click", function () {
            var textHtml = $(this).html();
            if (labelArr.indexOf(textHtml) != -1) {
                return
            }
            var id = $(this).attr("id");
            labelArr.push(textHtml);
            $(".fuzzyBox").css("display", "none");
            //???????????????
            $("#txt1").val("");
            $("#txt1").keyup();

            $(".labelAll").prepend('<span>\n' +
                '                        <strong id="' + id + '">' + textHtml + '</strong>\n' +
                '                        <i class="labelClose">??</i>\n' +
                '                    </span>');
            $(".labelCloseBtn").trigger('click');
            findEvent("", true, 1);
            clickHandle();
        });

        // ????????????
        $('.labelAll').on("click", ".labelClose", function () {
            var removeStr = $(this).parent().find("strong").text();
            removeByValue(labelArr, removeStr);
            $(this).parent().remove();
            $(".labelCloseBtn").trigger('click');
            findEvent("", true, 1)
            clickHandle();
        });

        handleCount();
        findEvent("", true, 1);
        // initTags();
        // initObjectTag();
        dataTogether();
        tagfind();

        // ????????????
        $(".close").click(function () {
            $(".maskBox").fadeOut(200);
        });

        $(".tabConSon2").perfectScrollbar();

        $(".js-cancel").click(function () {
            $(this).parents(".mmodal").hide();
        });

        // ?????????????????????
        vVsub();

        $("#linkTag").fSelect();

        jeDate("#registerTime", {
            theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
            format: "YYYY-MM-DD hh:mm:ss",
            zIndex: 3000,
        });
        // ????????????
        $(".statusList li").click(function () {
            $(this).addClass("active").siblings().removeClass("active");
        });
        var sortHtml = "";
        var sortMOnOff = true;
        $(".sortMethod").click(function () {
            if (sortMOnOff) {
                $(this).next().slideDown();
            } else {
                $(this).next().slideUp();
            }
            sortMOnOff = !sortMOnOff;
        });
        $(".sortText p").click(function () {
            sortMOnOff = !sortMOnOff;
            $(this).parent().slideUp();
            sortHtml = $(this).html();
            $(".sortMethod").html(sortHtml);
        });


        // ????????????
        $(".kuang i.close").click(function () {
            $(this).parent().parent().fadeOut();
            // $(".tanBox").fadeOut();
        })
        $(".clearBtn").click(function () {
            $(this).prev().val("");
        })
        $("#unitDiv").perfectScrollbar();
        newAdduploadImg();

    })

        function newAdduploadImg() {
            var img = '';

            //????????????????????????????????????????????????????????????createObjectURL??????
            function getObjectURL(file) {
                var url = null;
                if (window.createObjectURL != undefined) {
                    url = window.createObjectURL(file); //basic
                } else if (window.URL != undefined) {
                    url = window.URL.createObjectURL(file);
                } else if (window.webkitURL != undefined) {
                    url = window.webkitURL.createObjectURL(file);
                }

                return url;
            }

            //?????????????????????????????????
            $(function () {
                $("#browerfile").change(function (e) {
                    var path = browerfile.value;
                    var objUrl = getObjectURL(this.files[0]);
                    if (objUrl) {
                        $('#QRCode').attr("src", objUrl);
                    }
                    var file = e.target.files[0];
                    var reader = new FileReader();
                    reader.readAsDataURL(file); // ?????? base64
                    reader.onloadend = function () {
                        // ????????? base64 ??????, ?????????????????? img ??? src ?????????
                        img = reader.result;
                        // ??????????????????

                    };
                })
            })
        }


        // ???????????????
    // $(".titleCon").perfectScrollbar();




    function footerChange() {
        // .index-main??????
        var indexMainH = $(".fx-left").outerHeight(true);
        $(".footerBox").css("top", indexMainH + 50);
    }


    //??????????????????
    function dataTogether() {
        $("#dataBoxLoading").mLoading("show");
        var beginDate = new Date();
        var timer1 = window.setTimeout(function () {
            $.ajax({
                type: "post",
                url: "/units/dataTogether/all",
                dataType: "json",
                data: {
                    page: 1,
                    pageSize: 5
                },
                success: function (result) {
                    let list = result.data.data;
                    let count = result.data.total;
                    $("#dataTogetherCount").text(count);
                    $("#dataTogether").empty();
                    if (count == 0) {
                        let str = '<li style="height: 200px" class="backG"></li>';
                        $("#dataTogether").append(str);
                    }
                    for (let i = 0; i < list.length; i++) {
                        var unit = list[i];
                        var eventName = unit.unitName;
                        if (eventName == null || eventName.trim().length == 0) {
                            eventName = '???';
                        }
                        var eventContent = unit.unitDetail;
                        if (eventContent == null || eventContent.trim().length == 0) {
                            eventContent = '???';
                        }
                        var eventSource = unit.status;
                        if (eventSource == null || eventSource.trim().length == 0) {
                            eventSource = '???';
                        } else {
                            eventSource = eventSource == 1 ? '?????????' : '?????????';
                        }
                        var occurredTime = new Date(unit.registerTime).format("yyyy-MM-dd hh:mm:ss");
                        if (unit.registerTime == null) {
                            occurredTime = '???';
                        }
                        $("#dataTogether").append('<dl>\n' +
                            '                              <dt>\n' +
                            '                              <span style="cursor: pointer; font-weight: bold;white-space: nowrap; text-overflow:ellipsis; overflow: hidden; " onclick="toDetail(\'' + "unit" + '\',\'' + unit.unitId + '\')">' + eventName + '</span>\n' +
                            '                              <i class="new"></i>\n' +
                            '                                </dt>\n' +
                            '                                <dd>\n' +
                            '                                <p class="con" style="white-space: nowrap; text-overflow:ellipsis; overflow: hidden;">' + eventContent + '' +
                            '                                </p>\n' +
                            '                            <div class="sourceInfo">\n' +
                            // '                                <span class="name">??????</span>\n' +
                            '                                <strong style="margin-left: 0px;">\n' +
                            '                                <b>????????????</b>\n' +
                            '                                <span>' + eventSource + '</span>\n' +
                            '                                </strong>\n' +
                            '                                <em>' + occurredTime + '</em>\n' +
                            '                            </div>\n' +
                            '                            </dd>\n' +
                            '                            </dl>');

                    }
                }
            })
            $("#dataBoxLoading").hide();
            window.clearTimeout(timer1);
        }, new Date() - beginDate + 200)
    }

    //??????????????????????????????
    function eventDataTogether(unitId) {
        $.ajax({
            type: "post",
            url: "/units/dataTogether",
            dataType: "json",
            async: false,
            data: {
                unitId: unitId,
                page: 1,
                pageSize: 1
            },
            success: function (result) {
                if (result.code == 'success') {
                    eventDateTogetherCount = result.data.total;
                }

            }
        })
    }

    //????????????
    function getTags(objectId) {
        $.ajax({
            type: "POST",
            url: "/tagBaseInfo/findByObjectId",
            dataType: "json",
            async: false,
            data: {
                objectId: objectId
            },
            success: function (result) {
                var str = '';
                if (result.code === "success") {
                    var tags = result.data;
                    var tagCount = 10;
                    if (tags.length >= tagCount) {
                        tags.length = tagCount;
                    }
                    for (var i = 0; i < tags.length; i++) {
                        str += '<span style="background: ' + JSON.parse(tags[i].tagCssCode).color + '" class="green">' + tags[i].tagName + '</span>';
                    }
                }
                unittag = str;

            }
        });
    }

    //????????????
    function findEvent(status, flag, page) {

        let tags = '';
        $(".labelAll span strong").each(function () {
            tags += "" + $(this).attr("id") + "" + ','
        });
        if (tags) {
            tags = tags.substring(0, tags.length - 1);
        }
        $("#loading").mLoading("show");
        $("#eventList").empty();
        var begingDate = new Date();
        var time1 = window.setTimeout(function () {
            var data = {};
            data.tags = tags;
            data.param = $("#searchParam").val();
            data.status = status;
            data.page = page;
            data.pageSize = 5;
            $.ajax({
                type: "post",
                url: "/units/param",
                dataType: "json",
                data: data,
                success: function (result) {
                    if (result.code === "success") {
                        var units = result.data.data;
                        $("#totalEvent").text("");
                        $("#totalEvent").text(result.data.total);
                        $("#eventList").empty();
                        $("#loading").css("height", "0");
                        if (flag) {
                            // ??????
                            var pageTotal;
                            if (result.data.total <= 5) {
                                pageTotal = 1;
                            } else {
                                pageTotal = Math.ceil(result.data.total / 5);
                            }
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
                                    findEvent(handleFlag, false, page);
                                }
                            });
                        }
                        if (units.length == 0) {
                            var strs = '<li class="backG topCot" style="height: 250px;">' +
                                '</li>';
                            $("#eventList").append(strs);
                        }
                        for (var i = 0; i < units.length; i++) {

                            var hanled = "?????????";
                            var iconImg = '';
                            if (units[i].status == "1") {
                                iconImg = '<i class="icon" style="background:url(../images/icon-green.png) no-repeat ">'
                                hanled = "?????????";
                            } else {
                                iconImg = '<i class="icon">';
                            }


                            eventDataTogether(units[i].unitId);
                            // if (!eventDateTogetherCount) {
                            //     eventDateTogetherCount = 0;
                            // }
                            getTags(units[i].unitId);
                            if (!unittag) {
                                unittag = ''
                            }

                            var registerTime = "???";
                            if (units[i].registerTime != null) {
                                registerTime = new Date(units[i].registerTime).format("yyyy-MM-dd  hh:mm:ss")
                            }
                            var str = ' <li>\n' +
                                '                        <div class="pubBox waitPG">\n' +
                                iconImg +
                                '                                <span>' + hanled + '</span>\n' +
                                '                            </i>\n' +
                                '                            <p class="proName"  onclick="baseInfo(\'' + units[i].unitId + '\',\'' + isValidStr(units[i].unitName) + '\')" style="cursor: pointer" >' + isValidStr(units[i].unitName) + '</p>\n' +
                                '                            <p class="proInfo" style=" white-space:nowrap;\n' +
                                '            text-overflow:ellipsis;\n' +
                                '            overflow: hidden;">' + isValidStr(units[i].unitDetail) + '</p>\n' +
                                '                            <div class="infoBox">\n' +
                                '                                <div class="item">\n' +
                                '                                    <i></i>\n' +
                                '                                    <span>' + registerTime + '</span>\n' +
                                '                                </div>\n' +
                                '                                <div class="item">\n' +
                                '                                    <i></i>\n' +
                                '                                    <span onclick="toEventDataTogether(\'' + units[i].unitId + '\',\'' + eventDateTogetherCount + '\')" style="cursor: pointer">???????????????' + eventDateTogetherCount + '???</span>\n' +
                                '                                </div>\n' +
                                // '                                <div class="item">\n' +
                                // '                                    <i></i>\n' +
                                // '                                    <a href="javascript:;">???????????????3???</a>\n' +
                                // '                                </div>\n' +
                                '                            </div>\n' +
                                '                            <div class="labelBox" id="eventLabels" style="height:24px;">\n' + unittag +
                                '                            </div>\n' +
                                '                            <div class="btnGroup">\n' +
                                '<a class="btnSty" onclick="showWarning(\'' + units[i].unitId + '\')">??????</a>' +
                                '                                <div class="sortList sortList2 v-fr">\n' +
                                '                                    <a href="javascript:;" class="sort">??????</a>\n' +
                                '                                    <div class="sortDown sortDown2">\n' +
                                '                                        <p onclick="baseInfo(\'' + units[i].unitId + '\')">??????</p>\n' +
                                '                                        <p onclick="showUpdate(\'' + units[i].unitId + '\')"> ??????</p>\n' +
                                '                                        <p onclick="showDel(\'' + units[i].unitId + '\')">??????</p>\n' +
                                '                                    </div>\n' +
                                '                                </div>\n' +
                                '                            </div>\n' +
                                '                        </div>\n' +
                                '                    </li>';
                            $("#eventList").append(str)
                        }
                        // ????????????
                        var dropSort = true;
                        $(".searchCon ul li .sort").click(function () {
                            if (dropSort) {
                                $(this).next().fadeIn();
                            } else {
                                $(this).next().fadeOut();
                            }
                            dropSort = !dropSort;
                        });
                        $(".sortDown").mouseleave(function () {
                            $(this).fadeOut(200);
                        });
                        // footerChange();
                    }
                }
            });
            $("#loading").mLoading("hide");
            window.clearTimeout(time1)
        }, new Date() - begingDate + 200)

    }

    function showWarning(unitId) {
        $("#noticeName").val('');
        $("#noticeContent").val('');
        $("#noticeLevel").val('4');
        $.ajax({
            type: 'post',
            url: '/warnings/find/type',
            data: {
                objectId: unitId,
                objectType: 'unit'
            }, success: function (result) {
                let warning = result.data;
                if (warning == null) {
                    $("#toUpdateWarningId").val('');
                    $.messager.alert("??????", "??????????????????");
                } else {
                    $("#toUpdateWarningId").val(warning.noticeId);
                    $("#noticeName").val(warning.noticeName);
                    $("#noticeContent").val(warning.noticeContent);
                    $("#noticeLevel").val(warning.noticeLevel);
                }
            }
        })
        $("#toUpdateUnitId").val(unitId);
        $("#warningInfo").show();
    }

    function saveWarning() {
        let data = {};
        data.noticeId = $("#toUpdateWarningId").val();
        data.noticeName = $("#noticeName").val();
        data.noticeContent = $("#noticeContent").val();
        data.noticeLevel = $("#noticeLevel").val();
        data.noticeObjectId = $("#toUpdateUnitId").val();
        data.noticeObjectType = 'unit';
        $.ajax({
            type: 'post',
            url: '/warnings/save',
            data: data,
            dataType: 'json',
            success: function (result) {
                if (result.code == 'success') {
                    successOperator();
                    $("#warningInfo").hide();
                }
            }
        });
    }

    function toEventDataTogether(eventId, eventDateTogetherCount) {
        if (eventDateTogetherCount == 0) {
            noDataTogether();
        } else {
            openNewWindow("dataTogether?Type=" + eventId + "");
        }
    }

    //????????????
    function baseInfo(unitId, eventName) {
        var url = encodeURI("unitDetail?unitId=" + unitId);
        openNewWindow(url, 'top');
    }


    function showDel(unitId) {
        $("#toUpdateEventId").val(unitId);
        $.messager.confirm({
            width: 380,
            height: 160,
            name: '????????????',
            msg: '???????????????',
            ok: "???", cancel: "???",
            fn: function (r) {

                if (r) {
                    var eventId = $("#toUpdateEventId").val();
                    $.ajax({
                        type: "POST",
                        url: "/units/del",
                        dataType: "json",
                        data: {
                            unitId: unitId
                        },
                        success: function (result) {
                            if (result.code == "success") {
                                $("#m1").hide();
                                findEvent("", true, 1);
                                handleCount();
                                dataTogether();
                                // $("#m2").show();
                                successOperator();
                            }
                        }
                    });
                }
            }
        });
    }

    function successOperator() {
        $.messager.alert("????????????", "????????????!");
    }

    function noDataTogether() {
        $.messager.alert("????????????", "???????????????!");
    }

    //????????????
    function addShow() {
        $("input").val("");
        $("#unitDetail").val("");
        $("#usccCode").val("");
        $("#update").hide();
        $("#addEventTitle").show();
        $("#updateEventTitle").hide();
        $("#add").show();
        $(".fs-options").find('div').removeClass("selected");
        $(".fs-options").find('div').removeClass("selected");
        $(".fs-label").eq(0).attr("title", "");
        $(".fs-label").eq(0).text("");
        $(".fs-label").eq(1).attr("title", "");
        $(".fs-label").eq(1).text("");
        $("#addEvent").show();
    }


    //????????????
    function handleCount() {
        $.ajax({
            type: "get",
            url: "/units/status",
            dataType: "json",
            success: function (result) {
                var onStatus = result.data.onStatus;
                var unStatus = result.data.unStatus;
                $("#onStatus").text(onStatus + "???");
                $("#unStatus").text(unStatus + "???")
            }
        })
    }


    var parserDate = function (date) {
        var t = Date.parse(date);
        if (!isNaN(t)) {
            return new Date(Date.parse(date.replace(/-/g, "/")));
        } else {
            return new Date();
        }
    };

    function sortEvent(sortField) {
        $("#sort").val(sortField);
        search(1, "", true);
    }


    function reset() {
        $("#searchParam").val("");
        $(".labelAll span strong").each(function () {

            $(this).parent().remove();
        });
        findEvent("", true, 1);
    }

    function showUpdate(unitId) {
        $("#toUpdateEventId").val(unitId);
        $("#add").hide();
        $("#addEventTitle").hide();
        $("#updateEventTitle").show();
        $("#update").show();

        $.ajax({
            type: "POST",
            url: "/tagObjectRelation/findTagByObjectId",
            dataType: "json",
            data: {
                objectId: unitId
            },
            success: function (result) {
                if (result.code === "success") {
                    let tags = result.data;
                    let names = '';
                    $(".fs-options").eq(0).find('div').removeClass("selected");
                    for (let i = 0; i < tags.length; i++) {
                        names += tags[i].tagName + ",";
                        $(".fs-options").eq(0).find('div[data-value=\"' + tags[i].tagId + '\"]').addClass("selected");
                    }
                    names = names.substr(0, names.length - 1);
                    $(".fs-label").eq(0).attr("title", names);
                    $(".fs-label").eq(0).text(names);

                }
            }
        });


        $.ajax({
            type: "GET",
            url: "/units/" + unitId,
            dataType: "json",
            success: function (result) {
                if (result.code === "success") {
                    let unit = result.data;
                    $("#toUpdateEventId").val(unit.unitId);
                    $("#unitName").val(isValidStr(unit.unitName));
                    $("#registerTime").val(new Date(unit.registerTime).format("yyyy-MM-dd hh:mm:ss"));
                    $("#unitDetail").val(isValidStr(unit.unitDetail));
                    $("#usccCode").val(isValidStr(unit.usccCode));
                    $("#unitLegalPerson").val(isValidStr(unit.unitLegalPerson));
                    $("#industry").val(isValidStr(unit.industry));
                    $("#addr").val(isValidStr(unit.addr));
                    $("#status").val(isValidStr(unit.status));
                    $("#longti").val(unit.longti);
                    $("#lati").val(unit.lati);
                    $("#addEvent").show();
                }
            }
        });

    }

    function save(flag) {
        let data = {};
        data.unitName = $("#unitName").val();
        data.registerTime = parserDate($("#registerTime").val());
        data.unitDetail = $("#unitDetail").val();
        data.usccCode = $("#usccCode").val();
        data.unitLegalPerson = $("#unitLegalPerson").val();
        data.industry = $("#industry").val();
        data.addr = $("#addr").val();
        data.status = $("#status").val();
        data.longti = $("#longti").val();
        data.lati = $("#lati").val();
        let tags = '';
        $(".fs-options").eq(0).find('div').each(function () {
            if ($(this).hasClass('selected')) {
                tags += $(this).context.dataset.value + ',';
            }
        });
        data.tags = safeToString(tags);
        if (flag === "add") {
            $.ajax({
                type: "POST",
                url: "/units/save",
                dataType: "json",
                data: data,
                success: function (result) {
                    if (result.code === "success") {
                        $("#addEvent").hide();
                        findEvent("", true, 1);
                        successOperator();
                        handleCount();
                        dataTogether();
                    }
                }
            });
        }
        if (flag == "update") {
            data.unitId = $("#toUpdateEventId").val();
            $.ajax({
                type: "POST",
                url: "/units/save",
                dataType: "json",
                data: data,
                success: function (result) {
                    if (result.code === "success") {
                        $("#addEvent").hide();
                        findEvent("", true, 1);
                        successOperator();
                        handleCount();
                        dataTogether();
                    }
                }
            });
        }
    }
</script>
</html>
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
    <link rel="stylesheet" href="../../css/ol.css">
    <script src="../../js/ajaxfileupload.js" result="text/javascript"></script>
    <script result="text/javascript" src="../common/w_common_method.js"></script>
    <script type="text/javascript" src="../../js/myselect.js"></script>
    <script type="text/javascript" src="../../js/ol.js"></script>
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
                <!-- ???????????? -->
                <div class="advanceBox">
                    <div class="searchInp">
                        <div class="inpBox">
                            <input result="text" placeholder="?????????/????????????" id="SearchNameOrPlace"
                                   onkeypress="if(event.keyCode==13){findEvent('',true,1)}">
                        </div>
                        <button class="btn1" onclick="findEvent('',true,1)">??????</button>
                        <button class="btn2" onclick="reset()">??????</button>
                        <a id="advancedSearch" class="advancedSearch" onclick="advanceSearch()">????????????</a>
                    </div>
                    <div class="advanceData">
                        <div>
                            <span>???????????????</span>
                            <select class="vV-drop" style="width:250px;height:28px;" id="SearchIsSettlement">
                                <option value="" selected>?????????</option>
                                <option value="1">?????????</option>
                                <option value="0">?????????</option>
                            </select>
                        </div>
                        <div>
                            <span class="span">???????????????</span>
                            <input id="searchOccurredTime" class="vV-ipt date w-246" result="text" style="width: 250px;"
                                   value=""
                                   placeholder="?????????" readonly="readonly">
                            <span class="span">???????????????</span>
                            <input id="SearchSettlementTime" class="vV-ipt date w-246" result="text"
                                   style="width: 250px;" value=""
                                   placeholder="?????????"
                                   readonly="readonly">
                        </div>
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
                <div class="sortList v-fr">
                    <a href="javascript:;" class="sort sortMethod">????????????</a>
                    <div class="sortDown sortText">
                        <p>??????</p>
                        <p>???????????????</p>
                        <p>???????????????</p>
                    </div>
                </div>
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
                    <p class="num" id="handling">0???</p>
                    <p class="name">?????????</p>
                </div>
                <div class="line"></div>
                <div class="item item2">
                    <i></i>
                    <p class="num" id="handled">0???</p>
                    <p class="name">?????????</p>
                </div>
            </div>
        </div>
        <div class="bear-block">
            <div class="bear-tit">
                <h5>???????????????<span id="dataTogetherCount">0</span>???</h5>
                <a href="dataTogether?Type=event" target="_blank">??????>></a>
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

<div class="tanBox" id="resolve" style="display: none">
    <div class="pubBlock kuang" style="width: 600px;">
        <i class="close" onclick="javascript:$('#operate').fadeOut();">??</i>
        <div class="bear-tit">
            <h5>????????????</h5>
        </div>
        <div style="height: 100px">
            <div class="baseTable">
                <table border="0">

                    <tr>
                        <div>
                            <td width="20%" class="center">????????????</td>
                            <td width="30%">
                                <input id="settlementTime" class="vV-ipt date w-246" result="text" value=""
                                       placeholder="???????????????" readonly="readonly">
                            </td>
                        </div>
                    </tr>
                    <tr>
                        <td colspan="4" height="60" align="center">
                            <button class="alertBtn" onclick="saveSettlement()">??????</button>
                        </td>
                    </tr>
                </table>
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

<div class="maskBox" id="eventHandle" style="display: none;position: fixed;z-index: 1000;">
    <div class="pubBlock kuang">
        <i class="close">??</i>
        <div class="bear-tit">
            <h5>??????????????????</h5>
        </div>
        <div class="lr-Box">
            <table border="0" class="lrTable mt-20" id="handleList">
            </table>
            <div class="clearfix pageBox">
                <div class="v-fl">
                    &nbsp;&nbsp;???&nbsp;<span class="totalHandle">0</span>&nbsp;?????????
                </div>
                <div id="paginationHandle" class=" v-fr pageStyle"></div>
            </div>

            <div class="baseTable">
                <table border="0">
                    <tr>
                        <td width="39%" class="center">????????????</td>
                        <td colspan="3">
                            <textarea class="vV-area w-400 m8" style="width: 680px;height: 50px;"
                                      id="handleContent"></textarea>
                        </td>
                    </tr>
                </table>
                <table border="0">
                    <tr>
                        <td width="20%" class="center">????????????</td>
                        <td width="30%">
                            <input id="handleDate" class="vV-ipt date w-246 Time" result="text" value=""
                                   placeholder="(?????????????????????)" readonly="readonly" style="width: 245px;">
                        </td>
                        <td class="center">????????????</td>
                        <td>
                            <div>
                                <input type="file" class="upload-btn" id="czPath" name="czPath">
                                <span type="text" class="file-input-trigger" onclick="selectFile($(this))">????????????</span>
                                <p class="file-name" id="handleFilepath"></p>
                            </div>
                        </td>
                    <tr>

                        <td width="20%" class="center">????????????</td>
                        <td width="30%">
                            <gov:gov id="handleUnit" clazz="vV-drop" style="width:245px;height:28px;"></gov:gov>
                        </td>
                    <td width="20%" class="center">?????????</td>
                    <td width="30%">
                        <input id="handleUser" class="vV-ipt" style="width:245px;height:28px;" readonly/>
                    </td>
                </tr>
                    <tr>
                        <td class="center">????????????</td>
                        <td id="handleIsflag">
                            <label class="vV-radio ck" name="handleIsflag">???</label>
                            <label class="vV-radio" name="handleIsflag">???</label>
                        </td>
                    </tr>
                    <br>

                    <tr>
                        <td colspan="4" height="60" align="center">
                            <button class="alertBtn" id="handleLogBut" onclick="saveEventHandle()">??????</button>
                        </td>
                    </tr>
                </table>

            </div>
        </div>
    </div>
</div>
<div class="tanBox" id="resUnit" style="display: none">
    <div class="pubBlock kuang" style="width: 600px;height: 210px">
        <i class="close">??</i>
        <div class="bear-tit">
            <h5>????????????</h5>
        </div>
        <div style="height: 110px;">
            <div class="baseTable">
                <table border="0">
                    <tr>
                        <td width="20%" class="center">????????????</td>
                        <td width="30%">
                            <gov:gov id="zbdw" clazz="vV-drop" style="width:250px;height:28px;"></gov:gov>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">????????????</td>
                        <td width="30%">
                            <gov:gov id="xbdw" clazz="vV-drop" style="width:250px;height:28px;"></gov:gov>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" height="60" align="center">
                            <button class="alertBtn" onclick="saveResUnit()">??????</button>
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
            <iframe src="./map.jsp" id="main_frame" name="main_frame" frameborder="0" width="100%"
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
        <div class="titleCon" id="eventDiv" style="height: 500px;">
            <div class="baseTable" style="height: 700px;">
                <table border="0" style="width: 700px;">
                    <div class="bear-tit bear-tit2 point">
                        <h5>????????????</h5>
                    </div>
                    <tr>
                        <td width="20%" class="center">????????????</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="eventName" style="width: 200px;">
                        </td>

                        <td width="20%" class="center">????????????</td>
                        <td width="30%">
                            <input id="occurredTime" class="vV-ipt date w-246 Time" result="text" value=""
                                   placeholder="???????????????"
                                   readonly="readonly" required style="width: 200px;">
                        </td>
                    </tr>
                    <tr>
                        <td class="center">????????????</td>
                        <td colspan="3">
                            <textarea class="vV-area w-400 m8" style="width: 550px;" id="eventContent"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">????????????</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="occurredPlace" style="width: 200px;">
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">??????????????????</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" autocomplete="off" id="occurredLongti"
                                   placeholder="????????????????????????" style="width: 200px;" ondblclick="choicePoint()">
                        </td>
                        <td width="20%" class="center">??????????????????</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" autocomplete="off" id="occurredLati"
                                   style="width: 200px;" ondblclick="choicePoint()">
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
                        <td class="center">????????????</td>
                        <td colspan="3">
                            <object:object type="person" clazz="vV-drop" style="width:550px;height:28px;"
                                           id="linkPersonNo"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="center">????????????</td>
                        <td colspan="3">
                            <object:object type="unit" clazz="vV-drop" style="width:550px;height:28px;"
                                           id="linkUnitNo"/>
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
<input type="hidden" id="toUpdateWarningId">
<input type="hidden" id="toUpdateHandleLogId">
<input type="hidden" id="editEventHandLogFlag">
</body>

<script type="text/javascript">
    var eventDateTogetherCount = 0;
    var unittag;
    var tagsJson = [];
    var map;
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
        $("#main_frame")[0].contentWindow.showPoint($("#occurredLongti").val(), $("#occurredLati").val());
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
            findEvent("", true, 1)
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

        $("#linkPersonNo").fSelect();
        $("#linkUnitNo").fSelect();
        $("#linkEventNo").fSelect();
        $("#linkTag").fSelect();
        jeDate("#searchOccurredTime", {
            theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
            format: "YYYY-MM-DD",
            multiPane: false,
            range: "???"
        });
        jeDate("#SearchSettlementTime", {
            theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
            format: "YYYY-MM-DD",
            multiPane: false,
            range: "???"
        });

        jeDate("#occurredTime", {
            theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
            format: "YYYY-MM-DD hh:mm:ss",
            zIndex: 3000,
        });
        jeDate("#handleDate", {
            theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
            format: "YYYY-MM-DD hh:mm:ss",
            zIndex: 3000,
        });

        jeDate("#settlementTime", {
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

        newAdduploadImg();
        // ???????????????
        // $(".titleCon").perfectScrollbar();
        $("#eventDiv").perfectScrollbar();


    });


    function footerChange() {
        // .index-main??????
        var indexMainH = $(".fx-left").outerHeight(true);
        $(".footerBox").css("top", indexMainH + 50);
    }

    function showWarning(eventId) {
        $("#noticeName").val('');
        $("#noticeContent").val('');
        $("#noticeLevel").val('4');
        $.ajax({
            type: 'post',
            url: '/warnings/find/type',
            data: {
                objectId: eventId,
                objectType: 'event'
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
        $("#toUpdateEventId").val(eventId);
        $("#warningInfo").show();
    }

    function saveWarning() {
        let data = {};
        data.noticeId = $("#toUpdateWarningId").val();
        data.noticeName = $("#noticeName").val();
        data.noticeContent = $("#noticeContent").val();
        data.noticeLevel = $("#noticeLevel").val();
        data.noticeObjectId = $("#toUpdateEventId").val();
        data.noticeObjectType = 'event';
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


    //??????????????????
    function dataTogether() {
        $("#dataBoxLoading").mLoading("show");
        var beginDate = new Date();
        var timer1 = window.setTimeout(function () {
            $.ajax({
                type: "post",
                url: "/eventInfo/findAllDataTogether",
                dataType: "json",
                data: {
                    page: 1,
                    pageSize: 5
                },
                success: function (result) {
                    let list = result.data.dataTogether;
                    let count = result.data.count;
                    $("#dataTogetherCount").text(count);
                    $("#dataTogether").empty();
                    if (count == 0) {
                        let str = '<li style="height: 200px" class="backG"></li>';
                        $("#dataTogether").append(str);
                    }
                    for (let i = 0; i < list.length; i++) {
                        var event = list[i];
                        var eventName = event.eventName;
                        if (eventName == null || eventName.trim().length == 0) {
                            eventName = '???';
                        }
                        var eventContent = event.eventContent;
                        if (eventContent == null || eventContent.trim().length == 0) {
                            eventContent = '???';
                        }
                        var isSettlement = event.isSettlement;
                        if (isSettlement == null || isSettlement.trim().length == 0 || isSettlement == "0") {
                            isSettlement = '???';
                        } else {
                            isSettlement = '???'
                        }
                        var occurredTime = new Date(event.occurredTime).format("yyyy-MM-dd hh:mm:ss");
                        if (event.occurredTime == null) {
                            occurredTime = '???';
                        }
                        $("#dataTogether").append('<dl>\n' +
                            '                              <dt>\n' +
                            '                              <span style="cursor:pointer; font-weight: bold;white-space: nowrap; text-overflow:ellipsis; overflow: hidden; " onclick="toDetail(\'' + "event" + '\',\'' + event.eventId + '\')">' + eventName + '</span>\n' +
                            '                              <i class="new"></i>\n' +
                            '                                </dt>\n' +
                            '                                <dd>\n' +
                            '                                <p class="con" style="white-space: nowrap; text-overflow:ellipsis; overflow: hidden;">' + eventContent + '' +
                            '                                </p>\n' +
                            '                            <div class="sourceInfo">\n' +
                            // '                                <span class="name">??????</span>\n' +
                            '                                <strong style="margin-left: 0px;">\n' +
                            '                                <b>????????????</b>\n' +
                            '                                <span>' + isSettlement + '</span>\n' +
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
    function eventDataTogether(eventId) {
        $.ajax({
            type: "post",
            url: "/eventInfo/findDataTogether",
            dataType: "json",
            async: false,
            data: {
                eventId: eventId,
                page: 1,
                pageSize: 1
            },
            success: function (result) {
                if (result.code == 'success') {
                    eventDateTogetherCount = result.data.count;
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
    function findEvent(handleFlag, flag, page) {

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
            data.nameOrPlace = $("#SearchNameOrPlace").val();
            data.isSettlement = $("#SearchIsSettlement").val();
            data.occurredTime = $("#searchOccurredTime").val();
            data.settlementTime = $("#SearchSettlementTime").val();
            data.isHandle = handleFlag;
            data.page = page;
            data.pageSize = 5;
            $.ajax({
                type: "post",
                url: "/eventInfo/findByParam",
                dataType: "json",
                data: data,
                success: function (result) {
                    if (result.code === "success") {
                        var events = result.data.events;
                        //????????????????????????????????????????????????
                        // $("#eventInfo").val(JSON.stringify(rows))
                        $("#totalEvent").text("");
                        $("#totalEvent").text(result.data.count);
                        $("#eventList").empty();

                        $("#loading").css("height", "0");
                        if (flag) {
                            // ??????
                            var pageTotal;
                            if (result.data.count <= 5) {
                                pageTotal = 1;
                            } else {
                                pageTotal = Math.ceil(result.data.count / 5);
                            }
                            new Page({
                                id: 'pagination',
                                pageTotal: pageTotal, //??????,?????????
                                pageAmount: 5,  //???????????????
                                dataTotal: result.data.count, //?????????????????????
                                curPage: 1, //????????????,???????????????1
                                pageSize: 5, //????????????,???????????????5
                                showPageTotalFlag: true, //????????????????????????,?????????????????????
                                showSkipInputFlag: true, //??????????????????,?????????????????????
                                getPage: function (page) {

                                    findEvent(handleFlag, false, page);
                                }
                            });
                        }
                        if (events.length == 0) {
                            var strs = '<li class="backG topCot" style="height: 250px;">' +
                                '</li>';
                            $("#eventList").append(strs);
                        }
                        for (var i = 0; i < events.length; i++) {

                            var hanled = "?????????";
                            var iconImg = '';
                            if (events[i].isHandle == "1") {
                                iconImg = '<i class="icon" style="background:url(../images/icon-green.png) no-repeat ">'
                                hanled = "?????????";
                            } else {
                                iconImg = '<i class="icon">';
                            }


                            eventDataTogether(events[i].eventId);
                            // if (!eventDateTogetherCount) {
                            //     eventDateTogetherCount = 0;
                            // }
                            getTags(events[i].eventId);
                            if (!unittag) {
                                unittag = ''
                            }

                            var occurredTime = "???";
                            if (events[i].occurredTime != null) {
                                occurredTime = new Date(events[i].occurredTime).format("yyyy-MM-dd  hh:mm:ss")
                            }
                            var str = ' <li>\n' +
                                '                        <div class="pubBox waitPG">\n' +
                                iconImg +
                                '                                <span>' + hanled + '</span>\n' +
                                '                            </i>\n' +
                                '                            <p class="proName"  onclick="baseInfo(\'' + events[i].eventId + '\',\'' + isValidStr(events[i].eventName) + '\')" style="cursor: pointer" >' + isValidStr(events[i].eventName) + '</p>\n' +
                                '                            <p class="proInfo" style=" white-space:nowrap;\n' +
                                '            text-overflow:ellipsis;\n' +
                                '            overflow: hidden;">' + isValidStr(events[i].eventContent) + '</p>\n' +
                                '                            <div class="infoBox">\n' +
                                '                                <div class="item" name="????????????">\n' +
                                '                                    <i></i>\n' +
                                '                                    <span>' + occurredTime + '</span>\n' +
                                '                                </div>\n' +
                                '                                <div class="item">\n' +
                                '                                    <i></i>\n' +
                                '                                    <span onclick="toEventDataTogether(\'' + events[i].eventId + '\',\'' + eventDateTogetherCount + '\')" style="cursor: pointer">???????????????' + eventDateTogetherCount + '???</span>\n' +
                                '                                </div>\n' +
                                // '                                <div class="item">\n' +
                                // '                                    <i></i>\n' +
                                // '                                    <a href="javascript:;">???????????????3???</a>\n' +
                                // '                                </div>\n' +
                                '                            </div>\n' +
                                '                            <div class="labelBox" id="eventLabels" style="height:24px;">\n' + unittag +
                                '                            </div>\n' +
                                '                            <div class="btnGroup">\n' +
                                '<a class="btnSty" onclick="showWarning(\'' + events[i].eventId + '\')">??????</a>' +
                                '                                <div class="sortList sortList2 v-fr">\n' +
                                '                                    <a href="javascript:;" class="sort">??????</a>\n' +
                                '                                    <div class="sortDown sortDown2">\n' +
                                '                                        <p onclick="baseInfo(\'' + events[i].eventId + '\')">??????</p>\n' +
                                '                                        <p onclick="showUpdate(\'' + events[i].eventId + '\')"> ??????</p>\n' +
                                '                                        <p onclick="showDel(\'' + events[i].eventId + '\')">??????</p>\n' +
                                '                                        <p onclick="resUnitShow(\'' + events[i].eventId + '\')">????????????</p>\n' +
                                '                                        <p onclick="showEventHandle(\'' + events[i].eventId + '\',\'handlelog\')">????????????</p>\n' +
                                '                                        <p onclick="showResolve(\'' + events[i].eventId + '\')">????????????</p>\n' +
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


    //??????????????????
    function resUnitShow(eventId) {
        $("#toUpdateEventId").val(eventId);
        $.ajax({
            type: 'get',
            url: '/eventInfo/findResponsibilityUnit',
            data: {
                eventId: eventId
            },
            dataType: 'json',
            success: function (result) {
                let zbid = result.data.zb == null ? "" : result.data.zb.id;
                let xbid = result.data.zb == null ? "" : result.data.xb.id;
                $("#zbdw").val(zbid);
                $("#xbdw").val(xbid);
            }
        })
        $("#resUnit").show();
    }

    function toEventDataTogether(eventId, eventDateTogetherCount) {
        if (eventDateTogetherCount == 0) {
            noDataTogether();
        } else {
            openNewWindow("dataTogether?Type=" + eventId + "");
        }
    }

    function saveResUnit() {
        var data = [];
        let zbdw = {};
        zbdw.eventId = $("#toUpdateEventId").val();
        zbdw.govUnitId = $("#zbdw").val();
        zbdw.type = '1';
        data.push(zbdw);
        let xbdw = {};
        xbdw.eventId = $("#toUpdateEventId").val();
        xbdw.govUnitId = $("#xbdw").val();
        xbdw.type = '0';
        data.push(xbdw);
        $.ajax({
            type: "POST",
            url: "/eventInfo/addResponsibilityUnit",
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(data),
            dataType: "json",
            success: function (result) {
                $("#resUnit").hide();
                successOperator();
            }

        })
    }

    //????????????
    function baseInfo(eventId, eventName) {
        var url = encodeURI("eventDetail?eventId=" + eventId);
        openNewWindow(url, 'top');
    }

    //????????????
    function savetagNames(tagnames) {
        $("#eventTagNames").val("")
        var tags = [];
        for (var i = 0; i < tagnames.length; i++) {
            var tagname = tagnames[i].tagName;
            tags.push(tagname);
        }
        $("#eventTagNames").val(tags)
    }

    function showDel(eventId) {
        $("#toUpdateEventId").val(eventId)
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
                        url: "/eventInfo/del",
                        dataType: "json",
                        data: {
                            eventId: eventId
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

    // ????????????
    function advanceSearch() {
        if (searchonOff) {
            $("#advancedSearch").html("????????????");
            $("#advancedSearch").addClass("active");
            $(".advanceBox").addClass("active");
            $(".advanceBox").animate({"height": "178px"}, 100);
        } else {
            $("#advancedSearch").html("????????????");
            $("#advancedSearch").removeClass("active");
            $(".advanceBox").removeClass("active");
            $(".advanceBox").animate({"height": "70px"}, 100);
        }
        searchonOff = !searchonOff;
    }

    //????????????
    function addShow() {
        $("input").val("");
        $("#eventContent").val("");
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
        $(".fs-label").eq(2).attr("title", "");
        $(".fs-label").eq(2).text("");
        $("#addEvent").show();
    }


    //???????????????????????????
    function handleCount() {
        $.ajax({
            result: "POST",
            url: "/eventInfo/handleCount",
            dataType: "json",
            success: function (result) {
                var handled = result.data.handled;
                var handling = result.data.handling;
                $("#handled").text(handled + "???")
                $("#handling").text(handling + "???")
            }
        })
    }

    //?????????????????????
    function initTags() {
        $.ajax({
            result: "POST",
            url: "/TagBaseInfoManager/findAllTag",
            dataType: "json",
            // async: false,//??????????????????
            data: {
                field: "tagName",
                method: "asc"
            },
            success: function (result) {
                if (result.message == "success") {
                    var tags = result.allTag;
                    $("#allTags").empty();
                    for (var i = 0; i < tags.length; i++) {
                        $("#allTags").append('<span class="spanItem">' + tags[i].tagName + '</span>');
                        $("#allTags2").append('<span class="spanItem">' + tags[i].tagName + '</span>');
                        $("#addEventTags").append('<option>' + tags[i].tagName + '</option>');
                    }
                }
            }
        });
    }

    function initObjectTag() {
        initUnitTags();
        initPersonTags();
        initEventTags();
    }


    //?????????????????????
    function initPersonTags() {
        $.ajax({
            result: "POST",
            url: "/tagBaseInfo/findTagByParam",
            dataType: "json",
            data: {
                tagLabelType: "person",
            },
            success: function (result) {
                if (result.message != "error") {
                    var persons = {"level": 1, "name": "???", "id": uuid(), "uid": uuid(), "pid": uuid()};
                    var personClasses = [];
                    var tagList = result.list;
                    // $("#personTags").empty();
                    for (var i = 0; i < tagList.length; i++) {
                        var tag = tagList[i];//????????????list
                        var classes = {
                            "level": 2,
                            "name": tag[0].tagClassesFirstName,
                            "id": uuid(),
                            "uid": uuid(),
                            "pid": uuid()
                        };
                        var tags = [];
                        for (var j = 0; j < tag.length; j++) {
                            var tagName = tag[j].tagName;
                            $("#" + tag[0].tagClassesFirst + "").append('<span class="span">' + tagName + '</span>\n');
                            var persontag = {"level": 3, "name": tagName, "id": uuid(), "uid": uuid(), "pid": uuid()};
                            tags.push(persontag);

                        }
                        classes.children = tags;
                        personClasses.push(classes);
                    }
                    persons.children = personClasses;
                    tagsJson.push(persons);
                    initpersontagflag = true;
                    initSelect();
                }
            }
        });
    }

    //?????????????????????
    function initUnitTags() {
        $.ajax({
            result: "POST",
            url: "/tagBaseInfo/findTagByParam",
            dataType: "json",
            data: {
                tagLabelType: "unit"
            },
            success: function (result) {
                if (result.message != "error") {
                    var units = {"level": 1, "name": "??????", "id": uuid(), "uid": uuid(), "pid": uuid()};
                    var unitClasses = [];
                    var tagList = result.list;
                    // $("#unitTags").empty();
                    for (var i = 0; i < tagList.length; i++) {
                        var tag = tagList[i];//????????????list
                        var classes = {
                            "level": 2,
                            "name": tag[0].tagClassesFirstName,
                            "id": uuid(),
                            "uid": uuid(),
                            "pid": uuid()
                        };
                        var tags = [];
                        for (var j = 0; j < tag.length; j++) {
                            var tagName = tag[j].tagName;
                            $("#" + tag[0].tagClassesFirst + "").append('<span class="span">' + tagName + '</span>\n');
                            var unittag = {"level": 3, "name": tagName, "id": uuid(), "uid": uuid(), "pid": uuid()};
                            tags.push(unittag);
                        }
                        classes.children = tags;
                        unitClasses.push(classes);
                    }
                    units.children = unitClasses;
                    tagsJson.push(units);
                    initunittagflag = true;
                    initSelect();
                }
            }
        });
    }

    //?????????????????????
    function initEventTags() {
        $.ajax({
            result: "POST",
            url: "/tagBaseInfo/findTagByParam",
            dataType: "json",
            data: {
                tagLabelType: "event",
            },
            success: function (result) {
                if (result.message != "error") {
                    var events = {"level": 1, "name": "??????", "id": uuid(), "uid": uuid(), "pid": uuid()};
                    var eventClasses = [];
                    var tagList = result.list;
                    // $("#eventTags").empty();
                    for (var i = 0; i < tagList.length; i++) {

                        var tag = tagList[i];//????????????list
                        var classes = {
                            "level": 2,
                            "name": tag[0].tagClassesFirstName,
                            "id": uuid(),
                            "uid": uuid(),
                            "pid": uuid()
                        };
                        var tags = [];
                        for (var j = 0; j < tag.length; j++) {
                            var tagName = tag[j].tagName;
                            $("#" + tag[0].tagClassesFirst + "").append('<span class="span">' + tagName + '</span>\n');
                            var eventtag = {"level": 3, "name": tagName, "id": uuid(), "uid": uuid(), "pid": uuid()};
                            tags.push(eventtag);
                        }
                        classes.children = tags;
                        eventClasses.push(classes);
                    }
                    events.children = eventClasses;
                    tagsJson.push(events);
                    initeventtagflag = true;
                    initSelect();
                }
            }
        })
    }


    //??????????????????
    function showEventHandle(eventId) {
        $("#editEventHandLogFlag").val("0");
        reShowHandleLog(eventId, 1, true);
        $("#toUpdateEventId").val(eventId)
        $("#handleContent").val("");
        $("#czPath").val("");
        $("#handleFilepath").text("");
        $("#handleDate").val("");
        $("#handleUser").val("");
        $("#handleFilepath").val("");
        $("#handleCuser").val("");
        $("#handleCjdid").val("");
        $("#handleJfrs").val("");
        $("#eventHandle").show();

    }

    //??????????????????
    function saveEventHandle() {

        var eventId = $("#toUpdateEventId").val();
        var data = {};
        var editFlag = $("#editEventHandLogFlag").val();
        if (editFlag == "1") {
            data.handleLogId = $("#toUpdateHandleLogId").val();
        }
        data.handleEventId = eventId;
        data.handleContent = $("#handleContent").val();
        data.handleDate = parserDate($("#handleDate").val());

        var handlePass = "";
        if ($("#handleIsflag").find("label:eq(0)").hasClass("vV-radio ck")) {
            handlePass = "1";
        }
        if ($("#handleIsflag").find("label:eq(1)").hasClass("vV-radio ck")) {
            handlePass = "0";
        }
        data.handlePass = handlePass;
        data.handleUnit = $("#handleUnit option:selected").text();
        data.handleUser = $("#handleUser").val();
        $.ajax({
            type: "POST",
            url: "/eventInfo/saveEventHandleLog",
            dataType: "json",
            data: data,
            success: function (result) {
                if (result.message != "error") {
                    $("#eventHandle").hide();
                    uploadFile(result.data);
                    reset();
                    handleCount();
                    // $("#m2").show();
                    successOperator();
                }
            }
        });
    }

    function uploadFile(handleLogId) {
        var fileEleId = "czPath";
        var attrName = "czPath";
        //???????????????????????????
        $.ajaxFileUpload({
            result: "POST",
            url: "/eventInfo/uploadFile",
            fileElementId: fileEleId,
            dataType: "json",
            data: {
                attrName: attrName,
                handleLogLd: handleLogId
            },
        });
    }

    var parserDate = function (date) {
        var t = Date.parse(date);
        if (!isNaN(t)) {
            return new Date(Date.parse(date.replace(/-/g, "/")));
        } else {
            return new Date();
        }
    };

    //??????????????????
    function showResolve(eventId) {
        $("#toUpdateEventId").val(eventId)
        $("#settlementTime").val("");
        $("#resolve").show();
    }

    //??????????????????
    function saveSettlement() {
        $.ajax({
            type: "POST",
            url: "/eventInfo/settlement",
            dataType: 'json',
            data: {
                eventId: $("#toUpdateEventId").val(),
                settlementTime: parserDate($("#settlementTime").val()),
            },
            success: function (result) {
                if (result.code == 'success') {
                    $("#resolve").hide();
                    successOperator();
                    reset();
                    dataTogether();
                }
            }

        })
    }


    function sortEvent(sortField) {
        $("#sort").val(sortField);
        search(1, "", true);
    }

    function selectFile(thisdom) {
        thisdom.prev().trigger('click')
        thisdom.prev().on('change', function (event) {
            var fileName = event.target.files[0].name
            thisdom.next().text(fileName)
        })
    }


    function reset() {
        $("#SearchNameOrPlace").val("");
        $("#searchOccurredTime").val("");
        $("#SearchIsSettlement").val("");
        $("#SearchSettlementTime").val("");
        $(".labelAll span strong").each(function () {
            // var removeStr = $(this).text();
            $(this).parent().remove();
        });
        $("#handleResolve").find("li").removeClass("active");
        $("#handleResolve").find("li").eq(0).addClass("active");
        findEvent("", true, 1);

    }

    function reShowHandleLog(eventId, page, pageFlag) {
        $("#toUpdateEventId").val(eventId);
        let data = {};
        data.eventId = eventId;
        data.page = page;
        data.pageSize = 3;
        $.ajax({
            type: "get",
            url: "/eventInfo/findEventHandleLog",
            dataType: "json",
            data: data,
            success: function (result) {
                var total = result.data.all.length;
                $(".totalHandle").text(total)
                var rows = result.data.data;

                var pageTotal;
                if (total <= 3) {
                    pageTotal = 1;
                } else {
                    pageTotal = Math.ceil(total / 3);
                }

                if (pageFlag) {
                    new Page({
                        id: 'paginationHandle',
                        pageTotal: pageTotal, //??????,?????????
                        pageAmount: 3,  //???????????????
                        dataTotal: total, //?????????????????????
                        curPage: 1, //????????????,???????????????1
                        pageSize: 3, //????????????,???????????????5
                        getPage: function (page) {
                            reShowHandleLog(eventId, page, false);
                        }
                    });
                }
                $("#handleList").empty();
                $("#handleList").append('<tr>\n' +
                    '                    <th width="15%">????????????</th>\n' +
                    '                    <th width="30%">????????????</th>\n' +
                    '                    <th width="20%">????????????</th>\n' +
                    '                    <th width="20%">????????????</th>\n' +
                    '                    <th width="15%">??????</th>\n' +
                    '                </tr>')
                for (var i = 0; i < rows.length; i++) {
                    var handleDate = new Date(rows[i].handleDate).format("yyyy-MM-dd");
                    if (rows[i].handleDate == null) {
                        handleDate = "???"
                    }
                    var handleContent = rows[i].handleContent;
                    if (handleContent == null || handleContent.trim().length == 0) {
                        handleContent = "???"
                    }
                    if (handleContent.length >= 20) {
                        handleContent = handleContent.substr(0, 20) + '...';
                    }
                    var handleUnit = rows[i].handleUnit;
                    if (handleUnit == null || handleUnit.trim().length == 0) {
                        handleUnit = "???"
                    }
                    var handlePass = rows[i].handlePass;
                    if (handlePass == null || handlePass.trim().length == 0) {
                        handlePass = "??????"
                    } else {
                        handlePass = handlePass == "1" ? "???" : "???";
                    }

                    $("#handleList").append(' <tr>\n' +
                        '                    <td>' + handleDate + '</td>\n' +
                        '                    <td>' + handleContent + '</td>\n' +
                        '                    <td>' + handleUnit + '</td>\n' +
                        '                    <td >' + handlePass + '</td>\n' +
                        '                    <td>\n' +
                        '                        <a onclick="editHandleLog(\'' + rows[i].handleLogId + '\')" style="color: #409dff">??????</a>\n' +
                        '                        <a onclick="delHandleLog(\'' + rows[i].handleLogId + '\')" style="color: #409dff">??????</a>\n' +
                        '                    </td>\n' +
                        '                </tr>')
                }
            }
        });
    }

    function editHandleLog(handleLogId) {
        $("#editEventHandLogFlag").val("1");
        $("#toUpdateHandleLogId").val(handleLogId)
        $.ajax({
            type: "GET",
            url: "/eventInfo/findHandleLog",
            dataType: "json",
            data: {
                handleLogId: handleLogId,
            },
            success: function (result) {
                if (result.code == "success") {
                    $("#handleContent").val(result.data.handleContent);
                    $("#handleDate").val(new Date(result.data.handleDate).format("yyyy-MM-dd hh:ss:mm"));
                    // $("#handleUnit").val(result.data.handleUnit);
                    $("#handleUnit option:contains('" + result.data.handleUnit + "')").attr('selected', true);
                    $("#handleIsflag").find("label").removeClass("ck");
                    if (result.data.handlePass == "1") {
                        $("#handleIsflag").find("label:eq(0)").addClass("ck");
                    }
                    if (result.data.handlePass == "0") {
                        $("#handleIsflag").find("label:eq(1)").addClass("ck");
                    }

                    $("#handleFilepath").text(getCaption(result.data.handleFilePath));
                    $("#handleUser").val(result.data.handleUser);
                }


            }
        })
    }

    function delHandleLog(handleLogId) {
        $.messager.confirm({
            width: 380,
            height: 160,
            name: '????????????',
            msg: '???????????????',
            ok: "???", cancel: "???",
            fn: function (r) {
                if (r) {
                    $.ajax({
                        type: "GET",
                        url: "/eventInfo/delHandleLog",
                        dataType: "json",
                        data: {
                            handleLogId: handleLogId,
                        },
                        success: function (result) {
                            if (result.code == "success") {
                                var toUploadEventId = $("#toUpdateEventId").val();
                                reShowHandleLog(toUploadEventId, 1, true);
                                successOperator();
                            }
                        }
                    });
                }
            }
        });
    }

    //???????????????
    function getCaption(obj) {
        if (obj != null) {
            return obj.split("ZCC")[1]
        }
        return "";
    }

    var IsHj;

    function showUpdate(eventId) {
        $("#toUpdateEventId").val(eventId);
        $("#add").hide();
        $("#addEventTitle").hide();
        $("#updateEventTitle").show();
        $("#update").show();

        $.ajax({
            type: "POST",
            url: "/tagObjectRelation/findTagByObjectId",
            dataType: "json",
            data: {
                objectId: eventId
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
            type: "POST",
            url: "/eventInfo/findEventRelationObject",
            dataType: "json",
            data: {
                eventId: eventId,
                objectType: 'person'
            },
            success: function (result) {
                console.log(result)
                if (result.code === "success") {
                    let persons = result.data;
                    let names = '';
                    $(".fs-options").eq(1).find('div').removeClass("selected");
                    for (let i = 0; i < persons.length; i++) {
                        names += persons[i].personName + ",";
                        $(".fs-options").eq(1).find('div[data-value=\"' + persons[i].personId + '\"]').addClass("selected");
                    }
                    names = names.substr(0, names.length - 1);
                    $(".fs-label").eq(1).attr("title", names);
                    $(".fs-label").eq(1).text(names);

                }
            }
        });
        $.ajax({
            type: "POST",
            url: "/eventInfo/findEventRelationObject",
            dataType: "json",
            data: {
                eventId: eventId,
                objectType: 'unit'
            },
            success: function (result) {
                if (result.code === "success") {
                    let units = result.data;
                    let names = '';
                    $(".fs-options").eq(2).find('div').removeClass("selected");
                    for (let i = 0; i < units.length; i++) {
                        names += units[i].unitName + ",";
                        $(".fs-options").eq(2).find('div[data-value=\"' + units[i].unitId + '\"]').addClass("selected");
                    }
                    names = names.substr(0, names.length - 1);
                    $(".fs-label").eq(2).attr("title", names);
                    $(".fs-label").eq(2).text(names);
                }
            }
        });

        $.ajax({
            type: "POST",
            url: "/eventInfo/findById",
            dataType: "json",
            data: {
                eventId: eventId
            },
            success: function (result) {
                if (result.code === "success") {
                    let event = result.data;
                    $("#toUpdateEventId").val(event.eventId);
                    $("#eventName").val(isValidStr(event.eventName));
                    $("#occurredTime").val(new Date(event.occurredTime).format("yyyy-MM-dd hh:mm:ss"));
                    $("#eventContent").val(isValidStr(event.eventContent));
                    $("#occurredPlace").val(isValidStr(event.occurredPlace));
                    $("#occurredLongti").val(isValidStr(event.occurredLongti));
                    $("#occurredLati").val(isValidStr(event.occurredLati));
                    $("#addEvent").show();
                }


            }
        });

    }

    function save(flag) {
        var data = {};
        data.eventName = $("#eventName").val();
        data.occurredTime = parserDate($("#occurredTime").val());
        data.eventContent = $("#eventContent").val();
        data.occurredPlace = $("#occurredPlace").val();
        data.occurredLongti = $("#occurredLongti").val();
        data.occurredLati = $("#occurredLati").val();
        var tags = '';
        $(".fs-options").eq(0).find('div').each(function () {
            if ($(this).hasClass('selected')) {

                tags += $(this).context.dataset.value + ',';
            }
        });
        data.tags = safeToString(tags);
        var persons = '';
        $(".fs-options").eq(1).find('div').each(function () {
            if ($(this).hasClass('selected')) {

                persons += $(this).context.dataset.value + ',';
            }
        });
        data.linkPersonNos = safeToString(persons);
        var units = '';
        $(".fs-options").eq(2).find('div').each(function () {
            if ($(this).hasClass('selected')) {
                units += $(this).context.dataset.value + ',';
            }
        });
        data.linkUnitNos = safeToString(units);
        data.linkEventNos = safeToString($("#linkEventNo").val());
        if (flag === "add") {
            $.ajax({
                type: "POST",
                url: "/eventInfo/save",
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
            data.eventId = $("#toUpdateEventId").val();
            $.ajax({
                type: "POST",
                url: "/eventInfo/save",
                dataType: "json",
                data: data,
                success: function (result) {
                    if (result.code == "success") {
                        $("#addEvent").hide();
                        findEvent("", true, 1);
                        handleCount();
                        successOperator();
                        dataTogether();
                        handleCount();
                    }
                }
            });
        }
    }
</script>
</html>
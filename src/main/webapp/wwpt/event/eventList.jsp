<%@ taglib prefix="tag" uri="object_tag" %>
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
    <%@include file="../common/w_include_header.jsp"%>
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

        .pageStyle ul li{
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
                <h5>查询条件</h5>
            </div>
            <div class="searchWrap">
                <!-- 高级搜索 -->
                <div class="advanceBox">
                    <div class="searchInp">
                        <div class="inpBox">
                            <input result="text" placeholder="事件名或发生地址" id="SearchNameOrPlace">
                        </div>
                        <button class="btn1" onclick="findEvent('',true,1)">搜索</button>
                        <button class="btn2" onclick="reset()">重置</button>
                        <a id="advancedSearch" class="advancedSearch" onclick="advanceSearch()">高级搜索</a>
                    </div>
                    <div class="advanceData">
                        <div>
                            <span>是否清算：</span>
                            <select class="vV-drop" style="width:250px;height:28px;" id="SearchIsSettlement">
                                <option value="" selected>请选择</option>
                                <option value="1">已清算</option>
                                <option value="0">未清算</option>
                            </select>
                        </div>
                        <div>
                            <span class="span">发生日期：</span>
                            <input id="searchOccurredTime" class="vV-ipt date w-246" result="text" style="width: 250px;"
                                   value=""
                                   placeholder="请选择" readonly="readonly">
                            <span class="span">清算日期：</span>
                            <input id="SearchSettlementTime" class="vV-ipt date w-246" result="text"
                                   style="width: 250px;" value=""
                                   placeholder="请选择"
                                   readonly="readonly">
                        </div>
                    </div>
                </div>
                <div class="labelSearch" style="z-index: 1">
                    <div class="clearfix">
                        <span class="labelText v-fl">标签</span>
                        <div class="labelAdd v-fl">
                            <!-- 所有标签 -->
                            <div class="labelAll">
                                <!-- input框 -->
                                <div class="fuzzyBox">
                                    <input class="vV-ipt w-200" id="txt1" result="text" value="" placeholder="请输入标签关键字"
                                           autocomplete="off">
                                    <div class="fuzzyData">
                                        <div id="allTags">
                                        </div>
                                    </div>
                                </div>
                                <!-- 加号 -->
                                <strong class="addBtn">+</strong>
                            </div>
                        </div>
                    </div>
                    <!-- 分类label -->
                    <div class="labelDown">
                        <i class="labelCloseBtn">×</i>
                        <tag:tag clazz="tabName" id="tag" style="" type="tagDiv"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="searchReault">
            <div class="searchNum">
                    <span>
                        为您找到到相关结果
                        <strong id="totalEvent">0</strong>
                        项
                    </span>
                <div class="btnGroup">
                    <a class="active" onclick="addShow()">新增</a>
                    <a onclick="exportEventToExcel()">下载</a>
                </div>
            </div>
            <div class="sortBox clearfix">
                <ul class="statusList v-fl" id="handleResolve">
                    <li class="active" onclick="findEvent('',true,1)">全部</li>
                    <li onclick="findEvent('1',true,1)">已处理</li>
                    <li onclick="findEvent('0',true,1)">未处理</li>
                </ul>
                <div class="sortList v-fr">
                    <a href="javascript:;" class="sort sortMethod">排序方式</a>
                    <div class="sortDown sortText">
                        <p>默认</p>
                        <p>按发生时间</p>
                        <p>按更新时间</p>
                    </div>
                </div>
            </div>
            <div class="searchCon" style="position: relative">
                <div id="loading" style="position: absolute;z-index:5;top: 50%;left: 50%;margin-top: -100px;margin-left: -100px;height: 500px">
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
                <h5>处置情况</h5>
            </div>
            <div class="assessBox">
                <div id="handleLoading"></div>
                <div class="item item1">
                    <i></i>
                    <p class="num" id="handling">0个</p>
                    <p class="name">未处置</p>
                </div>
                <div class="line"></div>
                <div class="item item2">
                    <i></i>
                    <p class="num" id="handled">0个</p>
                    <p class="name">已处置</p>
                </div>
            </div>
        </div>
        <div class="bear-block">
            <div class="bear-tit">
                <h5>数据聚合（<span id="dataTogetherCount">0</span>）</h5>
                <a href="dataTogether.jsp?Type=contradictionEvent" target="_blank">更多>></a>
            </div>
            <div class="dataBox">
                <div id="dataBoxLoading" ></div>
                <div class="dataList marquee1">
                    <div class="view" id="dataTogether">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="tanBox" id="resolve" style="display: none">
    <div class="pubBlock kuang">
        <i class="close" onclick="javascript:$('#operate').fadeOut();">×</i>
        <div class="bear-tit">
            <h5>化解存档</h5>
        </div>
        <div style="height: 200px">
            <div class="baseTable">
                <table border="0">

                    <tr>
                        <div>
                            <td width="20%" class="center">结案时间</td>
                            <td width="30%">
                                <input id="wwJarq" class="vV-ipt date w-246" result="text" value="" placeholder="请选择时间" readonly="readonly">
                            </td>
                        </div>
                    </tr>
                    <tr>
                        <div>
                            <td width="20%" class="center">存档时间</td>
                            <td width="30%">
                                <input id="wwCdrq" class="vV-ipt date w-246" result="text" value="" placeholder="请选择时间" readonly="readonly">
                            </td>
                        </div>
                    </tr>


                    <tr>
                        <td colspan="4" height="60" align="center">
                            <button class="alertBtn">保存</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="maskBox" id="eventHandle" style="display: none;position: fixed;z-index: 1000;">
    <div class="pubBlock kuang">
        <i class="close">×</i>
        <div class="bear-tit">
            <h5 id="handleLogTitle">录入处置日志</h5>
            <h5 id="leaderTitle">录入领导批示</h5>
        </div>
        <div class="lr-Box">
            <table border="0" class="lrTable mt-20" id="handleList">
            </table>
            <div class="clearfix pageBox">
                <div class="v-fl">
                    &nbsp;&nbsp;共&nbsp;<span class="totalHandle">2</span>&nbsp;条数据
                </div>
                <div id="paginationHandle" class=" v-fr pageStyle"></div>
            </div>

            <div class="baseTable">
                <table border="0">
                    <tr>
                        <td width="39%" class="center">处置内容</td>
                        <td colspan="3">
                            <textarea class="vV-area w-400 m8" style="width: 680px;height: 50px;" id="handleContent"></textarea>
                        </td>
                    </tr>
                </table>
                <table border="0">
                    <tr>
                        <td width="20%" class="center">处置时间</td>
                        <td width="30%">
                            <input id="handleDate" class="vV-ipt date w-246 Time" result="text" value="" placeholder="(默认为当前时间)" readonly="readonly" style="width: 245px;">
                        </td>
                        <td class="center">上传文件</td>
                        <td>
                            <div>
                                <input result="file" class="upload-btn" id="czPath" name="czPath">
                                <span result="text" class="file-input-trigger" onclick="selectFile($(this))">选择文件</span>
                                <p class="file-name" id="handleFilepath"></p>
                            </div>
                        </td>
                    <tr>
                        <td width="20%" class="center">操作人</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="handleUser" style="width: 245px;">
                        </td>
                        <td width="20%" class="center">创建人</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="handleCuser" style="width: 245px;">
                        </td>

                    </tr>

                    <tr>
                        <td class="center">集访类型</td>
                        <td>
                            <ul class="vV-tabs" id="handleJflx" style="width: 260px">
                            </ul>
                        </td>
                        <td class="center">是否通过</td>
                        <td id="handleIsflag">
                            <label class="vV-radio" name="handleIsflag">是</label>
                            <label class="vV-radio ck" name="handleIsflag">否</label>
                        </td>
                    </tr>
                    <br>

                    <tr>
                        <td colspan="4" height="60" align="center">
                            <button class="alertBtn" id="handleLogBut">保存</button>
                            <button class="alertBtn" id="leaderBut">保存</button>
                        </td>
                    </tr>
                </table>

            </div>
        </div>
    </div>
</div>
<div class="tanBox" id="resUnit" style="display: none">
    <div class="pubBlock kuang" style="width: 750px;">
        <i class="close">×</i>
        <div class="bear-tit">
            <h5>责任单位</h5>
        </div>
        <div style="height: 250px;">
            <div class="baseTable">
                <table border="0">
                    <tr>
                        <td width="20%" class="center">主办单位</td>
                        <td width="30%">
                            <select id="wwZrbmZb" class="vV-drop" style="width:200px;height:28px;" data-options="editable:false">
                            </select>
                        </td>

                        <td width="20%" class="center">协办单位</td>
                        <td width="30%">
                            <select id="wwZrbmXb" class="vV-drop" style="width:200px;height:28px;" data-options="editable:false">
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">委托单位</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="wwZrbmWt" style="width: 200px;">
                        </td>

                        <td width="20%" class="center">责任部门(街道)</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="wwZrbmJd" style="width: 200px;">
                        </td>
                    </tr>

                    <tr>
                        <td width="20%" class="center">督办单位</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="wwZrbmDb" style="width: 200px;">
                        </td>

                        <td class="center">工作周期</td>
                        <td id="wwGzzq1">
                            <label class="vV-radio ck" name="wwGzzq1" style="padding: 0 4px 0 29px;">7天</label>
                            <label class="vV-radio" name="wwGzzq1" style="padding: 0 4px 0 29px;">15天</label>
                            <label class="vV-radio" name="wwGzzq1" style="padding: 0 4px 0 29px;">一个月</label>
                        </td>

                    </tr>

                    <tr>
                        <td colspan="4" height="60" align="center">
                            <button class="alertBtn" onclick="saveResUnit()">保存</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>


<div class="tanBox" id="addEvent" style="display: none">
    <div class="pubBlock kuang">
        <i class="close">×</i>
        <div class="bear-tit">
            <h5 id="addEventTitle">新增事件</h5>
            <h5 id="updateEventTitle">修改事件</h5>
        </div>
        <div class="titleCon" style="height: 550px;">
            <div class="baseTable">
                <table border="0" style="width: 700px;">
                    <div class="bear-tit bear-tit2 point">
                        <h5>基本信息</h5>
                    </div>
                    <tr>
                        <td width="20%" class="center">事件名称</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="eventName" style="width: 200px;">
                        </td>

                        <td width="20%" class="center">发生时间</td>
                        <td width="30%">
                            <input id="occurredTime" class="vV-ipt date w-246 Time" result="text" value=""
                                   placeholder="请选择时间"
                                   readonly="readonly" required style="width: 200px;">
                        </td>
                    </tr>
                    <tr>
                        <td class="center">简要情况</td>
                        <td colspan="3">
                            <textarea class="vV-area w-400 m8" style="width: 550px;" id="eventContent"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">发生地址</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="occurredPlace" style="width: 200px;">
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center">事件发生经度</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="occurredLongti" style="width: 200px;">
                        </td>
                        <td width="20%" class="center">事件发生纬度</td>
                        <td width="30%">
                            <input class="vV-ipt" result="text" value="" id="occurredLati" style="width: 200px;">
                        </td>
                    </tr>

                </table>
                <table border="0" style="width: 700px;">
                    <div class="bear-tit bear-tit2 point">
                        <h5>扩展信息</h5>
                    </div>

                    <tr>
                        <td class="center">标签联动</td>
                        <td colspan="3">
                            <tag:tag clazz="vV-drop" style="width:550px;height:28px;" id="linkTag" type="tagSelect"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="center">涉及人员</td>
                        <td colspan="3">
                            <select class="vV-drop" style="width:550px;height:28px;" id="linkPersonNo"
                                    multiple="multiple">
                                <option value="1">小明</option>
                                <option value="2">小王</option>
                                <option value="3">小张</option>
                                <option value="4">小李</option>
                                <option value="5">小赵</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="center">涉及单位</td>
                        <td colspan="3">
                            <select class="vV-drop" style="width:550px;height:28px;" id="linkUnitNo"
                                    multiple="multiple">
                                <option value="A">A单位</option>
                                <option value="B">B单位</option>
                                <option value="C">C单位</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="center">涉及事件</td>
                        <td colspan="3">
                            <select class="vV-drop" style="width:550px;height:28px;" id="linkEventNo"
                                    multiple="multiple">
                                <option value="AA">A事件</option>
                                <option value="BB">B事件</option>
                                <option value="CC">C事件</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="center"></td>
                        <td width="30%">
                        </td>
                    </tr>
                    <tr id="add">
                        <td colspan="4" height="60" align="center">
                            <button class="alertBtn" onclick="save('add')">保存</button>
                        </td>
                    </tr>
                    <tr id="update">
                        <td colspan="4" height="60" align="center">
                            <button class="alertBtn" onclick="save('update')">保存</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
<input type="hidden" id="addedTagNames">
<input type="hidden" id="toUpdateEventId">
</body>

<script result="text/javascript">
    var eventDateTogetherCount = 0;
    var unittag;
    var tagsJson = [];

    var initpersontagflag = false;
    var initunittagflag = false;
    var initeventtagflag = false;
    //高级搜索标识
    var searchonOff = true;

    function initSelect() {
        if (initpersontagflag && initeventtagflag && initunittagflag) {

            // 标签联动
            treeBox({
                el: '$(".focusEl")', //焦点事件DOM 必传
                width: { // 各级列表宽度 可选 不传默认值就为 160，160，160，200
                    lv1: 80,
                    lv2: 100,
                    lv3: 160,
                    selected: 200
                },
                // selectedNum:3,// 设置可以选择多少个复选框 可选 不传默认3
                height: 260, //高度 不传默认值 280

                selectedNum: 20,
                // data: jobs.info, //数据 必传
                data: tagsJson,
                confirm: function (res) { //回调函数 必传 会以json的格式返回所选中的数据
                    for (var k in res) {
                        $(".jobType").eq(k).val(res[k].value);
                        $(".jobType").eq(k).attr('name', 'jobType[' + res[k].uid + ']');
                    }
                }
            });
        }
    }


    $(function () {
        //隐藏列表框
        $("body").click(function () {
            $(".fuzzyData").fadeOut();
        });

        // //移入移出效果
        // $(".spanItem").hover(function () {
        //     $(this).css('background-color', '#dbf1fc');
        // }, function () {
        //     $(this).css('background-color', 'white');
        // });


        //项点击
        var labelArr = [];
        var labelAllH = 0;
        var labelTop = 0;

        // $(".spanItem").on("click", function () {
        //     var textCon = $(this).text();
        //     if (labelArr.indexOf(textCon) != -1) {
        //         return
        //     }
        //     labelArr.push(textCon);
        //     // 隐藏输入框
        //     $(".fuzzyBox").css("display", "none");
        //     $(".labelAll").prepend('<span>\n' +
        //         '                <strong>' + textCon + '</strong>\n' +
        //         '                <i class="labelClose">×</i>\n' +
        //         '            </span>');
        //     alert(1)
        //     search(1, "-1", true);
        //     $(".labelCloseBtn").trigger('click');
        //     clickHandle();
        // });

        //标签点击，填充到标签列表框
        $(".tabCon .span").on("click", function () {
            var textHtml = $(this).html();
            if (labelArr.indexOf(textHtml) != -1) {
                return
            }
            var id = $(this).attr("id");
            labelArr.push(textHtml);
            $(".fuzzyBox").css("display", "none");
            //清空输入框
            $("#txt1").val("");
            $("#txt1").keyup();

            $(".labelAll").prepend('<span>\n' +
                '                        <strong id="' + id + '">' + textHtml + '</strong>\n' +
                '                        <i class="labelClose">×</i>\n' +
                '                    </span>');
            $(".labelCloseBtn").trigger('click');
            findEvent("", true, 1)
            clickHandle();
        });

        // 标签删除
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

        // 关闭弹窗
        $(".close").click(function () {
            $(".maskBox").fadeOut(200);
        });

        $(".tabConSon2").perfectScrollbar();

        $(".js-cancel").click(function () {
            $(this).parents(".mmodal").hide();
        });

        // 输入框控件调用
        vVsub();

        $("#linkPersonNo").fSelect();
        $("#linkUnitNo").fSelect();
        $("#linkEventNo").fSelect();
        $("#linkTag").fSelect();
        jeDate("#searchOccurredTime", {
            theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
            format: "YYYY-MM-DD",
            multiPane: false,
            range: "至"
        });
        jeDate("#SearchSettlementTime", {
            theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
            format: "YYYY-MM-DD",
            multiPane: false,
            range: "至"
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

        jeDate("#wwJarq", {
            theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
            format: "YYYY-MM-DD hh:mm:ss",
            zIndex: 3000,
        });
        jeDate("#wwCdrq", {
            theme: {bgcolor: "#00A1CB", pnColor: "#00CCFF"},
            format: "YYYY-MM-DD hh:mm:ss",
            zIndex: 3000,
        });

        // 排序方式
        $(".statusList li").click(function () {
            console.log("切换")
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


        // 弹窗关闭
        $(".kuang i.close").click(function () {
            $(".tanBox").fadeOut();
        })
        $(".clearBtn").click(function () {
            $(this).prev().val("");
        })

        function newAdduploadImg() {
            var img = '';

            //获取图片路径的方法，兼容多种浏览器，通過createObjectURL实现
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

            //实现上上传图片功能代码
            $(function () {
                $("#browerfile").change(function (e) {
                    var path = browerfile.value;
                    var objUrl = getObjectURL(this.files[0]);
                    if (objUrl) {
                        $('#QRCode').attr("src", objUrl);
                    }
                    var file = e.target.files[0];
                    var reader = new FileReader();
                    reader.readAsDataURL(file); // 读出 base64
                    reader.onloadend = function () {
                        // 图片的 base64 格式, 可以直接当成 img 的 src 属性值
                        img = reader.result;
                        // 下面逻辑处理

                    };
                })
            })
        }

        newAdduploadImg();
        // 弹框滚动条
        $(".titleCon").perfectScrollbar();


    });


    function footerChange() {
        // .index-main高度
        var indexMainH = $(".fx-left").outerHeight(true);
        $(".footerBox").css("top", indexMainH + 50);
    }


    //数据聚合汇总
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
                    let count = result.count;
                    $("#dataTogetherCount").text(count);
                    $("#dataTogether").empty();
                    if (count == 0) {
                        let str = '<li style="height: 200px" class="backG"></li>';
                        $("#dataTogether").append(str);
                    }
                    for (let i = 0; i < list.length; i++) {
                        var event = list[i];
                        var eventName = event.EVENT_NAME;
                        if (eventName == null || eventName.trim().length == 0) {
                            eventName = '无';
                        }
                        var eventContent = event.EVENT_CONTENT;
                        if (eventContent == null || eventContent.trim().length == 0) {
                            eventContent = '无';
                        }
                        var eventSource = event.EVENT_SOURCE;
                        if (eventSource == null || eventSource.trim().length == 0) {
                            eventSource = '无';
                        }
                        var stCreateTime = new Date(event.ST_CREATE_TIME).format("yyyy-MM-dd hh:mm:ss");
                        if (event.ST_CREATE_TIME == null) {
                            stCreateTime = '无';
                        }
                        $("#dataTogether").append('<dl>\n' +
                            '                              <dt>\n' +
                            '                              <span style="font-weight: bold;white-space: nowrap; text-overflow:ellipsis; overflow: hidden; ">' + eventName + '</span>\n' +
                            '                              <i class="new"></i>\n' +
                            '                                </dt>\n' +
                            '                                <dd>\n' +
                            '                                <p class="con" style="white-space: nowrap; text-overflow:ellipsis; overflow: hidden;">' + eventContent + '' +
                            '                                </p>\n' +
                            '                            <div class="sourceInfo">\n' +
                            // '                                <span class="name">小林</span>\n' +
                            '                                <strong style="margin-left: 0px;">\n' +
                            '                                <b>来源</b>\n' +
                            '                                <span>' + eventSource + '</span>\n' +
                            '                                </strong>\n' +
                            '                                <em>' + stCreateTime + '</em>\n' +
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

    //单个事件数据聚合信息
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

    //事件标签
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

    //事件列表
    function findEvent(handleFlag, flag, page) {

        var tags = '';
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
                        //下载本页时使用，用于暂存本页数据
                        // $("#eventInfo").val(JSON.stringify(rows))
                        $("#totalEvent").text("");
                        $("#totalEvent").text(result.data.count);
                        $("#eventList").empty();

                        $("#loading").css("height", "0");
                        if (flag) {
                            // 分页
                            var pageTotal;
                            if (result.data.count <= 5) {
                                pageTotal = 1;
                            } else {
                                pageTotal = Math.ceil(result.data.count / 5);
                            }
                            new Page({
                                id: 'pagination',
                                pageTotal: pageTotal, //必填,总页数
                                pageAmount: 5,  //每页多少条
                                dataTotal: result.data.count, //总共多少条数据
                                curPage: 1, //初始页码,不填默认为1
                                pageSize: 5, //分页个数,不填默认为5
                                showPageTotalFlag: true, //是否显示数据统计,不填默认不显示
                                showSkipInputFlag: true, //是否支持跳转,不填默认不显示
                                getPage: function (page) {
                                    // search(page, hjqk, false);
                                    //获取当前页数

                                }
                            });
                        }
                        if (events.length == 0) {
                            var strs = '<li class="backG topCot" style="height: 250px;">' +
                                '</li>';
                            $("#eventList").append(strs);
                        }
                        for (var i = 0; i < events.length; i++) {

                            var hanled = "未处理";
                            var iconImg = '';
                            if (events[i].isHandle == "1") {
                                iconImg = '<i class="icon" style="background:url(../images/icon-green.png) no-repeat ">'
                                hanled = "已处理";
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

                            var occurredTime = "无";
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
                                '                                <div class="item" name="发生时间">\n' +
                                '                                    <i></i>\n' +
                                '                                    <span>' + occurredTime + '</span>\n' +
                                '                                </div>\n' +
                                '                                <div class="item">\n' +
                                '                                    <i></i>\n' +
                                '                                    <span onclick="toEventDataTogether(\'' + events[i].eventId + '\',\'' + eventDateTogetherCount + '\')" style="cursor: pointer">数据聚合（' + eventDateTogetherCount + '）</span>\n' +
                                '                                </div>\n' +
                                // '                                <div class="item">\n' +
                                // '                                    <i></i>\n' +
                                // '                                    <a href="javascript:;">工作动态（3）</a>\n' +
                                // '                                </div>\n' +
                                '                            </div>\n' +
                                '                            <div class="labelBox" id="eventLabels" style="height:24px;">\n' + unittag +
                                '                            </div>\n' +
                                '                            <div class="btnGroup">\n' +
                                '                                <div class="sortList sortList2 v-fr">\n' +
                                '                                    <a href="javascript:;" class="sort">操作</a>\n' +
                                '                                    <div class="sortDown sortDown2">\n' +
                                '                                        <p onclick="baseInfo(\'' + events[i].eventId + '\')">详情</p>\n' +
                                '                                        <p onclick="showUpdate(\'' + events[i].eventId + '\')"> 修改</p>\n' +
                                '                                        <p onclick="showDel(\'' + events[i].eventId + '\')">删除</p>\n' +
                                '                                        <p onclick="resUnitShow(\'' + events[i].eventId + '\')">责任单位</p>\n' +
                                '                                        <p onclick="showEventHandle(\'' + events[i].eventId + '\',\'handlelog\')">处置日志</p>\n' +
                                '                                        <p onclick="showEventHandle(\'' + events[i].eventId + '\',\'leader\')">领导批示</p>\n' +
                                '                                        <p onclick="showResolve(\'' + events[i].eventId + '\')">化解存档</p>\n' +
                                '                                    </div>\n' +
                                '                                </div>\n' +
                                '                            </div>\n' +
                                '                        </div>\n' +
                                '                    </li>';
                            $("#eventList").append(str)


                        }
                        // 操作下拉
                        var dropSort = true;
                        $(".searchCon ul li .sort").click(function () {
                            if (dropSort) {
                                $(this).next().fadeIn();
                            } else {
                                $(this).next().fadeOut();
                            }
                            dropSort = !dropSort;
                        })
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

    function toEventDataTogether(eventId, eventDateTogetherCount) {
        if (eventDateTogetherCount == 0) {
            noDataTogether();
        } else {
            openNewWindow("dataTogether.jsp?Type=" + eventId + "");
        }
    }

    //详细信息
    function baseInfo(eventId, eventName) {
        var url = encodeURI("eventDetail.jsp?eventId=" + eventId);
        openNewWindow(url);
    }

    //保存标签
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
            name: '操作确认',
            msg: '是否删除？',
            ok: "是", cancel: "否",
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
                                // dataTogether();
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
        $.messager.alert("操作提示", "操作成功!");
    }

    function noDataTogether() {
        $.messager.alert("操作提示", "无数据聚合!");
    }

    // 高级搜索
    function advanceSearch(){
        if (searchonOff) {
            $("#advancedSearch").html("收起工具");
            $("#advancedSearch").addClass("active");
            $(".advanceBox").addClass("active");
            $(".advanceBox").animate({"height": "178px"}, 100);
        } else {
            $("#advancedSearch").html("高级搜索");
            $("#advancedSearch").removeClass("active");
            $(".advanceBox").removeClass("active");
            $(".advanceBox").animate({"height": "70px"}, 100);
        }
        searchonOff = !searchonOff;
    }

    //添加显示
    function addShow() {
        $("input").val("");
        $("#eventContent").val("");
        $("#update").hide();
        $("#addEventTitle").show();
        $("#updateEventTitle").hide();
        $("#add").show();
        $(".fs-options").find('div').removeClass("selected");
        $(".fs-options").find('div').removeClass("selected");
        $("#addEvent").show();
    }

    //导出事件
    function exportEventToExcel() {
        $('<form id="exportEvent" method="post" action="/eventManager/downloadAllContradictionEvent/"></form>').appendTo('body').submit().remove();
    }

    //已处理、未处理统计
    function handleCount() {
        $.ajax({
            result: "POST",
            url: "/eventInfo/handleCount",
            dataType: "json",
            success: function (result) {
                var handled = result.data.handled;
                var handling = result.data.handling;
                $("#handled").text(handled + "个")
                $("#handling").text(handling + "个")
            }
        })
    }

    //初始化选择标签
    function initTags() {
        $.ajax({
            result: "POST",
            url: "/TagBaseInfoManager/findAllTag",
            dataType: "json",
            // async: false,//异步改为同步
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


    //初始化人员标签
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
                    var persons = {"level": 1, "name": "人", "id": uuid(), "uid": uuid(), "pid": uuid()};
                    var personClasses = [];
                    var tagList = result.list;
                    // $("#personTags").empty();
                    for (var i = 0; i < tagList.length; i++) {
                        var tag = tagList[i];//某一类的list
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

    //初始化单位标签
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
                    var units = {"level": 1, "name": "单位", "id": uuid(), "uid": uuid(), "pid": uuid()};
                    var unitClasses = [];
                    var tagList = result.list;
                    // $("#unitTags").empty();
                    for (var i = 0; i < tagList.length; i++) {
                        var tag = tagList[i];//某一类的list
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

    //初始化事件标签
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
                    var events = {"level": 1, "name": "事件", "id": uuid(), "uid": uuid(), "pid": uuid()};
                    var eventClasses = [];
                    var tagList = result.list;
                    // $("#eventTags").empty();
                    for (var i = 0; i < tagList.length; i++) {

                        var tag = tagList[i];//某一类的list
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


    //处置日志显示
    function showEventHandle(eventId, result) {
        $("#editEventHandLogFlag").val("0");
        var showType;

        if (result == "handlelog") {
            $("#handleLogTitle").show();
            $("#leaderTitle").hide();
            $("#handleLogBut").show();
            $("#leaderBut").hide();
            showType = 0;
        }
        if (result == "leader") {
            $("#handleLogTitle").hide();
            $("#leaderTitle").show();
            $("#handleLogBut").hide();
            $("#leaderBut").show();
            showType = 1;
        }
        reShowHandleLog(eventId, showType, 1, true);
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

    //保存处置日志
    function saveEventHandle(handleType) {

        var eventId = $("#toUpdateEventId").val();
        var data = {};
        var editFlag = $("#editEventHandLogFlag").val();
        if (editFlag == "1") {
            data.handleLogId = $("#toUpdateHandleLogId").val();
        }
        data.handleType = handleType;//代表处置日志,1为领导批示
        data.handleEventId = eventId;
        data.handleContent = $("#handleContent").val();
        data.handleDate = parserDate($("#handleDate").val());
        data.handleUser = $("#handleUser").val();
        data.handleCuser = $("#handleCuser").val();
        var handleCjdid = $("#handleCjdid option:selected").text();
        if (handleCjdid == "请选择") {
            handleCjdid = "";
        }
        data.handleCjdid = handleCjdid;
        data.handleJfrs = $("#handleJfrs").val();
        var handleIsflag = "";
        if ($("#handleIsflag").find("label:eq(0)").hasClass("vV-radio ck")) {
            handleIsflag = "1";
        }
        if ($("#handleIsflag").find("label:eq(1)").hasClass("vV-radio ck")) {
            handleIsflag = "0";
        }
        data.handleIsflag = handleIsflag;
        var handleJflx = $("#handleJflx").find("li[class='act']").attr('value');
        data.handleJflx = handleJflx;
        $.ajax({
            result: "POST",
            url: "/eventHandleLogController/addEventHandleLog",
            dataType: "json",
            data: data,
            success: function (result) {
                if (result.message != "error") {
                    $("#eventHandle").hide();
                    uploadHanlelogFj(result.handleLogId);
                    findEvent();
                    // $("#m2").show();
                    successOperator();
                }
            }
        });
    }

    function uploadHanlelogFj(handleLogId) {
        var fileEleId = "czPath";
        var attrName = "czPath";
        //单个文件的异步上传
        $.ajaxFileUpload({
            result: "POST",
            url: "/eventHandleLogController/uploadHandleLogFj",
            fileElementId: fileEleId,
            dataType: "text",
            data: {
                attrName: attrName,
                eventHandlogId: handleLogId
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

    //化解存档显示
    function showResolve(eventId) {
        $("#toUpdateEventId").val(eventId)
        $("#wwJarq").val("");
        $("#wwCdrq").val("");
        $("#resolve").show();
    }


    function sortEvent(sortField) {
        $("#sort").val(sortField);
        search(1, "", true);
    }

    function selectFile(thisdom) {
        thisdom.prev().trigger('click');
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

    }

    function reShowHandleLog(eventId, result, page, pageFlag) {
        $("#toUpdateEventId").val(eventId);
        $("#toUpdatehandleLogType").val(result);
        $.ajax({
            result: "POST",
            url: "/eventHandleLogController/listEventHandleLogWithPage",
            dataType: "json",
            data: {
                eventId: eventId,
                result: result,
                page: page,
                pageSize: 3
            },
            success: function (result) {
                var total = result.total;
                $(".totalHandle").text(total)
                var rows = result.rows;


                var pageTotal;
                if (total <= 3) {
                    pageTotal = 1;
                } else {
                    pageTotal = Math.ceil(total / 3);
                }

                if (pageFlag) {
                    new Page({
                        id: 'paginationHandle',
                        pageTotal: pageTotal, //必填,总页数
                        pageAmount: 3,  //每页多少条
                        dataTotal: total, //总共多少条数据
                        curPage: 1, //初始页码,不填默认为1
                        pageSize: 3, //分页个数,不填默认为5
                        getPage: function (page) {
                            reShowHandleLog(eventId, result, page, false);
                        }
                    });
                }
                $("#handleList").empty();
                $("#handleList").append('<tr>\n' +
                    '                    <th width="10%">处置日期</th>\n' +
                    '                    <th width="10%">集访类型</th>\n' +
                    '                    <th width="10%">集访人数</th>\n' +
                    '                    <th width="20%">处置情况</th>\n' +
                    '                    <th width="10%">处置附件</th>\n' +
                    '                    <th width="20%">录入单位</th>\n' +
                    '                    <th width="10%">操作</th>\n' +
                    '                </tr>')
                for (var i = 0; i < rows.length; i++) {
                    var handleCtime = new Date(rows[i].handleCtime).format("yyyy-MM-dd");
                    if (rows[i].handleCtime == null) {
                        handleCtime = "无"
                    }
                    var handleJflx = rows[i].handleJflx;
                    if (handleJflx == "1") {
                        handleJflx = "人员聚集"
                    } else if (handleJflx == "2") {
                        handleJflx = "日常处置"
                    } else if (handleJflx == "3") {
                        handleJflx = "召开会议"
                    } else {
                        handleJflx = "无"
                    }
                    var handleJfrs = rows[i].handleJfrs;
                    if (handleJfrs == null || handleJfrs.trim().length == 0) {
                        handleJfrs = "0"
                    }
                    var handleContent = rows[i].handleContent;
                    if (handleContent == null || handleContent.trim().length == 0) {
                        handleContent = "无"
                    }
                    var handleFilepath = rows[i].handleFilepath;
                    if (handleFilepath == null || handleFilepath.trim().length == 0) {
                        handleFilepath = "无"
                    } else {
                        handleFilepath = getCaption(handleFilepath);
                    }

                    var handleCjdid = rows[i].handleCjdid;
                    if (handleCjdid == null || handleCjdid.trim().length == 0) {
                        handleCjdid = "无"
                    }
                    $("#handleList").append(' <tr>\n' +
                        '                    <td>' + handleCtime + '</td>\n' +
                        '                    <td>' + handleJflx + '</td>\n' +
                        '                    <td>' + handleJfrs + '</td>\n' +
                        '                    <td >' + handleContent + '</td>\n' +
                        '                    <td>' + handleFilepath + '</td>\n' +
                        '                    <td>' + handleCjdid + '</td>\n' +
                        '                    <td>\n' +
                        '                        <a onclick="editHandleLog(\'' + rows[i].handleLogId + '\')" style="color: #409dff">编辑</a>\n' +
                        '                        <a onclick="delHandleLog(\'' + rows[i].handleLogId + '\')" style="color: #409dff">删除</a>\n' +
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
            result: "POST",
            url: "/eventHandleLogController/findEventHandleLogById",
            dataType: "json",
            data: {
                handleLogId: handleLogId,
            },
            success: function (result) {
                $("#handleContent").val(result.handleContent);
                $("#handleDate").val(new Date(result.handleDate).format("yyyy-MM-dd hh:ss:mm"));
                // $("#handleFilepath").text(getCaption(result.handleFilepath));
                $("#handleUser").val(result.handleUser);
                $("#handleCuser").val(result.handleCuser);
                var handleCjdid = result.handleCjdid;
                if (handleCjdid == null || handleCjdid.trim().length == 0 || handleCjdid == "") {
                    $("#handleCjdid").val("")
                } else {
                    $("#handleCjdid").val($("#handleCjdid").find("option:contains('" + handleCjdid + "')").val())
                }
                $("#handleJfrs").val(result.handleJfrs);
                var handleJflx = result.handleJflx;
                $("#handleJflx").find("li").removeClass("act");
                if (handleJflx == "1") {
                    $("#handleJflx").find("li:eq(0)").addClass("act");
                }
                if (handleJflx == "2") {
                    $("#handleJflx").find("li:eq(1)").addClass("act");
                }
                if (handleJflx == "3") {
                    $("#handleJflx").find("li:eq(2)").addClass("act");
                }
                $("#handleIsflag").find("label").removeClass("ck");
                if (result.handleIsflag == "1") {
                    $("#handleIsflag").find("label:eq(0)").addClass("ck");
                }
                if (result.handleIsflag == "0") {
                    $("#handleIsflag").find("label:eq(1)").addClass("ck");
                }
            }
        })
    }

    function delHandleLog(handleLogId) {
        $.messager.confirm({
            width: 380,
            height: 160,
            name: '操作确认',
            msg: '是否删除？',
            ok: "是", cancel: "否",
            fn: function (r) {
                if (r) {
                    $.ajax({
                        result: "POST",
                        url: "/eventHandleLogController/delEventHandleLog",
                        dataType: "text",
                        data: {
                            handleLogId: handleLogId,
                        },
                        success: function (result) {
                            if (result == "success") {
                                var toUploadEventId = $("#toUpdateEventId").val();
                                var eventHandleLogType = $("#toUpdatehandleLogType").val();
                                reShowHandleLog(toUploadEventId, eventHandleLogType, 1, true);
                                successOperator();
                            }
                        }
                    });
                }
            }
        });
    }

    //截取字符串
    function getCaption(obj) {
        return obj.split("@@@@")[1]
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
                    for (let i = 0; i < tags.length; i++) {
                        names += tags[i].tagName + ","
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
        data.tags = safeToString($("#linkTag").val());
        data.linkPersonNos = safeToString($("#linkPersonNo").val());
        data.linkUnitNos = safeToString($("#linkUnitNo").val());
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
                    }
                }
            });
        }
    }
</script>
</html>
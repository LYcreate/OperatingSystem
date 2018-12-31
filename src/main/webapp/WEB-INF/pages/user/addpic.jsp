<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="template/head-nav.jsp"%>
    <fieldset class="layui-elem-field layui-field-title"
              style="margin-top: 10px;width:90%">
        <legend>分享新的活动</legend>
    </fieldset>
    <div class="  table-responsive main-content" v-cloak style="margin-left: 50px;margin-right: 150px;">
        <table class="layui-table table-striped table-bordered table-hover" style="table-layout:fixed">
            <tr>
                <th colspan="1" style="text-align:center">活动名称</th>
                <td colspan="2">
                    <input type="text" class="layui-input" placeholder="请输入活动名称" v-model="act.actname"/>
                </td>
                <th colspan="1" style="text-align:center">截止时间</th>
                <td colspan="2">
                    <input class="layui-input" v-model="act.endDate" placeholder="请选择截止时间"
                           onclick="layui.laydate({min:layui.laydate.now(0),max:layui.laydate.now(+3),elem: this, festival:false,istime: true, format: 'YYYY-MM-DD',choose:function (datas){app.act.endDate=datas;
                           console.log(app.act.endDate)}})">
                </td>
            </tr>
            <tr>
                <th colspan="1" style="text-align:center">活动链接</th>
                <td colspan="5">
                    <input type="text" class="layui-input" placeholder="请输入描述活动内容的网页链接" v-model="act.address"/>
                </td>
            </tr>
            <tr>
                <th colspan="1" style="text-align:center;vertical-align:middle;">活动宣传图或海报</th>
                <td colspan="5" style="vertical-align:middle;">
                    <div class="form-group">
                        <input id="uploadIndexImg" type="file" name="file" class="layui-upload-file"/>
                        <img id="img" style="height:0px" v-bind:src="act.picture" onerror="this.src='/screenos/imgs/defaultpic.png'"/>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="6">
                    <button style="margin-left:5%" class="layui-btn layui-btn-success" v-on:click="save">提交</button>
                </td>
            </tr>
            <tr>
                <th colspan="1" style="text-align:center;vertical-align:middle;">活动宣传图或海报</th>
                <td colspan="5" style="vertical-align:middle;">
                    <div class="box">
                        <img id="image" src="/screenos/imgs/defaultpic.png">
                    </div>
                </td>
            </tr>
            <tr>
                <th colspan="1" style="text-align:center;vertical-align:middle;">活动宣传图或海报</th>
                <td colspan="5" style="vertical-align:middle;">
                    <div class="small" style="height:200px;height:300px;overflow:hidden;"></div>
                </td>
            </tr>
        </table>
    </div>
<%@ include file="template/footer.jsp"%>
<script>
    $('#image').cropper({
        aspectRatio: 2/3,
        viewMode:1,
        dragMode:'crop',
        preview:".small",
        background:false,
        movable:false,
        crop: function (e) {
            console.log(e);
        }
    });

    function back(){
        window.history.go(-1)
    }
    var stompClient = null;

    function connect() {
        var socket = new SockJS('/endpointWisely');
        stompClient = Stomp.over(socket);
        stompClient.connect({}, function (frame) {
            stompClient.subscribe('/screen', function (result) {
            })
        });
    }

    connect();
    layui.use(['element', 'upload', 'form', 'laydate'], function () {
        var laydate = layui.laydate();
        var element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块
        var form = layui.form()
            , layer = layui.layer;
        layui.upload({
            url: '/user/upload'
            , elem: '#uploadIndexImg' //指定原始元素，默认直接查找class="layui-upload-file"
            , method: 'post' //上传接口的http类型
            , ext: 'jpg|png'
            , before: function (input) {
                //返回的参数item，即为当前的input DOM对象
                layer.msg('正在上传图片', {
                    time: 10000, //不自动关闭
                    icon: 16
                    , shade: 0.01
                });
            }
            , success: function (json) {
                layer.closeAll();
                if (json.status == 0) {
                    $("#img").css("height", "800px");
                    app.act.picture = json.result;
                    $('#image').cropper('replace',json.result,false);
                } else {
                    layer.alert(json.result, {icon: 5});
                }
            }
        });
    });
    var app = new Vue({
        el: '.main-content',
        data: {
            act: {
                actname: "",
                address: "",
                picture: "",
                endDate: "",
            },
            mysessionId:'',
        },
        methods: {
            save: function () {
                if (app.act.actname == "")
                    layer.alert("活动名称不能为空", {icon: 5});
                else if (app.act.address == "")
                    layer.alert("活动链接不能为空", {icon: 5});
                else if (app.act.endDate == ""){
                    layer.alert("截止时间不能为空", {icon: 5});
                }
                else if (app.act.picture == "")
                    layer.alert("活动图标" + "不能为空", {icon: 5});
                else {
                    jQuery.ajax({
                        type: 'POST',
                        url: "/user/saveAct",
                        data: app.act,
                        dataType: 'json',
                        success: function (json) {
                            console.log(app.act)
                            layer.closeAll('loading')
                            if (json.status == 0) {
                                layer.msg(json.result, {icon: 6});
                                app.act={};
                            } else {
                                layer.alert(json.result, {icon: 5});
                            }
                            sendMessage();
                        }
                    });
                }
            },
            logout: function () {
                jQuery.ajax({
                    type: 'POST',
                    url: "/user/logout",
                    data: {
                    },
                    dataType: 'json',
                    success: function (json) {
                        if (json.status == 0) {
                            layer.msg(json.result, {icon: 6});
                            window.location.href="/index";
                        } else {
                            layer.alert(json.result, {icon: 5});
                        }
                    }
                });
            }
        }
    });
    function sendMessage() {
        stompClient.send("/actinput", {}, JSON.stringify({
            'name':'testmessage',
            'message':"update from user actinput",
            'coordinationId':"???",
        }));
    }

    function back(){
        window.history.go(-1)
    }

    function convertToData(url, canvasdata, cropdata, callback) {
        var cropw = cropdata.width; // 剪切的宽
        var croph = cropdata.height; // 剪切的宽
        var imgw = canvasdata.width; // 图片缩放或则放大后的高
        var imgh = canvasdata.height; // 图片缩放或则放大后的高

        var poleft = canvasdata.left - cropdata.left; // canvas定位图片的左边位置
        var potop = canvasdata.top - cropdata.top; // canvas定位图片的上边位置

        var canvas = document.createElement("canvas");
        var ctx = canvas.getContext('2d');

        canvas.width = cropw;
        canvas.height = croph;

        var img = new Image();
        img.src = url;

        img.onload = function() {
            this.width = imgw;
            this.height = imgh;
            // 这里主要是懂得canvas与图片的裁剪之间的关系位置
            ctx.drawImage(this, poleft, potop, this.width, this.height);
            var base64 = canvas.toDataURL('image/jpg', 1);  // 这里的“1”是指的是处理图片的清晰度（0-1）之间，当然越小图片越模糊，处理后的图片大小也就越小
            callback && callback(base64)      // 回调base64字符串
        }
    }
</script>
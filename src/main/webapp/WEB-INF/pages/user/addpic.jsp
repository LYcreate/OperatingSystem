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
                <input type="text" class="layui-input" placeholder="请输入活动名称" v-model="picture.picturename"/>
            </td>
        </tr>
        <tr>
            <th colspan="1" style="text-align:center">截止时间</th>
            <td colspan="2">
                <input class="layui-input" v-model="picture.endDate" placeholder="请选择截止时间"
                       onclick="layui.laydate({min:layui.laydate.now(0),max:layui.laydate.now(+3),elem: this, festival:false,istime: true, format: 'YYYY-MM-DD',choose:function (datas){app.picture.endDate=datas;
                           console.log(app.picture.endDate)}})">
            </td>
        </tr>
        <tr>
            <th colspan="1" style="text-align:center;vertical-align:middle;">开始图片裁剪与上传</th>
            <td colspan="5" style="vertical-align:middle;">
                <!--背景图片显示区域-->
                <!--<div onclick="JavaScript:$('#inputImage').click();" style="height:70%;" @click="isDisplay=!isDisplay;$('#inputImage').click();">-->
                <div style="height:70%;">
                    <div id="upicon">
                        <input id="uploadIndexImg" type="file" name="file" class="layui-upload-file"/>
                    </div>
                    <!--<button id="shangchuan" title="点击更换背景图片" style="margin-left:5%" class="layui-btn layui-btn-success">上传图片</button>-->
                </div>
                <!--<input  style="display: none;"  class="notFormFile" id="inputImage" name="file" type="file" accept="image/*">-->
                <div>
                    <h1 style="color:#0C0C0C">1、上传图片大小请勿超过1Mb,不然根据网络状况可能会上传失败</h1>
                    <h1 style="color:#0C0C0C">2、目前支持的格式为jpg和png</h1>
                    <h1 style="color:#FF5722">3、拖动、缩放裁剪框来裁剪你的图片，别忘了点击裁剪按钮!!</h1>
                    <h1 style="color:#0C0C0C">4、若不裁剪直接提交，将不能保证显示效果</h1>
                    <h1 style="color:#FF5722">5、别忘了最后点击提交更改按钮哦！</h1>
                </div>
                <!--点击上面背景图片更换图片-->
                <!--图片裁剪以及智能识别区域-->
                <!--<div class="small" style="height:200px;height:300px;overflow:hidden;"></div>-->
            </td>
        </tr>
        <tr>
            <th colspan="1" style="text-align:center;vertical-align:middle;">活动宣传图或海报</th>
            <td colspan="5" style="vertical-align:middle;">
                <!--背景图片显示区域-->
                <div id="showEdit" class="containerImage Hide cliper_wrapper">
                    <img id="EditImg" src="">
                    <div id="myshow" class="footer-btn" style="height: 55px;">
                        <button type="button" style="width: 130px;font-size: 20px;height: 40px;margin-top: 8px;" class="ReselectPhoto" onclick="JavaScript:$('#uploadIndexImg').click();">重选照片</button>
                        <!--<button type="button" style="width: 130px;font-size: 20px;height: 40px;margin-top: 8px;" class="ReselectPhoto" onclick="JavaScript:$('#inputImage').click();">重选照片</button>-->
                        <button id="cut" type="button" style="width: 100px;font-size: 20px;height: 40px;margin-top: 8px;background-color: #3A9E9E;border: 1px solid #3A9E9E;" class="Cut">剪切</button>
                        <button id="submit" type="button" style="width: 100px;font-size: 20px;height: 40px;margin-top: 8px;" class="Cut">提交更改</button>
                        <button id="rotate" type="button" style="width: 100px;font-size: 20px;height: 40px;margin-top: 8px;" class="Cut">旋转90度</button>
                    </div>
                </div>
                <!--<div class="small" style="height:200px;height:300px;overflow:hidden;"></div>-->
            </td>
        </tr>
        <tr>
            <th colspan="1" style="text-align:center;vertical-align:middle;">图片效果预览</th>
            <td colspan="5" style="vertical-align:middle;">
                <div class="small" style="width: 200px;height: 300px;overflow: hidden">
                </div>
            </td>
        </tr>
        <tr v-if="ifDisplay">
            <th colspan="1" style="text-align:center;vertical-align:middle;">活动宣传图或海报</th>
            <td colspan="5" style="vertical-align:middle;">
                <input type="hidden" id="BS_s" value="${BS}">
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <button style="margin-left:5%" class="layui-btn layui-btn-success" v-on:click="save">提交</button>
            </td>
        </tr>
    </table>
</div>
</div>
</div>
</div>
<script>

    $(function () {
        'use strict';//表示强规则
        var Cropper = window.Cropper;
        var console = window.console || { log: function () {} };
        var URL = window.URL || window.webkitURL;
        var $image = $('#EditImg');
        //获取图片截取的位置
        var screenWidth = $(window).width();
        var screenHeight =  $(window).height();
        var $dataX = $('#dataX');
        var $dataY = $('#dataY');
        var $dataHeight = $('#dataHeight');
        var $dataWidth = $('#dataWidth');
        var $dataRotate = $('#dataRotate');
        var $dataScaleX = $('#dataScaleX');
        var $dataScaleY = $('#dataScaleY');
        var options = {
            containerHeight :  screenWidth,
            containerWidth : screenHeight,
            viewMode:1,
            dragMode:'crop',
            autoCropArea:1,
            preview:".small",
            movable:false,
            guides :true,//裁剪框虚线 默认true有
            aspectRatio: 2/3, //裁剪框比例1:1
            // responsive : true,// 是否在窗口尺寸改变的时候重置cropper
            // background : true,// 容器是否显示网格背景
            // zoomable : true,//是否允许放大缩小图片
            // resizable : false,//是否允许改变剪裁框的大小
            // cropBoxMovable :false,//是否允许拖动裁剪框
            // cropBoxResizable :false,//是否允许拖动 改变裁剪框大小
            crop: function (e) {
                $dataX.val(Math.round(e.x));
                $dataY.val(Math.round(e.y));
                $dataHeight.val(Math.round(e.height));
                $dataWidth.val(Math.round(e.width));
                $dataRotate.val(e.rotate);
                $dataScaleX.val(e.scaleX);
                $dataScaleY.val(e.scaleY);
            }
        };

        $('#EditImg').cropper(options);

        // Options
        var originalImageURL = $image.attr('src');
        var uploadedImageURL;
        var $inputImage = $('#inputImage');
        URL = window.URL || window.webkitURL;
        var blobURL;
        if (URL) {
            $inputImage.change(function () {
                var files = this.files,
                    file;
                if (files && files.length) {
                    file = files[0];
                    if (/^image\/\w+$/.test(file.type)) {
                        blobURL = URL.createObjectURL(file);
                        $image.one('built.cropper', function () {
                            URL.revokeObjectURL(blobURL); // Revoke when load complete
                        }).cropper('reset', true).cropper('replace', blobURL);
                        //$inputImage.val('');
                        $image.cropper('setCanvasData',{width:300,height:300});
                    } else {
                        //alert('Please choose an image file.');
                    }
                }
            });
        } else {
            $inputImage.parent().remove();
        }
        //裁剪图片
        $("#cut").on("click", function () {
            var dataURL = $image.cropper("getCroppedCanvas");
            var imgurl = dataURL.toDataURL("image/*", 0.5);
            $image.cropper('destroy').attr('src', imgurl).cropper(options);
        });
        $("#rotate").on("click", function () {
            $image.cropper('rotate', 90);
        });
        //提交图片
        $("#submit").on("click", function () {
            // var accessory = $('#inputImage').val();
            // var accessory = $('#uploadIndexImg').val();
            if (typeof accessory == "null"){
                alert("is null");
                return ;
            }
            var accessoryName = app.picture.filename;
            // var accessoryName = accessory.substring(accessory.lastIndexOf("\\")+1,accessory.length);//截取原文件名
            var dataURL = $image.cropper("getCroppedCanvas");//拿到剪裁后的数据
            var data = dataURL.toDataURL("image/*", 0.5);//转成base64
            if (typeof data == "null"){
                alert("is null");
                return ;
            }
            var BS_s = $("#BS_s").val();
            $.ajax({
                // url: BS_s+"/wxFirst/uploadImgBase",
                url: "/screenos/uploadImgBase",
                dataType:'json',
                type: "POST",
                data: {
                    fileName : accessoryName,
                    imgBase64 : data.toString()
                },
                timeout : 10000, //超时时间设置，单位毫秒
                async: true,
                success: function (result) {
                    app.picture.url = result.phoUrl;
                    console.log(result)
                    console.log(app.picture.url)
                },
                error: function (returndata) {
                    console.log("错误信息：")
                    console.log(returndata)

                    var formData = new FormData();//初始化一个FormData对象
                    // formData.append("file", $(".notFormFile")[0].files[0]);//将文件塞入FormData
                    formData.append("file", $(".layui-upload-file")[0].files[0]);//将文件塞入FormData
                    $.ajax({
                        url: "/screenos/user/upload",
                        type: "POST",
                        data: formData,
                        processData: false,  // 告诉jQuery不要去处理发送的数据
                        contentType: false,   // 告诉jQuery不要去设置Content-Type请求头
                        before: function (input) {
                            //返回的参数item，即为当前的input DOM对象
                            layer.msg('正在上传图片', {
                                time: 10000, //不自动关闭
                                icon: 16
                                , shade: 0.01
                            });
                        },
                        success: function (json) {
                            layer.closeAll();
                            if (json.status == 0) {
                                app.picture.url = json.url;
                                layer.open({
                                    title: '裁剪失败提醒',
                                    icon: 6,
                                    content: "上传成功，但是你上传的图片太大了，很抱歉我们暂不支持裁剪",
                                    offset: '300px',
                                    yes: function(index, layero){
                                        //do something
                                        layer.close(index);
                                        $('#EditImg').cropper('destroy');
                                        console.log("itshoudesed!")
                                        $("#myshow").hide();
                                        $("#shangchuan").hide();
                                        $("#EditImg").attr(
                                            "src",app.picture.url
                                        )
                                    },
                                    cancel: function(index, layero){
                                        layer.close(index);
                                        $('#EditImg').cropper('destroy');
                                        console.log("itshoudesed!")
                                        $("#myshow").hide();
                                        $("#shangchuan").hide();
                                        $("#EditImg").attr(
                                            "src",app.picture.url
                                        )
                                        return false;
                                    }
                                });
                            } else {
                                layer.open({
                                    title: '图片上传不成功',
                                    icon: 5,
                                    content: "你上传的图片太大了，请选择缩略图上传！",
                                    offset: '300px',
                                    yes: function(index, layero){
                                        //do something
                                        layer.close(index); //如果设定了yes回调，需进行手工关闭
                                        window.location.href="/index";
                                    },
                                    cancel: function(index, layero){
                                        layer.close(index);
                                        window.location.href="/index";
                                        return false;
                                    }
                                });
                            }
                        },
                        error: function () {
                            layer.open({
                                title: '图片上传不成功',
                                icon: 5,
                                content: "上传出现错误，网络忙",
                                offset: '300px',
                                yes: function(index, layero){
                                    //do something
                                    layer.close(index); //如果设定了yes回调，需进行手工关闭
                                    window.location.href="/index";
                                },
                                cancel: function(index, layero){
                                    layer.close(index);
                                    window.location.href="/index";
                                    return false;
                                }
                            });
                        }
                    });
                }
            });
            $('#EditImg').cropper('destroy');
            console.log("itshoudesed!")
            $("#myshow").hide();
            $("#shangchuan").hide();
            $("#upicon").hide();
            $("#EditImg").attr(
                "src",app.picture.url
            )
            layer.msg("裁剪完毕", {icon: 6});
        });
    });
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

    // connect();
    layui.use(['element', 'upload', 'form', 'laydate'], function () {
        var laydate = layui.laydate();
        var element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块
        var form = layui.form()
            , layer = layui.layer;
        layui.upload({
            url: '/screenos/user/upload'
            , elem: '#uploadIndexImg' //指定原始元素，默认直接查找class="layui-upload-file"
            , method: 'post' //上传接口的http类型
            , ext: 'jpg|png|bmp|jpeg|HEIC|HEIF'
            , before: function (input) {
                //返回的参数item，即为当前的input DOM对象
                layer.msg('正在上传图片', {
                    time: 10000, //不自动关闭
                    icon: 16
                    , shade: 0.01
                });
            },
            success: function (json) {
                console.log("!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                console.log(json);
                layer.closeAll();
                if (json.status == 0) {
                    // $("#img").css("height", "800px");
                    app.picture.url = "/screenos"+json.url;
                    console.log("app.picture.url"+app.picture.url)
                    app.picture.filename=app.picture.url.substring(17);
                    $('#EditImg').cropper('replace', app.picture.url,false);
                    layer.msg("上传成功,请开始裁剪", {icon: 6});
                } else {
                    layer.open({
                        title: '图片上传不成功',
                        icon: 5,
                        content: json.url,
                        offset: '300px',
                        yes: function(index, layero){
                            //do something
                            layer.close(index); //如果设定了yes回调，需进行手工关闭
                            window.location.href="/index";
                        },
                        cancel: function(index, layero){
                            layer.close(index);
                            window.location.href="/index";
                            return false;
                        }
                    });}
            }
        });
    });
    var app = new Vue({
        el: '.main-content',
        data: {
            picture: {
                picturename: "",
                url: "",
                endDate: "",
            },
            mysessionId:'',
            filename:'',
            isDisplay:false,
        },
        methods: {
            save: function () {
                if (app.picture.picturename == "")
                    layer.open({
                        title: '错误信息',
                        icon: 5,
                        offset: '300px',
                        content: "活动名称不能为空",
                    });
                else if (app.picture.url == "")
                    layer.open({
                        title: '错误信息',
                        icon: 5,
                        offset: '300px',
                        content: "活动链接不能为空",
                    });
                else if (app.picture.endDate == ""){
                    // layer.open({
                    //     title: '错误信息',
                    //     icon: 5,
                    //     offset: '300px',
                    //     content: "活动时间不能为空",
                    // });
                    app.picture.endDate=laydate.now(+1);
                }
                else {
                    jQuery.ajax({
                        type: 'POST',
                        url: "/screenos/user/savePicture",
                        data: app.picture,
                        dataType: 'json',
                        success: function (json) {
                            console.log(app.url)
                            layer.closeAll('loading')
                            if (json.status == 0) {
                                // sendMessage();
                                app.url={};
                                layer.open({
                                    title: '提交成功',
                                    icon: 6,
                                    content: json.url,
                                    offset: '300px',
                                    yes: function(index, layero){
                                        //do something
                                        layer.close(index); //如果设定了yes回调，需进行手工关闭
                                        window.location.href="/index";
                                    },
                                    cancel: function(index, layero){
                                        layer.close(index);
                                        window.location.href="/index";
                                        return false;
                                    }
                                });

                            } else {
                                layer.open({
                                    title: '提交不成功',
                                    icon: 5,
                                    offset: '300px',
                                    content: json.url,
                                });
                            }
                        }
                    });
                }
            },
            readFile() {
                this.isDisplay=!this.isDisplay;$('#inputImage').click();
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
        stompClient.send("/pictureinput", {}, JSON.stringify({
            // 'name':'testmessage',
            // 'message':"update from user pictureinput",
            // 'coordinationId':"???",
            'name':'toone',
            'message':''+app.picture.url,
            'coordinationId':'',
        }));
    }

    function back(){
        window.history.go(-1)
    }


</script>
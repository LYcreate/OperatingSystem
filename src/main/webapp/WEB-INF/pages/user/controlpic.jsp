<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="template/head-nav.jsp"%>

<fieldset class="layui-elem-field layui-field-title"
          style="margin-top: 10px;width:90%">
    <legend>分享新的图片</legend>
</fieldset>
<div class="  table-responsive main-content" v-cloak style="margin-left: 50px;margin-right: 150px;">
    <table class="layui-table table-striped table-bordered table-hover" style="table-layout:fixed">
        <tr>
            <th colspan="1" style="text-align:center">图片名称</th>
            <td colspan="5">
                <input type="text" class="layui-input" placeholder="请输入图片名称" v-model="picture.picturename"/>
            </td>
        </tr>
        <tr>
            <th colspan="1" style="text-align:center">命令选择</th>
            <td colspan="5">
                <input type="radio" id="one" value="0" v-model="btos.isrefresh">
                <label for="one">改变刷新时间</label>
                <br>
                <input type="radio" id="two" value="1" v-model="btos.isrefresh">
                <label for="two">增加新的壁纸</label>
                <br>
                <span>Picked: {{btos.isrefresh}}</span>
            </td>
        </tr>
        <tr>
            <th colspan="1" style="text-align:center">切换时间</th>
            <td colspan="5">
                <input type="text" class="layui-input" placeholder="请输入切换时间" v-model="btos.time"/>
            </td>
        </tr>
        <tr>
            <th colspan="1" style="text-align:center">特效类型</th>
            <td colspan="5">
                <input type="radio" id="t1" value="1" v-model="btos.effectype">
                <label for="t1">特效1</label>
                <br>
                <input type="radio" id="t2" value="2" v-model="btos.effectype">
                <label for="t2">特效2</label>
                <br>
                <input type="radio" id="t3" value="3" v-model="btos.effectype">
                <label for="t3">特效3</label>
                <br>
                <input type="radio" id="t4" value="4" v-model="btos.effectype">
                <label for="t4">特效4</label>
                <br>
                <span>Picked: {{btos.effectype}}</span>
            </td>
        </tr>
        <tr>
            <th colspan="1" style="text-align:center">图片位置</th>
            <td colspan="5">
                <input type="radio" id="zuoshang" value="1" v-model="btos.position">
                <label for="zuoshang">左上角</label>
                <br>
                <input type="radio" id="youshang" value="2" v-model="btos.position">
                <label for="youshang">右上角</label>
                <br>
                <input type="radio" id="zuoxia" value="3" v-model="btos.position">
                <label for="zuoxia">左下角</label>
                <br>
                <input type="radio" id="youxia" value="4" v-model="btos.position">
                <label for="youxia">右下角</label>
                <br>
                <span>Picked: {{btos.position}}</span>
            </td>
        </tr>
        <tr>
            <th colspan="1" style="text-align:center;vertical-align:middle;">图片效果预览</th>
            <td colspan="5" style="vertical-align:middle;">
                <div>
                    <img  style="width:750px;height: 425px;overflow: hidden" v-bind:src="picture.url">
                </div>
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
    layui.use(['element', 'form', 'laydate'], function () {
        var laydate = layui.laydate();
        var element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块
        var form = layui.form()
            , layer = layui.layer;
    });


    var app = new Vue({
        el: '.main-content',
        data: {
            picture: ${picture},
            mysessionId:'',
            btos:{
                isrefresh:'',
                effectype:'',
                position:'',
                time:'',
                picture:'',
                uid:"16124400",
            },
            filename:'',
            isDisplay:false,
        },
        created:function(){
            console.log(this.btos);
        },
        methods: {
            save: function () {
                console.log(this.btos);
                if (app.btos.isrefresh==""){
                    layer.open({
                        title: '错误信息',
                        icon: 5,
                        offset: '300px',
                        content: "isrefresh不能为空",
                    })
                }else if (app.btos.effectype == "") {
                    layer.open({
                        title: '错误信息',
                        icon: 5,
                        offset: '300px',
                        content: "effectype不能为空",
                    })
                }else if (app.btos.position == "") {
                    layer.open({
                        title: '错误信息',
                        icon: 5,
                        offset: '300px',
                        content: "postion不能为空",
                    });
                }else if (app.btos.time == ""){
                    layer.open({
                        title: '错误信息',
                        icon: 5,
                        offset: '300px',
                        content: "time不能为空",
                    })
                }else if (app.btos.uid == ""){
                    layer.open({
                        title: '错误信息',
                        icon: 5,
                        offset: '300px',
                        content: "uid不能为空",
                    })
                }
                else {
                    console.log('app.btos');
                    console.log(app.btos);
                    app.btos.picture=app.picture.id;
                    // app.btos.picture=app.picture;
                    $.ajax({
                        type: 'GET',
                        url: "/screenos/getbtos",
                        data: app.btos,
                        dataType: 'json',
                        success: function (json) {
                            layer.closeAll('loading')
                            if (json.status == 0 ) {
                                // sendMessage();
                                console.log(json.result);
                                console.log("savesuccess")
                                layer.open({
                                    title: '提交信息',
                                    icon: 6,
                                    offset: '300px',
                                    content: "成功提交",
                                });

                            } else {
                                console.log("savesuccess")
                                layer.open({
                                    title: '错误信息',
                                    icon: 5,
                                    offset: '300px',
                                    content: "提交失败，请联系管理员",
                                });
                                // layer.open({
                                //     title: '提交不成功',
                                //     icon: 5,
                                //     // offset: '300px',
                                //     content: json.url,
                                // });
                            }
                        }
                    });
                }
            },
            logout: function () {
                $.ajax({
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
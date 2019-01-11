<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"
    +request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org"
      xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout"
      layout:decorator="/user/layout/frame">
<head>
    <meta charset="UTF-8">
    <title>校园互动屏</title>
    <!--<link rel="stylesheet" href="/layui/css/layui.css"/>-->
    <link rel="stylesheet" href="<%=basePath%>/old/layui/css/layui.css"/>
    <script src="<%=basePath%>/js/vue1.0.js"></script>
    <script src="<%=basePath%>/js/jquery.min.js"></script>
    <script src="<%=basePath%>/old/layui/layui.js"></script>
    <script src="<%=basePath%>/js/stomp.js"></script>
    <script src="<%=basePath%>/js/sockjs.min.js"></script>
</head>
<body>
<div class="container">
    <div class="main-content  table-responsive" v-cloak style="text-align: center;vertical-align: middle">
        <fieldset class="layui-elem-field layui-field-title loginForm" style="margin:10px auto;bamargin-top:40px;border:1px solid #e2e2e2;padding:20px;max-width:480px;display:inline-block;background: #fff">
            <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                <ul class="layui-tab-title">
                    <li class="layui-this">用户登录</li>
                </ul>
                <div class="layui-tab-content" >
                    <div class="layui-tab-item layui-show">
                        <form class="layui-form layui-form-pane " style="margin-top:20px;">
                            <div class="layui-form-item">
                                <label class="layui-form-label">用户名称</label>
                                <div class="layui-input-inline">
                                    <input type="text" v-model="user.uid" placeholder="工号/学号/邮箱/手机号" autocomplete="off" class="layui-input login_name">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">用户密码</label>
                                <div class="layui-input-inline">
                                    <input type="password" v-model="user.password" placeholder="请输入用户密码" autocomplete="off" class="layui-input login_psw" @keyup.Enter="login">
                                </div>
                            </div>
                            <!--<div class="layui-form-item" v-if="show">-->
                            <!--<label class="layui-form-label"style="padding:2px 0px!important;"><a href="javascript:void(0)"><img src="checkCodeAction" v-on:click="changeYzm()" style="width:100%;height:32px;"></a></label>-->
                            <!--<div class="layui-input-inline">-->
                            <!--<input type="text" v-model="login_yzm" placeholder="请输入验证码" autocomplete="off" class="layui-input login_yzm">-->
                            <!--</div>-->
                            <!--</div>-->
                        </form>
                        <button class="layui-btn layui-btn-big btn-login" v-on:click="login" style="width:300px;">登录</button></div>
                    <hr/>
                    <div>
                        <button class="layui-btn layui-btn-big btn-login" v-on:click="guest" style="width:300px;">测试登录</button></div>
                    <hr/>
                    <button class="layui-btn layui-btn-big btn-login" v-on:click="master" style="width:300px;">快捷管理登录</button></div>
            </div>
        </fieldset>
    </div>
</div>
<script>
    $(document).ready(function () {
        layui.use(['element','form'], function () {
            var element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块
            var form = layui.form()
                , layer = layui.layer;
            var app = new Vue({
                el: '.main-content',
                data: {
                    user:{
                        uid:"",
                        password:"",
                    },
                },
                methods: {
                    login: function () {
                        console.log(JSON.stringify(app.user));
                        jQuery.ajax({
                            type: 'POST',
                            url: "<%=path%>/user/login",
                            data: app.user,
                            dataType: 'json',
                            success: function (json) {
                                if (json.status == 0) {
                                    layer.msg(json.result, {icon: 6});
                                    window.location.href="/screenos/index";
                                } else {
                                    layer.alert(json.result, {icon: 5});
                                }
                            }
                        });
                    },
                    guest: function () {
                        $.ajax({
                            type: 'POST',
                            url: "<%=path%>/user/guest",
                            data:"",
                            dataType: 'json',
                            success: function (json) {
                                if (json.status == 0) {
                                    layer.msg(json.result, {icon: 6});
                                    window.location.href="/screenos/index";
                                } else {
                                    layer.alert(json.result, {icon: 5});
                                }
                            }
                        });
                    },
                    master: function () {
                        jQuery.ajax({
                            type: 'POST',
                            url: "<%=path%>/user/master",
                            data:"",
                            dataType: 'json',
                            success: function (json) {
                                if (json.status == 0) {
                                    layer.msg(json.result, {icon: 6});
                                    window.location.href="/screenos/index";
                                } else {
                                    layer.alert(json.result, {icon: 5});
                                }
                            }
                        });
                    },
                    logout: function () {
                        jQuery.ajax({
                            type: 'POST',
                            url: "<%=path%>/user/logout",
                            data: {
                            },
                            dataType: 'json',
                            success: function (json) {
                                if (json.status == 0) {
                                    layer.msg(json.result, {icon: 6});
                                    window.location.href="/screenos/index";
                                } else {
                                    layer.alert(json.result, {icon: 5});
                                }
                            }
                        });
                    }
                }
            });
        });
    });
</script>
</body>
</html>

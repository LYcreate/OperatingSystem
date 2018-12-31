<%--
  Created by IntelliJ IDEA.
  User: Erubsh
  Date: 2018/12/25
  Time: 13:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>管理后台</title>
    <link rel="stylesheet" href="/screenos/old/layui/css/layui.css"/>
    <script src="/screenos/js/vue1.0.js"></script>
    <script src="/screenos/js/jquery.min.js"></script>
    <script src="/screenos/old/layui/layui.js"></script>
    <script src="/screenos/js/stomp.js"></script>
    <script src="/screenos/js/sockjs.min.js"></script>
    <script src="/screenos/js/cropper.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-header">
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left"  lay-filter="test">
        <li class="layui-nav-item">
            <div class="layui-logo"><a href="/screenos/screen">壁纸屏管理端</a></div>
        </li>
        <li class="layui-nav-item">
            <a href="javascript:;" onclick="back()">返回</a>
        </li>
        <li class="layui-nav-item">
            <a href="javascript:;">图片管理</a>
            <dl class="layui-nav-child">
                <dd><a href="/screenos/user/piclist">本地图片列表</a></dd>
                <dd><a href="/screenos/user/searchpic">在线搜索图片</a></dd>
                <dd><a href="/screenos/user/addpic">添加图片</a></dd>
                <dd><a href="/screenos/user/editpic">编辑图片</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item" style="float: right">
            <a href="javascript:;">
                <div th:text="${session.userName}"></div>
            </a>
            <dl class="layui-nav-child">
                <dd><a href="/screenos/screen">浏览壁纸界面</a></dd>
                <dd><a v-on:click="logout">登出</a></dd>
            </dl>
        </li>
    </ul>
</div>
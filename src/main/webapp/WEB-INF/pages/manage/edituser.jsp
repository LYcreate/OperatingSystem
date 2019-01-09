<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="template/head-nav.jsp"%>
<fieldset class="layui-elem-field layui-field-title"
          style="margin-top: 10px;width:90%">
    <legend>编辑用户</legend>
</fieldset>
<div class="table-responsive main-content" v-cloak style="margin-left: 50px;margin-right: 150px;">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label" style="text-align:center;vertical-align:middle;">姓名</label>
            <div class="layui-input-block">
                <input type="text" v-model="user.username" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="text-align:center;vertical-align:middle;">密码</label>
            <div class="layui-input-inline">
                <input type="password" v-model="user.password" required placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="text-align:center;vertical-align:middle;">学/工号</label>
            <div class="layui-input-inline">
                <input type="text" v-model="user.uid" required placeholder="请输入学/工号" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="text-align:center;vertical-align:middle;">所属院系</label>
            <div class="layui-input-block">
                <input type="text" v-model="user.part" required  lay-verify="required" placeholder="请输入所属院系" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="text-align:center;vertical-align:middle;">用户类型</label>
            <div class="layui-input-block">
                <select name="userType">
                    <option disabled>请选择</option>
                    <option value="0">一般用户</option>
                    <option value="1">管理员</option>
                    <option value="2">设备</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="text-align:center;vertical-align:middle;">性别</label>
            <div class="layui-input-block">
                <select name="gender">
                    <option disabled>请选择</option>
                    <option value="1">男</option>
                    <option value="0">女</option>
                    <option value="2">其他</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="button" class="layui-btn" lay-submit lay-filter="formDemo" value="立即提交">
            </div>
        </div>
    </form>
</div>
<%@ include file="template/footer.jsp"%>
<script>
    $(document).ready(function () {
        layui.use(['element', 'upload', 'form'], function () {
            var form = layui.form();
            form.on('submit(formDemo)', function(data){
                console.log(data)
                app.user.userType=data.field.userType;
                app.user.gender=data.field.gender;
                app.save();
                return false;
            });
            var element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块
            var layer = layui.layer;
            var app = new Vue({
                el: '.main-content',
                data: {
                    user: ${user}
                },
                methods: {
                    save: function () {
                        if (app.user.userType == "")
                            layer.alert("用户类型不能为空", {icon: 5});
                        else if (app.user.gender == "")
                            layer.alert("性别不能为空", {icon: 5});
                        else if (app.user.password == "")
                            layer.alert("密码不能为空", {icon: 5});
                        else if (app.user.uid== "")
                            layer.alert("学/工号不能为空", {icon: 5});
                        else if (app.user.part == "")
                            layer.alert("所属学院不能为空", {icon: 5});
                        else if (app.user.username == "")
                            layer.alert("姓名不能为空", {icon: 5});
                        else {
                            $.ajax({
                                type: 'POST',
                                url: "/screenos/user/editUser",
                                data: app.user,
                                dataType: 'json',
                                success: function (json) {
                                    layer.closeAll('loading')
                                    if (json.status == 0) {
                                        layer.msg(json.result, {icon: 6});
                                        app.user={};
                                    } else {
                                        layer.alert(json.result, {icon: 5});
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
        });
    });
    function back(){
        window.history.go(-1)
    }
</script>

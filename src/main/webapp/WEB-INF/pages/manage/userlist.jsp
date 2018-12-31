<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="template/head-nav.jsp"%>
    <fieldset class="layui-elem-field layui-field-title"
              style="margin-top: 10px;width:90%">
        <legend>用户列表</legend>
    </fieldset>
    <div class="main-content">
        <div>
            <table id="allusers" class="layui-table" v-cloak style="table-layout:fixed;">
                <colgroup>
                    <col width="5%">
                    <col width="15%">
                    <col width="10%">
                    <col width="15%">
                    <col width="15%">
                    <col width="25%">
                    <col width="15%">
                </colgroup>
                <thead>
                <tr>
                    <th>序号</th>
                    <th>学号</th>
                    <th>姓名</th>
                    <th>用户类型</th>
                    <th>性别</th>
                    <th>最后登录时间</th>
                    <th>所属院系</th>
                </tr>
                </thead>
                <tbody>
                <tr v-for="user in users">
                    <td>{{$index+1}}</td>
                    <td>{{user.uid}}</td>
                    <td>{{user.username}}</td>
                    <td>{{user.userType==1?"管理员":user.userType==2?"设备":"学生"}}</td>
                    <td>{{user.gender==1?"男":user.gender==2?"其他":"女"}}</td>
                    <td>{{user.loginDate}}
                    <td>{{user.part}}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
<%@ include file="template/footer.jsp"%>
<script>
    layui.use(['element', 'layer', 'form'], function () {
        var element = layui.element;
        var layer = layui.layer;
        var i=0;
        var uers =new Array();
        var app = new Vue({
            el: '.main-content',
            data: {
                users: [],
                user: {},
            },
            created: function () {
                this.load();
            },
            methods: {
                load: function () {
                    $.post("/manage/getAllUsers", function (result) {
                        users = result.result;
                        for(i=0;i<users.length;i++)
                        {
                            if(users[i].loginDate == null)
                                users[i].loginDate="从未登陆";
                            else {
                                users[i].loginDate=users[i].loginDate.substring(0,10);
                            }
                        }
                        app.users=users;
                    })
                },
                logout: function () {
                    jQuery.ajax({
                        type: 'POST',
                        url: "/user/logout",
                        data: {},
                        dataType: 'json',
                        success: function (json) {
                            if (json.status == 0) {
                                layer.msg(json.result, {icon: 6});
                                window.location.href = "/index";
                            } else {
                                layer.alert(json.result, {icon: 5});
                            }
                        }
                    });
                }
            }
        });

        function load() {
            app.load();
        }
    });

    function back() {
        window.history.go(-1)
    }
</script>

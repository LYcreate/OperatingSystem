<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="template/head-nav.jsp"%>
<fieldset class="layui-elem-field layui-field-title"
          style="margin-top: 10px;width:90%">
    <legend>活动列表</legend>
</fieldset>
<div class="main-content">
    <div>
        <table id="allacts" class="layui-table" v-cloak style="table-layout:fixed;">
            <colgroup>
                <col width="5%">
                <col width="25%">
                <col width="30%">
                <col width="15%">
                <col width="15%">
            </colgroup>
            <thead>
            <tr>
                <th>序号</th>
                <th>标题</th>
                <th>活动链接</th>
                <th>投稿日期</th>
                <th>截止时间</th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="act in acts">
                <td>{{$index+1}}</td>
                <td>{{act.actname}}</td>
                <td>{{act.address}}</td>
                <td>{{act.subDate}}</td>
                <td>{{act.endDate}}</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<%@ include file="template/footer.jsp"%>
<script>
    layui.use(['element','layer','form'], function() {
        var element = layui.element;
        var layer=layui.layer;
        var acts=new Array();
        var i=0;
        var app = new Vue({
            el:'.main-content',
            data:{
                acts:[],
                act:{},
            },
            created:function(){
                this.load();
            },
            methods:{
                load:function(){
                    jQuery.ajax({
                        type: 'POST',
                        url: "/manage/getAllActs",
                        dataType: 'json',
                        success: function (result) {
                            console.log(result)
                            acts=result.result
                            for(i=0;i<acts.length;i++)
                            {
                                acts[i].subDate=acts[i].subDate.substring(0,10);
                                acts[i].endDate=acts[i].endDate.substring(0,10);
                            }
                            app.acts=acts;
                        }
                    });
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
                },
            }
        });
        function load(){
            app.load();
        }
    });

    function back(){
        window.history.go(-1)
    }
</script>
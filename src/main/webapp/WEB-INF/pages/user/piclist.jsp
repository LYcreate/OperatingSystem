<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ include file="template/head-nav.jsp"%>--%>
<%--<script src="/screenos/js/bootstrap.min.js"></script>--%>
<%--<link rel="stylesheet" href="/screenos/css/bootstrap.min.css">--%>
<%--<fieldset class="layui-elem-field layui-field-title"--%>
          <%--style="margin-top: 10px;width:90%">--%>
    <%--<legend>壁纸列表</legend>--%>
<%--</fieldset>--%>
<%--<div class="main-content">--%>
    <%--<div>--%>

        <%--<table id="allpictures" class="layui-table" v-cloak style="table-layout:fixed;">--%>
            <%--<colgroup>--%>
                <%--<col width="5%">--%>
                <%--<col width="15%">--%>
                <%--<col width="25%">--%>
                <%--<col width="15%">--%>
                <%--<col width="15%">--%>
                <%--<col width="20%">--%>
            <%--</colgroup>--%>
            <%--<thead>--%>
            <%--<tr>--%>
                <%--<th colspan="1" style="text-align:center">操作</th>--%>
                <%--<td colspan="4"><input type="text" placeholder="请输入您想要查询的图片信息" class="form-control" v-model="keyword"/></td>--%>
                <%--<td colspan="1" style="text-align:center">--%>
                    <%--<button class="btn btn-success" v-on:click="find" type="button">--%>
                        <%--查询--%>
                    <%--</button>--%>
                <%--</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<th>序号</th>--%>
                <%--<th>标题</th>--%>
                <%--<th>图片路径</th>--%>
                <%--<th>投稿日期</th>--%>
                <%--<th>截止时间</th>--%>
                <%--<th>有关操作</th>--%>
            <%--</tr>--%>
            <%--</thead>--%>
            <%--<tbody>--%>
            <%--<tr v-for="picture in nowpictures">--%>
                <%--<td>{{$index+1+pagesize*(page-1)}}</td>--%>
                <%--<td>{{picture.picturename}}</td>--%>
                <%--<td style="width:100px;overflow:hidden;white-space:nowrap;word-break:keep-all;">{{picture.url}}</td>--%>
                <%--<td>{{picture.subDate}}</td>--%>
                <%--<td>{{picture.endDate}}</td>--%>
                <%--<td>--%>
                    <%--<div class="layui-btn-group">--%>
                        <%--<button class="layui-btn  layui-btn-normal" v-on:click="show(picture)"><i--%>
                                <%--class="layui-icon"></i>详情信息--%>
                        <%--</button>--%>
                    <%--</div>--%>
                    <%--<div class="layui-btn-group">--%>
                        <%--<button class="layui-btn  layui-btn-normal" v-on:click="del(picture)"><i--%>
                                <%--class="layui-icon"></i>删除--%>
                        <%--</button>--%>
                    <%--</div>--%>
                    <%--<div class="layui-btn-group">--%>
                        <%--&lt;%&ndash;<a role='button' class="btn btn-primary "  href="/screenos/edituser?uid={{user.uid}}"></a>&ndash;%&gt;--%>
                        <%--<button class="layui-btn  layui-btn-normal" v-on:click="add(picture)">--%>
                            <%--<i class="layui-icon"></i>添加到屏幕--%>
                        <%--</button>--%>
                    <%--</div>--%>
                <%--</td>--%>
            <%--</tr>--%>
            <%--</tbody>--%>
        <%--</table>--%>
        <%--<table>--%>
            <%--<tr>--%>
                <%--<td colspan="8"><div id="page"></div></td>--%>
            <%--</tr>--%>
        <%--</table>--%>
        <%--&lt;%&ndash;<tr>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<td colspan="8"><div id="page"></div></td>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</tr>&ndash;%&gt;--%>
        <%--<div class="modal fade" id="pictureDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">--%>
            <%--<div class="modal-dialog" style="height: 100%">--%>
                <%--<div class="modal-content">--%>
                    <%--<div class="modal-header">--%>
                        <%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">--%>
                            <%--&times;--%>
                        <%--</button>--%>
                        <%--<h4 class="modal-title" >--%>
                            <%--{{picture.picturename}}--%>
                        <%--</h4>--%>
                    <%--</div>--%>
                    <%--<div class="modal-body">--%>
                        <%--<b>图片信息：</b><img style="max-height: 200px;" v-bind:src="picture.url" alt="图片丢失或不存在" onerror="this.src='/screenos/images/defaultpic.png'"/>--%>
                        <%--<hr/>--%>
                        <%--<div class="modal-footer">--%>
                            <%--<button type="button" class="btn btn-default" data-dismiss="modal">关闭--%>
                            <%--</button>--%>
                        <%--</div>--%>
                    <%--</div><!-- /.modal-content -->--%>
                <%--</div><!-- /.modal -->--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>
<%--<%@ include file="template/footer.jsp"%>--%>
<%--<script>--%>
    <%--layui.use(['element','layer','form','laypage'], function() {--%>
        <%--var element = layui.element;--%>
        <%--var layer=layui.layer;--%>
        <%--var laypage = layui.laypage;--%>
        <%--var pictures= new Array();--%>
        <%--var i=0;--%>
        <%--var app = new Vue({--%>
            <%--el:'.main-content',--%>
            <%--data:{--%>
                <%--pictures:[],--%>
                <%--picture:{},--%>
                <%--temp:{},--%>
                <%--nowpictures: [],--%>
                <%--page: 1,--%>
                <%--pagesize: 5,--%>
                <%--maxtCount: 0,--%>
                <%--pages: 0,--%>
                <%--keyword:'',--%>
                <%--num:'',--%>
                <%--pics1:[],--%>
                <%--pics2:[],--%>
                <%--pics3:[],--%>
                <%--pics4:[],--%>
            <%--},--%>
            <%--created:function(){--%>
                <%--this.load();--%>
            <%--},--%>
            <%--methods:{--%>
                <%--load:function(){--%>

                    <%--$.ajax({--%>
                        <%--type: 'POST',--%>
                        <%--url: "/screenos/getallpictrues",--%>
                        <%--dataType: 'json',--%>
                        <%--success: function (result) {--%>
                            <%--pageini(result);--%>
                            <%--// console.log(result);--%>
                            <%--// datas=[];--%>
                            <%--// var pics=result;--%>
                            <%--// for(i=0;i<pics.length;i++)--%>
                            <%--// {--%>
                            <%--//     pics[i].subDate=getLocalTime(pics[i].subDate/1000);--%>
                            <%--//     pics[i].endDate=getLocalTime(pics[i].endDate/1000);--%>
                            <%--// }--%>
                            <%--// app.pictures=pics;--%>
                            <%--// app.maxtCount = pics.length;--%>
                            <%--// if(app.maxtCount < app.pagesize)--%>
                            <%--//     app.pagesize = app.maxtCount;--%>
                            <%--// app.pages = app.maxtCount / app.pagesize;--%>
                            <%--// pageini(result);--%>
                            <%--// for (i = 0; i < app.pagesize; i++) {--%>
                            <%--//     app.temp= app.pictures[i];--%>
                            <%--//     datas.push(app.temp);--%>
                            <%--// }--%>
                            <%--// app.nowpictures = datas;--%>
                        <%--}--%>
                    <%--});--%>
                <%--},--%>
                <%--show: function (picture) {--%>
                    <%--app.picture=picture;--%>
                    <%--console.log(picture);--%>
                    <%--$("#pictureDetail").modal("show");--%>
                <%--},--%>
                <%--add:function(picture){--%>
                    <%--window.location.href = "/screenos/user/controlpicture?id="+picture.id;--%>
                <%--},--%>
                <%--find:function(){--%>
                    <%--layer.load(1);--%>
                    <%--$.ajax({--%>
                        <%--type: 'POST',--%>
                        <%--url: "/screenos/keysearch",--%>
                        <%--data: {'keyword':app.keyword},--%>
                        <%--dataType: 'json',--%>
                        <%--success: function (result) {--%>
                            <%--console.log('result');--%>
                            <%--console.log(result);--%>
                            <%--layer.closeAll('loading')--%>
                            <%--if (result.status == 0) {--%>
                                <%--// layer.msg("查询完毕", {icon: 6});--%>
                                <%--// app.nowpictures=result.result;--%>
                                <%--// app.pictures=result.result;--%>
                                <%--app.page=1;--%>
                                <%--pageini(result.result);--%>
                            <%--} else {--%>
                                <%--layer.alert("查询出错", {icon: 5});--%>
                            <%--}--%>
                        <%--}--%>
                    <%--});--%>
                <%--},--%>
                <%--del:function (picture) {--%>
                    <%--layer.confirm('确定删除？', {--%>
                        <%--btn: ['确定','取消'] //按钮--%>
                    <%--}, function() {--%>
                        <%--console.log(picture)--%>
                        <%--$.ajax({--%>
                            <%--type: 'POST',--%>
                            <%--url: "/screenos/deletepictrue",--%>
                            <%--data: {'id':picture.id},--%>
                            <%--dataType: 'json',--%>
                            <%--success: function (json) {--%>
                                <%--layer.closeAll('loading')--%>
                                <%--if (json.status == 0) {--%>
                                    <%--layer.msg(json.result, {icon: 6});--%>
                                    <%--app.load();--%>
                                <%--} else {--%>
                                    <%--layer.alert(json.result, {icon: 5});--%>
                                <%--}--%>
                            <%--}--%>
                        <%--});--%>
                    <%--});--%>
                <%--},--%>
                <%--logout: function () {--%>
                    <%--$.ajax({--%>
                        <%--type: 'POST',--%>
                        <%--url: "/screenos/user/logout",--%>
                        <%--data: {--%>
                        <%--},--%>
                        <%--dataType: 'json',--%>
                        <%--success: function (json) {--%>
                            <%--if (json.status == 1) {--%>
                                <%--layer.msg(json.result, {icon: 6});--%>
                                <%--window.location.href="/index";--%>
                            <%--} else {--%>
                                <%--layer.alert(json.result, {icon: 5});--%>
                            <%--}--%>
                        <%--}--%>
                    <%--});--%>
                <%--},--%>
            <%--}--%>
        <%--});--%>
        <%--function load(){--%>
            <%--app.load();--%>
        <%--}--%>
        <%--function pageini(result){--%>
            <%--console.log(result);--%>
            <%--datas=[];--%>
            <%--var pics=result;--%>
            <%--for(i=0;i<pics.length;i++)--%>
            <%--{--%>
                <%--pics[i].subDate=getLocalTime(pics[i].subDate/1000);--%>
                <%--pics[i].endDate=getLocalTime(pics[i].endDate/1000);--%>
            <%--}--%>
            <%--app.pictures=pics;--%>
            <%--app.maxtCount = pics.length;--%>
            <%--if(app.maxtCount < app.pagesize)--%>
                <%--app.pagesize = app.maxtCount;--%>
            <%--app.pages = app.maxtCount / app.pagesize;--%>
            <%--laypage({--%>
                <%--cont: 'page'--%>
                <%--,pages: app.pages//总页数--%>
                <%--,groups: 3 //连续显示分页数--%>
                <%--,jump: function(obj){--%>
                    <%--if (app.page == obj.curr) return false;--%>
                    <%--app.page = obj.curr;--%>
                    <%--layer.load(1);--%>
                    <%--datas = [];--%>
                    <%--for (i = 0; i < app.pagesize; i++) {--%>
                        <%--app.temp = app.pictures[(app.page-1) * app.pagesize + i];--%>
                        <%--datas.push(app.temp);--%>
                    <%--}--%>
                    <%--app.nowpictures = datas;--%>
                    <%--layer.closeAll('loading');--%>
                <%--}--%>
            <%--});--%>
            <%--for (i = 0; i < app.pagesize; i++) {--%>
                <%--app.temp= app.pictures[i];--%>
                <%--datas.push(app.temp);--%>
            <%--}--%>
            <%--app.nowpictures = datas;--%>
            <%--console.log(app.nowpictures);--%>
        <%--}--%>
    <%--});--%>

    <%--function back(){--%>
        <%--window.history.go(-1)--%>
    <%--}--%>

    <%--function getLocalTime(nS) {--%>
        <%--return new Date(parseInt(nS) * 1000).toLocaleString().replace(/:\d{1,2}$/,' ');--%>
    <%--}--%>


<%--</script>--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="template/head-nav.jsp"%>
<script src="/screenos/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/screenos/css/bootstrap.min.css">
<fieldset class="layui-elem-field layui-field-title"
          style="margin-top: 10px;width:90%">
    <legend>壁纸列表</legend>
</fieldset>
<div class="main-content">
    <div>

        <table id="allpictures" class="layui-table" v-cloak style="table-layout:fixed;">
            <%--<colgroup>--%>
                <%--<col width="5%">--%>
                <%--<col width="15%">--%>
                <%--<col width="25%">--%>
                <%--<col width="15%">--%>
                <%--<col width="15%">--%>
                <%--<col width="20%">--%>
            <%--</colgroup>--%>
            <colgroup>
                <col width="20%">
                <col width="20%">
                <col width="20%">
                <col width="20%">
                <col width="20%">
            </colgroup>
                <thead>
                    <tr>
                        <th colspan="1" style="text-align:center">操作</th>
                        <td colspan="3"><input type="text" placeholder="请输入您想要查询的图片信息" class="form-control" v-model="keyword"/></td>
                        <td colspan="1" style="text-align:center">
                            <button class="btn btn-success" v-on:click="find" type="button">
                                查询
                            </button>
                        </td>
                    </tr>
                <%--<tr>--%>
                    <%--<th>序号</th>--%>
                    <%--<th>标题</th>--%>
                    <%--<th>图片路径</th>--%>
                    <%--<th>投稿日期</th>--%>
                    <%--<th>截止时间</th>--%>
                    <%--<th>有关操作</th>--%>
                <%--</tr>--%>
                </thead>
            <tbody>
                    <tr>
                        <td v-for="picture in pics1">
                            <%--<img src="{{picture.url}}" width="100%" height="200px">--%>
                            <img v-bind:src="picture.url" width="100%" height="175px">
                            <hr style="height:1px;border:none;border-top:1px solid #555;" />
                            <div style="text-align: center">
                                <div class="layui-btn-group">
                                    <button class="layui-btn  layui-btn-normal" v-on:click="show(picture)"><i
                                            class="layui-icon"></i>查看详情信息
                                    </button>
                                </div>
                                <div class="layui-btn-group">
                                    <button class="layui-btn  layui-btn-normal" v-on:click="del(picture)"><i
                                            class="layui-icon"></i>删除
                                    </button>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td v-for="picture in pics2">
                            <img v-bind:src="picture.url" width="100%" height="175px">
                            <hr style="height:1px;border:none;border-top:1px solid #555;" />
                            <div  style="text-align: center">
                                <div class="layui-btn-group">
                                    <button class="layui-btn  layui-btn-normal" v-on:click="show(picture)"><i
                                            class="layui-icon"></i>查看详情信息
                                    </button>
                                </div>
                                <div class="layui-btn-group">
                                    <button class="layui-btn  layui-btn-normal" v-on:click="del(picture)"><i
                                            class="layui-icon"></i>删除
                                    </button>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td v-for="picture in pics3">
                            <img v-bind:src="picture.url" width="100%" height="175px">
                            <hr style="height:1px;border:none;border-top:1px solid #555;" />
                            <div style="text-align: center">
                                <div class="layui-btn-group">
                                    <button class="layui-btn  layui-btn-normal" v-on:click="show(picture)"><i
                                            class="layui-icon"></i>查看详情信息
                                    </button>
                                </div>
                                <div class="layui-btn-group">
                                    <button class="layui-btn  layui-btn-normal" v-on:click="del(picture)"><i
                                            class="layui-icon"></i>删除
                                    </button>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td v-for="picture in pics4">
                            <img v-bind:src="picture.url" width="100%" height="175px">
                            <hr style="height:1px;border:none;border-top:1px solid #555;" />
                            <div style="text-align: center">
                                <div class="layui-btn-group">
                                    <button class="layui-btn  layui-btn-normal" v-on:click="show(picture)"><i
                                            class="layui-icon"></i>查看详情信息
                                    </button>
                                </div>
                                <div class="layui-btn-group">
                                    <button class="layui-btn  layui-btn-normal" v-on:click="del(picture)"><i
                                        class="layui-icon"></i>删除
                                    </button>
                                </div>
                            </div>
                        </td>
                    </tr>
            <%--<tr v-for="picture in nowpictures">--%>
                <%--<td>{{$index+1+pagesize*(page-1)}}</td>--%>
                <%--<td>{{picture.picturename}}</td>--%>
                <%--<td style="width:100px;overflow:hidden;white-space:nowrap;word-break:keep-all;">{{picture.url}}</td>--%>
                <%--<td>{{picture.subDate}}</td>--%>
                <%--<td>{{picture.endDate}}</td>--%>
                <%--<td>--%>
                    <%--<div class="layui-btn-group">--%>
                        <%--<button class="layui-btn  layui-btn-normal" v-on:click="show(picture)"><i--%>
                                <%--class="layui-icon"></i>详情信息--%>
                        <%--</button>--%>
                    <%--</div>--%>
                    <%--<div class="layui-btn-group">--%>
                        <%--<button class="layui-btn  layui-btn-normal" v-on:click="del(picture)"><i--%>
                                <%--class="layui-icon"></i>删除--%>
                        <%--</button>--%>
                    <%--</div>--%>
                    <%--<div class="layui-btn-group">--%>
                        <%--&lt;%&ndash;<a role='button' class="btn btn-primary "  href="/screenos/edituser?uid={{user.uid}}"></a>&ndash;%&gt;--%>
                        <%--<button class="layui-btn  layui-btn-normal" v-on:click="add(picture)">--%>
                            <%--<i class="layui-icon"></i>添加到屏幕--%>
                        <%--</button>--%>
                    <%--</div>--%>
                <%--</td>--%>
            <%--</tr>--%>
            </tbody>
        </table>
        <table>
            <tr>
                <td colspan="8"><div id="page"></div></td>
            </tr>
        </table>
        <%--<tr>--%>
        <%--<td colspan="8"><div id="page"></div></td>--%>
        <%--</tr>--%>
        <div class="modal fade" id="pictureDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" style="height: 100%">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" >
                            {{picture.picturename}}
                        </h4>
                    </div>
                    <div class="modal-body">
                        <b>图片信息：</b><img style="max-height: 200px;" v-bind:src="picture.url" alt="图片丢失或不存在" onerror="this.src='/screenos/images/defaultpic.png'"/>
                        <hr/>
                        <b>图片地址：</b><div style="width:100px;overflow:fragments;white-space:nowrap;word-break:keep-all;">{{picture.url}}</div>
                        <hr/>
                        <b>有效期至：</b><div style="width:100px;overflow:fragments;white-space:nowrap;word-break:keep-all;">{{picture.endDate}}</div>
                        <hr/>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default"  v-on:click="add(picture)">
                                <i class="layui-icon">添加到屏幕</i>
                            </button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                            </button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>
        </div>
    </div>
</div>
<%@ include file="template/footer.jsp"%>
<script>
    layui.use(['element','layer','form','laypage'], function() {
        var element = layui.element;
        var layer=layui.layer;
        var laypage = layui.laypage;
        var pictures= new Array();
        var i=0;
        var app = new Vue({
            el:'.main-content',
            data:{
                pictures:[],
                picture:{},
                temp:{},
                nowpictures: [],
                page: 1,
                pagesize: 20,
                maxtCount: 0,
                pages: 0,
                keyword:'',
                num:'',
                pics1:[],
                pics2:[],
                pics3:[],
                pics4:[],
            },
            created:function(){
                this.load();
            },
            methods:{
                load:function(){
                    $.ajax({
                        type: 'POST',
                        url: "/screenos/getallpictrues",
                        dataType: 'json',
                        success: function (result) {
                            pageini(result);
                            app.changetofour(app.nowpictures);
                            // console.log(result);
                            // datas=[];
                            // var pics=result;
                            // for(i=0;i<pics.length;i++)
                            // {
                            //     pics[i].subDate=getLocalTime(pics[i].subDate/1000);
                            //     pics[i].endDate=getLocalTime(pics[i].endDate/1000);
                            // }
                            // app.pictures=pics;
                            // app.maxtCount = pics.length;
                            // if(app.maxtCount < app.pagesize)
                            //     app.pagesize = app.maxtCount;
                            // app.pages = app.maxtCount / app.pagesize;
                            // pageini(result);
                            // for (i = 0; i < app.pagesize; i++) {
                            //     app.temp= app.pictures[i];
                            //     datas.push(app.temp);
                            // }
                            // app.nowpictures = datas;
                        }
                    });
                },
                show: function (picture) {
                    app.picture=picture;
                    console.log(picture);
                    $("#pictureDetail").modal("show");
                },
                changetofour:function(data){
                    console.log(data.length);
                    if(data.length>5){
                        for(i=0;i<5;i=i+1){
                            app.pics1.push(data[i]);
                        }
                    }else{
                        for(i=0;i<data.length;i++){
                            app.pics1.push(data[i]);}
                    }


                    if(data.length>10){
                        for(i=5;i<10;i++)
                            app.pics2.push(data[i]);
                    }else{
                        for(i=5;i<data.length;i++)
                            app.pics2.push(data[i]);
                    }


                    if(data.length>15){
                        for(i=10;i<15;i++)
                            app.pics3.push(data[i]);
                    }else{
                        for(i=10;i<data.length;i++)
                            app.pics3.push(data[i]);
                    }

                    if(data.length>20){
                        for(i=15;i<20;i++)
                            app.pics4.push(data[i]);
                    }else{
                        for(i=15;i<data.length;i++)
                            app.pics4.push(data[i]);
                    }
                    // console.log(app.pics1);
                    // console.log(app.pics2);
                    // console.log(app.pics3);
                    // console.log(app.pics4);
                },
                reset:function(){
                    app.pics1=[];
                    app.pics2=[];
                    app.pics3=[];
                    app.pics4=[];
                },
                add:function(picture){
                    window.location.href = "/screenos/user/controlpicture?id="+picture.id;
                },
                find:function(){
                    app.reset();
                    app.pagesize=20;
                    layer.load(1);
                    $.ajax({
                        type: 'POST',
                        url: "/screenos/keysearch",
                        data: {'keyword':app.keyword},
                        dataType: 'json',
                        success: function (result) {
                            console.log('result');
                            console.log(result);
                            layer.closeAll('loading')
                            if (result.status == 0) {
                                // layer.msg("查询完毕", {icon: 6});
                                // app.nowpictures=result.result;
                                // app.pictures=result.result;
                                app.page=1;
                                pageini(result.result);
                                app.changetofour(app.nowpictures);
                            } else {
                                layer.alert("查询出错", {icon: 5});
                            }
                        }
                    });
                },
                del:function (picture) {
                    layer.confirm('确定删除？', {
                        btn: ['确定','取消'] //按钮
                    }, function() {
                        console.log(picture)
                        $.ajax({
                            type: 'POST',
                            url: "/screenos/deletepictrue",
                            data: {'id':picture.id},
                            dataType: 'json',
                            success: function (json) {
                                layer.closeAll('loading')
                                if (json.status == 0) {
                                    layer.msg(json.result, {icon: 6});
                                    app.load();
                                } else {
                                    layer.alert(json.result, {icon: 5});
                                }
                            }
                        });
                    });
                },
                logout: function () {
                    $.ajax({
                        type: 'POST',
                        url: "/screenos/user/logout",
                        data: {
                        },
                        dataType: 'json',
                        success: function (json) {
                            if (json.status == 1) {
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
        function pageini(result){
            console.log(result);
            datas=[];
            var pics=result;
            for(i=0;i<pics.length;i++)
            {
                pics[i].subDate=getLocalTime(pics[i].subDate/1000);
                pics[i].endDate=getLocalTime(pics[i].endDate/1000);
            }
            app.pictures=pics;
            app.maxtCount = pics.length;
            if(app.maxtCount < app.pagesize)
                app.pagesize = app.maxtCount;
            app.pages = parseInt(app.maxtCount / app.pagesize);
            if(app.pagesize*app.pages<app.maxtCount)
                app.pages=app.pages+1;
            laypage({
                cont: 'page'
                ,pages: app.pages//总页数
                ,groups: 3 //连续显示分页数
                ,jump: function(obj){
                    if (app.page == obj.curr) return false;
                    app.reset();
                    app.page = obj.curr;
                    console.log("laypage!!!");
                    console.log(app.pictures);
                    console.log(app.pages);
                    console.log(app.page);
                    if(app.page<app.pages){
                        layer.load(1);
                        datas = [];
                        for (i = 0; i < app.pagesize; i++) {
                            app.temp = app.pictures[(app.page-1) * app.pagesize + i]
                            // app.temp.endDate=getLocalTime(app.temp.endDate);
                            datas.push(app.temp);
                        }
                        app.nowpictures = datas;
                        app.changetofour(app.nowpictures);
                        layer.closeAll('loading');
                    }else{
                        layer.load(1);
                        datas = [];
                        var nowpos = (app.page-1) * app.pagesize;
                        console.log(nowpos);
                        for (i = nowpos; i <  app.maxtCount ; i++) {
                            app.temp = app.pictures[i];
                            // app.temp.endDate=getLocalTime(app.temp.endDate);
                            // console.log(app.pictures[i]);
                            datas.push(app.temp);
                        }
                        // console.log(datas);
                        app.nowpictures = datas;
                        app.changetofour(app.nowpictures);
                        layer.closeAll('loading');
                    }
                }
            });
            //第一次才执行 后面只在laypage里面执行
            for (i = 0; i < app.pagesize; i++) {
                app.temp= app.pictures[i];
                datas.push(app.temp);
            }
            app.nowpictures = datas;
            // console.log(app.nowpictures);
        }
    });

    function getLocalTime(nS) {
        return new Date(parseInt(nS) * 1000).toLocaleString().replace(/:\d{1,2}$/,' ');
    }

</script>
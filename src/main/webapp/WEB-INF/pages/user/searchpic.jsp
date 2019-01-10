<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="template/head-nav.jsp"%>
<script src="/screenos/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/screenos/css/bootstrap.min.css">
<fieldset class="layui-elem-field layui-field-title"
          style="margin-top: 10px;width:90%">
    <legend>在线图片资源</legend>
</fieldset>
<div class="main-content">
    <div>
        <table id="searchpictures" class="layui-table" v-cloak style="table-layout:fixed;">
            <thead>
            <tr>
                <th colspan="1" style="text-align:center">操作</th>
                <td colspan="2"><input type="text" placeholder="请输入图片关键词！" class="form-control" v-model="keyword"/></td>
                <td colspan="1"><input type="text" placeholder="请输入请求图片数量" class="form-control" v-model="num"/></td>
                <td colspan="1" style="text-align:center">
                    <button class="btn btn-success" v-on:click="search" type="button">
                        搜索
                    </button>
                </td>
            </tr>
            </thead>
        </table>
        <table id="allpictures" class="layui-table" v-cloak style="table-layout:fixed;">
            <colgroup>
                <col width="20%">
                <col width="20%">
                <col width="20%">
                <col width="20%">
                <col width="20%">
            </colgroup>
            <tbody>
            <div>
                <tr>
                    <td v-for="picture in pics1">
                        <%--<img src="{{picture.url}}" width="100%" height="200px">--%>
                        <img v-bind:src="picture.url" width="100%" height="175px">
                        <hr style="height:1px;border:none;border-top:1px solid #555;" />
                        <div>
                            <div class="layui-btn-group" style="text-align: left">
                                <button class="layui-btn  layui-btn-normal" v-on:click="show(picture)"><i
                                        class="layui-icon"></i>查看详情信息
                                </button>
                            </div>
                            <div class="layui-btn-group" style="text-align: right">
                                <button class="layui-btn  layui-btn-normal"  v-on:click="add(picture)"><i
                                        class="layui-icon"></i>添加到本地
                                </button>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td v-for="picture in pics2">
                        <img v-bind:src="picture.url" width="100%" height="175px">
                        <hr style="height:1px;border:none;border-top:1px solid #555;" />
                        <div>
                            <div class="layui-btn-group" style="text-align: left">
                                <button class="layui-btn  layui-btn-normal" v-on:click="show(picture)"><i
                                        class="layui-icon"></i>查看详情信息
                                </button>
                            </div>
                            <div class="layui-btn-group" style="text-align: right">
                                <button class="layui-btn  layui-btn-normal" v-on:click="add(picture)"><i
                                        class="layui-icon"></i>添加到本地
                                </button>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td v-for="picture in pics3">
                        <img v-bind:src="picture.url" width="100%" height="175px">
                        <hr style="height:1px;border:none;border-top:1px solid #555;" />
                        <div>
                            <div class="layui-btn-group" style="text-align: left">
                                <button class="layui-btn  layui-btn-normal" v-on:click="show(picture)"><i
                                        class="layui-icon"></i>查看详情信息
                                </button>
                            </div>
                            <div class="layui-btn-group" style="text-align: right">
                                <button class="layui-btn  layui-btn-normal" v-on:click="add(picture)"><i
                                        class="layui-icon"></i>添加到本地
                                </button>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td v-for="picture in pics4">
                        <img v-bind:src="picture.url" width="100%" height="175px">
                        <hr style="height:1px;border:none;border-top:1px solid #555;" />
                        <div>
                            <div class="layui-btn-group" style="text-align: left">
                                <button class="layui-btn  layui-btn-normal" v-on:click="show(picture)"><i
                                        class="layui-icon"></i>查看详情信息
                                </button>
                            </div>
                            <div class="layui-btn-group" style="text-align: right">
                                <button class="layui-btn  layui-btn-normal" v-on:click="add(picture)"><i
                                        class="layui-icon"></i>添加到本地
                                </button>
                            </div>
                        </div>
                    </td>
                </tr>
            </div>
            </tbody>
            <tr>
                <td colspan="6"><div id="page"></div></td>
            </tr>
        </table>
        <div class="modal fade" id="pictureDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" style="height: 100%">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" >
                            {{picture.originalName}}
                        </h4>
                    </div>
                    <div class="modal-body">
                        <b>图片信息：</b><img style="max-height: 200px;" v-bind:src="picture.url" alt="图片丢失或不存在" onerror="this.src='/screenos/images/defaultpic.png'"/>
                        <hr/>
                        <div class="modal-footer">
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
        var pictures= [];
        var i=0;
        var app = new Vue({
            el:'.main-content',
            data:{
                searchresult:{},
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
                        // $.ajax({
                        //     type: 'POST',
                        //     url: "/screenos/getallpictrues",
                        //     dataType: 'json',
                        //     success: function (result) {
                        //         pageini(result);
                        //         app.changetofour(app.nowpictures);
                        //         // console.log(result);
                        //         // datas=[];
                        //         // var pics=result;
                        //         // for(i=0;i<pics.length;i++)
                        //         // {
                        //         //     pics[i].subDate=getLocalTime(pics[i].subDate/1000);
                        //         //     pics[i].endDate=getLocalTime(pics[i].endDate/1000);
                        //         // }
                        //         // app.pictures=pics;
                        //         // app.maxtCount = pics.length;
                        //         // if(app.maxtCount < app.pagesize)
                        //         //     app.pagesize = app.maxtCount;
                        //         // app.pages = app.maxtCount / app.pagesize;
                        //         // pageini(result);
                        //         // for (i = 0; i < app.pagesize; i++) {
                        //         //     app.temp= app.pictures[i];
                        //         //     datas.push(app.temp);
                        //         // }
                        //         // app.nowpictures = datas;
                        //     }
                        // });
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
                    layer.load(1);
                    console.log(picture);
                    console.log(picture.originalName);
                    $.ajax({
                        type: 'POST',
                        url: "/screenos/getorgipictrues",
                        data: {'orginalfilename': picture.originalName},
                        dataType: 'json',
                        success: function (result) {
                            console.log('result');
                            console.log(result);
                            console.log(result.result.originalName);
                            layer.closeAll('loading');
                            // var str = b64EncodeUnicode(result.originalName);
                            if (result.status == 0) {
                                app.page=1;
                                window.location.href = "/screenos/user/editpicture?url="+result.result.originalName;
                            } else {
                                layer.alert("添加时出错", {icon: 5});
                            }
                        }
                    });
                },
                search:function(){
                    this.reset();
                    layer.load(1);
                    $.ajax({
                        type: 'POST',
                        url: "/screenos/searchpictrues",
                        data: {'keyword':app.keyword,'num':app.num,'batch':app.page},
                        dataType: 'json',
                        success: function (result) {
                            console.log('result');
                            console.log(result);
                            app.searchresult=result,
                            layer.closeAll('loading');
                            if (result.status == 0) {
                                app.page=1;
                                pageini(result.result.resultList);
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
                        console.log(picture);
                        $.ajax({
                            type: 'POST',
                            url: "/screenos/deletepictrue",
                            data: {'id':picture.id},
                            dataType: 'json',
                            success: function (json) {
                                layer.closeAll('loading');
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
            // for(i=0;i<pics.length;i++)
            // {
            //     pics[i].subDate=getLocalTime(pics[i].subDate/1000);
            //     pics[i].endDate=getLocalTime(pics[i].endDate/1000);
            // }
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
                            app.temp = app.pictures[(app.page-1) * app.pagesize + i];
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
        // function pageini(result){
        //     datas=[];
        //     var pics=result.result.resultList;
        //     console.log(pics);
        //     for(i=0;i<pics.length;i++)
        //     {
        //         pics[i].url="https://alpha.wallhaven.cc/wallpapers/thumb/small/th-"+pics[i].originalName;
        //     }
        //     console.log(pics);
        //     app.pictures=pics;
        //     app.maxtCount = pics.length;
        //     if(app.maxtCount < app.pagesize)
        //         app.pagesize = app.maxtCount;
        //     app.pages = app.maxtCount / app.pagesize;
        //     console.log(app.pages);
        //     laypage({
        //         cont: 'page'
        //         ,pages: app.pages//总页数
        //         ,groups: 3 //连续显示分页数
        //         ,jump: function(obj){
        //             if (app.page == obj.curr) return false;
        //             app.page = obj.curr;
        //             layer.load(1);
        //             datas = [];
        //             for (i = 0; i < app.pagesize; i++) {
        //                 app.temp = app.pictures[(app.page-1) * app.pagesize + i];
        //                 datas.push(app.temp);
        //             }
        //             app.nowpictures = datas;
        //             layer.closeAll('loading');
        //         }
        //     });
        //     for (i = 0; i < app.pagesize; i++) {
        //         app.temp= app.pictures[i];
        //         datas.push(app.temp);
        //     }
        //     app.nowpictures = datas;
        //     console.log(app.pictures);
        //     console.log(app.nowpictures);
        // }
    });

    function back(){
        window.history.go(-1)
    }

    function getLocalTime(nS) {
        return new Date(parseInt(nS) * 1000).toLocaleString().replace(/:\d{1,2}$/,' ');
    }

    function b64EncodeUnicode(str) {
        return btoa(encodeURIComponent(str).replace(/%([0-9A-F]{2})/g, function(match, p1) {
            return String.fromCharCode('0x' + p1);
        }))};
</script>
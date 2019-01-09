<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="template/head-nav.jsp"%>
<script src="/screenos/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/screenos/css/bootstrap.min.css">
<fieldset class="layui-elem-field layui-field-title"
          style="margin-top: 10px;width:90%">
    <legend>在线图片资源列表</legend>
</fieldset>
<div class="main-content">
    <div>

        <table id="allpictures" class="layui-table" v-cloak style="table-layout:fixed;">
            <colgroup>
                <col width="5%">
                <col width="15%">
                <col width="25%">
                <col width="15%">
                <col width="20%">
            </colgroup>
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
            <tr>
                <th>序号</th>
                <th>图片名字</th>
                <th>图片路径</th>
                <th>文件大小(Byte)</th>
                <th>有关操作</th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="picture in nowpictures">
                <td>{{$index+1+pagesize*(page-1)}}</td>
                <td>{{picture.originalName}}</td>
                <td style="width:100px;overflow:hidden;white-space:nowrap;word-break:keep-all;">{{picture.url}}</td>
                <td>{{picture.picsize}}</td>
                <td>
                    <div class="layui-btn-group">
                        <button class="layui-btn  layui-btn-normal" v-on:click="show(picture)"><i
                                class="layui-icon"></i>详情信息
                        </button>
                    </div>
                    <div class="layui-btn-group">
                        <button class="layui-btn  layui-btn-normal" v-on:click="add(picture)"><i
                                class="layui-icon"></i>添加到本地
                        </button>
                    </div>
                    <%--<div class="layui-btn-group">--%>
                    <%--&lt;%&ndash;<a role='button' class="btn btn-primary "  href="/screenos/edituser?uid={{user.uid}}"></a>&ndash;%&gt;--%>
                    <%--<button class="layui-btn  layui-btn-normal" v-on:click="edit(picture)">--%>
                    <%--<i class="layui-icon"></i>编辑--%>
                    <%--</button>--%>
                    <%--</div>--%>
                </td>
            </tr>
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
                            {{picture.picturename}}
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
        var pictures= new Array();
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
                pagesize: 5,
                maxtCount: 0,
                pages: 0,
                keyword:'',
                num:5,
            },
            created:function(){
                this.load();
            },
            methods:{
                load:function(){

                },
                show: function (picture) {
                    app.picture=picture;
                    console.log(picture);
                    $("#pictureDetail").modal("show");
                },
                edit:function(picture){
                    window.location.href = "/screenos/editpicture?id="+picture.id;
                },
                search:function(){
                    layer.load(1);
                    console.log(app.keyword);
                    console.log(app.num);
                    $.ajax({
                        type: 'POST',
                        url: "/screenos/searchpictrues",
                        data: {'keyword':this.keyword,'num':this.num,'batch':0},
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
                                pageini(result);
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
            datas=[];
            var pics=result.result.resultList;
            console.log(pics);
            for(i=0;i<pics.length;i++)
            {
                pics[i].url="https://alpha.wallhaven.cc/wallpapers/thumb/small/th-"+pics[i].originalName;
            }
            console.log(pics);
            app.pictures=pics;
            app.maxtCount = pics.length;
            if(app.maxtCount < app.pagesize)
                app.pagesize = app.maxtCount;
            app.pages = app.maxtCount / app.pagesize;
            console.log(app.pages);
            laypage({
                cont: 'page'
                ,pages: app.pages//总页数
                ,groups: 3 //连续显示分页数
                ,jump: function(obj){
                    if (app.page == obj.curr) return false;
                    app.page = obj.curr;
                    layer.load(1);
                    datas = [];
                    for (i = 0; i < app.pagesize; i++) {
                        app.temp = app.pictures[(app.page-1) * app.pagesize + i];
                        datas.push(app.temp);
                    }
                    app.nowpictures = datas;
                    layer.closeAll('loading');
                }
            });
            for (i = 0; i < app.pagesize; i++) {
                app.temp= app.pictures[i];
                datas.push(app.temp);
            }
            app.nowpictures = datas;
            console.log(app.pictures);
            console.log(app.nowpictures);
        }
    });

    function back(){
        window.history.go(-1)
    }

    function getLocalTime(nS) {
        return new Date(parseInt(nS) * 1000).toLocaleString().replace(/:\d{1,2}$/,' ');
    }
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"
            +request.getServerPort()+path;
    String socketpath="ws://"+request.getServerName()+":"
            +request.getServerPort()+path+"/";
    request.getSession().setAttribute("uid","654321");
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="Generator" content="EditPlus®">
    <meta name="Author" content="">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <title>Document</title>
    <script src="<%=basePath%>/js/vue.min.js"></script>
    <script src="<%=basePath%>/js/vue-router.min.js"></script>
    <script src="<%=basePath%>/js/jquery.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>/css/swiper.css">
    <link rel="stylesheet" href="<%=basePath%>/css/swiper.min.css">
    <script src="<%=basePath%>/js/swiper.js"></script>
    <script src="<%=basePath%>/js/swiper.min.js"></script>

    <style>
        .swiper-container1 {
            width: 50%;
            height: 50%;
        }

        .swiper-container2 {
            width: 50%;
            height: 50%;
        }
        .swiper-container3 {
            width: 50%;
            height: 50%;
        }
        .swiper-container4 {
            width: 50%;
            height: 50%;
         /*755*422*/
        }
    </style>
</head>
<body>
<div class="demo" style="width:1524px;height:844px">
    <div class="swiper-container1" style="float:left" >
        <div class="swiper-wrapper">
            <div v-for="pica in picas" class="swiper-slide swiper-slide-next"><img style="width:100%;height:422px" v-bind:src="pica" ></div>
        </div>
        <%--<!--  如果需要分页器 -->--%>
        <%--<div class="swiper-pagination"></div>    --%>
        <%--<!--  如果需要导航按钮 -->--%>
        <%--<div class="swiper-button-prev"></div>--%>
        <%--<div class="swiper-button-next"></div>--%>
        <%--<!-- 如果需要滚动条 -->--%>
        <%--<div class="swiper-scrollbar"></div> --%>
    </div>

    <div class="swiper-container2" style="float:right ">
        <div class="swiper-wrapper">
            <div v-for="picb in picbs" class="swiper-slide swiper-slide-next"><img  style="width:100%;height:422px" v-bind:src="picb" ></div>
        </div>
    </div>
    <%--style="width:50%;height:540px"--%>
    <div class="swiper-container3" style="float:left" >
        <div class="swiper-wrapper">
            <div v-for="picc in piccs" class="swiper-slide swiper-slide-next"><img  style="width:100%;height:422px" v-bind:src="picc" ></div>
        </div>
    </div>

    <div class="swiper-container4" style="float:right ">
        <div class="swiper-wrapper">
            <div v-for="picd in picds" class="swiper-slide swiper-slide-next"><img  style="width:100%;height:422px" v-bind:src="picd" ></div>
        </div>
    </div>

</div>

<script>
    var url ='<%=socketpath%>ws';
    var para={'uid':"123456"};
    var strpara=JSON.stringify(para);
    var sock = new WebSocket(url);      //打开WebSocket

    sock.onopen = function() {          //处理连接开启事件
        console.log('Opening');
    };
    // sayMarco();
    sock.onmessage = function(e) {      //处理信息
        console.log('Received Message: ');
        console.log(e);
        // console.log(e.data["pictureid"]);
        var result=e["data"];
        console.log(result);
        // console.log(result["pictureid"]);
        console.log(result["pictureid"]);
        console.log(result.pictureid);
        var obj = JSON.parse(result);
        console.log(obj["pictureid"]);
        console.log(obj.pictureid);
        console.log(obj);
        result=obj;
        // console.log(result.getAttr("pictureid"));
        // console.log(result.get("pictureid"));
        if(result["postion"]==1){
            if(result["isrefresh"]==1){
                console.log(vmm.picas);
                $.ajax({
                    url: '/screenos/getpicbyid',
                    type: 'Get',
                    data:{'id':result["pictureid"]},
                    success: function (data) { // 接口调用成功回调函数
                        console.log(data);
                        vmm.picas.push(data.url);
                        console.log(vmm.picas);
                    }
                 });
            }else{
                console.log(result.time);
                autoslide.autosetA(2,result.time*1000);
                if(result.time>0)
                autoslide.autosetA(1,result.time*1000);
                else{
                    autoslide.autosetA(2,result.time*1000);
                }
            }
        }else if(result.postion==2){
            if(result.isrefresh==1){
                console.log(vmm.picbs);
                $.ajax({
                    url: '/screenos/getpicbyid',
                    type: 'Get',
                    data:{'id':result["pictureid"]},
                    success: function (data) { // 接口调用成功回调函数
                        console.log(data);
                        vmm.picbs.push(data.url);
                        console.log(vmm.picbs);
                    }
                });
            }else{
                console.log(result.time);
                autoslide.autosetB(2,result.time*1000);
                if(result.time>0)
                    autoslide.autosetB(1,result.time*1000);
                else{
                    autoslide.autosetB(2,result.time*1000);
                }
            }
        }else if(result.postion==3){
            if(result.isrefresh==1){
                console.log(vmm.piccs);
                $.ajax({
                    url: '/screenos/getpicbyid',
                    type: 'Get',
                    data:{'id':result["pictureid"]},
                    success: function (data) { // 接口调用成功回调函数
                        console.log(data);
                        vmm.piccs.push(data.url);
                        console.log(vmm.piccs);
                    }
                });
            }else {
                console.log(result.time);
                if (result.time > 0) {
                    autoslide.autosetC(2, result.time * 1000);
                    autoslide.autosetC(1, result.time * 1000);
                }else{
                    autoslide.autosetC(2,result.time*1000);
                }
            }
        }else if(result.postion==4){
            if(result.isrefresh==1){
                console.log(vmm.picds);
                $.ajax({
                    url: '/screenos/getpicbyid',
                    type: 'Get',
                    data:{'id':result["pictureid"]},
                    success: function (data) { // 接口调用成功回调函数
                        console.log(data);
                        vmm.picds.push(data.url);
                        console.log(vmm.picds);
                    }
                });
            }else{
                console.log(result.time);
                autoslide.autosetD(2,result.time*1000);
                if(result.time>0)
                    autoslide.autosetD(1,result.time*1000);
                else{
                    autoslide.autosetD(2,result.time*1000);
                }
            }
        }
    //     $.ajax({
    //         url: 'http://localhost:8080/screenos/getpicbyid',
    //         type: 'Get',
    //         data:{id:e.data["pictureid"]},
    //         success: function (data) { // 接口调用成功回调函数
    //
    //         }
    //      )
    };
    <%--function testpic() {--%>
        <%--$.ajax({--%>
            <%--url: 'http://localhost:8080/screenos/gettestpiclist2',--%>
            <%--type: 'Get',--%>
            <%--success: function (data) { // 接口调用成功回调函数--%>
                <%--console.log(data);--%>
                <%--console.log(1);--%>
                <%--var presrc = "<%=basePath%>"--%>
                <%--var srcs = new Array(data.length)--%>
                <%--for (var i = 0; i < data.length; i++) {--%>
                    <%--srcs[i] = presrc + data[i];--%>
                    <%--console.log(srcs[i]);--%>
                    <%--console.log(11);--%>
                <%--}--%>
                <%--vmm.picas = srcs;--%>
                <%--console.log(vmm.picas);--%>
                <%--console.log(111);--%>
            <%--}--%>
        <%--});--%>
        <%--$.ajax({--%>
            <%--url: 'http://localhost:8080/screenos/gettestpiclist2',--%>
            <%--type: 'Get',--%>
            <%--success: function (data) { // 接口调用成功回调函数--%>
                <%--console.log(data);--%>
                <%--console.log(2);--%>
                <%--var presrc = "<%=basePath%>"--%>
                <%--var srcs = new Array(data.length)--%>
                <%--for (var i = 0; i < data.length; i++) {--%>
                    <%--srcs[i] = presrc + data[i];--%>
                    <%--console.log(srcs[i]);--%>
                    <%--console.log(22);--%>
                <%--}--%>
                <%--vmm.picbs = srcs;--%>
                <%--console.log(vmm.picbs);--%>
                <%--console.log(222);--%>
            <%--}--%>
        <%--});--%>
        <%--$.ajax({--%>
            <%--url: 'http://localhost:8080/screenos/gettestpiclist2',--%>
            <%--type: 'Get',--%>
            <%--success: function (data) { // 接口调用成功回调函数--%>
                <%--console.log(data);--%>
                <%--console.log(3);--%>
                <%--var presrc = "<%=basePath%>"--%>
                <%--var srcs = new Array(data.length)--%>
                <%--for (var i = 0; i < data.length; i++) {--%>
                    <%--srcs[i] = presrc + data[i];--%>
                    <%--console.log(srcs[i]);--%>
                    <%--console.log(33);--%>
                <%--}--%>
                <%--vmm.piccs = srcs;--%>
                <%--console.log(vmm.piccs);--%>
                <%--console.log(333);--%>
            <%--}--%>
        <%--});--%>
        <%--$.ajax({--%>
            <%--url: 'http://localhost:8080/screenos/gettestpiclist2',--%>
            <%--type: 'Get',--%>
            <%--success: function (data) { // 接口调用成功回调函数--%>
                <%--console.log(data);--%>
                <%--console.log(4);--%>
                <%--var presrc = "<%=basePath%>"--%>
                <%--var srcs = new Array(data.length)--%>
                <%--for (var i = 0; i < data.length; i++) {--%>
                    <%--srcs[i] = presrc + data[i];--%>
                    <%--console.log(srcs[i]);--%>
                    <%--console.log(44);--%>
                <%--}--%>
                <%--vmm.picds = srcs;--%>
                <%--console.log(vmm.picds);--%>
                <%--console.log(444);--%>
            <%--}--%>
        <%--})--%>

    <%--}--%>
    // 图片动态绑定
    var vmm = new Vue({
        el: ".demo",
        data: {
            picas: [],
            picbs: [],
            piccs: [],
            picds: [],
        },
        created: function () {
            this.load();
        },
        methods: {
            load: function () {
                $.ajax({
                    url: '/screenos/gettestpiclist1',
                    type: 'Get',
                    success: function (data) { // 接口调用成功回调函数
                        // console.log(data);
                        // console.log(1);
                        var presrc = "<%=basePath%>"
                        var srcs = new Array(data.length)
                        for (var i = 0; i < data.length; i++) {
                            srcs[i] = presrc + data[i];
                            // console.log(srcs[i]);
                            // console.log(11);
                        }
                        vmm.picas = srcs;
                        autoslide.autosetA(1,5000);
                        // console.log(vmm.picas);
                        // console.log(111);
                    }
                });
                $.ajax({
                    url: '/screenos/gettestpiclist2',
                    type: 'Get',
                    success: function (data) { // 接口调用成功回调函数
                        // console.log(data);
                        // console.log(2);
                        var presrc = "<%=basePath%>"
                        var srcs = new Array(data.length)
                        for (var i = 0; i < data.length; i++) {
                            srcs[i] = presrc + data[i];
                            // console.log(srcs[i]);
                            // console.log(22);
                        }
                        vmm.picbs = srcs;
                        autoslide.autosetB(1,5500);
                        // console.log(vmm.picbs);
                        // console.log(222);
                    }
                });
                $.ajax({
                    url: '/screenos/gettestpiclist3',
                    type: 'Get',
                    success: function (data) { // 接口调用成功回调函数
                        // console.log(data);
                        // console.log(3);
                        var presrc = "<%=basePath%>"
                        var srcs = new Array(data.length)
                        for (var i = 0; i < data.length; i++) {
                            srcs[i] = presrc + data[i];
                            // console.log(srcs[i]);
                            // console.log(33);
                        }
                        vmm.piccs = srcs;
                        autoslide.autosetC(1,6500);
                        // console.log(vmm.piccs);
                        // console.log(333);
                    }
                });
                $.ajax({
                    url: '/screenos/gettestpiclist4',
                    type: 'Get',
                    success: function (data) { // 接口调用成功回调函数
                        // console.log(data);
                        // console.log(4);
                        var presrc = "<%=basePath%>"
                        var srcs = new Array(data.length)
                        for (var i = 0; i < data.length; i++) {
                            srcs[i] = presrc + data[i];
                            // console.log(srcs[i]);
                            // console.log(44);
                        }
                        vmm.picds = srcs;
                        autoslide.autosetD(1,7000);
                        // console.log(vmm.picds);
                        // console.log(444);
                    }
                })

            }
        }
    });

    // 特效定义
    var effsrc = new Vue({
        data:{
            eff1:"cube",
            eff2:"flip",
            eff3:"slide",
            eff4:"fade",
            eff5:"slide",
        }
    })

    //  特效切换函数（页面刷新后生效）
    var change =  new Vue({
        el:'',
        data:{
            effA:localStorage.getItem('change-effA'),
            effB:localStorage.getItem('change-effB'),
            effC:localStorage.getItem('change-effC'),
            effD:localStorage.getItem('change-effD'),
        },
        methods:{
            change1:function(numbs) {
                // changeA.effA = localStorage.getItem('change-effA');
                // console.log(change.effA);
                switch (numbs) {
                    case 1:
                        change.effA = effsrc.eff1;
                        break;
                    case 2:
                        change.effA = effsrc.eff2;
                        break;
                    case 3:
                        change.effA = effsrc.eff3;
                        break;
                    case 4:
                        change.effA = effsrc.eff4;
                        break;
                    case 5:
                        change.effA = effsrc.eff5;
                        break;
                }
                localStorage.removeItem('change-effA');
                localStorage.setItem ('change-effA',change.effA);
            },
            change2:function(numbs) {
                switch (numbs) {
                    case 1:
                        change.effB = effsrc.eff1;
                        break;
                    case 2:
                        change.effB = effsrc.eff2;
                        break;
                    case 3:
                        change.effB = effsrc.eff3;
                        break;
                    case 4:
                        change.effB = effsrc.eff4;
                        break;
                    case 5:
                        change.effB = effsrc.eff5;
                        break;
                }
                localStorage.removeItem('change-effB');
                localStorage.setItem ('change-effB',change.effB);
            },
            change3:function(numbs) {
                switch (numbs) {
                    case 1:
                        change.effC = effsrc.eff1;
                        break;
                    case 2:
                        change.effC = effsrc.eff2;
                        break;
                    case 3:
                        change.effC = effsrc.eff3;
                        break;
                    case 4:
                        change.effC = effsrc.eff4;
                        break;
                    case 5:
                        change.effC = effsrc.eff5;
                        break;
                }
                localStorage.removeItem('change-effC');
                localStorage.setItem ('change-effC',change.effC);
            },
            change4:function(numbs) {
                switch (numbs) {
                    case 1:
                        change.effD = effsrc.eff1;
                        break;
                    case 2:
                        change.effD = effsrc.eff2;
                        break;
                    case 3:
                        change.effD = effsrc.eff3;
                        break;
                    case 4:
                        change.effD = effsrc.eff4;
                        break;
                    case 5:
                        change.effD = effsrc.eff5;
                        break;
                }
                localStorage.removeItem('change-effD');
                localStorage.setItem ('change-effD',change.effD);
            }
        }
    });

    var mySwiper1 = new  Swiper ('.swiper-container1', {
        direction: 'horizontal', // 垂直切换选项
        loop: true, // 循环模式选项
        //autoplay:true,
        effect:change.effA,
        observer:true,//修改swiper自己或子元素时，自动初始化swiper
        observeParents:true,//修改swiper的父元素时，自动初始化swiper
        // // 如果需要分页器
        // pagination: {
        //   el: '.swiper-pagination',
        // },
        // // 如果需要前进后退按钮
        // navigation: {
        //   nextEl: '.swiper-button-next',
        //   prevEl: '.swiper-button-prev',
        // },
        // // 如果需要滚动条
        // scrollbar: {
        //   el: '.swiper-scrollbar',
        // },
    });

    var mySwiper2 = new  Swiper ('.swiper-container2', {
        direction: 'horizontal', // 垂直切换选项
        loop: true, // 循环模式选项
        //autoplay:true,
        effect:change.effB,
        observer:true,//修改swiper自己或子元素时，自动初始化swiper
        observeParents:true,//修改swiper的父元素时，自动初始化swiper
    });

    var mySwiper3 = new  Swiper ('.swiper-container3', {
        direction: 'horizontal', // 垂直切换选项
        loop: true, // 循环模式选项
        //autoplay:true,
        effect:change.effC,
        observer:true,//修改swiper自己或子元素时，自动初始化swiper
        observeParents:true,//修改swiper的父元素时，自动初始化swiper
    });

    var mySwiper4 = new  Swiper ('.swiper-container4', {
        direction: 'horizontal', // 垂直切换选项
        loop: true, // 循环模式选项
        //autoplay:true,
        effect:change.effD,
        observer:true,//修改swiper自己或子元素时，自动初始化swiper
        observeParents:true,//修改swiper的父元素时，自动初始化swiper
    });

    //   图片切换函数
    var  slide = new Vue({
        data:{
            p1:0,
            p2:0,
            p3:0,
            p4:0,
        },
        methods:{
            PrevA:function() {
                if (mySwiper1.realIndex == 0 ) {
                    mySwiper1.slideTo(vmm.picas.length-1, 1000, false);
                }
                else
                    mySwiper1.slidePrev();
            },
            NextA:function(){
                if(mySwiper1.realIndex == vmm.picas.length-1){
                    mySwiper1.slideTo(0,1000,false);
                }
                else
                    mySwiper1.slideNext();
            },
            PrevB:function() {
                if (mySwiper2.realIndex == 0) {
                    mySwiper2.slideTo(vmm.picbs.length-1, 1000, false);
                }
                else
                    mySwiper2.slidePrev();
            },
            NextB:function(){
                if(mySwiper2.realIndex == vmm.picbs.length-1){
                    mySwiper2.slideTo(0,1000,false);
                }
                else
                    mySwiper2.slideNext();
            },
            PrevC:function() {
                if (mySwiper3.realIndex == 0) {
                    mySwiper3.slideTo(vmm.piccs.length-1, 1000, false);
                }
                else
                    mySwiper3.slidePrev();
            },
            NextC:function(){
                if(mySwiper3.realIndex == vmm.piccs.length-1){
                    mySwiper3.slideTo(0,1000,false);
                }
                else
                    mySwiper3.slideNext();
            },
            PrevD:function() {
                if (mySwiper4.realIndex == 0) {
                    mySwiper4.slideTo(vmm.picds.length-1, 1000, false);
                }
                else
                    mySwiper4.slidePrev();
            },
            NextD:function(){
                if(mySwiper4.realIndex == vmm.picds.length-1){
                    mySwiper4.slideTo(0,1000,false);
                }
                else
                    mySwiper4.slideNext();
            },
            slidingA:function(){
                if((slide.p1 == 1) && (mySwiper1.realIndex != 0)) {
                    mySwiper1.slidePrev();
                }
                else if((slide.p1 == 0) && (mySwiper1.realIndex != vmm.picas.length-1)){
                    mySwiper1.slideNext();
                }
                else if(mySwiper1.realIndex == vmm.picas.length-1){
                    slide.p1 = !slide.p1;
                    mySwiper1.slidePrev();
                }
                else if(mySwiper1.realIndex == 0){
                    slide.p1 = !slide.p1;
                    mySwiper1.slideNext();
                }
            },
            slidingB:function(){
                if((slide.p2 == 1) && (mySwiper2.realIndex != 0)) {
                    mySwiper2.slidePrev();
                }
                else if((slide.p2 == 0) && (mySwiper2.realIndex != vmm.picbs.length-1)){
                    mySwiper2.slideNext();
                }
                else if(mySwiper2.realIndex == vmm.picbs.length-1){
                    slide.p2 = !slide.p2;
                    mySwiper2.slidePrev();
                }
                else if(mySwiper2.realIndex == 0){
                    slide.p2 = !slide.p2;
                    mySwiper2.slideNext();
                }
            },
            slidingC:function(){
                if((slide.p3 == 1) && (mySwiper3.realIndex != 0)) {
                    mySwiper3.slidePrev();
                }
                else if((slide.p3 == 0) && (mySwiper3.realIndex != vmm.piccs.length-1)){
                    mySwiper3.slideNext();
                }
                else if(mySwiper3.realIndex == vmm.piccs.length-1){
                    slide.p3 = !slide.p3;
                    mySwiper3.slidePrev();
                }
                else if(mySwiper3.realIndex == 0){
                    slide.p3 = !slide.p3;
                    mySwiper3.slideNext();
                }
            },
            slidingD:function(){
                if((slide.p4 == 1) && (mySwiper4.realIndex != 0)) {
                    mySwiper4.slidePrev();
                }
                else if((slide.p4 == 0) && (mySwiper4.realIndex != vmm.picds.length-1)){
                    mySwiper4.slideNext();
                }
                else if(mySwiper4.realIndex == vmm.picds.length-1){
                    slide.p4 = !slide.p4;
                    mySwiper4.slidePrev();
                }
                else if(mySwiper4.realIndex == 0){
                    slide.p4 = !slide.p4;
                    mySwiper4.slideNext();
                }
            }
        }
    });

    //   图片定时轮播
    var autoslide = new Vue({
        data:{
            t1:'',
            t2:'',
            t3:'',
            t4:'',
        },
        methods:{
            autosetA:function(mode,interval){
                if(mode == 1)
                {
                    autoslide.t1 = window.setInterval("slide.slidingA()",interval);
                }
                else
                {
                    window.clearInterval(autoslide.t1);
                }
            },
            autosetB:function(mode,interval){
                if(mode == 1)
                {
                    autoslide.t2 = window.setInterval("slide.slidingB()",interval);
                }
                else
                {
                    window.clearInterval(autoslide.t2);
                }
            },
            autosetC:function(mode,interval){
                if(mode == 1)
                {
                    autoslide.t3 = window.setInterval("slide.slidingC()",interval);
                }
                else
                {
                    window.clearInterval(autoslide.t3);
                }
            },
            autosetD:function(mode,interval){
                if(mode == 1)
                {
                    autoslide.t4 = window.setInterval("slide.slidingD()",interval);
                }
                else
                {
                    window.clearInterval(autoslide.t4);
                }
            },
        }
    });

    //  路由切换页面
    //  问题： 加载后滑动失效
    // var A1 = {template:'<div class="swiper-containerA1"  style="float:left" >\n' +
    //     '       <div class="swiper-wrapper">\n' +
    //     '             <div v-for="pica in vmm.picas" class="swiper-slide swiper-slide-next"><img v-bind:src="pica" ></div>\n' +
    //     '      </div>\n' +
    //     '   </div>'};
    // var A2 = {template:'<div class="swiper-containerA2" style="float:left" >\n' +
    //     '       <div class="swiper-wrapper">\n' +
    //     '             <div v-for="pica in vmm.picas" class="swiper-slide swiper-slide-next"><img v-bind:src="pica" ></div>\n' +
    //     '      </div>\n' +
    //     '   </div>'};
    // var A3 = {template:'<div class="swiper-containerA3" style="float:left" >\n' +
    //     '       <div class="swiper-wrapper">\n' +
    //     '             <div v-for="pica in vmm.picas" class="swiper-slide swiper-slide-next"><img v-bind:src="pica" ></div>\n' +
    //     '      </div>\n' +
    //     '   </div>'};
    // var A4 = {template:'<div class="swiper-containerA4" style="float:left" >\n' +
    //     '       <div class="swiper-wrapper">\n' +
    //     '             <div v-for="pica in vmm.picas" class="swiper-slide swiper-slide-next"><img v-bind:src="pica" ></div>\n' +
    //     '      </div>\n' +
    //     '   </div>'};
    //
    // var routes = [
    //     {path:'/',redirect:'/mySwiperA1'},
    //     {path:'/mySwiperA1',component:A1},
    //     {path:'/mySwiperA2',component:A2},
    //     {path:'/mySwiperA3',component:A3},
    //     {path:'/mySwiperA4',component:A4}
    // ];
    //
    // var router = new VueRouter({
    //     routes:routes
    // });
    // new Vue({
    //     el:'#app',
    //     router
    // });
</script>
</body>
</html>

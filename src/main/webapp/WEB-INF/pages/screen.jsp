<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"
            +request.getServerPort()+path;
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
    <script src="<%=basePath%>/js/vue1.0.js"></script>
    <script src="http://how2j.cn/study/jquery.min.js"></script>
    <script src="<%=basePath%>/js/jquery.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>/css/swiper.css">
    <link rel="stylesheet" href="<%=basePath%>/css/swiper.min.css">
    <script src="<%=basePath%>/js/swiper.js"></script>
    <script src="<%=basePath%>/js/swiper.min.js"></script>

    <style>
        .swiper-container {
            width: 750px;
            height: 425px;
            /* 	float:left */
        }
        .swiper-container2 {
            width: 750px;
            height: 425px;
        }
        .swiper-container3 {
            width: 750px;
            height: 425px;
        }
        .swiper-container4 {
            width: 750px;
            height: 425px;
        }
    </style>
</head>
<body>
<div class="demo">
    <div class="swiper-container" style="float:left;  " >
        <div class="swiper-wrapper">
            <div v-for="pic in pics" class="swiper-slide swiper-slide-next"><img v-bind:src="pic" ></div>
        </div>
        <!--  如果需要分页器 -->
        <div class="swiper-pagination"></div>
        <!--  如果需要导航按钮 -->
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
        <!-- 如果需要滚动条 -->
        <div class="swiper-scrollbar"></div>
    </div>

    <div class="swiper-container2" style="float:right ">
        <div class="swiper-wrapper">
            <div v-for="pic in pics" class="swiper-slide swiper-slide-next"><img v-bind:src="pic" ></div>
        </div>
    </div>

    <div class="swiper-container3" style="float:left" >
        <div class="swiper-wrapper">
            <div v-for="pic in pics" class="swiper-slide swiper-slide-next"><img v-bind:src="pic" ></div>
        </div>
    </div>

    <div class="swiper-container4" style="float:right ">
        <div class="swiper-wrapper">
            <div v-for="pic in pics" class="swiper-slide swiper-slide-next"><img v-bind:src="pic" ></div>
            <%--<div class="swiper-slide swiper-slide-next"><img src="<%=basePath%>/images/16124400po7.jpg"></div>--%>
        </div>
    </div>
</div>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<a href="#" id="a1"><- 上一页</a>
<a class="default" href="#" id="a2">下一页 -&gt;</a>
<script>
    var app = new Vue({
        el: ".demo",
        data: {
            pics: [],
        },
        created: function () {
            this.load();
        },
        methods: {
            load: function () {
                $.ajax({
                    url: '<%=basePath%>/gettestpiclist',
                    type: 'Get',
                    success: function (data) { // 接口调用成功回调函数
                        console.log(data);
                        console.log(123);
                        var presrc = "<%=basePath%>"
                        var srcs = new Array(data.length)
                        for (var i = 0; i < data.length; i++) {
                            srcs[i] = presrc + data[i];
                            console.log(srcs[i]);
                            console.log(456);
                        }
                        app.pics = srcs;
                        console.log(app.pics);
                        console.log(789);
                    }
                })
            }
        }
    });

    var mySwiper = new  Swiper ('.swiper-container', {
        direction: 'horizontal', // 垂直切换选项
        loop: true, // 循环模式选项
        //autoplay:true,
        effect:'flip',
        flipEffect:{
            slideShadows:true,
            limitRotation:true,
        },
        observer:true,//修改swiper自己或子元素时，自动初始化swiper
        observeParents:true,//修改swiper的父元素时，自动初始化swiper
        // 如果需要分页器

        pagination: {
            el: '.swiper-pagination',
            //el:'.banner .swiper-pagination',
        },
        // 如果需要前进后退按钮
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        // 如果需要滚动条
        scrollbar: {
            el: '.swiper-scrollbar',
        },
    });
    $('#a1').click(function(){
        mySwiper.slidePrev();
    })
    $('#a2').click(function(){
        mySwiper.slidePrev();
    })

    var mySwiper2 = new  Swiper ('.swiper-container2', {
        direction: 'horizontal', // 垂直切换选项
        loop: true, // 循环模式选项
        //autoplay:true,
        effect:'flip',
        flipEffect:{
            slideShadows:true,
            limitRotation:true,
        },
        observer:true,//修改swiper自己或子元素时，自动初始化swiper
        observeParents:true,//修改swiper的父元素时，自动初始化swiper
        // 如果需要分页器
        pagination: {
            el: '.swiper-pagination2',
            //el:'.banner .swiper-pagination',
        },
        // 如果需要前进后退按钮
        navigation: {
            nextEl: '.swiper-button-next2',
            prevEl: '.swiper-button-prev2',
        },
        // 如果需要滚动条
        scrollbar: {
            el: '.swiper-scrollbar2',
        },
    });

    var mySwiper3 = new  Swiper ('.swiper-container3', {
        direction: 'horizontal', // 垂直切换选项
        loop: true, // 循环模式选项
        //autoplay:true,
        effect:'flip',
        flipEffect:{
            slideShadows:true,
            limitRotation:true,
        },
        observer:true,//修改swiper自己或子元素时，自动初始化swiper
        observeParents:true,//修改swiper的父元素时，自动初始化swiper
        // 如果需要分页器
        pagination: {
            el: '.swiper-pagination3',
            //el:'.banner .swiper-pagination',
        },
        // 如果需要前进后退按钮
        navigation: {
            nextEl: '.swiper-button-next3',
            prevEl: '.swiper-button-prev3',
        },
        // 如果需要滚动条
        scrollbar: {
            el: '.swiper-scrollbar3',
        },
    });

    var mySwiper4 = new  Swiper ('.swiper-container4', {
        direction: 'horizontal', // 垂直切换选项
        loop: true, // 循环模式选项
        //autoplay:true,
        effect:'flip',
        flipEffect:{
            slideShadows:true,
            limitRotation:true,
        },
        observer:true,//修改swiper自己或子元素时，自动初始化swiper
        observeParents:true,//修改swiper的父元素时，自动初始化swiper
        // 如果需要分页器
        pagination: {
            el: '.swiper-pagination4',
            //el:'.banner .swiper-pagination',
        },
        // 如果需要前进后退按钮
        navigation: {
            nextEl: '.swiper-button-next4',
            prevEl: '.swiper-button-prev4',
        },
        // 如果需要滚动条
        scrollbar: {
            el: '.swiper-scrollbar4',
        },
    });
</script>
</body>
</html>

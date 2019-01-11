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
<script src="<%=basePath%>/js/vue.min.js"></script>
<script src="<%=basePath%>/js/vue-router.min.js"></script>
    <script src="<%=basePath%>/js/jquery.min.js"></script>
<link rel="stylesheet" href="<%=basePath%>/css/swiper.css">
<link rel="stylesheet" href="<%=basePath%>/css/swiper.min.css">
<script src="<%=basePath%>/js/swiper.js"></script>
<script src="<%=basePath%>/js/swiper.min.js"></script>

<style>
    .swiper-container1 {
    width: 750px;
    height: 425px;
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
   <div class="swiper-container1" style="float:left" >
       <div class="swiper-wrapper">
             <div v-for="pica in picas" class="swiper-slide swiper-slide-next"><img v-bind:src="pica" ></div>
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
          <div v-for="picb in picbs" class="swiper-slide swiper-slide-next"><img v-bind:src="picb" ></div>
      </div>
     </div>

     <div class="swiper-container3" style="float:left" >
         <div class="swiper-wrapper">
             <div v-for="picc in piccs" class="swiper-slide swiper-slide-next"><img v-bind:src="picc" ></div>
        </div>
      </div>

	  <div class="swiper-container4" style="float:right ">
      <div class="swiper-wrapper">
          <div v-for="picd in picds" class="swiper-slide swiper-slide-next"><img v-bind:src="picd" ></div>
      </div>
       </div>

</div>

<script>
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
                    url: 'http://localhost:8080/screenos/gettestpiclist',
                    type: 'Get',
                    success: function (data) { // 接口调用成功回调函数
                        console.log(data);
                        console.log(1);
                        var presrc = "<%=basePath%>"
                        var srcs = new Array(data.length)
                        for (var i = 0; i < data.length; i++) {
                            srcs[i] = presrc + data[i];
                            console.log(srcs[i]);
                            console.log(11);
                        }
                        vmm.picas = srcs;
                        console.log(vmm.picas);
                        console.log(111);
                    }
                });
                $.ajax({
                    url: 'http://localhost:8080/screenos/gettestpiclist',
                    type: 'Get',
                    success: function (data) { // 接口调用成功回调函数
                        console.log(data);
                        console.log(2);
                        var presrc = "<%=basePath%>"
                        var srcs = new Array(data.length)
                        for (var i = 0; i < data.length; i++) {
                            srcs[i] = presrc + data[i];
                            console.log(srcs[i]);
                            console.log(22);
                        }
                        vmm.picbs = srcs;
                        console.log(vmm.picbs);
                        console.log(222);
                    }
                });
                $.ajax({
                    url: 'http://localhost:8080/screenos/gettestpiclist',
                    type: 'Get',
                    success: function (data) { // 接口调用成功回调函数
                        console.log(data);
                        console.log(3);
                        var presrc = "<%=basePath%>"
                        var srcs = new Array(data.length)
                        for (var i = 0; i < data.length; i++) {
                            srcs[i] = presrc + data[i];
                            console.log(srcs[i]);
                            console.log(33);
                        }
                        vmm.piccs = srcs;
                        console.log(vmm.piccs);
                        console.log(333);
                    }
                });
                $.ajax({
                    url: 'http://localhost:8080/screenos/gettestpiclist',
                    type: 'Get',
                    success: function (data) { // 接口调用成功回调函数
                        console.log(data);
                        console.log(4);
                        var presrc = "<%=basePath%>"
                        var srcs = new Array(data.length)
                        for (var i = 0; i < data.length; i++) {
                            srcs[i] = presrc + data[i];
                            console.log(srcs[i]);
                            console.log(44);
                        }
                        vmm.picds = srcs;
                        console.log(vmm.picds);
                        console.log(444);
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
                console.log(1111111);
                console.log(change.effA);
                console.log(2222222);
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
        methods:{
            PrevA:function() {
                if (mySwiper1.realIndex == 0) {
                    mySwiper1.slideTo(change.effA.length-1, 1000, false);
                }
                else
                    mySwiper1.slidePrev();
            },
            NextA:function(){
                if(mySwiper1.realIndex == change.effA.length-1){
                    mySwiper1.slideTo(0,1000,false);
                }
                else
                    mySwiper1.slideNext();
            },
            PrevB:function() {
                if (mySwiper2.realIndex == 0) {
                    mySwiper2.slideTo(change.effB.length-1, 1000, false);
                }
                else
                    mySwiper2.slidePrev();
            },
            NextB:function(){
                if(mySwiper2.realIndex == change.effB.length-1){
                    mySwiper2.slideTo(0,1000,false);
                }
                else
                    mySwiper2.slideNext();
            },
            PrevC:function() {
                if (mySwiper3.realIndex == 0) {
                    mySwiper3.slideTo(change.effC.length-1, 1000, false);
                }
                else
                    mySwiper3.slidePrev();
            },
            NextC:function(){
                if(mySwiper3.realIndex == change.effC.length-1){
                    mySwiper3.slideTo(0,1000,false);
                }
                else
                    mySwiper3.slideNext();
            },
            PrevD:function() {
                if (mySwiper4.realIndex == 0) {
                    mySwiper4.slideTo(change.effD.length-1, 1000, false);
                }
                else
                    mySwiper4.slidePrev();
            },
            NextD:function(){
                if(mySwiper4.realIndex == change.effD.length-1){
                    mySwiper4.slideTo(0,1000,false);
                }
                else
                    mySwiper4.slideNext();
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
                    autoslide.t1 = window.setInterval("slide.NextA()",interval);
                    }
                else
                {
                    window.clearInterval(autoslide.t1);
                }
            },
            autosetB:function(mode,interval){
                if(mode == 1)
                {
                    autoslide.t2 = window.setInterval("slide.NextB()",interval);
                }
                else
                {
                    window.clearInterval(autoslide.t2);
                }
            },
            autosetC:function(mode,interval){
                if(mode == 1)
                {
                    autoslide.t3 = window.setInterval("slide.NextC()",interval);
                }
                else
                {
                    window.clearInterval(autoslide.t3);
                }
            },
            autosetD:function(mode,interval){
                if(mode == 1)
                {
                    autoslide.t4 = window.setInterval("slide.NextD()",interval);
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

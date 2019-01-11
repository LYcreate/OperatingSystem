<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 2019/1/10
  Time: 23:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path=request.getContextPath();
    String socketpath="ws://"+request.getServerName()+":"
            +request.getServerPort()+path+"/";
    String basePath=request.getScheme()+"://"+request.getServerName()+":"
            +request.getServerPort()+path+"/";
    request.getSession().setAttribute("uid","123456");
%>
<html>
<head>
    <title>wstest</title>
    <script src="<%=path%>/js/sockjs.min.js"></script>
</head>
<body>
<script>

    var url ='<%=socketpath%>ws';
    var para={'uid':"123456"};
    var strpara=JSON.stringify(para);
    var sock = new WebSocket(url);      //打开WebSocket

    sock.onopen = function() {          //处理连接开启事件
        console.log('Opening');
        sayMarco();
    };
    sock.onmessage = function(e) {      //处理信息
        console.log('Received Message: ');

    };

    sock.onclose = function() {         //处理连接关闭事件
        console.log('Closing');
    };

    function sayMarco() {               //发送信息函数
        console.log('Sending Marco!');
        var data={
            'isrefresh':1,
            'effectype':1,
            'postion':1,
            'time':123,
            'uid':'123456',
            'pictrue':{
                'id':1,
                'picturename':"p1",
                'url':"/testpic",
               ' realpath':"realpic"
            },
        };
        var message=JSON.stringify(data);
        sock.send(message);
    }
</script>
</body>
</html>

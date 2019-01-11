package com.operatingSystem.wsocket;



import com.operatingSystem.model.User;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * websocket握手拦截器
 * 拦截握手前，握手后的两个切面
 */
public class MyHandShakeInterceptor implements HandshakeInterceptor {

    public boolean beforeHandshake(ServerHttpRequest serverHttpRequest, ServerHttpResponse serverHttpResponse, WebSocketHandler webSocketHandler,
                                   Map<String, Object> map) throws Exception {
        System.out.println("beforeHandShake");
        System.out.println("Websocket:用户[ID:"
                + ((ServletServerHttpRequest) serverHttpRequest).getServletRequest().getSession(false).getAttribute("uid") + "]已经建立连接");
        if (serverHttpRequest instanceof ServletServerHttpRequest) {
            ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) serverHttpRequest;
            HttpSession session = servletRequest.getServletRequest().getSession(false);
            System.out.println("hehe");
            // 标记用户
            String uid =(String)session.getAttribute("uid");
            System.out.println("uid"+uid);
            if(uid!=null){
                map.put("uid", uid);//为服务器创建WebSocketSession做准备
                System.out.println("用户id："+uid+" 被加入");
            }else{
                System.out.println("user为空");
                return false;
            }
        }
        System.out.println("OK");
        return true;
    }

    public void afterHandshake(ServerHttpRequest serverHttpRequest, ServerHttpResponse serverHttpResponse, WebSocketHandler webSocketHandler, Exception e) {

    }
}

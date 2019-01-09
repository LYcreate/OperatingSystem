package com.operatingSystem.Utils;

import org.springframework.stereotype.Service;

/*
    String isrefresh:1或0 判断是否去更新前端图片
//1的情况使用的变量
Object pictrue:一张图片的所有信息
int effectype：和图片绑定的切换特效 1234
int position：图片四个角的位置 1234
//0的情况使用的变量
int time：图片切换的间隔

*/
@Service
public class StoB {
    public int isrefresh;
    public int effectype;
    public int postion;
    public int time;
    public Object pictrue;
    public String uid;
    public StoB() {
        isrefresh = 0;
    }

    public StoB(int isrefresh) {
        this.isrefresh = isrefresh;
    }

    public StoB(int isrefresh, int effectype, int postion, int time, Object pictrue, String uid) {
        this.isrefresh = isrefresh;
        this.effectype = effectype;
        this.postion = postion;
        this.time = time;
        this.pictrue = pictrue;
        this.uid = uid;
    }
}

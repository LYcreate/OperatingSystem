package com.operatingSystem.Utils;

import org.springframework.stereotype.Service;

@Service
public class BtoS {
    public int isrefresh;
    public int effectype;
    public int postion;
    public int time;
    public Object pictrue;
    public String uid;
    public BtoS() {
        isrefresh = 0;
    }

    public BtoS(int isrefresh) {
        this.isrefresh = isrefresh;
    }

    @Override
    public String toString() {
        return "BtoS{" +
                "isrefresh=" + isrefresh +
                ", effectype=" + effectype +
                ", postion=" + postion +
                ", time=" + time +
                ", pictrue=" + pictrue +
                ", uid='" + uid + '\'' +
                '}';
    }
}

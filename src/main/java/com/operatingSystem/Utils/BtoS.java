package com.operatingSystem.Utils;

import org.springframework.stereotype.Service;

@Service
public class BtoS {
    public int isrefresh;
    public int effectype;
    public int postion;
    public int time;
    public Object pictrue;

    public BtoS() {
        isrefresh = 0;
    }

    public BtoS(int isrefresh) {
        this.isrefresh = isrefresh;
    }
}

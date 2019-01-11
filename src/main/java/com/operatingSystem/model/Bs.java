package com.operatingSystem.model;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.UUID;

@Entity
@Table(name = "bs")
public class Bs {

    public String id;
    public Integer isrefresh;
    public Integer effectype;
    public Integer postion;
    public Integer time;
    public String pictureid;
    public String uid;
    public String equipid;

    public Bs() {
        super();
        ensureId();
        isrefresh = 0;
    }

    public Bs(Integer isrefresh) {
        super();
        ensureId();
        this.isrefresh = isrefresh;
    }

    public Integer getIsrefresh() {
        return isrefresh;
    }

    public void setIsrefresh(Integer isrefresh) {
        this.isrefresh = isrefresh;
    }

    public Integer getEffectype() {
        return effectype;
    }

    public void setEffectype(Integer effectype) {
        this.effectype = effectype;
    }

    public Integer getPostion() {
        return postion;
    }

    public void setPostion(Integer postion) {
        this.postion = postion;
    }

    public Integer getTime() {
        return time;
    }

    public void setTime(Integer time) {
        this.time = time;
    }

    public String getPictureid() {
        return pictureid;
    }

    public void setPictureid(String pictureid) {
        this.pictureid = pictureid;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getEquipid() {
        return equipid;
    }

    public void setEquipid(String equipid) {
        this.equipid = equipid;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    private void ensureId() {
        this.setId(UUID.randomUUID().toString());
    }

    public Bs(String id, Integer isrefresh, Integer effectype, Integer postion, Integer time, String pictureid, String uid, String equipid) {
        this.id = id;
        this.isrefresh = isrefresh;
        this.effectype = effectype;
        this.postion = postion;
        this.time = time;
        this.pictureid = pictureid;
        this.uid = uid;
        this.equipid = equipid;
    }

    public Bs(Integer isrefresh, Integer effectype, Integer postion, Integer time, String pictureid, String uid) {
        this.isrefresh = isrefresh;
        this.effectype = effectype;
        this.postion = postion;
        this.time = time;
        this.pictureid = pictureid;
        this.uid = uid;
    }

    @Override
    public String toString() {
        return "Bs{" +
                "id='" + id + '\'' +
                ", isrefresh=" + isrefresh +
                ", effectype=" + effectype +
                ", postion=" + postion +
                ", time=" + time +
                ", pictureid='" + pictureid + '\'' +
                ", uid='" + uid + '\'' +
                ", equipid='" + equipid + '\'' +
                '}';
    }
}

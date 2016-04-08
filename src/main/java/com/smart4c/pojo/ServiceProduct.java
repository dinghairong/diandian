package com.smart4c.pojo;

import java.util.Date;

/**
 * Created by apple on 15/11/11.
 */
public class ServiceProduct {
    /*
| service_project_id | int(8)       | NO     | MUL   |    <null> |                |
    *
    * */

    private int id;

    private String title;

    /**
     * 摘要
     * abstract
     */
    private String summary;

    /**
     * 车主自带配件
     */
    private String accessory;

    private String description;

    private double newprice;

    private double oldprice;

    /**
     * 时长 分钟
     */
    private String duration;

    /**
     * 图片名称
     */
    private String icon;

    /**
     * 图片存放路径
     */
    private String path;

    /**
     * isfirst
     */
    private boolean isHome;

    private int status;

    private Date createdTime;

    private Date updateTime;

    private double web_price;























    public double getWeb_price() {
        return web_price;
    }

    public void setWeb_price(double web_price) {
        this.web_price = web_price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getAccessory() {
        return accessory;
    }

    public void setAccessory(String accessory) {
        this.accessory = accessory;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getNewprice() {
        return newprice;
    }

    public void setNewprice(double newprice) {
        this.newprice = newprice;
    }

    public double getOldprice() {
        return oldprice;
    }

    public void setOldprice(double oldprice) {
        this.oldprice = oldprice;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public boolean isHome() {
        return isHome;
    }

    public void setIsHome(boolean isHome) {
        this.isHome = isHome;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}

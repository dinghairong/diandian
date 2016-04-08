package com.smart4c.pojo;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by apple on 15/11/13.
 */
public class City {
    private String id;

    private String name;

    private List<County> counties = new ArrayList<County>();
























    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<County> getCounties() {
        return counties;
    }

    public void setCounties(List<County> counties) {
        this.counties = counties;
    }
}

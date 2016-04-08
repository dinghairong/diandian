package com.smart4c.pojo;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by apple on 15/11/13.
 */
public class Province {
    private String id;

    private String name;

    private List<City> cities = new ArrayList<City>();























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

    public List<City> getCities() {
        return cities;
    }

    public void setCities(List<City> cities) {
        this.cities = cities;
    }
}

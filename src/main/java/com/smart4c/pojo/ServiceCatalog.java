package com.smart4c.pojo;

import java.util.List;

/**
 * Created by apple on 15/11/11.
 */
public class ServiceCatalog {
    private int id;

    private String name;

    private List<Services> serviceProjects;

    private List<ServiceProduct> serviceProducts;





































    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Services> getServiceProjects() {
        return serviceProjects;
    }

    public void setServiceProjects(List<Services> serviceProjects) {
        this.serviceProjects = serviceProjects;
    }

    public List<ServiceProduct> getServiceProducts() {
        return serviceProducts;
    }

    public void setServiceProducts(List<ServiceProduct> serviceProducts) {
        this.serviceProducts = serviceProducts;
    }
}

package com.smart4c.bean;

import java.io.Serializable;

import javax.persistence.*;

import java.util.List;


/**
 * The persistent class for the service_class database table.
 * 
 */
@Entity
@Table(name="service_class")
public class ServiceClass extends AbstractModel<Integer> implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	private String name;

	//bi-directional many-to-one association to ServiceProduct
	@OneToMany(mappedBy="serviceClass")
	private List<ServiceProject> serviceProjects;

	public ServiceClass() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<ServiceProject> getServiceProjects() {
		return this.serviceProjects;
	}

	public void setServiceProjects(List<ServiceProject> serviceProjects) {
		this.serviceProjects = serviceProjects;
	}

}

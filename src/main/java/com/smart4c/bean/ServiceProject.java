package com.smart4c.bean;

import java.io.Serializable;

import javax.persistence.*;

import java.util.List;


/**
 * The persistent class for the service_project database table.
 * 
 */
@Entity
@Table(name="service_project")
public class ServiceProject extends AbstractModel<Integer> implements Serializable  {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	private String name;

	//bi-directional many-to-one association to ServiceProduct
	@OneToMany(mappedBy="serviceProject")
	private List<ServiceProduct> serviceProducts;

	//bi-directional many-to-one association to ServiceClass
	@ManyToOne
	@JoinColumn(name="service_class_id")
	private ServiceClass serviceClass;

	public ServiceProject() {
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

	public List<ServiceProduct> getServiceProducts() {
		return this.serviceProducts;
	}

	public void setServiceProducts(List<ServiceProduct> serviceProducts) {
		this.serviceProducts = serviceProducts;
	}

	public ServiceClass getServiceClass() {
		return this.serviceClass;
	}

	public void setServiceClass(ServiceClass serviceClass) {
		this.serviceClass = serviceClass;
	}

}

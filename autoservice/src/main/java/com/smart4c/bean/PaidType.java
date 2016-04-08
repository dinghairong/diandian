package com.smart4c.bean;

import java.io.Serializable;

import javax.persistence.*;

import java.util.List;


/**
 * The persistent class for the paidtype database table.
 * 
 */
@Entity
@Table(name = "paidtype")
public class PaidType extends AbstractModel<Integer> implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	private String name;

	//bi-directional many-to-one association to Order
	@OneToMany(mappedBy="paidType")
	private List<Order> orders;
	
	//bi-directional many-to-one association to Serviceshop
	@OneToMany(mappedBy="paidtype")
	private List<ServiceShop> serviceshops;

	public PaidType() {
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

	public List<Order> getOrders() {
		return this.orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public List<ServiceShop> getServiceshops() {
		return serviceshops;
	}

	public void setServiceshops(List<ServiceShop> serviceshops) {
		this.serviceshops = serviceshops;
	}

}

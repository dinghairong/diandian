package com.smart4c.bean;

import java.io.Serializable;

import javax.persistence.*;


/**
 * The persistent class for the mycart database table.
 * 
 */
@Entity
@Table(name = "mycart")
public class MyCart extends AbstractModel<Integer> implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	private int num;
	
	private int state;
	

	//bi-directional many-to-one association to ServiceProduct
	@ManyToOne
	@JoinColumn(name="pid")
	private ServiceProduct serviceProduct;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="uid")
	private User user;

	//bi-directional many-to-one association to Company
	@ManyToOne
	@JoinColumn(name="cid")
	private Company company;

	public MyCart() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public ServiceProduct getServiceProduct() {
		return this.serviceProduct;
	}

	public void setServiceProduct(ServiceProduct serviceProduct) {
		this.serviceProduct = serviceProduct;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Company getCompany() {
		return this.company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

}

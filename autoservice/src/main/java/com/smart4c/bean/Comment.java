package com.smart4c.bean;

import java.io.Serializable;

import javax.persistence.*;

import java.util.Date;


/**
 * The persistent class for the comment database table.
 * 
 */
@Entity
@Table(name = "comment")
public class Comment extends AbstractModel<Integer> implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	@Lob
	private String content;

	@Temporal(TemporalType.TIMESTAMP)
	private Date createdTime;

	private int star;

	private int status;

	private String title;

	@Temporal(TemporalType.TIMESTAMP)
	private Date updateTime;
	
	//bi-directional many-to-one association to ServiceProduct
	@ManyToOne
	@JoinColumn(name="pid")
	private ServiceProduct serviceProduct;

	//bi-directional many-to-one association to Order
	@ManyToOne
	@JoinColumn(name="oid")
	private Order order;

	//bi-directional many-to-one association to Company
	@ManyToOne
	@JoinColumn(name="cid")
	private Company company;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="uid")
	private User user;

	//bi-directional many-to-one association to Serviceshop
	@ManyToOne
	@JoinColumn(name="sid")
	private ServiceShop serviceShop;

	public Comment() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreatedTime() {
		return this.createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public int getStar() {
		return this.star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public int getStatus() {
		return this.status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
	public ServiceProduct getServiceProduct() {
		return this.serviceProduct;
	}

	public void setServiceProduct(ServiceProduct serviceProduct) {
		this.serviceProduct = serviceProduct;
	}

	public Order getOrder() {
		return this.order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Company getCompany() {
		return this.company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public ServiceShop getServiceShop() {
		return this.serviceShop;
	}

	public void setServiceShop(ServiceShop serviceShop) {
		this.serviceShop = serviceShop;
	}

}

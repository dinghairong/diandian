package com.smart4c.bean;

import java.io.Serializable;

import javax.persistence.*;

import java.util.Date;
import java.util.List;


/**
 * The persistent class for the orders database table.
 * 
 */
@Entity
@Table(name="orders")
public class Order extends AbstractModel<Integer> implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	@Temporal(TemporalType.TIMESTAMP)
	private Date createdTime;

	private String customername;

	private String customerphone;

	private int number;
	
	private double paid;

	private String pos;

	private double price;

	private String serialnumber;

	private int state;

	private int type;

	private double web_price;

	public double getWeb_price_total() {
		return web_price_total;
	}

	public void setWeb_price_total(double web_price_total) {
		this.web_price_total = web_price_total;
	}

	public double getWeb_price() {
		return web_price;
	}

	public void setWeb_price(double web_price) {
		this.web_price = web_price;
	}

	private double web_price_total;

	@Temporal(TemporalType.TIMESTAMP)
	private Date updateTime;

	//bi-directional many-to-one association to Comment
	@OneToMany(mappedBy="order")
	private List<Comment> comments;

	//bi-directional many-to-one association to CorpOrderNumber
	@OneToMany(mappedBy="order")
	private List<CorpOrderNumber> corpOrderNumbers;

	//bi-directional many-to-one association to ServiceProduct
	@ManyToOne
	@JoinColumn(name="sp_id")
	private ServiceProduct serviceProduct;
		
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

	//bi-directional many-to-one association to UserCoupon
	@ManyToOne
	@JoinColumn(name="uc_id")
	private UserCoupon userCoupon;

	//bi-directional many-to-one association to Paidtype
	@ManyToOne
	@JoinColumn(name="pid")
	private PaidType paidType;

	public Order() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getCreatedTime() {
		return this.createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public String getCustomername() {
		return this.customername;
	}

	public void setCustomername(String customername) {
		this.customername = customername;
	}

	public String getCustomerphone() {
		return this.customerphone;
	}

	public void setCustomerphone(String customerphone) {
		this.customerphone = customerphone;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public double getPaid() {
		return this.paid;
	}

	public void setPaid(double paid) {
		this.paid = paid;
	}

	public String getPos() {
		return this.pos;
	}

	public void setPos(String pos) {
		this.pos = pos;
	}

	public double getPrice() {
		return this.price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getSerialnumber() {
		return this.serialnumber;
	}

	public void setSerialnumber(String serialnumber) {
		this.serialnumber = serialnumber;
	}

	public int getState() {
		return this.state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public int getType() {
		return this.type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public Date getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public List<Comment> getComments() {
		return this.comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public List<CorpOrderNumber> getCorpOrderNumbers() {
		return this.corpOrderNumbers;
	}

	public void setCorpOrderNumbers(List<CorpOrderNumber> corpOrderNumbers) {
		this.corpOrderNumbers = corpOrderNumbers;
	}
	
	public ServiceProduct getServiceProduct() {
		return this.serviceProduct;
	}

	public void setServiceProduct(ServiceProduct serviceProduct) {
		this.serviceProduct = serviceProduct;
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

	public UserCoupon getUserCoupon() {
		return this.userCoupon;
	}

	public void setUserCoupon(UserCoupon userCoupon) {
		this.userCoupon = userCoupon;
	}

	public PaidType getPaidType() {
		return this.paidType;
	}

	public void setPaidType(PaidType paidType) {
		this.paidType = paidType;
	}

}
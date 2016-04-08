package com.smart4c.bean;

import java.io.Serializable;

import javax.persistence.*;

import java.util.Date;
import java.util.List;


/**
 * The persistent class for the company database table.
 * 
 */
@Entity
@Table(name = "company")
public class Company extends AbstractModel<Integer> implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	private String address;
	
	private String balance = "0.00";

	private String company;

	private String contacts;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date createdTime;

	private String email;

	private String icon = "";
	
	private int masterId = 0;

	private String password;

	private String path = "";

	private String phone;

	private String href_addr;

	public String getHref_addr() {
		return href_addr;
	}

	public void setHref_addr(String href_addr) {
		this.href_addr = href_addr;
	}

	public String getThird_platform() {
		return third_platform;
	}

	public void setThird_platform(String third_platform) {
		this.third_platform = third_platform;
	}

	private String third_platform;

	private byte status = (byte)0;

	@Temporal(TemporalType.TIMESTAMP)
	private Date updateTime;

	//bi-directional many-to-one association to Comment
	@OneToMany(mappedBy="company")
	private List<Comment> comments;

	//bi-directional many-to-one association to Role
	@ManyToOne
	@JoinColumn(name="rid")
	private Role role;

	//bi-directional many-to-one association to Areadetail
	@ManyToOne
	@JoinColumn(name="cid")
	private AreaDetail areaDetail;
	
	//bi-directional many-to-one association to Mycart
	@OneToMany(mappedBy="company")
	private List<MyCart> myCarts;

	//bi-directional many-to-one association to Order
	@OneToMany(mappedBy="company")
	private List<Order> orders;

	//bi-directional many-to-one association to UserCoupon
	@OneToMany(mappedBy="company")
	private List<UserCoupon> userCoupons;
	
	//bi-directional many-to-one association to Prepaid
	@OneToMany(mappedBy="company")
	private List<Prepaid> prepaids;

	public Company() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getContacts() {
		return contacts;
	}

	public void setContacts(String contacts) {
		this.contacts = contacts;
	}

	public String getBalance() {
		return this.balance;
	}

	public void setBalance(String balance) {
		this.balance = balance;
	}

	public Date getCreatedTime() {
		return this.createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getIcon() {
		return this.icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}
	
	public int getMasterId() {
		return this.masterId;
	}

	public void setMasterId(int masterId) {
		this.masterId = masterId;
	}
	
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPath() {
		return this.path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public byte getStatus() {
		return this.status;
	}

	public void setStatus(byte status) {
		this.status = status;
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

	public Role getRole() {
		return this.role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public AreaDetail getAreaDetail() {
		return this.areaDetail;
	}

	public void setAreaDetail(AreaDetail areaDetail) {
		this.areaDetail = areaDetail;
	}
	
	public List<MyCart> getMycarts() {
		return this.myCarts;
	}

	public void setMyCarts(List<MyCart> myCarts) {
		this.myCarts = myCarts;
	}
	
	public List<Order> getOrders() {
		return this.orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public List<UserCoupon> getUserCoupons() {
		return this.userCoupons;
	}

	public void setUserCoupons(List<UserCoupon> userCoupons) {
		this.userCoupons = userCoupons;
	}

	public List<Prepaid> getPrepaids() {
		return this.prepaids;
	}

	public void setPrepaids(List<Prepaid> prepaids) {
		this.prepaids = prepaids;
	}
}

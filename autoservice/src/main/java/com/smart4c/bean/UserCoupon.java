package com.smart4c.bean;

import java.io.Serializable;

import javax.persistence.*;

import java.util.Date;
import java.util.List;


/**
 * The persistent class for the user_coupons database table.
 * 
 */
@Entity
@Table(name="user_coupons")
public class UserCoupon extends AbstractModel<Integer> implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	@Temporal(TemporalType.TIMESTAMP)
	private Date createdTime;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="exprie_date")
	private Date exprieDate;

	private String serialnumber;

	private int status;

	@Temporal(TemporalType.TIMESTAMP)
	private Date updateTime;

	//bi-directional many-to-one association to Order
	@OneToMany(mappedBy="userCoupon")
	private List<Order> orders;

	//bi-directional many-to-one association to Company
	@ManyToOne
	@JoinColumn(name="cid")
	private Company company;

	//bi-directional many-to-one association to Coupon
	@ManyToOne
	@JoinColumn(name="coupons_id")
	private Coupon coupon;
	
	@ManyToOne
	@JoinColumn(name="pid")
	private Prepaid paid;

	public UserCoupon() {
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

	public Date getExprieDate() {
		return this.exprieDate;
	}

	public void setExprieDate(Date exprieDate) {
		this.exprieDate = exprieDate;
	}

	public String getSerialnumber() {
		return this.serialnumber;
	}

	public void setSerialnumber(String serialnumber) {
		this.serialnumber = serialnumber;
	}

	public int getStatus() {
		return this.status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public List<Order> getOrders() {
		return this.orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public Company getCompany() {
		return this.company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public Coupon getCoupon() {
		return this.coupon;
	}

	public void setCoupon(Coupon coupon) {
		this.coupon = coupon;
	}

	public Prepaid getPaid() {
		return paid;
	}

	public void setPaid(Prepaid paid) {
		this.paid = paid;
	}

}

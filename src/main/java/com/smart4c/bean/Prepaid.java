package com.smart4c.bean;

import java.io.Serializable;

import javax.persistence.*;

import java.util.Date;
import java.util.List;


/**
 * The persistent class for the prepaid database table.
 * 
 */
@Entity
@Table(name = "prepaid")
public class Prepaid extends AbstractModel<Integer> implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	@Temporal(TemporalType.TIMESTAMP)
	private Date createdTime;

	private String money = "0";

	private int state;
	
	private String serialnumber;

	//bi-directional many-to-one association to Company
	@ManyToOne
	@JoinColumn(name="cid")
	private Company company;
	
	@OneToMany(mappedBy="paid")
	private List<UserCoupon> userCouponList; 

	public Prepaid() {
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

	public String getMoney() {
		return this.money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public int getState() {
		return this.state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getSerialnumber() {
		return serialnumber;
	}

	public void setSerialnumber(String serialnumber) {
		this.serialnumber = serialnumber;
	}

	public Company getCompany() {
		return this.company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public List<UserCoupon> getUserCouponList() {
		return userCouponList;
	}

	public void setUserCouponList(List<UserCoupon> userCouponList) {
		this.userCouponList = userCouponList;
	}

}

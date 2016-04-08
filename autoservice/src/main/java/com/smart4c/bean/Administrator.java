package com.smart4c.bean;

import java.io.Serializable;

import javax.persistence.*;

import com.smart4c.bean.AbstractModel;

import java.util.Date;
import java.util.List;


/**
 * The persistent class for the administrator database table.
 * 
 */
@Entity
@Table(name = "administrator")
public class Administrator extends AbstractModel<Integer> implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	private String balance;

	@Temporal(TemporalType.TIMESTAMP)
	private Date createdTime;

	private String email;

	private String icon = "";

	private String name;

	private String password;

	private String path = "";

	private String phone;

	private byte status;

	@Temporal(TemporalType.TIMESTAMP)
	private Date updateTime;

	//bi-directional many-to-one association to Areadetail
	@ManyToOne
	@JoinColumn(name="cid")
	private AreaDetail areaDetail;

	//bi-directional many-to-one association to Role
	@ManyToOne
	@JoinColumn(name="rid")
	private Role role;

	//bi-directional many-to-one association to Advisory
	@OneToMany(mappedBy="administrator")
	private List<Advisory> advisories;
		
	public Administrator() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
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

	public AreaDetail getAreaDetail() {
		return this.areaDetail;
	}

	public void setAreaDetail(AreaDetail areaDetail) {
		this.areaDetail = areaDetail;
	}

	public Role getRole() {
		return this.role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public List<Advisory> getAdvisories() {
		return this.advisories;
	}

	public void setAdvisories(List<Advisory> advisories) {
		this.advisories = advisories;
	}
}

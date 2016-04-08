package com.smart4c.bean;

import java.io.Serializable;

import javax.persistence.*;

import java.util.Date;
import java.util.List;


/**
 * The persistent class for the users database table.
 * 
 */
@Entity
@Table(name="users")
public class User extends AbstractModel<Integer> implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	private String balance = "";

	@Temporal(TemporalType.TIMESTAMP)
	private Date createdTime;

	private String email = "";

	private String icon = "";

	private String name = "";

	private String password = "";

	private String path = "";

	private String phone = "";

	private int status = 0;

	@Temporal(TemporalType.TIMESTAMP)
	private Date updateTime;
	
	//bi-directional many-to-one association to Advisory
	@OneToMany(mappedBy="user")
	private List<Advisory> advisories;

	//bi-directional many-to-one association to Comment
	@OneToMany(mappedBy="user")
	private List<Comment> comments;

	//bi-directional many-to-one association to Mycart
	@OneToMany(mappedBy="user")
	private List<MyCart> myCarts;
		
	//bi-directional many-to-one association to Order
	@OneToMany(mappedBy="user")
	private List<Order> orders;

	//bi-directional many-to-one association to Role
	@ManyToOne
	@JoinColumn(name="rid")
	private Role role;

	//bi-directional many-to-one association to Areadetail
	@ManyToOne
	@JoinColumn(name="cid")
	private AreaDetail areaDetail;

	@OneToOne(mappedBy="user")
	private UserExternal userExternal;

	public User() {
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

	public List<Advisory> getAdvisories() {
		return this.advisories;
	}

	public void setAdvisories(List<Advisory> advisories) {
		this.advisories = advisories;
	}
	
	public List<Comment> getComments() {
		return this.comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
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

	public UserExternal getUserExternal() {
		return userExternal;
	}

	public void setUserExternal(UserExternal userExternal) {
		this.userExternal = userExternal;
	}
}

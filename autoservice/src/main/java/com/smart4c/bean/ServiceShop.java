package com.smart4c.bean;

import org.codehaus.jackson.annotate.JsonIgnore;

import java.io.Serializable;

import javax.persistence.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


/**
 * The persistent class for the serviceshop database table.
 * 
 */
@Entity
@Table(name = "serviceshop")
public class ServiceShop extends AbstractModel<Integer> implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	private String address;

	private String business;

	@Temporal(TemporalType.TIMESTAMP)
	private Date createdTime;

	private String image ;

	private double latitude;

	private String license;

	private double longitude;

	private String password;

	private String path;

	private int people;

	private String phone;

	private double sizes;

	private int status;

	private String tel;

	private String title;

	@Temporal(TemporalType.TIMESTAMP)
	private Date updateTime;

	private int years;

	//bi-directional many-to-one association to Comment
	@OneToMany(mappedBy="serviceShop")
	private Set<Comment> comments;

	//bi-directional many-to-one association to Order
	@OneToMany(mappedBy="serviceShop")
	private Set<Order> orders;

	//bi-directional many-to-one association to Areadetail
	@ManyToOne
	@JoinColumn(name="cid")
	private AreaDetail areaDetail;
	
	//bi-directional many-to-one association to ServiceshopService
	@OneToMany(mappedBy="serviceshop")
	private Set<ServiceshopService> serviceshopServices;
	
	//bi-directional many-to-one association to Paidtype
	@ManyToOne
	@JoinColumn(name="pid", nullable=false)
	private PaidType paidtype;

	public ServiceShop() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBusiness() {
		return this.business;
	}

	public void setBusiness(String business) {
		this.business = business;
	}

	public Date getCreatedTime() {
		return this.createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public double getLatitude() {
		return this.latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public String getLicense() {
		return this.license;
	}

	public void setLicense(String license) {
		this.license = license;
	}

	public double getLongitude() {
		return this.longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
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

	public int getPeople() {
		return this.people;
	}

	public void setPeople(int people) {
		this.people = people;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public double getSizes() {
		return this.sizes;
	}

	public void setSizes(double sizes) {
		this.sizes = sizes;
	}

	public int getStatus() {
		return this.status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public PaidType getPaidtype() {
		return paidtype;
	}

	public void setPaidtype(PaidType paidtype) {
		this.paidtype = paidtype;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
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

	public int getYears() {
		return this.years;
	}

	public void setYears(int years) {
		this.years = years;
	}

	public List<Comment> getComments() {
		List<Comment> new_comment = new ArrayList<Comment>();
		if(null != this.comments){
			new_comment.addAll(this.comments);
		}
		return new_comment;
	}

	public void setComments(List<Comment> comments) {
		Set<Comment> new_comment = null;
		if(null != comments){
			new_comment = new HashSet<Comment>(comments);
		}
		this.comments = new_comment;
	}

	public List<Order> getOrders() {
		List<Order> new_order = new ArrayList<Order>();
		if(null != this.orders){
			new_order.addAll(this.orders);
		}
		return new_order;
	}

	public void setOrders(List<Order> orders) {
		Set<Order> new_order = null;
		if(null != orders){
			new_order = new HashSet<Order>(orders);
		}
		this.orders = new_order;
	}

	public AreaDetail getAreaDetail() {
		return this.areaDetail;
	}

	public void setAreaDetail(AreaDetail areaDetail) {
		this.areaDetail = areaDetail;
	}

	public List<ServiceshopService> getServiceshopServices() {
		List<ServiceshopService> service = new ArrayList<ServiceshopService>();
		if(null  != this.serviceshopServices){
			service.addAll(this.serviceshopServices);
		}
		return service;
	}

	public void setServiceshopServices(List<ServiceshopService> serviceshopServices) {
		Set<ServiceshopService> service = null;
		if(null != serviceshopServices){
			service = new HashSet<ServiceshopService>(serviceshopServices);
		}
		this.serviceshopServices = service;
	}

}

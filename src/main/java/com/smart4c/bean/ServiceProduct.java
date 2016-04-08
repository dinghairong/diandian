package com.smart4c.bean;

import java.io.Serializable;

import javax.persistence.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


/**
 * The persistent class for the service_product database table.
 * 
 */
@Entity
@Table(name="service_product")
public class ServiceProduct extends AbstractModel<Integer> implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	@Column(name="abstract")
	private String abstract_;

	private String accessory;

	@Temporal(TemporalType.TIMESTAMP)
	private Date createdTime;

	private String description;

	private String duration;

	private String icon;

	private double newprice;

	private double oldprice;

	private String path;
	
	private int isfirst;

	private int status;

	private String title;

	private double web_price;

	@Temporal(TemporalType.TIMESTAMP)
	private Date updateTime;

	//bi-directional many-to-one association to Comment
	@OneToMany(mappedBy="serviceProduct")
	private List<Comment> comments;
		
	//bi-directional many-to-one association to Order
	@OneToMany(mappedBy="serviceProduct")
	private Set<Order> orders;

	//bi-directional many-to-one association to ServiceProject
	@ManyToOne
	@JoinColumn(name="service_project_id")
	private ServiceProject serviceProject;
	
	//bi-directional many-to-one association to ServiceshopService
	@OneToMany(mappedBy="serviceProduct")
	private List<ServiceshopService> serviceshopServices;

	public ServiceProduct() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAbstract_() {
		return this.abstract_;
	}

	public void setAbstract_(String abstract_) {
		this.abstract_ = abstract_;
	}

	public String getAccessory() {
		return this.accessory;
	}

	public void setAccessory(String accessory) {
		this.accessory = accessory;
	}

	public Date getCreatedTime() {
		return this.createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDuration() {
		return this.duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public String getIcon() {
		return this.icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public double getNewprice() {
		return this.newprice;
	}

	public void setNewprice(double newprice) {
		this.newprice = newprice;
	}

	public double getOldprice() {
		return this.oldprice;
	}

	public void setOldprice(double oldprice) {

		this.oldprice = oldprice;
	}

	public double getWeb_price() {
		return this.web_price;
	}

	public void setWeb_price(double web_price) {
		this.web_price = web_price;
	}

	public String getPath() {
		return this.path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public int getIsfirst() {
		return isfirst;
	}

	public void setIsfirst(int isfirst) {
		this.isfirst = isfirst;
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
	
	public List<Comment> getComments() {
		return this.comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
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

	public ServiceProject getServiceProject() {
		return this.serviceProject;
	}

	public void setServiceProject(ServiceProject serviceProject) {
		this.serviceProject = serviceProject;
	}

	public List<ServiceshopService> getServiceshopServices() {
		return serviceshopServices;
	}

	public void setServiceshopServices(List<ServiceshopService> serviceshopServices) {
		this.serviceshopServices = serviceshopServices;
	}

}
package com.smart4c.bean;

import java.io.Serializable;

import javax.persistence.*;

import java.util.List;


/**
 * The persistent class for the areadetail database table.
 * 
 */
@Entity
@Table(name = "areadetail")
public class AreaDetail extends AbstractModel<Integer> implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	private String area;

	private String city;

	private String county;

	private String firstletter;

	private int ishot;

	private String province;

	private String town;

	//bi-directional many-to-one association to Administrator
	@OneToMany(mappedBy="areaDetail")
	private List<Administrator> administrators;

	//bi-directional many-to-one association to Company
	@OneToMany(mappedBy="areaDetail")
	private List<Company> companies;

	//bi-directional many-to-one association to Serviceshop
	@OneToMany(mappedBy="areaDetail")
	private List<ServiceShop> serviceShops;

	//bi-directional many-to-one association to User
	@OneToMany(mappedBy="areaDetail")
	private List<User> users;

	public AreaDetail() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getArea() {
		return this.area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCounty() {
		return this.county;
	}

	public void setCounty(String county) {
		this.county = county;
	}

	public String getFirstletter() {
		return this.firstletter;
	}

	public void setFirstletter(String firstletter) {
		this.firstletter = firstletter;
	}

	public int getIshot() {
		return this.ishot;
	}

	public void setIshot(int ishot) {
		this.ishot = ishot;
	}

	public String getProvince() {
		return this.province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getTown() {
		return this.town;
	}

	public void setTown(String town) {
		this.town = town;
	}

	public List<Administrator> getAdministrators() {
		return this.administrators;
	}

	public void setAdministrators(List<Administrator> administrators) {
		this.administrators = administrators;
	}

	public List<Company> getCompanies() {
		return this.companies;
	}

	public void setCompanies(List<Company> companies) {
		this.companies = companies;
	}

	public List<ServiceShop> getServiceShops() {
		return this.serviceShops;
	}

	public void setServiceShops(List<ServiceShop> serviceShops) {
		this.serviceShops = serviceShops;
	}

	public List<User> getUsers() {
		return this.users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

}
package com.smart4c.bean;

import javax.persistence.*;
import java.io.File;
import java.io.Serializable;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the users database table.
 * 
 */
@Entity
@Table(name="store")
public class Store extends AbstractModel<Integer> implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	private String storename;

	private String  companyname;

	private String  linkman;

	private String  mobile;

	private String  introducer_mobile;

	private String  regtime;

	private String  updatetime;

	private String  businesshours;

	private Integer  status;

	private String  logo;

	private String  address;

	private String  longitude;

	private String  latitude;

	private Integer staffnumber;

	private Integer plantingduration;

	private String  covering;

	private String  imgs;

	private String  businesslicense;

	private String  email;

	private Integer  device;

	private Integer  areaid;

	private String  text1;

	private String  token;

	private String  city;

	private Integer  shengcode;


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getStorename() {
		return storename;
	}

	public void setStorename(String storename) {
		this.storename = storename;
	}

	public String getCompanyname() {
		return companyname;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}

	public String getLinkman() {
		return linkman;
	}

	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getIntroducer_mobile() {
		return introducer_mobile;
	}

	public void setIntroducer_mobile(String introducer_mobile) {
		this.introducer_mobile = introducer_mobile;
	}

	public String getRegtime() {
		return regtime;
	}

	public void setRegtime(String regtime) {
		this.regtime = regtime;
	}

	public String getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(String updatetime) {
		this.updatetime = updatetime;
	}

	public String getBusinesshours() {
		return businesshours;
	}

	public void setBusinesshours(String businesshours) {
		this.businesshours = businesshours;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public Integer getStaffnumber() {
		return staffnumber;
	}

	public void setStaffnumber(Integer staffnumber) {
		this.staffnumber = staffnumber;
	}

	public Integer getPlantingduration() {
		return plantingduration;
	}

	public void setPlantingduration(Integer plantingduration) {
		this.plantingduration = plantingduration;
	}

	public String getCovering() {
		return covering;
	}

	public void setCovering(String covering) {
		this.covering = covering;
	}

	public String getImgs() {
		return imgs;
	}

	public void setImgs(String imgs) {
		this.imgs = imgs;
	}

	public String getBusinesslicense() {
		return businesslicense;
	}

	public void setBusinesslicense(String businesslicense) {
		this.businesslicense = businesslicense;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getDevice() {
		return device;
	}

	public void setDevice(Integer device) {
		this.device = device;
	}

	public Integer getAreaid() {
		return areaid;
	}

	public void setAreaid(Integer areaid) {
		this.areaid = areaid;
	}

	public String getText1() {
		return text1;
	}

	public void setText1(String text1) {
		this.text1 = text1;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public Integer getShengcode() {
		return shengcode;
	}

	public void setShengcode(Integer shengcode) {
		this.shengcode = shengcode;
	}

}

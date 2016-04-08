package com.smart4c.bean;

import java.io.Serializable;

import javax.persistence.*;

import java.util.List;


/**
 * The persistent class for the car_brand database table.
 * 
 */
@Entity
@Table(name="car_brand")
public class CarBrand extends AbstractModel<Integer> implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	@Column(name="first_letter")
	private String firstLetter;

	private String icon;

	private String iconPath;

	private String name;

	private byte status;

	//bi-directional many-to-one association to Car
	@OneToMany(mappedBy="carBrand")
	private List<Car> cars;

	public CarBrand() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstLetter() {
		return this.firstLetter;
	}

	public void setFirstLetter(String firstLetter) {
		this.firstLetter = firstLetter;
	}

	public String getIcon() {
		return this.icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getIconPath() {
		return this.iconPath;
	}

	public void setIconPath(String iconPath) {
		this.iconPath = iconPath;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public byte getStatus() {
		return this.status;
	}

	public void setStatus(byte status) {
		this.status = status;
	}

	public List<Car> getCars() {
		return this.cars;
	}

	public void setCars(List<Car> cars) {
		this.cars = cars;
	}

}

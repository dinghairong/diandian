package com.smart4c.bean;

import java.io.Serializable;

import javax.persistence.*;

import java.util.List;


/**
 * The persistent class for the format database table.
 * 
 */
@Entity
@Table(name = "format")
public class Format extends AbstractModel<Integer> implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	private int ishot;

	private String name;

	//bi-directional many-to-one association to Car
	@OneToMany(mappedBy="format")
	private List<Car> cars;

	public Format() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIshot() {
		return this.ishot;
	}

	public void setIshot(int ishot) {
		this.ishot = ishot;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Car> getCars() {
		return this.cars;
	}

	public void setCars(List<Car> cars) {
		this.cars = cars;
	}

}
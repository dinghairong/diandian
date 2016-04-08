package com.smart4c.bean;

import java.io.Serializable;

import javax.persistence.*;


/**
 * The persistent class for the matching_tire database table.
 * 
 */
@Entity
@Table(name="matching_tire")
public class MatchingTire extends AbstractModel<Integer> implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	private String position;

	private int runflat;

	//bi-directional many-to-one association to Car
	@ManyToOne
	@JoinColumn(name="cid")
	private Car car;

	public MatchingTire() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPosition() {
		return this.position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public int getRunflat() {
		return this.runflat;
	}

	public void setRunflat(int runflat) {
		this.runflat = runflat;
	}

	public Car getCar() {
		return this.car;
	}

	public void setCar(Car car) {
		this.car = car;
	}

}

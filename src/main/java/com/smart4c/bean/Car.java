package com.smart4c.bean;

import java.io.Serializable;

import javax.persistence.*;

import java.util.List;


/**
 * The persistent class for the car database table.
 * 
 */
@Entity
public class Car extends AbstractModel<Integer> implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	private String emissions;

	private String icon;

	private int ishot;

	@Column(name="local_import")
	private int localImport;

	private String models;

	private String path;

	private String version;

	private String years;

	//bi-directional many-to-one association to CarBrand
	@ManyToOne
	@JoinColumn(name="car_brand_id")
	private CarBrand carBrand;

	//bi-directional many-to-one association to Format
	@ManyToOne
	@JoinColumn(name="fid")
	private Format format;

	//bi-directional many-to-one association to MatchingTire
	@OneToMany(mappedBy="car")
	private List<MatchingTire> matchingTires;

	public Car() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmissions() {
		return this.emissions;
	}

	public void setEmissions(String emissions) {
		this.emissions = emissions;
	}

	public String getIcon() {
		return this.icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public int getIshot() {
		return this.ishot;
	}

	public void setIshot(int ishot) {
		this.ishot = ishot;
	}

	public int getLocalImport() {
		return this.localImport;
	}

	public void setLocalImport(int localImport) {
		this.localImport = localImport;
	}

	public String getModels() {
		return this.models;
	}

	public void setModels(String models) {
		this.models = models;
	}

	public String getPath() {
		return this.path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getVersion() {
		return this.version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getYears() {
		return this.years;
	}

	public void setYears(String years) {
		this.years = years;
	}

	public CarBrand getCarBrand() {
		return this.carBrand;
	}

	public void setCarBrand(CarBrand carBrand) {
		this.carBrand = carBrand;
	}

	public Format getFormat() {
		return this.format;
	}

	public void setFormat(Format format) {
		this.format = format;
	}

	public List<MatchingTire> getMatchingTires() {
		return this.matchingTires;
	}

	public void setMatchingTires(List<MatchingTire> matchingTires) {
		this.matchingTires = matchingTires;
	}

}
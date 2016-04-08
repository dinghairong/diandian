package com.smart4c.bean;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;


/**
 * The persistent class for the areadetail database table.
 * 
 */
@Entity
@Table(name = "area")
public class Area extends AbstractModel<Integer> implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	private String areaname;

	private int parentid;


	public Integer getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAreaname() {
		return areaname;
	}

	public void setAreaname(String areaname) {
		this.areaname = areaname;
	}

	public int getParentid() {
		return parentid;
	}

	public void setParentid(int parentid) {
		this.parentid = parentid;
	}
}
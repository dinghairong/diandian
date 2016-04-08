package com.smart4c.bean;

import java.io.Serializable;

import javax.persistence.*;

import java.util.Date;


/**
 * The persistent class for the advisory database table.
 * 
 */
@Entity
@Table(name = "advisory")
public class Advisory extends AbstractModel<Integer> implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	@Temporal(TemporalType.TIMESTAMP)
	private Date admintime;

	private int iscommon;

	@Lob
	private String usecontent;

	@Temporal(TemporalType.TIMESTAMP)
	private Date usetime;

	@Lob
	private String uucontent;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="uid")
	private User user;

	//bi-directional many-to-one association to Administrator
	@ManyToOne
	@JoinColumn(name="adminid")
	private Administrator administrator;

	public Advisory() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getAdmintime() {
		return this.admintime;
	}

	public void setAdmintime(Date admintime) {
		this.admintime = admintime;
	}

	public int getIscommon() {
		return this.iscommon;
	}

	public void setIscommon(int iscommon) {
		this.iscommon = iscommon;
	}

	public String getUsecontent() {
		return this.usecontent;
	}

	public void setUsecontent(String usecontent) {
		this.usecontent = usecontent;
	}

	public Date getUsetime() {
		return this.usetime;
	}

	public void setUsetime(Date usetime) {
		this.usetime = usetime;
	}

	public String getUucontent() {
		return this.uucontent;
	}

	public void setUucontent(String uucontent) {
		this.uucontent = uucontent;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Administrator getAdministrator() {
		return this.administrator;
	}

	public void setAdministrator(Administrator administrator) {
		this.administrator = administrator;
	}

}
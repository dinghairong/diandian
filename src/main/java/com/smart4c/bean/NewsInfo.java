package com.smart4c.bean;

import java.io.Serializable;

import javax.persistence.*;

import java.util.Date;


/**
 * The persistent class for the newsinfo database table.
 * 
 */
@Entity
@Table(name = "newsinfo")
public class NewsInfo extends AbstractModel<Integer> implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	@Lob
	private String content;

	@Temporal(TemporalType.TIMESTAMP)
	private Date createdtime;

	private int isread;

	private String title;

	@Temporal(TemporalType.TIMESTAMP)
	private Date updatetime;

	//bi-directional many-to-one association to Serviceshop
	@ManyToOne
	@JoinColumn(name="vid")
	private ServiceShop serviceShop;

	//bi-directional many-to-one association to Infoclass
	@ManyToOne
	@JoinColumn(name="oid")
	private InfoClass infoClass;

	public NewsInfo() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreatedtime() {
		return this.createdtime;
	}

	public void setCreatedtime(Date createdtime) {
		this.createdtime = createdtime;
	}

	public int getIsread() {
		return this.isread;
	}

	public void setIsread(int isread) {
		this.isread = isread;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getUpdatetime() {
		return this.updatetime;
	}

	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}

	public ServiceShop getServiceShop() {
		return this.serviceShop;
	}

	public void setServiceShop(ServiceShop serviceShop) {
		this.serviceShop = serviceShop;
	}

	public InfoClass getInfoClass() {
		return this.infoClass;
	}

	public void setInfoClass(InfoClass infoClass) {
		this.infoClass = infoClass;
	}

}

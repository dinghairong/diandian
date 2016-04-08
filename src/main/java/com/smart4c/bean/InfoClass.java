package com.smart4c.bean;

import java.io.Serializable;

import javax.persistence.*;

import java.util.List;


/**
 * The persistent class for the infoclass database table.
 * 
 */
@Entity
@Table(name = "infoclass")
public class InfoClass extends AbstractModel<Integer> implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	private String name;

	//bi-directional many-to-one association to Newsinfo
	@OneToMany(mappedBy="infoClass")
	private List<NewsInfo> newsinfos;

	public InfoClass() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<NewsInfo> getNewsinfos() {
		return this.newsinfos;
	}

	public void setNewsinfos(List<NewsInfo> newsinfos) {
		this.newsinfos = newsinfos;
	}

}

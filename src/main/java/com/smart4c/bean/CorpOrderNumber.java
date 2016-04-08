package com.smart4c.bean;

import java.io.Serializable;

import javax.persistence.*;


/**
 * The persistent class for the corp_order_number database table.
 * 
 */
@Entity
@Table(name="corp_order_number")
public class CorpOrderNumber extends AbstractModel<Integer> implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	private int total;

	private int used;

	//bi-directional many-to-one association to Order
	@ManyToOne
	@JoinColumn(name="oid")
	private Order order;

	public CorpOrderNumber() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getTotal() {
		return this.total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getUsed() {
		return this.used;
	}

	public void setUsed(int used) {
		this.used = used;
	}

	public Order getOrder() {
		return this.order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

}

package com.smart4c.bean;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the serviceshop_service database table.
 * 
 */
@Entity
@Table(name="serviceshop_service")
public class ServiceshopService extends AbstractModel<Integer> implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(unique=true, nullable=false)
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	//bi-directional many-to-one association to Serviceshop
	@ManyToOne
	@JoinColumn(name="ssid", nullable=false)
	private ServiceShop serviceshop;

	//bi-directional many-to-one association to ServiceProject
	@ManyToOne
	@JoinColumn(name="spid", nullable=false)
	private ServiceProduct serviceProduct;

	public ServiceshopService() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public ServiceShop getServiceshop() {
		return this.serviceshop;
	}

	public void setServiceshop(ServiceShop serviceshop) {
		this.serviceshop = serviceshop;
	}

	public ServiceProduct getServiceProduct() {
		return serviceProduct;
	}

	public void setServiceProduct(ServiceProduct serviceProduct) {
		this.serviceProduct = serviceProduct;
	}
}
package com.poly.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import java.util.List;

@Entity
public class Manufacturer {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int manufacturer_id;

	private String manufacturer_name;

	private boolean is_del;

	@OneToMany(mappedBy = "manufacturer")
	private List<Product> products;

	public Manufacturer() {
		// TODO Auto-generated constructor stub
	}

	public Manufacturer(int manufacturer_id, String manufacturer_name, boolean is_del, List<Product> products) {
		super();
		this.manufacturer_id = manufacturer_id;
		this.manufacturer_name = manufacturer_name;
		this.is_del = is_del;
		this.products = products;
	}

	public int getManufacturer_id() {
		return manufacturer_id;
	}

	public void setManufacturer_id(int manufacturer_id) {
		this.manufacturer_id = manufacturer_id;
	}

	public String getManufacturer_name() {
		return manufacturer_name;
	}

	public void setManufacturer_name(String manufacturer_name) {
		this.manufacturer_name = manufacturer_name;
	}

	public boolean isIs_del() {
		return is_del;
	}

	public void setIs_del(boolean is_del) {
		this.is_del = is_del;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

}

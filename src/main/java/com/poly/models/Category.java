package com.poly.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import java.util.List;

@Entity
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int category_id;

	private String category_name;

	private boolean is_del;

	@OneToMany(mappedBy = "category")
	private List<Product> products;

	public Category() {
		// TODO Auto-generated constructor stub
	}

	public Category(int category_id, String category_name, boolean is_del, List<Product> products) {
		super();
		this.category_id = category_id;
		this.category_name = category_name;
		this.is_del = is_del;
		this.products = products;
	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
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

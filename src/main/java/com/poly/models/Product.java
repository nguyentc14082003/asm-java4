package com.poly.models;

import javax.persistence.*;
import java.util.List;

@Entity
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int product_id;

	@ManyToOne
	@JoinColumn(name = "category_id")
	private Category category;

	@ManyToOne
	@JoinColumn(name = "manufacturer_id")
	private Manufacturer manufacturer;
	private String product_name;
	private int quantity_in_stock;
	private double original_price;
	private String image;
	private String size;
	private String material;
	private double weight;
	private String color;
	private String description;
	private boolean is_del;

	@OneToMany(mappedBy = "product", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private List<PromotionalDetails> promotionalDetailsList;

	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL)
	private List<InvoiceDetail> invoiceDetails;

	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL)
	private List<Wishlist> wishlists;

	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL)
	private List<RecentlyViewed> recentlyViewedList;

	// Default constructor
	public Product() {
	}

	public Product(int product_id, Category category, Manufacturer manufacturer, String product_name,
			int quantity_in_stock, double original_price, String image, String size, String material, double weight,
			String color, String description, boolean is_del, List<PromotionalDetails> promotionalDetailsList,
			List<InvoiceDetail> invoiceDetails, List<Wishlist> wishlists, List<RecentlyViewed> recentlyViewedList) {
		super();
		this.product_id = product_id;
		this.category = category;
		this.manufacturer = manufacturer;
		this.product_name = product_name;
		this.quantity_in_stock = quantity_in_stock;
		this.original_price = original_price;
		this.image = image;
		this.size = size;
		this.material = material;
		this.weight = weight;
		this.color = color;
		this.description = description;
		this.is_del = is_del;
		this.promotionalDetailsList = promotionalDetailsList;
		this.invoiceDetails = invoiceDetails;
		this.wishlists = wishlists;
		this.recentlyViewedList = recentlyViewedList;
	}

	

	@Override
	public String toString() {
		return "Product [product_id=" + product_id + ", category=" + category + ", manufacturer=" + manufacturer
				+ ", product_name=" + product_name + ", quantity_in_stock=" + quantity_in_stock + ", original_price="
				+ original_price + ", image=" + image + ", size=" + size + ", material=" + material + ", weight="
				+ weight + ", color=" + color + ", description=" + description + ", is_del=" + is_del + "]";
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Manufacturer getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(Manufacturer manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getQuantity_in_stock() {
		return quantity_in_stock;
	}

	public void setQuantity_in_stock(int quantity_in_stock) {
		this.quantity_in_stock = quantity_in_stock;
	}

	public double getOriginal_price() {
		return original_price;
	}

	public void setOriginal_price(double original_price) {
		this.original_price = original_price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isIs_del() {
		return is_del;
	}

	public void setIs_del(boolean is_del) {
		this.is_del = is_del;
	}

	public List<PromotionalDetails> getPromotionalDetailsList() {
		return promotionalDetailsList;
	}

	public void setPromotionalDetailsList(List<PromotionalDetails> promotionalDetailsList) {
		this.promotionalDetailsList = promotionalDetailsList;
	}

	public List<InvoiceDetail> getInvoiceDetails() {
		return invoiceDetails;
	}

	public void setInvoiceDetails(List<InvoiceDetail> invoiceDetails) {
		this.invoiceDetails = invoiceDetails;
	}

	public List<Wishlist> getWishlists() {
		return wishlists;
	}

	public void setWishlists(List<Wishlist> wishlists) {
		this.wishlists = wishlists;
	}

	public List<RecentlyViewed> getRecentlyViewedList() {
		return recentlyViewedList;
	}

	public void setRecentlyViewedList(List<RecentlyViewed> recentlyViewedList) {
		this.recentlyViewedList = recentlyViewedList;
	}

}

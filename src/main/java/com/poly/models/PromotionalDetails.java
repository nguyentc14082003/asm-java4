package com.poly.models;

import javax.persistence.*;

@Entity
public class PromotionalDetails {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int promotional_id;

	@ManyToOne
	@JoinColumn(name = "product_id")
	private Product product;

	@ManyToOne
	@JoinColumn(name = "flashSale_id")
	private FlashSale flashSale;

	private double discounted_price;
	private boolean promotion_status;

	public PromotionalDetails() {
	}

	public PromotionalDetails(int promotional_id, Product product, FlashSale flashSale, double discounted_price,
			boolean promotion_status) {
		super();
		this.promotional_id = promotional_id;
		this.product = product;
		this.flashSale = flashSale;
		this.discounted_price = discounted_price;
		this.promotion_status = promotion_status;
	}

	public int getPromotional_id() {
		return promotional_id;
	}

	public void setPromotional_id(int promotional_id) {
		this.promotional_id = promotional_id;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public FlashSale getFlashSale() {
		return flashSale;
	}

	public void setFlashSale(FlashSale flashSale) {
		this.flashSale = flashSale;
	}

	public double getDiscounted_price() {
		return discounted_price;
	}

	public void setDiscounted_price(double discounted_price) {
		this.discounted_price = discounted_price;
	}

	public boolean isPromotion_status() {
		return promotion_status;
	}

	public void setPromotion_status(boolean promotion_status) {
		this.promotion_status = promotion_status;
	}

}

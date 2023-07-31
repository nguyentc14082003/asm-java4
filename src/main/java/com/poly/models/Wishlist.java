package com.poly.models;

import java.util.Date;

import javax.persistence.*;

@Entity
public class Wishlist {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int wishlist_id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private UserCustom user;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    private Date wishlist_date;

    public Wishlist() {
    }

	public Wishlist(int wishlist_id, UserCustom user, Product product, Date wishlist_date) {
		super();
		this.wishlist_id = wishlist_id;
		this.user = user;
		this.product = product;
		this.wishlist_date = wishlist_date;
	}

	public int getWishlist_id() {
		return wishlist_id;
	}

	public void setWishlist_id(int wishlist_id) {
		this.wishlist_id = wishlist_id;
	}

	public UserCustom getUser() {
		return user;
	}

	public void setUser(UserCustom user) {
		this.user = user;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Date getWishlist_date() {
		return wishlist_date;
	}

	public void setWishlist_date(Date wishlist_date) {
		this.wishlist_date = wishlist_date;
	}
    
    
}

package com.poly.models;

import java.util.Date;

import javax.persistence.*;

@Entity
public class RecentlyViewed {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int recently_viewed_id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private UserCustom user;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    private Date viewed_date;

    public RecentlyViewed() {
    }

	public RecentlyViewed(int recently_viewed_id, UserCustom user, Product product, Date viewed_date) {
		super();
		this.recently_viewed_id = recently_viewed_id;
		this.user = user;
		this.product = product;
		this.viewed_date = viewed_date;
	}

	public int getRecently_viewed_id() {
		return recently_viewed_id;
	}

	public void setRecently_viewed_id(int recently_viewed_id) {
		this.recently_viewed_id = recently_viewed_id;
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

	public Date getViewed_date() {
		return viewed_date;
	}

	public void setViewed_date(Date viewed_date) {
		this.viewed_date = viewed_date;
	}
    
}

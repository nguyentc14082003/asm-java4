package com.poly.models;

import java.util.List;

import javax.persistence.*;

@Entity
public class UserCustom {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int user_id;

	private String username;

	private String password;

	private String fullname;

	private String email;

	private String phone_number;

	private String address;

	private boolean isAdmin;

	private boolean is_del;

	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
	private List<Invoice> invoices;

	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
	private List<Wishlist> wishlists;

	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
	private List<RecentlyViewed> recentlyViewedList;

	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
	private List<Cart> carts;

	public UserCustom() {
	}

	public UserCustom(int user_id, String username, String password, String fullname, String email, String phone_number,
			String address, boolean isAdmin, boolean is_del, List<Invoice> invoices, List<Wishlist> wishlists,
			List<RecentlyViewed> recentlyViewedList, List<Cart> carts) {
		super();
		this.user_id = user_id;
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.email = email;
		this.phone_number = phone_number;
		this.address = address;
		this.isAdmin = isAdmin;
		this.is_del = is_del;
		this.invoices = invoices;
		this.wishlists = wishlists;
		this.recentlyViewedList = recentlyViewedList;
		this.carts = carts;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public boolean isAdmin() {
		return isAdmin;
	}

	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	public boolean isIs_del() {
		return is_del;
	}

	public void setIs_del(boolean is_del) {
		this.is_del = is_del;
	}

	public List<Invoice> getInvoices() {
		return invoices;
	}

	public void setInvoices(List<Invoice> invoices) {
		this.invoices = invoices;
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

	public List<Cart> getCarts() {
		return carts;
	}

	public void setCarts(List<Cart> carts) {
		this.carts = carts;
	}

}

package com.poly.dao;

import javax.persistence.*;

import org.hibernate.Hibernate;

import com.poly.models.Cart;
import com.poly.utils.JpaUtil;

import java.util.List;

public class CartDAO extends EntityDAO<Cart> {

	public CartDAO() {
		super(Cart.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		return JpaUtil.getEntityManager();
	}

	public void deleteProductInCart(int productID, int userId) {
		EntityManager en = getEntityManager();
		try {
			String jpql = "DELETE FROM Cart c WHERE c.user.user_id = :userId AND c.product.product_id = :productId";
			en.getTransaction().begin();
			en.createQuery(jpql).setParameter("userId", userId).setParameter("productId", productID).executeUpdate();
			en.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			en.getTransaction().rollback();
			en.close();
		}
	}

	public List<Cart> getAllCartsByUserId(int userId) {
		EntityManager entityManager = getEntityManager();
		try {
			String jpql = "SELECT c FROM Cart c WHERE c.user.user_id = :userId";
			TypedQuery<Cart> query = entityManager.createQuery(jpql, Cart.class);
			query.setParameter("userId", userId);
			return query.getResultList();
		} finally {
			entityManager.close();
		}
	}
	public Cart getCartByUseridAndProductId(int userId, int productId) {
		EntityManager entityManager = getEntityManager();
		try {
			String jpql = "SELECT c FROM Cart c WHERE c.user.user_id = :userId and c.product.product_id = :productId";
			TypedQuery<Cart> query = entityManager.createQuery(jpql, Cart.class);
			query.setParameter("userId", userId);
			query.setParameter("productId", productId);
			return query.getSingleResult();
		} finally {
			entityManager.close();
		}
	}
	public double totalPriceCartByUserId(int userId) {
		List<Cart> cartList = getAllCartsByUserId(userId);
		double totalPrice = 0;
		for (Cart cart : cartList) {
			totalPrice += cart.getPrice() * cart.getQuantity();
		}
		return totalPrice;
	}

	public Cart getCartWithUser(int cartId) {
		EntityManager entityManager = getEntityManager();
		Cart cart = null;
		try {
			entityManager.getTransaction().begin();
			cart = entityManager.find(Cart.class, cartId);
			Hibernate.initialize(cart.getUser()); // Force load thông tin người dùng
			entityManager.getTransaction().commit();
		} catch (Exception ex) {
			entityManager.getTransaction().rollback();
			throw ex;
		} finally {
			entityManager.close();
		}
		return cart;
	}

	public static void main(String[] args) {
		CartDAO dao = new CartDAO();
		dao.deleteProductInCart(300007,101012);
	}
}

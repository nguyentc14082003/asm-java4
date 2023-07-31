package com.poly.dao;

import com.poly.models.Product;
import com.poly.models.UserCustom;
import com.poly.models.Wishlist;
import com.poly.utils.JpaUtil;

import javax.persistence.EntityManager;
import java.util.List;

public class WishlistDAO extends EntityDAO<Wishlist> {

	public WishlistDAO() {
		super(Wishlist.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		return JpaUtil.getEntityManager();
	}

	// Thêm sản phẩm vào danh sách yêu thích
	public void addToWishlist(int userId, int productId) {
		EntityManager entityManager = getEntityManager();
		try {
			entityManager.getTransaction().begin();

			// Kiểm tra xem sản phẩm đã tồn tại trong danh sách yêu thích của người dùng
			// chưa
			String jpql = "SELECT w FROM Wishlist w WHERE w.user.id = :userId AND w.product.id = :productId";
			List<Wishlist> existingItems = entityManager.createQuery(jpql, Wishlist.class)
					.setParameter("userId", userId).setParameter("productId", productId).getResultList();

			if (existingItems.isEmpty()) {
				// Nếu chưa tồn tại, thêm sản phẩm vào danh sách yêu thích
				Wishlist wishlistItem = new Wishlist();
				wishlistItem.setUser(entityManager.getReference(UserCustom.class, userId));
				wishlistItem.setProduct(entityManager.getReference(Product.class, productId));
				entityManager.persist(wishlistItem);
			}

			entityManager.getTransaction().commit();
		} catch (Exception ex) {
			entityManager.getTransaction().rollback();
			throw ex;
		} finally {
			entityManager.close();
		}
	}

	// Xóa sản phẩm khỏi danh sách yêu thích
	public void removeFromWishlist(int userId, int productId) {
		EntityManager entityManager = getEntityManager();
		try {
			entityManager.getTransaction().begin();

			// Tìm sản phẩm trong danh sách yêu thích của người dùng
			String jpql = "SELECT w FROM Wishlist w WHERE w.user.id = :userId AND w.product.id = :productId";
			List<Wishlist> wishlistItems = entityManager.createQuery(jpql, Wishlist.class)
					.setParameter("userId", userId).setParameter("productId", productId).getResultList();

			if (!wishlistItems.isEmpty()) {
				// Nếu sản phẩm tồn tại, xóa nó khỏi danh sách yêu thích
				Wishlist wishlistItem = wishlistItems.get(0);
				entityManager.remove(wishlistItem);
			}

			entityManager.getTransaction().commit();
		} catch (Exception ex) {
			entityManager.getTransaction().rollback();
			throw ex;
		} finally {
			entityManager.close();
		}
	}

	// Lấy danh sách sản phẩm trong danh sách yêu thích của người dùng
	public List<Wishlist> getWishlistByUserId(int userId) {
		EntityManager entityManager = getEntityManager();
		try {
			String jpql = "SELECT w FROM Wishlist w WHERE w.user.id = :userId";
			return entityManager.createQuery(jpql, Wishlist.class).setParameter("userId", userId).getResultList();
		} finally {
			entityManager.close();
		}
	}
	
	
}

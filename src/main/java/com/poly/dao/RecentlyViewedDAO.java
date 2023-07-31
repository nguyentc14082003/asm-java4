package com.poly.dao;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.poly.models.Product;
import com.poly.models.RecentlyViewed;
import com.poly.models.UserCustom;
import com.poly.utils.JpaUtil;

public class RecentlyViewedDAO extends EntityDAO<RecentlyViewed> {

	public RecentlyViewedDAO() {
		super(RecentlyViewed.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		return JpaUtil.getEntityManager();
	}

	// Thêm sản phẩm vào danh sách sản phẩm đã xem gần đây
	public void addToRecentlyViewed(int userId, int productId) {
		EntityManager entityManager = getEntityManager();
		try {
			entityManager.getTransaction().begin();

			// Kiểm tra xem sản phẩm đã tồn tại trong danh sách sản phẩm đã xem của người
			// dùng chưa
			String jpql = "SELECT r FROM RecentlyViewed r WHERE r.user.id = :userId AND r.product.id = :productId";
			List<RecentlyViewed> existingItems = entityManager.createQuery(jpql, RecentlyViewed.class)
					.setParameter("userId", userId).setParameter("productId", productId).getResultList();

			if (!existingItems.isEmpty()) {
				// Nếu sản phẩm đã tồn tại, xóa sản phẩm trùng
				for (RecentlyViewed item : existingItems) {
					entityManager.remove(item);
				}
			}

			// Thêm sản phẩm vào danh sách sản phẩm đã xem gần đây
			RecentlyViewed recentlyViewedItem = new RecentlyViewed();
			recentlyViewedItem.setUser(entityManager.getReference(UserCustom.class, userId));
			recentlyViewedItem.setProduct(entityManager.getReference(Product.class, productId));
			recentlyViewedItem.setViewed_date(new Date());
			entityManager.persist(recentlyViewedItem);

			entityManager.getTransaction().commit();
		} catch (Exception ex) {
			entityManager.getTransaction().rollback();
			throw ex;
		} finally {
			entityManager.close();
		}
	}

	// Lấy danh sách sản phẩm đã xem gần đây của người dùng
	public List<RecentlyViewed> getRecentlyViewedByUserId(int userId) {
		EntityManager entityManager = getEntityManager();
		try {
			String jpql = "SELECT r FROM RecentlyViewed r WHERE r.user.id = :userId ORDER BY r.viewedDate DESC";
			TypedQuery<RecentlyViewed> query = entityManager.createQuery(jpql, RecentlyViewed.class);
			query.setParameter("userId", userId);
			query.setMaxResults(40); // Giới hạn số lượng kết quả trả về là 40
			return query.getResultList();
		} finally {
			entityManager.close();
		}
	}

}

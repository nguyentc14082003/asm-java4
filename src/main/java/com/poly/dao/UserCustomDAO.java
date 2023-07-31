package com.poly.dao;

import com.poly.models.UserCustom;
import com.poly.utils.JpaUtil;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import org.hibernate.Hibernate;

import java.util.List;

public class UserCustomDAO extends EntityDAO<UserCustom> {

	public UserCustomDAO() {
		super(UserCustom.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		return JpaUtil.getEntityManager();
	}

	// Thêm người dùng mới
	@Override
	public void create(UserCustom entity) {
		super.create(entity);
	}

	// Cập nhật thông tin người dùng
	@Override
	public UserCustom update(UserCustom entity) {
		return super.update(entity);
	}

	// Xóa người dùng
	@Override
	public void delete(int id) {
		EntityManager entityManager = getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			UserCustom user = entityManager.find(UserCustom.class, id);
			if (user != null) {
				// Đặt trạng thái xóa thành true
				user.setIs_del(true);
				entityManager.merge(user);
			}
			transaction.commit();
		} catch (Exception ex) {
			if (transaction.isActive()) {
				transaction.rollback();
			}
			throw ex;
		} finally {
			entityManager.close();
		}
	}

	// Lấy danh sách tất cả người dùng
	@Override
	public List<UserCustom> getAll() {
		return super.getAll();
	}

	// Lấy danh sách người dùng có cột trạng thái xóa là false

	public List<UserCustom> getActiveUsers() {
		EntityManager entityManager = getEntityManager();
		try {
			String jpql = "SELECT u FROM UserCustom u WHERE u.isDel = false";
			TypedQuery<UserCustom> query = entityManager.createQuery(jpql, UserCustom.class);
			return query.getResultList();
		} finally {
			entityManager.close();
		}
	}

	// Tìm kiếm người dùng theo tên đăng nhập (username)

	public UserCustom findByUsername(String username) {
		EntityManager entityManager = getEntityManager();
		try {
			String jpql = "SELECT u FROM UserCustom u WHERE u.username = :username";
			TypedQuery<UserCustom> query = entityManager.createQuery(jpql, UserCustom.class)
					.setParameter("username", username).setMaxResults(1);

			List<UserCustom> users = query.getResultList();
			if (!users.isEmpty()) {
				return users.get(0);
			}
			return null;
		} finally {
			entityManager.close();
		}
	}

	// Kiểm tra xem người dùng có quyền admin hay không
	public boolean isAdmin(int userId) {
		EntityManager entityManager = getEntityManager();
		try {
			UserCustom user = entityManager.find(UserCustom.class, userId);
			if (user != null) {
				return user.isAdmin();
			}
			return false;
		} finally {
			entityManager.close();
		}
	}

	// Lấy danh sách người dùng theo trang
	public List<UserCustom> getUsersByPage(int page, int pageSize) {
		EntityManager entityManager = getEntityManager();
		try {
			String jpql = "SELECT u FROM UserCustom u";
			TypedQuery<UserCustom> query = entityManager.createQuery(jpql, UserCustom.class)
					.setFirstResult((page - 1) * pageSize).setMaxResults(pageSize);

			return query.getResultList();
		} finally {
			entityManager.close();
		}
	}

	// Lấy tổng số người dùng
	public long getUserCount() {
		EntityManager entityManager = getEntityManager();
		try {
			String jpql = "SELECT COUNT(u) FROM UserCustom u";
			TypedQuery<Long> query = entityManager.createQuery(jpql, Long.class);
			return query.getSingleResult();
		} finally {
			entityManager.close();
		}
	}
	
	public UserCustom getUserWithCarts(int userId) {
		EntityManager entityManager = getEntityManager();
        UserCustom user = null;
        try {
            entityManager.getTransaction().begin();
            user = entityManager.find(UserCustom.class, userId);
            Hibernate.initialize(user); // Force load danh sách giỏ hàng
            entityManager.getTransaction().commit();
        } catch (Exception ex) {
            entityManager.getTransaction().rollback();
            throw ex;
        } finally {
            entityManager.close();
        }
        return user;
    }
}

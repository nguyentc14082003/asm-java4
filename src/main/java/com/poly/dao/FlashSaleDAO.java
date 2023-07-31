package com.poly.dao;

import com.poly.models.FlashSale;
import com.poly.utils.JpaUtil;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import java.util.Date;
import java.util.List;

public class FlashSaleDAO extends EntityDAO<FlashSale> {

	public FlashSaleDAO() {
		super(FlashSale.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		return JpaUtil.getEntityManager();
	}

	// Thêm khuyến mãi mới
	@Override
	public void create(FlashSale entity) {
		super.create(entity);
	}

	// Cập nhật thông tin khuyến mãi
	@Override
	public FlashSale update(FlashSale entity) {
		return super.update(entity);
	}

	// Xóa khuyến mãi
	@Override
	public void delete(int id) {
		EntityManager entityManager = getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			FlashSale flashSale = entityManager.find(FlashSale.class, id);
			if (flashSale != null) {
				// Đặt trạng thái của flash sale thành false
				flashSale.setIs_status(true);
				entityManager.merge(flashSale);
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

	// Lấy danh sách tất cả khuyến mãi
	@Override
	public List<FlashSale> getAll() {
		return super.getAll();
	}

	// Tìm kiếm khuyến mãi theo ID
	@Override
	public FlashSale findById(int id) {
		return super.findById(id);
	}

	// Lấy khuyến mãi đang diễn ra (nếu có)
	public FlashSale findActiveFlashSale() {
		EntityManager entityManager = getEntityManager();
		try {
			String jpql = "SELECT f FROM FlashSale f WHERE f.is_status = false";
			TypedQuery<FlashSale> query = entityManager.createQuery(jpql, FlashSale.class);
			List<FlashSale> flashSales = query.getResultList();
			if (!flashSales.isEmpty()) {
				return flashSales.get(0);
			}
			return null;
		} finally {
			entityManager.close();
		}
	}

	 // Phương thức lấy ra khuyến mãi đang active
    public FlashSale getActiveFlashSale() {
        EntityManager entityManager = getEntityManager();
        try {
            Date currentDate = new Date();
            String jpql = "SELECT f FROM FlashSale f WHERE f.is_status = false AND f.end_day >= :currentDate";
            TypedQuery<FlashSale> query = entityManager.createQuery(jpql, FlashSale.class);
            query.setParameter("currentDate", currentDate);
            List<FlashSale> resultList = query.getResultList();
            if (!resultList.isEmpty()) {
                return resultList.get(0);
            } else {
                return null;
            }
        } finally {
            entityManager.close();
        }
    }
	
	// Kích hoạt khuyến mãi mới
	public void activateFlashSale(FlashSale flashSale) {
		EntityManager entityManager = getEntityManager();
		try {
			entityManager.getTransaction().begin();
			FlashSale activeFlashSale = findActiveFlashSale();
			if (activeFlashSale != null) {
				activeFlashSale.setIs_status(false); // Kết thúc khuyến mãi hiện tại
				entityManager.merge(activeFlashSale);
			}
			flashSale.setIs_status(true); // Bắt đầu khuyến mãi mới
			entityManager.merge(flashSale);
			entityManager.getTransaction().commit();
		} catch (Exception ex) {
			entityManager.getTransaction().rollback();
			throw ex;
		} finally {
			entityManager.close();
		}
	}

}

package com.poly.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import com.poly.models.Invoice;
import com.poly.models.Product;
import com.poly.utils.JpaUtil;

import java.util.List;

public class InvoiceDAO extends EntityDAO<Invoice> {

	public InvoiceDAO() {
		super(Invoice.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		return JpaUtil.getEntityManager();
	}

	// Thêm hóa đơn mới
	@Override
	public void create(Invoice invoice) {
		super.create(invoice);
	}

	// Cập nhật hóa đơn
	@Override
	public Invoice update(Invoice invoice) {
		return update(invoice);
	}

	// Lấy danh sách tất cả hóa đơn
	@Override
	public List<Invoice> getAll() {
		EntityManager entityManager = getEntityManager();
		try {
			String jpql = "SELECT i FROM Invoice i";
			return entityManager.createQuery(jpql, Invoice.class).getResultList();
		} finally {
			entityManager.close();
		}
	}

	public List<Invoice> findLimitedRecords(int offset, int limit) {
		return super.findLimitedRecords(offset, limit);
	}

	// Phương thức lấy trang tiếp theo của sản phẩm
	public List<Invoice> next(int currentPage, int pageSize) {
		int offset = (currentPage - 1) * pageSize;
		return findLimitedRecords(offset, pageSize);
	}

	// Phương thức lấy trang trước của sản phẩm
	public List<Invoice> prev(int currentPage, int pageSize) {
		int offset = (currentPage - 2) * pageSize;
		return findLimitedRecords(offset, pageSize);
	}

	// Phương thức lấy trang cuối cùng của sản phẩm
	public List<Invoice> last(int pageSize) {
		EntityManager entityManager = getEntityManager();
		try {
			String jpql = "SELECT e FROM " + entityClass.getSimpleName() + " e ORDER BY e.invoiceId DESC";
			TypedQuery<Invoice> query = entityManager.createQuery(jpql, Invoice.class);
			query.setMaxResults(pageSize);
			return query.getResultList();
		} finally {
			entityManager.close();
		}
	}

	// Phương thức lấy trang đầu tiên của sản phẩm
	public List<Invoice> first(int pageSize) {
		return findLimitedRecords(0, pageSize);
	}
}

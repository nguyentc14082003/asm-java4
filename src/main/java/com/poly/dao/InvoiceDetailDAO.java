package com.poly.dao;

import javax.persistence.EntityManager;

import com.poly.models.InvoiceDetail;
import com.poly.utils.JpaUtil;

import java.util.List;

public class InvoiceDetailDAO extends EntityDAO<InvoiceDetail> {

	public InvoiceDetailDAO() {
		super(InvoiceDetail.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		return JpaUtil.getEntityManager();
	}

	@Override
	public void create(InvoiceDetail entity) {
		super.create(entity);
	}

	// Lấy danh sách chi tiết hóa đơn của một hóa đơn
	public List<InvoiceDetail> getInvoiceDetailsByInvoiceId(int invoiceId) {
		EntityManager entityManager = getEntityManager();
		try {
			String jpql = "SELECT id FROM InvoiceDetail id WHERE id.invoice.invoiceId = :invoiceId";
			return entityManager.createQuery(jpql, InvoiceDetail.class).setParameter("invoiceId", invoiceId)
					.getResultList();
		} finally {
			entityManager.close();
		}
	}

}

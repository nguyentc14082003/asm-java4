package com.poly.dao;

import com.poly.models.Product;
import com.poly.utils.JpaUtil;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import java.util.ArrayList;
import java.util.List;

public class ProductDAO extends EntityDAO<Product> {

	public ProductDAO() {
		super(Product.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		return JpaUtil.getEntityManager();
	}

	// Phương thức thêm sản phẩm
	public void addProduct(Product product) {
		create(product);
	}

	// Phương thức cập nhật sản phẩm
	public void updateProduct(Product product) {
		update(product);
	}

	@Override
	public void delete(int id) {
		EntityManager entityManager = getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			Product product = entityManager.find(Product.class, id);
			if (product != null) {
				product.setIs_del(true);
				entityManager.merge(product);
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

	public Product findProductById(int id) {
		return findById(id);
	}
	
	
	public List<Product> findByNameWithChar(String charToSearch) {
		EntityManager entityManager = getEntityManager();
		try {
			String jpql = "SELECT p FROM Product p WHERE p.product_name LIKE :charToSearch AND p.is_del = false";
			TypedQuery<Product> query = entityManager.createQuery(jpql, Product.class);
			query.setParameter("charToSearch", "%" + charToSearch + "%");
			return query.getResultList();
		} finally {
			entityManager.close();
		}
	}

	// Phương thức lấy danh sách tất cả sản phẩm
	public List<Product> getAllProducts() {
		return getAll();
	}

	// Phương thức lấy sản phẩm theo ID
	public Product getProductById(int id) {
		return findById(id);
	}

	// Phương thức lấy danh sách sản phẩm chưa xóa
	public List<Product> getAllProductNames() {
		EntityManager entityManager = getEntityManager();
		try {
			String jpql = "SELECT p FROM Product p WHERE p.is_del = false";
			TypedQuery<Product> query = entityManager.createQuery(jpql, Product.class);
			return query.getResultList();
		} finally {
			entityManager.close();
		}
	}

	public List<Product> findLimitedRecords(int offset, int limit) {
		return super.findLimitedRecords(offset, limit);
	}

	// Phương thức lấy trang tiếp theo của sản phẩm
	public List<Product> next(int currentPage, int pageSize) {
		int offset = (currentPage - 1) * pageSize;
		return findLimitedRecords(offset, pageSize);
	}

	// Phương thức lấy trang trước của sản phẩm
	public List<Product> prev(int currentPage, int pageSize) {
		int offset = (currentPage - 2) * pageSize;
		return findLimitedRecords(offset, pageSize);
	}

	// Phương thức lấy trang cuối cùng của sản phẩm
	public List<Product> last(int pageSize) {
		EntityManager entityManager = getEntityManager();
		try {
			String jpql = "SELECT e FROM " + entityClass.getSimpleName() + " e ORDER BY e.productId DESC";
			TypedQuery<Product> query = entityManager.createQuery(jpql, Product.class);
			query.setMaxResults(pageSize);
			return query.getResultList();
		} finally {
			entityManager.close();
		}
	}

	// Phương thức lấy trang đầu tiên của sản phẩm
	public List<Product> first(int pageSize) {
		return findLimitedRecords(0, pageSize);
	}

	// Phương thức lấy danh sách sản phẩm theo mã nhà cung cấp
	public List<Product> getProductsByManufacturerId(int manufacturerId) {
		EntityManager entityManager = getEntityManager();
		try {
			String jpql = "SELECT p FROM Product p WHERE p.is_del = false AND p.manufacturer.manufacturer_id = :manufacturerId";
			TypedQuery<Product> query = entityManager.createQuery(jpql, Product.class);
			query.setParameter("manufacturerId", manufacturerId);
			return query.getResultList();
		} finally {
			entityManager.close();
		}
	}

	// Phương thức lấy danh sách sản phẩm theo mã loại sản phẩm
	public List<Product> getProductsByCategoryId(int categoryId) {
		EntityManager entityManager = getEntityManager();
		try {
			String jpql = "SELECT p FROM Product p WHERE p.is_del = false AND p.category.category_id = :categoryId";
			TypedQuery<Product> query = entityManager.createQuery(jpql, Product.class);
			query.setParameter("categoryId", categoryId);
			return query.getResultList();
		} finally {
			entityManager.close();
		}
	}
}

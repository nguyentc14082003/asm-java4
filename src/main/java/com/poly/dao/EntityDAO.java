package com.poly.dao;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.util.List;

public abstract class EntityDAO<T> {
	protected Class<T> entityClass;

	public EntityDAO(Class<T> entityClass) {
		this.entityClass = entityClass;
	}

	protected abstract EntityManager getEntityManager();

	public void create(T entity) {
		EntityManager entityManager = getEntityManager();
		try {
			entityManager.getTransaction().begin();
			entityManager.persist(entity);
			entityManager.getTransaction().commit();
		} catch (Exception ex) {
			entityManager.getTransaction().rollback();
			throw ex;
		} finally {
			entityManager.close();
		}
	}

	public T update(T entity) {
		EntityManager entityManager = getEntityManager();
		try {
			entityManager.getTransaction().begin();
			T updatedEntity = entityManager.merge(entity);
			entityManager.getTransaction().commit();
			return updatedEntity;
		} catch (Exception ex) {
			entityManager.getTransaction().rollback();
			throw ex;
		} finally {
			entityManager.close();
		}
	}

	public void delete(int id) {
		EntityManager entityManager = getEntityManager();
		try {
			entityManager.getTransaction().begin();
			T entity = entityManager.find(entityClass, id);
			if (entity != null) {
				entityManager.remove(entity);
			}
			entityManager.getTransaction().commit();
		} catch (Exception ex) {
			entityManager.getTransaction().rollback();
			throw ex;
		} finally {
			entityManager.close();
		}
	}

	public List<T> getAll() {
		EntityManager entityManager = getEntityManager();
		try {
			String jpql = "SELECT e FROM " + entityClass.getSimpleName() + " e";
			TypedQuery<T> query = entityManager.createQuery(jpql, entityClass);
			return query.getResultList();
		} finally {
			
			entityManager.close();
		}
	}

	public T findById(int id) {
		EntityManager entityManager = getEntityManager();
		try {
			return entityManager.find(entityClass, id);
		} finally {
			entityManager.close();
		}
	}

	public List<T> findByName(String name) {
		EntityManager entityManager = getEntityManager();
		try {
			String jpql = "SELECT e FROM " + entityClass.getSimpleName() + " e WHERE e.name = :name";
			TypedQuery<T> query = entityManager.createQuery(jpql, entityClass);
			query.setParameter("name", name);
			return query.getResultList();
		} finally {
			entityManager.close();
		}
	}

	public List<T> findLimitedRecords(int offset, int limit) {
        EntityManager entityManager = getEntityManager();
        try {
            String jpql = "SELECT e FROM " + entityClass.getSimpleName() + " e WHERE e.isDel = false";
            TypedQuery<T> query = entityManager.createQuery(jpql, entityClass);
            query.setFirstResult(offset);
            query.setMaxResults(limit);
            return query.getResultList();
        } finally {
            entityManager.close();
        }
    }
	
}

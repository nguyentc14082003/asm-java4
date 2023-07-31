package com.poly.dao;

import com.poly.models.Category;
import com.poly.utils.JpaUtil;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpSession;

import java.util.List;

public class CategoryDAO extends EntityDAO<Category> {

	public CategoryDAO() {
		super(Category.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		return JpaUtil.getEntityManager();
	}

	public List<Category> getAllCategory() {
		return getAll();
	}

	public void getAllCategories(HttpSession session) {
        List<Category> categories = getAll();
        session.setAttribute("categories", categories);
    }
}

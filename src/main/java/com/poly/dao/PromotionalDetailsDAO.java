package com.poly.dao;

import java.util.List;

import javax.persistence.EntityManager;

import com.poly.models.PromotionalDetails;
import com.poly.utils.JpaUtil;

public class PromotionalDetailsDAO extends EntityDAO<PromotionalDetails>{

	public PromotionalDetailsDAO() {
		super(PromotionalDetails.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		return JpaUtil.getEntityManager();
	}

	@Override
	public void create(PromotionalDetails entity) {
		super.create(entity);
	}
	
	@Override
	public PromotionalDetails update(PromotionalDetails entity) {
		// TODO Auto-generated method stub
		return super.update(entity);
	}
	
	@Override
	public List<PromotionalDetails> getAll() {
		// TODO Auto-generated method stub
		return super.getAll();
	}
	
	
}

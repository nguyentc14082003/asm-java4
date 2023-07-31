package com.poly.dao;

import com.poly.models.Manufacturer;
import com.poly.utils.JpaUtil;

import javax.persistence.EntityManager;
import java.util.List;

public class ManufacturerDAO extends EntityDAO<Manufacturer> {

    public ManufacturerDAO() {
        super(Manufacturer.class);
    }

    @Override
    protected EntityManager getEntityManager() {
        return JpaUtil.getEntityManager();
    }

    public List<Manufacturer> getAllManufacturer() {
    	return getAll();
    }
    

}

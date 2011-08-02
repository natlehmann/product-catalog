package com.elpudu.productos.catalogo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.elpudu.productos.catalogo.domain.Product;

@Repository
@Transactional(propagation=Propagation.SUPPORTS, readOnly=true)
public class ProductDaoImpl extends HibernateDaoSupport implements ProductDao {
	
	
	@Autowired
	public ProductDaoImpl(HibernateTemplate hibernateTemplate){
		super();
		this.setHibernateTemplate(hibernateTemplate);
	}
	
	

	@Override
	@Transactional(readOnly=false, propagation = Propagation.REQUIRED)
	public Product create(Product product) {
		getHibernateTemplate().persist(product);
		return product;
	}
	
	@Override
	@Transactional(readOnly=false, propagation = Propagation.REQUIRED)
	public void delete(Product product) {
		getHibernateTemplate().delete(product);
	}
	
	@Override
	@Transactional(readOnly=false, propagation = Propagation.REQUIRED)
	public Product update(Product product) {
		getHibernateTemplate().update(product);
		return product;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Product getById(Integer id) {
		
		List<Product> products = getHibernateTemplate().findByNamedParam(
				"Select p from Product p left join fetch p.image where p.id = :id", "id", id);
		
		if (!products.isEmpty()) {
			return products.get(0);
		}
		
//		if (product != null) {
//			if (product.getImage() != null) {
////				getHibernateTemplate().refresh(product.getImage());
//				getHibernateTemplate().initialize(product.getImage());
//			}
//			
//			if (product.getSmallImage() != null) {
//				getHibernateTemplate().refresh(product.getSmallImage());
//			}
//		}
		
		return null;
	}



	@SuppressWarnings("unchecked")
	@Override
	public List<Product> getAll() {
		return getHibernateTemplate().loadAll(Product.class);
	}



	@Override
	public Product getByCode(String code) {
		
		@SuppressWarnings("unchecked")
		List<Product> products = getHibernateTemplate().findByNamedParam(
				"Select p from Product p where p.code = :code", "code", code);
		
		if (products != null && !products.isEmpty()) {
			return products.get(0);
		}
		
		return null;
	}
}

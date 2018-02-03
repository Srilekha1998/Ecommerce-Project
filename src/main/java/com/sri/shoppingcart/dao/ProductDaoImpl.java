package com.sri.shoppingcart.dao;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

import com.sri.shoppingcart.model.Category;
import com.sri.shoppingcart.model.ProductDemo;

@Repository("productDao")
@Transactional
public class ProductDaoImpl implements ProductDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	public ProductDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Transactional
	public List<ProductDemo> list() {
		@SuppressWarnings("unchecked")
		List<ProductDemo> listProduct = (List<ProductDemo>) sessionFactory.getCurrentSession().createCriteria(ProductDemo.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		//System.out.println(listProduct);
		return listProduct;
	}
	@Override
	@Transactional
	public void saveProduct(ProductDemo product) {
		sessionFactory.getCurrentSession().saveOrUpdate(product);
		
	}
	
	@Transactional
	public void deleteProduct(ProductDemo product,int id)
	{
		product.setId(id);
		sessionFactory.getCurrentSession().delete(product);
	}
	
	@Transactional
	public ProductDemo updateProduct(ProductDemo product,int id)
	{
		product.setId(id);
		product=sessionFactory.getCurrentSession().get(product.getClass(),id);
		return product;
	}
}

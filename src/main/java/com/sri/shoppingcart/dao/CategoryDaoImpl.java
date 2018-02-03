package com.sri.shoppingcart.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sri.shoppingcart.model.Category;
import com.sri.shoppingcart.model.ProductDemo;

@Repository("categoryDao")
@Transactional
public class CategoryDaoImpl implements CategoryDao {
	@Autowired
	private SessionFactory sessionFactory;

	public CategoryDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Transactional
	public List<Category> listCategory() {
		@SuppressWarnings("unchecked")
		List<Category> listProduct = (List<Category>) sessionFactory.getCurrentSession().createCriteria(Category.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		//System.out.println(listProduct);
		return listProduct;
	}
	@Override
	@Transactional
	public void saveCategory(Category category) {
		sessionFactory.getCurrentSession().saveOrUpdate(category);
		
	}
	
	@Override
	@Transactional
	public List<ProductDemo> listCategoryProduct(int id){
		return sessionFactory.getCurrentSession().createQuery("from ProductDemo where CATEGORY_ID='"+id+"'",ProductDemo.class).getResultList();
	
	}
	
	@Override
	@Transactional
	public void deleteCategory(Category category,int id) {
		category.setId(id);
		sessionFactory.getCurrentSession().delete(category);
	}
	
	@Override
	@Transactional
	public Category updateCategory(Category category,int id)
	{
		category.setId(id);
		category=sessionFactory.getCurrentSession().get(category.getClass(),id);
		return category;
	}


}

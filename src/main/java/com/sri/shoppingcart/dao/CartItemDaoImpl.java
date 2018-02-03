package com.sri.shoppingcart.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sri.shoppingcart.model.Cart;
import com.sri.shoppingcart.model.CartItems;

@Repository("cartItemDao")
@Transactional
public class CartItemDaoImpl implements CartItemDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	public CartItemDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	@Transactional
	public void save(CartItems cartItems)
	{
		sessionFactory.getCurrentSession().saveOrUpdate(cartItems);

	}
	
	@Override
	@Transactional
	public CartItems getCartItems(int id)
	{
		try
		{
			return sessionFactory.getCurrentSession().createQuery("from CartItems where PRODUCT_ID='"+id+"'",CartItems.class).getSingleResult();
		}
		catch(Exception ex)
		{
		return null;
		}
	}

}

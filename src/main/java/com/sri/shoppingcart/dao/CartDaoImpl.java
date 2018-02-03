package com.sri.shoppingcart.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sri.shoppingcart.model.Cart;
import com.sri.shoppingcart.model.CartItems;
import com.sri.shoppingcart.model.ProductDemo;
import com.sri.shoppingcart.model.RegisterDemo;

@Repository("cartDao")
@Transactional
public class CartDaoImpl implements CartDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	public CartDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public List<CartItems> getCartItems(int id)
	{
		Cart cart=new Cart();
		List<CartItems> cart1=(List<CartItems>) sessionFactory.getCurrentSession().get(cart.getClass(),id);
		return cart1;
	}
	
	@Override
	public Cart saveCart(Cart cart)
	{
		Session session = sessionFactory.getCurrentSession();
		session.persist(cart);
		return cart;
	}
	
	public void saveCartDetail(Cart cart)
	{
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(cart);
	}
	
	public Cart getCart(int id)
	{
		/*Cart cart=new Cart();
		Criteria criteria=sessionFactory.getCurrentSession().createCriteria(RegisterDemo.class);
		cart=(Cart) criteria.add(Restrictions.eq("REGISTERDEMO_ID",id)).uniqueResult();
		return cart;*/
		try
		{
			return sessionFactory.getCurrentSession().createQuery("from Cart where REGISTERDEMO_ID='"+id+"'",Cart.class).getSingleResult();
		}
		catch(Exception ex)
		{
		return null;
		}
	}

}

package com.sri.shoppingcart.dao;

import org.hibernate.Criteria;
//import org.h2.mvstore.db.TransactionStore.Transaction;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sri.shoppingcart.model.ProductDemo;
import com.sri.shoppingcart.model.RegisterDemo;

@Repository("RegisterDao")
@Transactional
public class RegisterDaoImpl implements RegisterDao {
	@Autowired
	private SessionFactory sessionFactory;

	public RegisterDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
       }
	@Override
	@Transactional
	public RegisterDemo saveRegister(RegisterDemo register) {
		Session session = sessionFactory.getCurrentSession();
		//Transaction transaction=session.beginTransaction();
		register.setRole("ROLE_USER");
		register.setEnabled("TRUE");
		session.persist(register);
		return register;
		//transaction.commit();
	}
	
	@Override
	@Transactional
	public void saveAddress(RegisterDemo register) {
		Session session = sessionFactory.getCurrentSession();
		//Transaction transaction=session.beginTransaction();
		session.saveOrUpdate(register);
		//transaction.commit();
	}
	
	@Transactional
	public RegisterDemo sendDetails(int id)
	{
		RegisterDemo register=new RegisterDemo();
		register.setId(id);
		register=sessionFactory.getCurrentSession().get(register.getClass(),id);
		return register;
	}
	
	@Override
	@Transactional
	public RegisterDemo getUserDetails(String uname)
	{
		RegisterDemo register=new RegisterDemo();
		Criteria criteria=sessionFactory.getCurrentSession().createCriteria(RegisterDemo.class);
		register=(RegisterDemo) criteria.add(Restrictions.eq("uname",uname)).uniqueResult();
		return register;
	}

}

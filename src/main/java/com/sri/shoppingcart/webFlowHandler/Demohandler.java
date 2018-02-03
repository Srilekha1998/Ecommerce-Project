package com.sri.shoppingcart.webFlowHandler;

import java.security.Principal;


import javax.servlet.http.HttpServletRequest;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.binding.message.MessageContext;
import org.springframework.stereotype.Component;

import com.sri.shoppingcart.dao.RegisterDao;
import com.sri.shoppingcart.model.Address;
import com.sri.shoppingcart.model.RegisterDemo;
import com.sri.shoppingcart.model.TempBean;

@Component("demohandler")
public class Demohandler {
	
	@Autowired
	TempBean tempBean;
	
	@Autowired(required = true)
	private RegisterDao registerDao;
	
	@Autowired(required = true)
	private Address address;

	@Autowired
	HttpServletRequest request;
	
	@Autowired
	RegisterDemo register;
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public String test() {
		
		System.out.println("Address ID = "+register.getTempBean().getAddId());
		
		return "success";
	}
	
	public RegisterDemo initFlow() {
	String uname= request.getUserPrincipal().getName();
	System.out.println(uname);
	register=registerDao.getUserDetails(uname);
	return register;
	}
	
	public String validateDetails(RegisterDemo register,MessageContext messageContext)
	{
		String status="success";
		return status;
	}
	
	public Address validate1Details(int id,MessageContext messageContext)
	{
		Address address=new Address();
		//address.setId(id);
		System.out.println(id);
		Address address1=sessionFactory.getCurrentSession().get(address.getClass(),id);
		return address1;
	}

}

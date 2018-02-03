package com.sri.shoppingcart.dao;
import com.sri.shoppingcart.model.RegisterDemo;

public interface RegisterDao {
	
	RegisterDemo saveRegister(RegisterDemo register);
	RegisterDemo sendDetails(int id);
	void saveAddress(RegisterDemo register);
	RegisterDemo getUserDetails(String uname);
}

package com.sri.shoppingcart.dao;

import java.util.List;

import com.sri.shoppingcart.model.Cart;
import com.sri.shoppingcart.model.CartItems;
import com.sri.shoppingcart.model.RegisterDemo;

public interface CartDao {
	
	List<CartItems> getCartItems(int id);
	Cart saveCart(Cart cart);
	void saveCartDetail(Cart cart);
    Cart getCart(int id);
}

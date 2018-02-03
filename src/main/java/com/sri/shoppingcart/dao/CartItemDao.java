package com.sri.shoppingcart.dao;

import com.sri.shoppingcart.model.Cart;
import com.sri.shoppingcart.model.CartItems;

public interface CartItemDao {

	public void save(CartItems cartItems);
	CartItems getCartItems(int id);
}

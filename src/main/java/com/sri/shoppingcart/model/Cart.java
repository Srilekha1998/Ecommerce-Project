package com.sri.shoppingcart.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name="Cart")
@Component
public class Cart {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@OneToMany(fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	private List<CartItems> cartItems;
	
	@OneToOne(fetch=FetchType.EAGER)
	private RegisterDemo registerDemo;
	
	private float grandTotal;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<CartItems> getCartItems() {
		return cartItems;
	}

	public void setCartItems(List<CartItems> cartItems) {
		this.cartItems = cartItems;
	}

	public RegisterDemo getRegisterDemo() {
		return registerDemo;
	}

	public void setRegisterDemo(RegisterDemo registerDemo) {
		this.registerDemo = registerDemo;
	}

	public float getGrandTotal() {
		return grandTotal;
	}

	public void setGrandTotal(float grandTotal) {
		this.grandTotal = grandTotal;
	}
	
	
}

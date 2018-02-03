package com.sri.shoppingcart.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;

@Entity
@Table(name="CartItems")
@Component
public class CartItems {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@OneToOne(fetch=FetchType.EAGER)
	private ProductDemo product;
	
	//@NotEmpty(message="Enter the quantity")
	private String quantity;
	private float subTotal;

	/*public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}*/

	public ProductDemo getProduct() {
		return product;
	}

	public void setProduct(ProductDemo product) {
		this.product = product;
	}
	

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public float getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(float subTotal) {
		this.subTotal = subTotal;
	}
	
	

}

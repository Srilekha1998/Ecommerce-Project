package com.sri.shoppingcart.model;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Table;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.GeneratedValue;  
import javax.persistence.GenerationType;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="Category")
@Component
public class Category {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	@NotEmpty(message="Name should not be empty.")
	private String cname;
	
	/*@OneToMany(fetch=FetchType.EAGER)
	private List<ProductDemo> product;*/
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	/*public List<ProductDemo> getProduct() {
		return product;
	}
	public void setProduct(List<ProductDemo> product) {
		this.product = product;
	}*/
}

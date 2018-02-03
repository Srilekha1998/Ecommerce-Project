package com.sri.shoppingcart.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.GeneratedValue;  
import javax.persistence.GenerationType;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="ProductDetails")
@Component
public class ProductDemo {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	  private int id;  
	  @NotEmpty(message="Name should not be empty.")
	  private String pname;  
	  @NotEmpty(message="Desciption should not be empty.")
	  private String pdescription;  
	  @NotEmpty(message="Cost should be specified.")
	  private String cost;
	 /* @Transient
	  @NotNull
	  private MultipartFile image;*/
	  
	  @ManyToOne(fetch=FetchType.EAGER)
	  private Category category;
	  
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPdescription() {
		return pdescription;
	}
	public void setPdescription(String pdescription) {
		this.pdescription = pdescription;
	}
	public String getCost() {
		return cost;
	}
	public void setCost(String cost) {
		this.cost = cost;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	} 
	  


}

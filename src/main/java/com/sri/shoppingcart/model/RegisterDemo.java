package com.sri.shoppingcart.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Size;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.ApplicationScope;

@Entity
@Table(name = "Registration")
@Component("register")
@ApplicationScope
public class RegisterDemo implements Serializable {

	private static final long serialVersionUID = 4657462015039726030L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@NotEmpty(message = "Name should not be empty.")
	private String fname;
	private String lname;
	@Email(message = "Invalid email! Please enter valid email.")
	private String email;
	@Size(max = 10, min = 10, message = "Phone Number entered is invalid.It must be with exactly 10 characters.")
	private String phoneNumber;
	@NotEmpty(message = "User Name should not be empty.")
	private String uname;
	@Size(max = 12, min = 6, message = "Password entered is invalid.It must be between 6 and 12 characters.")
	private String psw;

	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private List<Address> address;

	private String role;
	private String enabled;

	@Transient
	TempBean tempBean;

	public TempBean getTempBean() {
		return tempBean;
	}

	public void setTempBean(TempBean tempBean) {
		this.tempBean = tempBean;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		id = id;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getPsw() {
		return psw;
	}

	public void setPsw(String psw) {
		this.psw = psw;
	}

	public List<Address> getAddress() {
		return address;
	}

	public void setAddress(List<Address> address) {
		this.address = address;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

}

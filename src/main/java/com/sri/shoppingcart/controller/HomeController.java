package com.sri.shoppingcart.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndView;

import com.sri.shoppingcart.dao.CategoryDao;
import com.sri.shoppingcart.dao.ProductDao;
import com.sri.shoppingcart.dao.RegisterDao;
import com.sri.shoppingcart.model.Address;
import com.sri.shoppingcart.model.Category;
import com.sri.shoppingcart.model.ProductDemo;
import com.sri.shoppingcart.model.RegisterDemo;

@Controller
public class HomeController {
	@Autowired(required = true)
	private RegisterDao registerDao;
	
	@Autowired(required = true)
	private ProductDao productDao;
	
	@Autowired(required = true)
	private CategoryDao categoryDao;

	@RequestMapping("/")
	public String setUpForm() {

		return "index";
	}
	/*@RequestMapping("/index")
	public String loginForm(Map<String, Object> map) {

		return "Register";
	}*/
	 
	/*@RequestMapping("/Product")
	public ModelAndView productForm() {

		//return "Product";
		 return new ModelAndView("Product","product",new ProductDemo()); 
	}
	public String productForm(Model model) {
		//List<Category> category= categoryDao.list();
		model.addAttribute("categoryList", categoryDao.listCategory());
		model.addAttribute("product" , new ProductDemo());
		return "Product";
	}*/
	 
	
	/*public String regForm(Map<String, Object> map) {

		return "Register";
	}*/
	@RequestMapping("/Register")
	 public ModelAndView showform(){
		 return new ModelAndView("Register","register",new RegisterDemo()); 
	}
	
	@RequestMapping("/registration")
	public String save(@ModelAttribute("register") @Validated RegisterDemo register,BindingResult bindingResult,Model model){
		if (bindingResult.hasErrors()) {
	         return "Register";
	      }
		register=registerDao.saveRegister(register);
		model.addAttribute("address", new Address());
		  return "address";
	}
	
	@RequestMapping(value= {"/login"},method = {RequestMethod.GET,RequestMethod.POST})
	public String goLogin(Model model)
	{
		model.addAttribute("register",new RegisterDemo());
		return "login";
	}
	
	@RequestMapping("/logout")
	public String home()
	{
		return "/";
	}
	
	/*@RequestMapping("/loginuser")
	public String userLogin(@ModelAttribute("register") RegisterDemo register,Model model){
		model.addAttribute("categoryList", categoryDao.listCategory());
		model.addAttribute("product", new ProductDemo());
		  return "dataTable";
	}*/
	
	@RequestMapping("addaddress/{id}")
    public String setAddress(@ModelAttribute("address")@Validated Address address,BindingResult bindingResult,@PathVariable("id") int id,Model model) {
		if (bindingResult.hasErrors()) {
	         return "address";
	      }
		RegisterDemo register=registerDao.sendDetails(id);
		//List<Address> addresses=new ArrayList<Address>();
		List<Address> addresses=register.getAddress();
		addresses.add(address);
		register.setAddress(addresses);
		registerDao.saveAddress(register);
		model.addAttribute("register",register);
		return "extraAddress";
		}
	
	@RequestMapping("/address/{id}")
	public String showAddress(@ModelAttribute("address") Address address,@PathVariable("id") int id,Model model) {
		
		RegisterDemo register=registerDao.sendDetails(id);
		model.addAttribute("register",register);
		return "address";
	}
	/*@RequestMapping("/registration")
	    public String regFormSubmit(HttpServletRequest req, HttpServletResponse res) {
		String fname = req.getParameter("fname");
		String lname = req.getParameter("lname");
		String email = req.getParameter("email");
		String uname = req.getParameter("uname");
		String phoneNumber = req.getParameter("phoneNumber");
		String psw = req.getParameter("psw");
		Register register = new Register();
		register.setFname(fname);
		register.setLname(lname);
		register.setEmail(email);
		register.setPhoneNumber(phoneNumber);
		register.setUname(uname);
		register.setPsw(psw);
		registerDao.saveRegister(register);
		return "Register";
	}*/
	
	@RequestMapping("/testing") 
	public @ResponseBody List<ProductDemo> listAllUsers()
	{
		return productDao.list();
	}
	
	@RequestMapping("/displayCategory")
	public @ResponseBody List<Category> lists()
	{
		return categoryDao.listCategory();
	}
	
	@RequestMapping("/searching/{id}")
	public @ResponseBody List<ProductDemo> listProduct(@ModelAttribute("product") ProductDemo product,@PathVariable("id")int id){
		//System.out.println(id);
		List<ProductDemo> lists=categoryDao.listCategoryProduct(id);
		return lists;
	}
	
}


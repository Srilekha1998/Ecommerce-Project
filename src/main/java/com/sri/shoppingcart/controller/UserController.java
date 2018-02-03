package com.sri.shoppingcart.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sri.shoppingcart.dao.CartDao;
import com.sri.shoppingcart.dao.CartItemDao;
import com.sri.shoppingcart.dao.CategoryDao;
import com.sri.shoppingcart.dao.ProductDao;
import com.sri.shoppingcart.dao.RegisterDao;
import com.sri.shoppingcart.model.Address;
import com.sri.shoppingcart.model.Cart;
import com.sri.shoppingcart.model.CartItems;
import com.sri.shoppingcart.model.ProductDemo;
import com.sri.shoppingcart.model.RegisterDemo;

@Controller()
@RequestMapping("/user")
public class UserController {
	
	@Autowired(required = true)
	private RegisterDao registerDao;
	
	@Autowired(required = true)
	private ProductDao productDao;
	
	@Autowired(required = true)
	private CategoryDao categoryDao;
	
	@Autowired(required = true)
	private CartItemDao cartItemDao;
	
	@Autowired(required = true)
	private CartDao cartDao;
	
	
	@RequestMapping("/userShowList")
	public String userList(Model model)
	{
		model.addAttribute("categoryList", this.categoryDao.listCategory());
		model.addAttribute("productList", this.productDao.list());
		model.addAttribute("product" , new ProductDemo());
		return "userProductList";
	}
	
	
	@RequestMapping("/addToCartItems/{id}")
	public String cartItem(@ModelAttribute("cartItems") CartItems cartItems, @PathVariable("id") int id,Model model) {
		ProductDemo product=new ProductDemo();
		product = productDao.updateProduct(product, id);

		//model.addAttribute("categoryList", this.categoryDao.listCategory());
		model.addAttribute("productList",product);
		return "cartItems";
	}
	
	@RequestMapping("/addToCart/{id}")
	public String addingToCart(@ModelAttribute("cartItems")CartItems cartItems,@PathVariable("id") int id,Model model,Principal user) {
		ProductDemo product=new ProductDemo();
		RegisterDemo register=new RegisterDemo();
		//Cart cart=new Cart();
		List<CartItems> cartItems1;
		System.out.println("hii");
		String uname=user.getName();
		register=registerDao.getUserDetails(uname);
		Cart cart;
		if((cart=cartDao.getCart(register.getId()))==null)
		{
			cart=new Cart();
			cart.setRegisterDemo(register);
		 cart=cartDao.saveCart(cart);
		}
		if(cart.getCartItems()==null)
		{
			cartItems1=new ArrayList<CartItems>();
			cart.setGrandTotal(0);
		}
		else
		{
		   cartItems1=cart.getCartItems();
		}
		int count=0;
		for(CartItems item:cartItems1)
		{
			if(item.getProduct().getId()==id)
			{
				int q=Integer.parseInt(item.getQuantity());
				int q1=Integer.parseInt(cartItems.getQuantity());
				item.setQuantity(Integer.toString(q+q1));
				int cost=Integer.parseInt(item.getProduct().getCost());
				int q3=Integer.parseInt(item.getQuantity());
				item.setSubTotal(q3*cost);
				cart.setCartItems(cartItems1);
				cart.setGrandTotal(cart.getGrandTotal()+(q1*cost));
				cartDao.saveCartDetail(cart);
				count=1;
			}
		}
		if(count==0)
		{
			product = productDao.updateProduct(product, id);
			cartItems.setProduct(product);
			int c=Integer.parseInt(cartItems.getProduct().getCost());
			System.out.println(c);
			int q=Integer.parseInt(cartItems.getQuantity());
			System.out.println(q);
			cartItems.setSubTotal(c*q);
			System.out.println(cartItems.getSubTotal());
			cartItems1.add(cartItems);
			cart.setGrandTotal(cart.getGrandTotal()+cartItems.getSubTotal());
			cart.setCartItems(cartItems1);
			cartDao.saveCartDetail(cart);
		}
		model.addAttribute("cartItemsList", cartItems1);
		model.addAttribute("cart", cart);

		return "listCartItems";
	}
	
	@RequestMapping("/deleteCart")
	public String delete(Model model,Principal user)
	{
		//RegisterDemo register=new RegisterDemo();
		CartItems cartItems=new CartItems();
		String uname=user.getName();
		RegisterDemo register=registerDao.getUserDetails(uname);
		Cart cart;
		cart=cartDao.getCart(register.getId());
		cart.setCartItems(null);
		cart.setGrandTotal(0);
		cartDao.saveCartDetail(cart);
		return "checkout";
	}
	
	@RequestMapping("/existingAddress")
	public String showExistingAddress(Model model,Principal user)
	{ 
		String uname=user.getName();
		RegisterDemo register=registerDao.getUserDetails(uname);
		model.addAttribute("register", register.getAddress());
		return "listAddress";
	}
	
	@RequestMapping("/cart")
	public String userCart(Model model,Principal user)
	{
		RegisterDemo register=new RegisterDemo();
		String uname=user.getName();
		System.out.println(uname);
		register=registerDao.getUserDetails(uname);
		System.out.println(register.getId());
		System.out.println(register.getUname());
		Cart cart=new Cart();
		cart=cartDao.getCart(register.getId());
		System.out.println(cart.getRegisterDemo().getId());
		List<CartItems> cartItems1=new ArrayList<CartItems>();
		cartItems1=cart.getCartItems();
		System.out.println(cart.getGrandTotal());
		model.addAttribute("cartItemsList", cartItems1);
		model.addAttribute("cart", cart);

		return "listCartItems";

	}

}

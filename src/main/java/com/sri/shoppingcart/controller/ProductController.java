package com.sri.shoppingcart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.security.Principal;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sri.shoppingcart.dao.CartDao;
import com.sri.shoppingcart.dao.CategoryDao;
import com.sri.shoppingcart.dao.ProductDao;
import com.sri.shoppingcart.dao.RegisterDao;
import com.sri.shoppingcart.model.Cart;
import com.sri.shoppingcart.model.Category;
import com.sri.shoppingcart.model.ProductDemo;
import com.sri.shoppingcart.model.RegisterDemo;

@Controller
@RequestMapping("/admin")
public class ProductController {
	@Autowired(required = true)
	private ProductDao productDao;
	
	@Autowired(required = true)
	private CategoryDao categoryDao;

	@Autowired
	HttpServletRequest request;
	// private static final String UPLOAD_DIRECTORY ="/resources/Images";

	@RequestMapping("uploadForm")
	public ModelAndView uploadForm() {
		return new ModelAndView("uploadForm");
	}

	@RequestMapping(value = "savefile", method = RequestMethod.POST)
	public String saveimage(@ModelAttribute("product") ProductDemo product,@RequestParam CommonsMultipartFile file,Model model, HttpSession session) throws Exception {

		product = (ProductDemo) request.getServletContext().getAttribute("product");

		ServletContext context = session.getServletContext();
		String path = context.getRealPath("/resources/Images");
		String filename = Integer.toString(product.getId());

		System.out.println(path + File.pathSeparator + filename+".jpg");

		byte[] bytes = file.getBytes();
		BufferedOutputStream stream = new BufferedOutputStream(
				new FileOutputStream(new File(path + File.separator + filename+".jpg")));
		stream.write(bytes);
		stream.flush();
		stream.close();
        
		model.addAttribute("categoryList", this.categoryDao.listCategory());
		model.addAttribute("productList", this.productDao.list());
		return "dataTable";
	}

	@RequestMapping("/addproduct")
	public String saveProduct(@ModelAttribute("product") @Validated ProductDemo product,BindingResult bindingResult,Model model) {
		/*
		 * String productName = req.getParameter("productName"); String productDesc =
		 * req.getParameter("productDesc"); String productPrice =
		 * req.getParameter("productPrice"); ProductDemo product=new ProductDemo();
		 * product.setPname(productName); product.setPdescription(productDesc);
		 * product.setCost(productPrice); productDao.saveProduct(product);
		 */
		
		if (bindingResult.hasErrors()) {
			model.addAttribute("categoryList", this.categoryDao.listCategory());
		    //model.addAttribute("productList", this.productDao.list());
	         return "dataTable";
	      }

		productDao.saveProduct(product);

		request.getServletContext().setAttribute("product", product);
		model.addAttribute("categoryList", this.categoryDao.listCategory());
		model.addAttribute("productList", this.productDao.list());
		return "dataTable";
	}

	@RequestMapping("/display")
	public ModelAndView displayDetail(@ModelAttribute("product") ProductDemo product) {
		ModelAndView model = new ModelAndView();
		model.addObject("productList", this.productDao.list());
		model.setViewName("Product");
		return model;
	}

	@RequestMapping("/deleteproduct/{id}")
	public ModelAndView deleteProduct(@ModelAttribute("product") ProductDemo product, @PathVariable("id") int id) {
		// ProductDemo product=new ProductDemo();
		productDao.deleteProduct(product, id);
        ModelAndView model=new ModelAndView();
		model.addObject("categoryList", this.categoryDao.listCategory());
		model.addObject("productList", this.productDao.list());
		model.setViewName("dataTable");
		return model;
	}

	@RequestMapping("/updateproduct/{id}")
	public String updateProduct(@ModelAttribute("product") ProductDemo product, @PathVariable("id") int id,Model model) {
		// ProductDemo product=new ProductDemo();
		product = productDao.updateProduct(product, id);

		model.addAttribute("categoryList", this.categoryDao.listCategory());
		model.addAttribute("productList",product);
		return "updateProduct";
	}

	@RequestMapping("/editproduct")
	public String editProduct(@ModelAttribute("product") @Validated ProductDemo product,BindingResult bindingResult,Model model) {
		/*
		 * String productName = req.getParameter("productName"); String productDesc =
		 * req.getParameter("productDesc"); String productPrice =
		 * req.getParameter("productPrice"); ProductDemo product=new ProductDemo();
		 * product.setPname(productName); product.setPdescription(productDesc);
		 * product.setCost(productPrice); productDao.saveProduct(product);
		 */
		if (bindingResult.hasErrors()) {
			model.addAttribute("categoryList", this.categoryDao.listCategory());
			model.addAttribute("productList",product);
	         return "updateProduct";
	      }
		productDao.saveProduct(product);

		model.addAttribute("categoryList", this.categoryDao.listCategory());
		model.addAttribute("productList", this.productDao.list());
		return "dataTable";
	}
	
	@RequestMapping("/dataTable")
	/*public ModelAndView showTable(@ModelAttribute("product") ProductDemo product)
	{
		return new ModelAndView("dataTable");
	}*/
	public String productForm(Model model) {
		//List<Category> category= categoryDao.list();
		model.addAttribute("categoryList", this.categoryDao.listCategory());
		model.addAttribute("productList", this.productDao.list());
		model.addAttribute("product" , new ProductDemo());
		return "dataTable";
	}
	
	
	@RequestMapping("/category")
	public String showCategory(Model model)
	{
		model.addAttribute("category", new Category());
		return "category";
	}
	
	
	@RequestMapping("/addcategory")
	public String saveCategory(@ModelAttribute("category")@Validated Category category,BindingResult bindingResult,Model model) {
		
		if (bindingResult.hasErrors()) {
	         return "category";
	      }
		
		categoryDao.saveCategory(category);
        //request.getServletContext().setAttribute("category", category);
		//ModelAndView model = new ModelAndView();
		//model.addObject("categoryList", this.categoryDao.listCategory());
		//model.setViewName("dataTable");
		model.addAttribute("categoryList", this.categoryDao.listCategory());
		//model.addAttribute("productList", this.productDao.list());
		//model.addAttribute("product", new ProductDemo());
		return "category";
	}
	
	@RequestMapping("/deletecategory/{id}")
	public ModelAndView deleteProduct(@ModelAttribute("category") Category category, @PathVariable("id") int id) {
		// ProductDemo product=new ProductDemo();
		categoryDao.deleteCategory(category, id);
        ModelAndView model=new ModelAndView();
		//model.addObject("categoryList", this.categoryDao.listCategory());
		model.setViewName("category");
		return model;
	}
	
	@RequestMapping("/updatecategory/{id}")
	public String updateProduct(@ModelAttribute("category") Category category, @PathVariable("id") int id,Model model) {
		// ProductDemo product=new ProductDemo();
		category = categoryDao.updateCategory(category, id);

		//model.addAttribute("categoryList", this.categoryDao.listCategory());
		model.addAttribute("categoryList",category);
		return "updateCategory";
	}
	
	@RequestMapping("/editcategory")
	public String editCategory(@ModelAttribute("category") @Validated Category category,BindingResult bindingResult,Model model) {
		/*
		 * String productName = req.getParameter("productName"); String productDesc =
		 * req.getParameter("productDesc"); String productPrice =
		 * req.getParameter("productPrice"); ProductDemo product=new ProductDemo();
		 * product.setPname(productName); product.setPdescription(productDesc);
		 * product.setCost(productPrice); productDao.saveProduct(product);
		 */
		if (bindingResult.hasErrors()) {
			model.addAttribute("categoryList", category);
			//model.addAttribute("productList",product);
	         return "updateCategory";
	      }
		categoryDao.saveCategory(category);

		//model.addAttribute("categoryList", this.categoryDao.listCategory());
		//model.addAttribute("productList", this.productDao.list());
		return "category";
	}
	
	@RequestMapping("/searchByCategory")
	public String showSearch(@ModelAttribute("product") ProductDemo product,Model model) {
		model.addAttribute("categoryList", this.categoryDao.listCategory());
		model.addAttribute("productList", this.productDao.list());
		return "searchByCategory";
	}
	
	@RequestMapping("/searchProduct")
	public String searchForProduct(@ModelAttribute("product") ProductDemo product,Model model)
	{
		//int id=product.getCategory().getId();
		model.addAttribute("cid",product.getCategory().getId());
		model.addAttribute("categoryList", this.categoryDao.listCategory());
		model.addAttribute("productList", this.productDao.list());
		return "searchByCategory";
	}
	
	
}

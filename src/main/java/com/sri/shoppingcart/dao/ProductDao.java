package com.sri.shoppingcart.dao;


import java.util.List;
import com.sri.shoppingcart.model.ProductDemo;

public interface ProductDao {
	List<ProductDemo> list();
	void saveProduct(ProductDemo product);
	void deleteProduct(ProductDemo product,int id);
	ProductDemo updateProduct(ProductDemo product,int id);

}

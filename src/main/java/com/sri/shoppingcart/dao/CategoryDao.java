package com.sri.shoppingcart.dao;
import java.util.List;

import com.sri.shoppingcart.model.Category;
import com.sri.shoppingcart.model.ProductDemo;

public interface CategoryDao {
	 public List<Category> listCategory();
	 public void saveCategory(Category category);
	 public List<ProductDemo> listCategoryProduct(int id);
	 public void deleteCategory(Category category,int id);
	 Category updateCategory(Category category,int id);

}

package cn.com.product.service;

import java.util.List;

import cn.com.product.pojo.Product;
import cn.com.utils.Page;


public interface ProductService {

	List<Product> selectHotProduct();

	List<Product> selectNewProduct();

	List<Product> selectProductByCaid(int caid ,int start);

	List<Product> selectProductByCbid(int cbid ,int start);

	Product selectProductByPid(int pid);

	Page selectProductAPage(int caid);

	Page selectProductBPage(int cbid);

	List<Product> selectAllProducts();

	void deleteProductByPid(int pid);

	void saveProduct(Product product);

	void editProduct(Product product);

	List<Product> selectPageProducts(int start);

	Page selectProductPage();

}

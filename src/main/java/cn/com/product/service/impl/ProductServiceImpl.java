package cn.com.product.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.product.mapper.ProductMapper;
import cn.com.product.pojo.Product;
import cn.com.product.service.ProductService;
import cn.com.utils.Page;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductMapper productMapper;
	
	@Override
	public List<Product> selectHotProduct() {
		return productMapper.selectHotProduct();
	}

	public List<Product> selectNewProduct() {
		return productMapper.selectNewProduct();
	}

	@Override
	public List<Product> selectProductByCaid(int caid ,int start) {
		Map<String,Integer> params = new HashMap<>();
		params.put("caid", caid);
		params.put("start", start);
		return productMapper.selectProductByCaid( params );
	}

	@Override
	public List<Product> selectProductByCbid(int cbid ,int start) {
		Map<String,Integer> params = new HashMap<>();
		params.put("cbid", cbid);
		params.put("start", start);
		return productMapper.selectProductByCbid( params );
	}

	@Override
	public Product selectProductByPid(int pid) {
		return productMapper.selectProductByPid( pid );
	}

	public Page selectProductAPage(int caid) {
		return productMapper.selectProductAPage( caid );
	}

	public Page selectProductBPage(int cbid) {
		return productMapper.selectProductBPage( cbid );
	}

	@Override
	public List<Product> selectAllProducts() {
		return productMapper.selectAllProducts();
	}

	@Override
	public void deleteProductByPid(int pid) {
		productMapper.deleteProductByPid( pid );
	}

	@Override
	public void saveProduct(Product product) {
		productMapper.saveProduct( product );
	}

	@Override
	public void editProduct(Product product) {
		productMapper.editProduct( product );
	}

	@Override
	public List<Product> selectPageProducts(int start) {
		return productMapper.selectPageProducts( start );
	}

	@Override
	public Page selectProductPage() {
		return productMapper.selectProductPage();
	}

}

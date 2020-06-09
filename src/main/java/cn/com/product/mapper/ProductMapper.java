package cn.com.product.mapper;

import java.util.List;
import java.util.Map;

import cn.com.product.pojo.Product;
import cn.com.utils.Page;

public interface ProductMapper {

	// 查找热门商品
	public List<Product> selectHotProduct();

	// 查询最新商品
	public List<Product> selectNewProduct();

	// 根据一级分类id，查找所有一级分类商品
	public List<Product> selectProductByCaid( Map<String,Integer> params );

	// 根据二级分类，查询所有二级分类商品
	public List<Product> selectProductByCbid( Map<String,Integer> params );

	// 查询商品详情
	public Product selectProductByPid(int pid);

	// 分页查询
	public Page selectProductAPage(int caid);
	public Page selectProductBPage(int cbid);

	// 后台查找所有商品
	public List<Product> selectAllProducts();

	// 后台删除商品
	public void deleteProductByPid(int pid);

	// 后台添加商品
	public void saveProduct(Product product);

	// 更新商品
	public void editProduct(Product product);

	// 根据分页查询商品
	public List<Product> selectPageProducts(int start);

	// 分页查询，查询商品总数
	public Page selectProductPage();

}

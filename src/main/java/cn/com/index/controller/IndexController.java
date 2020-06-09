package cn.com.index.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.com.cataloga.pojo.Cataloga;
import cn.com.catalogb.pojo.Catalogb;
import cn.com.cataloga.service.CatalogaService;
import cn.com.catalogb.service.CatalogbService;
import cn.com.product.pojo.Product;
import cn.com.product.service.ProductService;

@Controller
public class IndexController {

	@Autowired
	CatalogaService catalogaService;
	
	@Autowired
	CatalogbService catalogbService;
	
	@Autowired
	ProductService productService;
	
//	@Autowired
	
	
	// 访问/index首页时查询所有一级分类、热门商品、最新商品
	@RequestMapping("index")
	public ModelAndView index( HttpServletRequest request ) {
		
		ModelAndView mav = new ModelAndView();
		
		// 查询一级分类
		List<Cataloga> catalogaList = catalogaService.selectAll();
		request.getSession().setAttribute("catalogaList", catalogaList);
		
		// 查询二级分类
		List<Catalogb> catalogbList = catalogbService.selectAll();
		request.getSession().setAttribute("catalogbList", catalogbList);
		
		// 查询热门商品
		List<Product> hotProductList = productService.selectHotProduct();
		request.getSession().setAttribute("hotProductList", hotProductList);
		
		// 查询最新商品
		List<Product> newProductList = productService.selectNewProduct();
		request.getSession().setAttribute("newProductList", newProductList);
		
		
		mav.setViewName("/WEB-INF/shoppage/index.jsp");
		return mav;
		
	}
	
	
}

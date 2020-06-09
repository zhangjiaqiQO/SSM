package cn.com.product.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.com.cataloga.pojo.Cataloga;
import cn.com.cataloga.service.CatalogaService;
import cn.com.catalogb.pojo.Catalogb;
import cn.com.catalogb.service.CatalogbService;
import cn.com.product.pojo.Product;
import cn.com.product.service.ProductService;
import cn.com.utils.CheckAdminUser;
import cn.com.utils.Page;
import cn.com.utils.ProductImageFile;

@Controller
public class ProductController {

	@Autowired
	ProductService productService;
	
	@Autowired
	CatalogaService catalogaService;
	
	@Autowired
	CatalogbService catalogbService;
	
	// 每页显示的数量
	int limit = 8;
	
	// 点击一级分类，根据一级分类id，查找出一级分类下的商品
	@RequestMapping("selectProductByCaid")
	public ModelAndView selectProductByCaid( HttpServletRequest request , int caid , int start ) {
		
		ModelAndView mav = new ModelAndView();
		
		// 根据一级分类id，查找出所有一级分类下的商品
		List<Product> caProduct = productService.selectProductByCaid( caid,start );
		request.getSession().setAttribute("caProduct", caProduct);

		// 查询分页的内容
		Page apage = productService.selectProductAPage( caid );
		apage.setCid(caid); // 当前分页所属的一级或二级分类
		apage.setLimit(limit); // 每页记录数
		apage.setLocalPage(start/limit+1); // 当前页
		// 总页数
		if( apage.getTotalCount()%limit == 0 ) {
			apage.setTotalPage( apage.getTotalCount()/limit );
		}else {
			apage.setTotalPage( apage.getTotalCount()/limit + 1 );
		}
		request.getSession().setAttribute("apage", apage);
		
		// 跳转到根据一级分类查询出的商品列表页面
		mav.setViewName("/WEB-INF/shoppage/producta.jsp");
		return mav;
	}
	
	// 点击二级分类，根据二级分类id，查找出二级分类下的商品
	@RequestMapping("selectProductByCbid")
	public ModelAndView selectProductByCbid( HttpServletRequest request , int cbid, int start ) {
		
		ModelAndView mav = new ModelAndView();
		
		// 根据二级分类id，查找出所有二级分类下的商品
		List<Product> cbProduct = productService.selectProductByCbid( cbid,start );
		request.getSession().setAttribute("cbProduct", cbProduct);
		
		// 查询分页的内容
		Page bpage = productService.selectProductBPage( cbid );
		bpage.setCid(cbid); // 当前分页所属的一级或二级分类
		bpage.setLimit(limit); // 每页记录数
		bpage.setLocalPage(start/limit+1); // 当前页
		// 总页数
		if( bpage.getTotalCount()%limit == 0 ) {
			bpage.setTotalPage( bpage.getTotalCount()/limit );
		}else {
			bpage.setTotalPage( bpage.getTotalCount()/limit + 1 );
		}
		request.getSession().setAttribute("bpage", bpage);
		
		// 跳转到根据二级分类查询出的商品列表页面
		mav.setViewName("/WEB-INF/shoppage/productb.jsp");
		return mav;
	}
	
	// 点击商品图片，跳转商品详情页面
	@RequestMapping("selectProductByPid")
	public ModelAndView selectProductByPid( HttpServletRequest request , int pid ) {
		
		ModelAndView mav = new ModelAndView();
		
		// 根据商品id查找商品
		Product product = productService.selectProductByPid( pid );
		request.getSession().setAttribute("product", product);
		
		// 跳转到根据二级分类查询出的商品列表页面
		mav.setViewName("/WEB-INF/shoppage/desc.jsp");
		return mav;
	}	
	
	// 后台查找所有商品
	@RequestMapping("selectAllProducts")
	public ModelAndView selectAllProducts( HttpServletRequest request ) {
		
		ModelAndView mav = new ModelAndView();
		
		// 原先是点击商品管理查出所有商品，后来改为点击商品管理，查出一二级分类和商品的第一页
//		// 查找所有商品
//		List<Product> allProducts = productService.selectAllProducts();
//		request.getSession().setAttribute("allProducts", allProducts);
		// 分页查询
		selectPruductPage(request, 0);
		
		// 查找所有一级分类
		List<Cataloga> allCataloga = catalogaService.selectAll();
		request.getSession().setAttribute("allCataloga", allCataloga);
		
		// 查找所有二级分类
		List<Catalogb> allCatalogb = catalogbService.selectAll();
		request.getSession().setAttribute("allCatalogb", allCatalogb);
		
		// 跳转到商品列表页面
		mav.setViewName("/adminpage/product/list.jsp");
		return mav;
	}	
	
	// 商品列表点击编辑，根据页面提交的pid查出要修改的商品，跳转到修改页面
	@RequestMapping("editProductPage")
	public ModelAndView editProductPage( HttpServletRequest request , int pid ) {
		
		ModelAndView mav = new ModelAndView();
		
		// 查找商品
		Product editProduct = productService.selectProductByPid(pid);
		request.getSession().setAttribute("editProduct", editProduct);
		
		// 以下注释的代码转移到点击商品管理跳转到list.jsp时查询
//		// 查找所有一级分类
//		List<Cataloga> allCataloga = catalogaService.selectAll();
//		request.getSession().setAttribute("allCataloga", allCataloga);
//		
//		// 查找所有二级分类
//		List<Catalogb> allCatalogb = catalogbService.selectAll();
//		request.getSession().setAttribute("allCatalogb", allCatalogb);
		
		// 跳转到修改商品的页面
		mav.setViewName("/adminpage/product/edit.jsp");
		return mav;
	}	
	
	// 商品修改页面点击确定，上传商品信息，修改商品信息后，保存到数据库，查找所有商品信息，跳转到商品列表页面
	@RequestMapping("editProduct")
	public ModelAndView editProduct( HttpServletRequest request , Product product , ProductImageFile imageFile ) throws IllegalStateException, IOException {
		
		ModelAndView mav = new ModelAndView();
		
		// 判断当前管理员是否是root
		if (!CheckAdminUser.checkRoot(request)) {
			// 添加修改失败，权限不足的信息
			mav.addObject("editFail", "修改商品失败！权限不足！请使用root登录！");
			mav.setViewName("/adminpage/product/list.jsp");
			return mav;
		}
    	
    	// 如果上传图片的原始文件名长度为0，则说明没有修改图片，图片路径仍为原始值，不做修改
    	// 如果上传图片的原始文件名长度不为0，说明修改了商品的图片，要修改图片路径及上传图片
    	if( imageFile.getPimage().getOriginalFilename().length() != 0 ) {
    		// 上传商品图片
    		// 获取一个随机文件名
        	String randomName = RandomStringUtils.randomAlphanumeric(10);
        	// 将原文件名去掉10位后，与随机字符串拼接，形成新文件名
        	String newFileName = randomName + imageFile.getPimage().getOriginalFilename().substring(11);
        	// 上传文件的路径
        	File newFile = new File( request.getServletContext().getRealPath("/products")+"\\"+product.getCbid(), newFileName);
        	newFile.getParentFile().mkdirs();
        	// 复制文件
        	imageFile.getPimage().transferTo(newFile);
        	product.setImagelocation( "products/"+product.getCbid()+"/"+newFileName );
    	}
    	
        // 设置商品的其它属性
//        product.setDate( new Date() );
        
        // 根据二级分类cbid设置一级分类caid
        List<Catalogb> catalogb =  (List<Catalogb>) request.getSession().getAttribute("allCatalogb");
        int caid = 0;
        for (Catalogb c : catalogb) {
			if( c.getCbid() == product.getCbid() ) {
				caid = c.getCaid();
			}
		}
        product.setCaid(caid);
        
        // 保存商品信息到数据库
        productService.editProduct( product );
        
        // 分页查询
        selectPruductPage(request, 0);
//        // 原先是查出所有商品跳转到商品列表页面，后来改为上面的代码，即只查询第一页的内容
//        // 查找所有商品
//		List<Product> allProducts = productService.selectAllProducts();
//		request.getSession().setAttribute("allProducts", allProducts);
		
		// 跳转到根据二级分类查询出的商品列表页面
		mav.addObject("editSuccess", "修改商品成功！");
		mav.setViewName("/adminpage/product/list.jsp");
		return mav;
	}
	
	// 根据商品pid，删除商品，跳转到商品列表页面
	@RequestMapping("deleteProduct")
	public ModelAndView deleteProduct( HttpServletRequest request , int pid ) {
		
		ModelAndView mav = new ModelAndView();
		
		// 判断当前管理员是否是root
		if (!CheckAdminUser.checkRoot(request)) {
			// 添加修改失败，权限不足的信息
			mav.addObject("deleteFail", "删除失败！权限不足！请使用root登录！");
			mav.setViewName("/adminpage/product/list.jsp");
			return mav;
		}
		
		// 根据商品pid，删除商品
		productService.deleteProductByPid( pid );
		mav.addObject("deleteSuccess", "删除成功!");
		
		// 分页查询
		selectPruductPage(request, 0);
//        // 原先是查出所有商品跳转到商品列表页面，后来改为上面的代码，即只查询第一页的内容
//        // 查找所有商品
//		List<Product> allProducts = productService.selectAllProducts();
//		request.getSession().setAttribute("allProducts", allProducts);
		
		// 跳转到根据二级分类查询出的商品列表页面
		mav.setViewName("/adminpage/product/list.jsp");
		return mav;
	}
	
	// 添加商品页面点击确定，添加商品
	@RequestMapping("addProduct")
	public ModelAndView addProduct( HttpServletRequest request , Product product , ProductImageFile imageFile ) throws IllegalStateException, IOException {
		
		ModelAndView mav = new ModelAndView();
		
		// 判断当前管理员是否是root
		if (!CheckAdminUser.checkRoot(request)) {
			// 添加修改失败，权限不足的信息
			mav.addObject("addFail", "添加商品失败！权限不足！请使用root登录！");
			mav.setViewName("/adminpage/product/list.jsp");
			return mav;
		}
		
		// 上传商品图片
		// 获取一个随机文件名
    	String randomName = RandomStringUtils.randomAlphanumeric(10);
        String newFileName = randomName + imageFile.getPimage().getOriginalFilename();
        // 上传文件的路径
        File newFile = new File( request.getServletContext().getRealPath("/products")+"\\"+product.getCbid(), newFileName);
        newFile.getParentFile().mkdirs();
        // 复制文件
        imageFile.getPimage().transferTo(newFile);
 
        // 设置商品的其它属性
        product.setDate( new Date() );
        product.setImagelocation( "products/"+product.getCbid()+"/"+newFileName );
        // 根据二级分类cbid设置一级分类caid
        List<Catalogb> catalogb =  (List<Catalogb>) request.getSession().getAttribute("allCatalogb");
        int caid = 0;
        for (Catalogb c : catalogb) {
			if( c.getCbid() == product.getCbid() ) {
				caid = c.getCaid();
			}
		}
        product.setCaid(caid);
        
        // 保存商品信息到数据库
        productService.saveProduct( product );
        
        // 分页查询
        selectPruductPage(request, 0);
//        // 原先是查出所有商品跳转到商品列表页面，后来改为上面的代码，即只查询第一页的内容
//        // 查找所有商品
//		List<Product> allProducts = productService.selectAllProducts();
//		request.getSession().setAttribute("allProducts", allProducts);
		
		// 跳转到根据二级分类查询出的商品列表页面
		mav.addObject("addSuccess", "添加商品成功！");
		mav.setViewName("/adminpage/product/list.jsp");
		return mav;
	}
	
	// 后台商品列表，分页查询
	@RequestMapping("selectProductPage")
	public ModelAndView selectProductPage( HttpServletRequest request , int start ) {
		
		ModelAndView mav = new ModelAndView();
		
		// 分页查询
		selectPruductPage(request, start);
		
		// 最开始分页查询的代码，后来封装到上面utils中的PruductPage类中了
//		// 查出分页显示需要的商品
//		List<Product> allProducts = productService.selectPageProducts( start );
//		request.getSession().setAttribute("allProducts", allProducts);
//		
//		// 查询分页的内容
//		Page productPage = productService.selectProductPage();
//		productPage.setLimit(limit); // 每页记录数
//		productPage.setLocalPage(start/limit+1); // 当前页
//		// 总页数
//		if( productPage.getTotalCount()%limit == 0 ) {
//			productPage.setTotalPage( productPage.getTotalCount()/limit );
//		}else {
//			productPage.setTotalPage( productPage.getTotalCount()/limit + 1 );
//		}
//		request.getSession().setAttribute("productPage", productPage);
		
		// 跳转到根据一级分类查询出的商品列表页面
		mav.setViewName("/adminpage/product/list.jsp");
		return mav;
		
	}
	
	// 分页查询的方法
	public void selectPruductPage( HttpServletRequest request , int start ){
		
		// 查出分页显示需要的商品
		List<Product> allProducts = productService.selectPageProducts( start );
		request.getSession().setAttribute("allProducts", allProducts);
		
		// 查询分页的内容
		Page productPage = productService.selectProductPage();
		productPage.setLimit(limit); // 每页记录数
		productPage.setLocalPage(start/limit+1); // 当前页
		// 总页数
		if( productPage.getTotalCount()%limit == 0 ) {
			productPage.setTotalPage( productPage.getTotalCount()/limit );
		}else {
			productPage.setTotalPage( productPage.getTotalCount()/limit + 1 );
		}
		request.getSession().setAttribute("productPage", productPage);
		
	}
	
}

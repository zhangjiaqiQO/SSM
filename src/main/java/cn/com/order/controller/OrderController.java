package cn.com.order.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.com.order.pojo.Order;
import cn.com.order.pojo.OrderItem;
import cn.com.order.service.OrderService;
import cn.com.product.pojo.Product;
import cn.com.product.service.ProductService;
import cn.com.shopuser.pojo.ShopUser;
import cn.com.utils.CheckShopUserLogin;

@Controller
public class OrderController {

	@Autowired
	ProductService productService;
	
	@Autowired
	OrderService orderService;
	
	@RequestMapping("addProductToCart")
	public ModelAndView addProductToCart( OrderItem orderItem , HttpServletRequest request ) {
		
		ModelAndView mav = new ModelAndView();
		
		// 判断用户是否登录
		if( !CheckShopUserLogin.check( request ) ) {
			mav.setViewName("/WEB-INF/shoppage/login.jsp");
			mav.addObject("notlogin", "您未登录，请登录后添加商品到购物车！");
			return mav;
		}
		
		Product product = productService.selectProductByPid( orderItem.getPid() );
		// 设置订单项的金额
		orderItem.setSubtotal( orderItem.getCount() * product.getShop_price() );
		// 设置订单项所属的用户
		ShopUser user = (ShopUser) request.getSession().getAttribute("exitShopUser");
		orderItem.setUid( user.getUid() );
		
		// 判断用户是否有同一商品且没有生成订单（即oid属性为null）的订单项，有则合二为一，没有，则直接保存
		OrderItem oldOrderItem = orderService.selectOrderItemByUidAndPid( user.getUid(),product.getPid() );
		// 存在同一商品的订单，合二为一，删除原订单，保存新订单
		if( oldOrderItem != null ) {
			// 删除原订单
			orderService.removeOrderItem( oldOrderItem.getOiid() );
			// 数量总计
			Integer count = orderItem.getCount() + oldOrderItem.getCount();
			orderItem.setCount(count);
			// 金额总计
			double subtotal = orderItem.getSubtotal() + oldOrderItem.getSubtotal();
			orderItem.setSubtotal(subtotal);
		}
		// 保存新订单到数据库
		orderService.saveOrderItem( orderItem );
		
//		// 查询出登陆用户所有的订单项
//		List<OrderItem> orderItems= orderService.selectAllOrderItemByUid( user.getUid() );
//		request.getSession().setAttribute("orderItems", orderItems);
		
		// 跳转页面
		mav.setViewName("redirect:cart");
		return mav;
		
	}
	/**
	 * 删除订单项
	 * @param oiid
	 * @param request
	 * @return
	 */
	@RequestMapping("removeOrderItem")
	public ModelAndView removeOrderItem( int oiid , HttpServletRequest request ) {
		
		// 从数据库删除订单项
		orderService.removeOrderItem( oiid );
		
//		// 查询出登陆用户所有的订单项
//		ShopUser user = (ShopUser) request.getSession().getAttribute("exitShopUser");
//		List<OrderItem> orderItems= orderService.selectAllOrderItemByUid( user.getUid() );
//		request.getSession().setAttribute("orderItems", orderItems);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:cart");
		return mav;
	}
	
	/**
	 * 清空购物车
	 * @param oiid
	 * @param request
	 * @return
	 */
	@RequestMapping("clearCart")
	public ModelAndView clearCart( HttpServletRequest request ) {
		
		// 根据登录用户的uid，删除用户所属的所有订单项
		ShopUser shopUser = (ShopUser) request.getSession().getAttribute("exitShopUser");
		// 从数据库删除订单项
		orderService.removeAllOrderItem( shopUser.getUid() );
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:cart");
		return mav;
	}
	
	/**
	 * 点击购物车图标或其它页面跳转
	 * @param request
	 * @return
	 */
	@RequestMapping("cart")
	public ModelAndView cart( HttpServletRequest request ) {
		
		ModelAndView mav = new ModelAndView();
		
		// 判断用户是否登录
		if( !CheckShopUserLogin.check( request ) ) {
			mav.setViewName("/WEB-INF/shoppage/login.jsp");
			mav.addObject("notlogin", "您未登录，请登录后添加商品到购物车！");
			return mav;
		}
		
		// 查询出登陆用户所有的订单项
		ShopUser user = (ShopUser) request.getSession().getAttribute("exitShopUser");
		List<OrderItem> orderItems = orderService.selectAllOrderItemByUid( user.getUid() );
		request.getSession().setAttribute("orderItems", orderItems);
		
		// 判断用户是否有订单项
		if( orderItems.size() == 0 ) {
			request.getSession().setAttribute("orderItemExist", "no");
		}else {
			request.getSession().setAttribute("orderItemExist", "yes");
		}
		
		// 查出订单项中包含的所有商品，存放在map中
		Map<Integer,Product> orderItemProductMap = new HashMap<Integer,Product>();
		double orderItemTotal = 0;
		for (OrderItem o : orderItems) {
			// 查出每个订单项对应的商品，存入map
			Product p = productService.selectProductByPid( o.getPid() );
			orderItemProductMap.put(p.getPid(), p);
			// 计算订单总金额
			orderItemTotal += o.getSubtotal();
		}
		request.getSession().setAttribute("orderItemProductMap", orderItemProductMap);
		request.getSession().setAttribute("orderItemTotal", orderItemTotal);
	
		mav.setViewName("/WEB-INF/shoppage/cart.jsp");
		return mav;
	}
	
	// 生成订单
	@RequestMapping("saveOrder")
	public ModelAndView saveOrder( HttpServletRequest request ) {
		
		// 根据订单项生成订单
		ShopUser user = (ShopUser) request.getSession().getAttribute("exitShopUser");
		Order newOrder = new Order();
		newOrder.setOrderdate(new Date());
		newOrder.setPaystate(1);
		newOrder.setAddress(user.getAddress());
		newOrder.setTelephone(user.getTelephone());
		newOrder.setUid(user.getUid());
		Double total = (Double) request.getSession().getAttribute("orderItemTotal");
		newOrder.setTotal(total);
		
		// 保存订单，返回保存的订单的id
		int orderId = orderService.saveOrder( newOrder );
		
		// 设置生成订单的订单项的oid属性，当订单支付成功时，删除订单中的订单项
		List<OrderItem> oiList = (List<OrderItem>) request.getSession().getAttribute("orderItems");
		for (OrderItem o : oiList) {
			orderService.updateOrderItem( orderId,o.getOiid() );
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/WEB-INF/shoppage/neworder.jsp");
		return mav;
	}
	
	// 查看用户的订单
	@RequestMapping("myorder")
	public ModelAndView myorder( HttpServletRequest request , int uid) {
		
		// 查找用户所有的订单及订单详情
		List<Order> myOrders = orderService.selectOrderAndOrderItemAndProductByUid( uid );
		
		// 写代码时用来看返回数据的方法
//		for (Order order : myOrders) {
//			System.out.println( order.toString() );
//			for (Order order2 : myOrders) {
//				List<Product> ps = order2.getProducts();
//				for (Product p : ps) {
//					System.out.println( p.toString() );
//				}
//				List<OrderItem> oiss = order2.getOrderItems();
//				for (OrderItem oii : oiss) {
//					System.out.println( oii.toString() );
//				}
//			}
//		}
		// 保存到session
		request.getSession().setAttribute("myOrders", myOrders);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/WEB-INF/shoppage/myorder.jsp");
		return mav;
	}
	
	// 后台查看所有订单
	@RequestMapping("selectAllOrders")
	public ModelAndView selectAllOrders( HttpServletRequest request ) {
		
		// 查找所有的订单及订单详情
		List<Order> allOrders = orderService.selectOrderAndOrderItemAndProduct();
		
		// 保存到session
		request.getSession().setAttribute("allOrders", allOrders);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/adminpage/order/list.jsp");
		return mav;
		
	}
	
	// 后台根据订单状态查询订单
	@RequestMapping("selectOrdersByState")
	public ModelAndView selectOrdersByState( HttpServletRequest request , int paystate) {
		
		// 查找所有的订单及订单详情
		List<Order> allOrders = orderService.selectOrdersByState( paystate );
		
		// 保存到session
		request.getSession().setAttribute("allOrders", allOrders);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/adminpage/order/list.jsp");
		return mav;
		
	}
	
	
	
	
	
}

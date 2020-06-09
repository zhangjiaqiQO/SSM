package cn.com.shopuser.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.com.shopuser.pojo.ShopUser;
import cn.com.shopuser.service.ShopUserService;

@Controller
public class ShopUserController {

	// 注入service
	@Autowired
	ShopUserService shopUserService;
	
	// 访问/register跳转到登录页面
	@RequestMapping("register")
	public ModelAndView register() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/WEB-INF/shoppage/register.jsp");
		return mav;
		
	}
	
	// 注册页面点击注册，验证验证码及注册用户
	@RequestMapping("shopUser_register")
	public ModelAndView shopUser_register( String checkcode, HttpServletRequest request , ShopUser shopUser ) {

		ModelAndView mav = new ModelAndView();
		// 获取session中的验证码
		String checkcodesession = (String) request.getSession().getAttribute("checkcode");
		if( checkcode == "" || !checkcode.equalsIgnoreCase(checkcodesession) ){
			mav.addObject("checkcodemsg", "<font color='red'>验证码错误！</font>");
			mav.setViewName("/WEB-INF/shoppage/register.jsp");
			return mav;
		}
		
		// 调用service层保存用户
		shopUserService.insertShopUser( shopUser );

		// 注册成功，跳转到登录页面
		mav.addObject("registersuccess", "注册成功，请登录！"); // 显示注册成功的信息
		mav.addObject("registerusername", shopUser.getUsername()); // 添加注册成功的用户名
		mav.setViewName("/WEB-INF/shoppage/login.jsp");
		return mav;
		
	}
	
	// Ajax异步检验用户名是否重名
	@RequestMapping("shopUser_checkUsername")
	public void shopUser_checkUsername(  HttpServletResponse response, ShopUser shopUser ) throws IOException {
		
		ShopUser exitShopUser = shopUserService.checkUsername( shopUser );
		response.setContentType("text/html;charset=UTF-8");
		if( shopUser.getUsername().length() == 0 ){
			response.getWriter().print("<font color='red'>用户名不能为空!</font>");
		}else if( exitShopUser == null ){
			response.getWriter().print("<font color='green'>用户名可用！</font>");
		}else{
			// 用户名已存在
			response.getWriter().print("<font color='red'>用户名已存在！</font>");
		}
	}
	
	// 访问/login，跳转到登录页面
	@RequestMapping("login")
	public ModelAndView login( ) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/WEB-INF/shoppage/login.jsp");
		return mav;
	}
	
	// 登录页面点击登录，校验用户名密码及跳转到首页
	@RequestMapping("shopUser_login")
	public ModelAndView shopUser_login(  HttpServletRequest request, ShopUser shopUser ) {
		
		ModelAndView mav = new ModelAndView();
		ShopUser exitShopUser = shopUserService.shopUser_login( shopUser );
		if( exitShopUser != null ) {
			// 登陆成功则跳转到首页
			mav.setViewName("redirect:index");
			request.getSession().setAttribute("exitShopUser", exitShopUser);
			return mav;
		}else {
			// 登陆失败跳转登录页面，并提示错误信息
			mav.setViewName("/WEB-INF/shoppage/login.jsp");
			mav.addObject("login_msg", "<font color='red'>用户名或密码错误！</font>");
			return mav;
		}
	}
	
	// 用户注销的方法
	@RequestMapping("quit")
	public ModelAndView quit( HttpServletRequest request ) {
		
		request.getSession().removeAttribute("exitShopUser");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:index");
		return mav;
	}
	
	
	
}

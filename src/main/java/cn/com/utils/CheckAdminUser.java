package cn.com.utils;

import javax.servlet.http.HttpServletRequest;

import cn.com.adminuser.pojo.AdminUser;

public class CheckAdminUser {

	// 判断后台管理员是否登录
	public static boolean checkLogin( HttpServletRequest request ) {

//		if( request.getSession().getAttribute("exitShopUser") == null ) {
//			return false;
//		}
		return true;
	}
	
	// 判断后台用户是否为超级管理员
	public static boolean checkRoot( HttpServletRequest request ) {

		AdminUser user = (AdminUser) request.getSession().getAttribute("exitAdminUser");
		
		if( user.getUid() == 1 ) {
			return true;
		}else {
			return false;
		}
	}
	
}

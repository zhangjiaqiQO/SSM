package cn.com.utils;

import javax.servlet.http.HttpServletRequest;

/**
 * 在访问部分页面时，判断用户是否登录
 */
public class CheckShopUserLogin {

	public static boolean check( HttpServletRequest request ) {

		if( request.getSession().getAttribute("exitShopUser") == null ) {
			return false;
		}
		return true;
	}
	
}

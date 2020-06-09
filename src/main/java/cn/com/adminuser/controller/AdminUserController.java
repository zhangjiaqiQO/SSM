package cn.com.adminuser.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.com.adminuser.pojo.AdminUser;
import cn.com.adminuser.service.AdminUserService;
import cn.com.utils.CheckAdminUser;

@Controller
public class AdminUserController {

	@Autowired
	AdminUserService adminUserService;
	
	// 访问首页
	@RequestMapping("index2")
	public ModelAndView index2() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/adminpage/index.jsp");
		return mav;
		
	}
	
	// 后台页面登录
	@RequestMapping("adminUserLogin")
	public ModelAndView adminUserLogin( AdminUser adminUser , HttpServletRequest request  ) {
		
		ModelAndView mav = new ModelAndView();

		// 根据用户名和密码查询是否存在用户
		AdminUser exitAdminUser = adminUserService.selectAdminUser( adminUser );
		
		// 如果用户不存在，设置错误信息，返回后台管理登陆页面
		if( exitAdminUser == null ) {
			request.getSession().setAttribute("adminUserLoginError", "用户名或密码错误！请重新登陆！");
			mav.setViewName("/adminpage/index.jsp");
			return mav;
		}
		
		// 向session中存入登录用户的信息
		request.getSession().setAttribute("exitAdminUser", exitAdminUser);
		mav.setViewName("/adminpage/home.jsp");
		return mav;
		
	}
	
	// 查询所有管理员
	@RequestMapping("selectAllAdminUser")
	public ModelAndView selectAllAdminUser( HttpServletRequest request , int start ) {
		
		List<AdminUser> allAdminUser = adminUserService.selectAllAdminUser( start );
		request.getSession().setAttribute("allAdminUser", allAdminUser);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/adminpage/adminuser/list.jsp");
		return mav;
		
	}
	
	// 管理员列表点击编辑，跳转到编辑管理员页面
	@RequestMapping("editAdminUserPage")
	public ModelAndView editAdminUserPage( HttpServletRequest request , int uid ) {
		
		// 查询出要编辑的管理员
		AdminUser editAdminUser = adminUserService.selectAdminUserByUid( uid );
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("editAdminUser", editAdminUser);
		mav.setViewName("/adminpage/adminuser/edit.jsp");
		return mav;
		
	}
	
	// 修改管理员，然后跳转到管理员列表页面
	@RequestMapping("editAdminUser")
	public ModelAndView editAdminUser( HttpServletRequest request , AdminUser adminUser ) {
		
		ModelAndView mav = new ModelAndView();

		// 判断当前管理员是否是root
		if( !CheckAdminUser.checkRoot(request) ) {
			// 添加修改失败，权限不足的信息
			mav.addObject("editFail", "修改失败！权限不足！请使用root登录！");
			mav.setViewName("/adminpage/adminuser/list.jsp");
			return mav;
		}
		
		// 修改管理员
		adminUserService.editAdminUser( adminUser );
		// 查询修改后的所有管理员
		List<AdminUser> allAdminUser = adminUserService.selectAllAdminUser( 0 );
		request.getSession().setAttribute("allAdminUser", allAdminUser);
		
		// 添加删除成功的信息
		mav.addObject("editSuccess", "修改成功!");
		mav.setViewName("/adminpage/adminuser/list.jsp");
		return mav;
		
	}
	
	// 管理员列表点击删除，删除管理员，跳转到管理员列表页面
	@RequestMapping("deleteAdminUser")
	public ModelAndView deleteAdminUser( HttpServletRequest request , int uid ) {
		
		ModelAndView mav = new ModelAndView();

		// 判断当前管理员是否是root
		if( !CheckAdminUser.checkRoot(request) ) {
			// 添加修改失败，权限不足的信息
			mav.addObject("deleteFail", "删除失败！权限不足！请使用root登录！");
			mav.setViewName("/adminpage/adminuser/list.jsp");
			return mav;
		}
		
		// 删除管理员
		adminUserService.deleteAdminUserByUid( uid );
		// 查询删除指定管理员之后的所有管理表
		List<AdminUser> allAdminUser = adminUserService.selectAllAdminUser( 0 );
		request.getSession().setAttribute("allAdminUser", allAdminUser);
		
		// 添加删除成功的信息
		mav.addObject("deleteSuccess", "删除成功!");
		mav.setViewName("/adminpage/adminuser/list.jsp");
		return mav;
		
	}
	
	// 添加管理员界面，点击确定，添加管理员到数据库，并跳转管理员列表页面
	@RequestMapping("addAdminUser")
	public ModelAndView addAdminUser( HttpServletRequest request , AdminUser adminUser ) {
		
		ModelAndView mav = new ModelAndView();

		// 判断当前管理员是否是root
		if( !CheckAdminUser.checkRoot(request) ) {
			// 添加权限不足的信息
			mav.addObject("addFail", "添加管理员失败！权限不足！请使用root登录！");
			mav.setViewName("/adminpage/adminuser/list.jsp");
			return mav;
		}
		
		// 添加管理员
		adminUserService.addAdminUser( adminUser );
		// 查询删除指定管理员之后的所有管理表
		List<AdminUser> allAdminUser = adminUserService.selectAllAdminUser( 0 );
		request.getSession().setAttribute("allAdminUser", allAdminUser);
		
		// 添加删除成功的信息
		mav.addObject("addSuccess", "添加管理员成功!");
		mav.setViewName("/adminpage/adminuser/list.jsp");
		return mav;
		
	}
	
//	// 管理员退出登录
//	@RequestMapping("adminUserQuit")
//	public ModelAndView adminUserQuit( HttpServletRequest request ) {
//		
//		request.getSession().removeAttribute("exitAdminUser");
//		
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("redirect:index2");
//		return mav;
//		
//	}
	
}

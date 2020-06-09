package cn.com.catalogb.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.com.catalogb.pojo.Catalogb;
import cn.com.catalogb.service.CatalogbService;
import cn.com.utils.CheckAdminUser;

@Controller
public class CatalogbController {

	@Autowired
	CatalogbService catalogbService;
	
	// 查询所有二级分类
	@RequestMapping("selectAllCatalogb")
	public ModelAndView selectAllCatalogb(HttpServletRequest request) {

		List<Catalogb> allCatalogb = catalogbService.selectAll();
		request.getSession().setAttribute("allCatalogb", allCatalogb);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/adminpage/catalogb/list.jsp");
		return mav;

	}

	// 二级分类列表点击编辑，跳转到编辑二级分类页面
	@RequestMapping("editCatalogbPage")
	public ModelAndView editCatalogbPage(HttpServletRequest request, int cbid) {

		// 查询出要编辑的二级分类
		Catalogb editCatalogb = catalogbService.selectCatalogbByCbid( cbid );

		ModelAndView mav = new ModelAndView();
		mav.addObject("editCatalogb", editCatalogb);
		mav.setViewName("/adminpage/catalogb/edit.jsp");
		return mav;

	}

	// 修改二级分类，然后跳转到二级分类列表页面
	@RequestMapping("editCatalogb")
	public ModelAndView editCatalogb(HttpServletRequest request, Catalogb catalogb) {

		ModelAndView mav = new ModelAndView();

		// 判断当前管理员是否是root
		if (!CheckAdminUser.checkRoot(request)) {
			// 添加修改失败，权限不足的信息
			mav.addObject("editFail", "修改失败！权限不足！请使用root登录！");
			mav.setViewName("/adminpage/catalogb/list.jsp");
			return mav;
		}

		// 修改二级分类
		catalogbService.editCatalogb(catalogb);
		// 查询修改后的所有二级分类
		List<Catalogb> allCatalogb = catalogbService.selectAll();
		request.getSession().setAttribute("allCatalogb", allCatalogb);

		// 添加删除成功的信息
		mav.addObject("editSuccess", "修改成功!");
		mav.setViewName("/adminpage/catalogb/list.jsp");
		return mav;

	}

	// 二级分类列表点击删除，删除二级分类，跳转到二级分类列表页面
	@RequestMapping("deleteCatalogb")
	public ModelAndView deleteCatalogb(HttpServletRequest request, int cbid) {

		ModelAndView mav = new ModelAndView();

		// 判断当前管理员是否是root
		if (!CheckAdminUser.checkRoot(request)) {
			// 添加修改失败，权限不足的信息
			mav.addObject("deleteFail", "删除失败！权限不足！请使用root登录！");
			mav.setViewName("/adminpage/catalogb/list.jsp");
			return mav;
		}

		// 删除二级分类
		catalogbService.deleteCatalogbByCbid(cbid);
		// 查询删除指定二级分类之后的所有二级分类
		List<Catalogb> allCatalogb = catalogbService.selectAll();
		request.getSession().setAttribute("allCatalogb", allCatalogb);

		// 添加删除成功的信息
		mav.addObject("deleteSuccess", "删除成功!");
		mav.setViewName("/adminpage/catalogb/list.jsp");
		return mav;

	}

	// 添加二级分类界面，点击确定，添加二级分类到数据库，并跳转二级分类列表页面
	@RequestMapping("addCatalogb")
	public ModelAndView addCatalogb(HttpServletRequest request, Catalogb catalogb) {

		ModelAndView mav = new ModelAndView();

		// 判断当前管理员是否是root
		if (!CheckAdminUser.checkRoot(request)) {
			// 添加权限不足的信息
			mav.addObject("addFail", "添加二级分类失败！权限不足！请使用root登录！");
			mav.setViewName("/adminpage/catalogb/list.jsp");
			return mav;
		}

		// 添加二级分类
		catalogbService.addCatalogb(catalogb);
		// 查询删除指定二级分类之后的所有二级分类
		List<Catalogb> allCatalogb = catalogbService.selectAll();
		request.getSession().setAttribute("allCatalogb", allCatalogb);

		// 添加删除成功的信息
		mav.addObject("addSuccess", "添加二级分类成功!");
		mav.setViewName("/adminpage/catalogb/list.jsp");
		return mav;

	}
	
}

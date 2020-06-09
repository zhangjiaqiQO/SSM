package cn.com.cataloga.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.com.cataloga.pojo.Cataloga;
import cn.com.cataloga.service.CatalogaService;
import cn.com.utils.CheckAdminUser;

@Controller
public class CatalogaController {

	@Autowired
	CatalogaService catalogaService;
	
	// 查询所有一级分类
	@RequestMapping("selectAllCataloga")
	public ModelAndView selectAllCataloga(HttpServletRequest request) {

		List<Cataloga> allCataloga = catalogaService.selectAll();
		request.getSession().setAttribute("allCataloga", allCataloga);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/adminpage/cataloga/list.jsp");
		return mav;

	}

	// 一级分类列表点击编辑，跳转到编辑一级分类页面
	@RequestMapping("editCatalogaPage")
	public ModelAndView editCatalogaPage(HttpServletRequest request, int caid) {

		// 查询出要编辑的一级分类
		Cataloga editCataloga = catalogaService.selectCatalogaByCaid( caid );

		ModelAndView mav = new ModelAndView();
		mav.addObject("editCataloga", editCataloga);
		mav.setViewName("/adminpage/cataloga/edit.jsp");
		return mav;

	}

	// 修改一级分类，然后跳转到一级分类列表页面
	@RequestMapping("editCataloga")
	public ModelAndView editCataloga(HttpServletRequest request, Cataloga cataloga) {

		ModelAndView mav = new ModelAndView();

		// 判断当前管理员是否是root
		if (!CheckAdminUser.checkRoot(request)) {
			// 添加修改失败，权限不足的信息
			mav.addObject("editFail", "修改失败！权限不足！请使用root登录！");
			mav.setViewName("/adminpage/cataloga/list.jsp");
			return mav;
		}

		// 修改一级分类
		catalogaService.editCataloga(cataloga);
		// 查询修改后的所有一级分类
		List<Cataloga> allCataloga = catalogaService.selectAll();
		request.getSession().setAttribute("allCataloga", allCataloga);

		// 添加删除成功的信息
		mav.addObject("editSuccess", "修改成功!");
		mav.setViewName("/adminpage/cataloga/list.jsp");
		return mav;

	}

	// 一级分类列表点击删除，删除一级分类，跳转到一级分类列表页面
	@RequestMapping("deleteCataloga")
	public ModelAndView deleteCataloga(HttpServletRequest request, int caid) {

		ModelAndView mav = new ModelAndView();

		// 判断当前管理员是否是root
		if (!CheckAdminUser.checkRoot(request)) {
			// 添加修改失败，权限不足的信息
			mav.addObject("deleteFail", "删除失败！权限不足！请使用root登录！");
			mav.setViewName("/adminpage/cataloga/list.jsp");
			return mav;
		}

		// 删除一级分类
		catalogaService.deleteCatalogaByCaid(caid);
		// 查询删除指定一级分类之后的所有一级分类
		List<Cataloga> allCataloga = catalogaService.selectAll();
		request.getSession().setAttribute("allCataloga", allCataloga);

		// 添加删除成功的信息
		mav.addObject("deleteSuccess", "删除成功!");
		mav.setViewName("/adminpage/cataloga/list.jsp");
		return mav;

	}

	// 添加一级分类界面，点击确定，添加一级分类到数据库，并跳转一级分类列表页面
	@RequestMapping("addCataloga")
	public ModelAndView addCataloga(HttpServletRequest request, Cataloga cataloga) {

		ModelAndView mav = new ModelAndView();

		// 判断当前管理员是否是root
		if (!CheckAdminUser.checkRoot(request)) {
			// 添加权限不足的信息
			mav.addObject("addFail", "添加一级分类失败！权限不足！请使用root登录！");
			mav.setViewName("/adminpage/cataloga/list.jsp");
			return mav;
		}

		// 添加一级分类
		catalogaService.addCataloga(cataloga);
		// 查询删除指定一级分类之后的所有一级分类
		List<Cataloga> allCataloga = catalogaService.selectAll();
		request.getSession().setAttribute("allCataloga", allCataloga);

		// 添加删除成功的信息
		mav.addObject("addSuccess", "添加一级分类成功!");
		mav.setViewName("/adminpage/cataloga/list.jsp");
		return mav;

	}

}

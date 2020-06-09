<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
	<title>SSM商城</title>
	<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/product.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/slider.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css"/>
</head>
<body>

	<%@ include file="header.jsp" %>
	<%@ include file="menu.jsp" %>

<div class="container productContent">

	<!-- 左侧一级分类二级分类列表 -->
	<%@ include file="catalogab.jsp" %>

	
<div class="span18 last">
		
	<div class="productImage">
		<br /><br />
		<a style="outline-style: none; text-decoration: none;" id="zoom" href="${pageContext.request.contextPath}/${product.imagelocation}" rel="gallery">
			<!-- 商品图片 -->
			<img style="opacity: 1;" title="" class="medium" src="${pageContext.request.contextPath}/${product.imagelocation}"/>
		</a>
	</div>
			
	<br /><br /><br />
	
	<div class="name" style="color: green">${product.pname}</div>
	
	<br /><br /><br />
	
	<div class="sn">
		<div>编号${product.pid}</div>
	</div>
	<div class="info">
		<dl>
			<dt>商城价</dt>
			<dd>
				<strong>￥${product.shop_price}</strong>
					参 考 价
				<del>￥${product.market_price}</del>
			</dd>
		</dl>
		<dl>
			<dt>促销</dt>
			<dd>
				<a>限时抢购</a>
			</dd>
		</dl>
	</div>
			
	<div class="action">
		<form action="${ pageContext.request.contextPath }/addProductToCart" method="post">
			<input id="pid" name="pid" type="hidden" value="${product.pid}"/>
			<dl class="quantity">
				<dt>购买数量</dt>
				<dd>
					<input id="count" name="count" value="1" maxlength="4" type="text"/>
				</dd>
				<dd>件</dd>
			</dl>
			<div class="buy">
				<input id="addCart" class="addCart" value="加入购物车" type="submit"/>
			</div>
		</form>
	</div>
		
	<div id="bar" class="bar">
		<ul>
			<li id="introductionTab">商品介绍</li>	
		</ul>
	</div>
				
	<div id="introduction" class="introduction">
		${product.description}
	</div>
						
				
</div>
</div>


	<%@include file="footer.jsp" %>

</body>
</html>
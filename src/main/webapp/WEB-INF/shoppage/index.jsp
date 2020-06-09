<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>SSM商城</title>
	<link href="${pageContext.request.contextPath}/css/slider.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/mycss.css" rel="stylesheet" type="text/css"/>
</head>

<body>

<%@ include file="header.jsp" %>
<%@ include file="menu.jsp" %>

<div class="container index">

	<div class="span24">
		<div id="hotProduct" class="hotProduct clearfix">
			<div class="title">
				<strong>热门商品</strong>
			</div>
			<ul class="tab"></ul>
			<!-- 热门商品 ----------------------------------------------------------------------->
			<ul class="tabContent" style="display: block;">
				<c:forEach var="hp" items="${hotProductList }">
					<li>
						<a target="_blank" href="${pageContext.request.contextPath}/selectProductByPid?pid=${hp.pid}">
							<img src="${pageContext.request.contextPath}/${ hp.imagelocation }"/>
						</a>
					</li>
				</c:forEach>
			</ul>								
		</div>
	</div>
	
	<div class="span24">
		<div id="newProduct" class="newProduct clearfix">
			<div class="title">
				<strong>最新商品</strong>
			</div>
			<ul class="tab"></ul>	 
			 <!-- 最新商品 ----------------------------------------------------------------------------->
			 <ul class="tabContent" style="display: block;">
				<c:forEach var="np" items="${newProductList }">
					<li>
						<a target="_blank" href="${pageContext.request.contextPath}/selectProductByPid?pid=${np.pid}">
							<img src="${pageContext.request.contextPath}/${ np.imagelocation }"/>
						</a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	
	
	
</div>

<%@ include file="footer.jsp" %>

</body>

</html>
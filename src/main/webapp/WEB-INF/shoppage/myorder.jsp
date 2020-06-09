<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0043)http://localhost:8080/mango/cart/list.jhtml -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

	<title>订单页面</title>
	<link href="${pageContext.request.contextPath}/css/slider.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/cart.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/mycss.css" rel="stylesheet" type="text/css"/>
</head>
<body>


	<%@ include file="header.jsp" %>
	<%@ include file="menu.jsp" %>
	


<div class="container cart">

	<div class="span24">
	
		<br />
		<font size="3" color="grey">订单列表</font>
		<br />
		<hr />
		<table>
			<tbody>
			<c:forEach var="myorder" items="${ myOrders }" >
				<tr>
					<th colspan="5">
						订单号
							${ myorder.oid }
						&nbsp;&nbsp;&nbsp;总金额&nbsp;￥
							<font color="red">${ myorder.total }</font>
						&nbsp;&nbsp;&nbsp;&nbsp;状态&nbsp; 
							<c:if test="${ myorder.paystate == 1 }">
								<font color="red">未付款&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
<!-- ------------------------------------------------------------------------------------------- -->
								<a href="">
<!-- ------------------------------------------------------------------------------------------- -->
									<font color="blue">去付款</font>
								</a>
							</c:if>
							<c:if test="${ myorder.paystate == 2 }">
								已付款
							</c:if>
							<c:if test="${ myorder.paystate == 3 }">
								<font color="red">等待确认收货</font>
							</c:if>
							<c:if test="${ myorder.paystate == 4 }">
								订单完成
							</c:if>
					</th>
				</tr>
					<tr>
						<th>图片</th>
						<th>商品名称</th>
						<th>价格</th>
						<th>数量</th>
						<th>总金额</th>
					</tr>
					<c:forEach var="p" items="${ myorder.products }">
						<tr>
							<!-- 图片 -->
							<td width="60">
								<img src="${ pageContext.request.contextPath }/${ p.imagelocation }"/>
							</td>
							<!-- 商品名称 -->
							<td>
								<a target="_blank" href="${pageContext.request.contextPath}/selectProductByPid?pid=${p.pid}">
									${ p.pname }
								</a>
							</td>
							<!--价格 -->
							<td>
								${ p.shop_price }
							</td>
							<!-- 数量 -->
							<td class="quantity" width="60">
								${ p.count }
							</td>
							<!-- 总金额 -->
							<td width="140">
								<span class="subtotal">￥${ p.subtotal }</span>
							</td>					
						</tr>
					</c:forEach>
					<tr>
						<th colspan="5">&nbsp;</th>
					</tr>
				</c:forEach>
			</tbody>
		</table>
			
	</div>
		
</div>

	<%@include file="footer.jsp" %>

</body>
</html>
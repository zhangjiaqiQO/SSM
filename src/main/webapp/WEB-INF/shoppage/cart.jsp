<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0043)http://localhost:8080/mango/cart/list.jhtml -->
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>购物车</title>
	<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/cart.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css"/>
</head>

<body>

	<%@ include file="header.jsp" %>
	<%@ include file="menu.jsp" %>

<div class="container cart">
	<div class="span24">
		<br /><br />
		<!-- 判断用户购物车中是否有订单项 -->
		<c:if test="${ orderItemExist == 'no' }">
			<div class="step step1">
				<font size="4" color="red">您还没有购物!请先<a style="color: blue;text-decoration: underline;" href="${pageContext.request.contextPath}/index">去购物!</a></font>
			</div>
		</c:if>
		<c:if test="${ orderItemExist == 'yes' }">
		
			<div class="step step1">
				<font size="3">购物车列表</font>
			</div>
			<table>
				<tbody>
				<tr>
					<th>图片</th>
					<th>商品</th>
					<th>价格</th>
					<th>数量</th>
					<th>小计</th>
					<th>操作</th>
				</tr>
				<c:forEach var="oi" items="${ orderItems }">
					<tr>
						<c:forEach var="oip" items="${ orderItemProductMap }">
							<c:if test="${ oi.pid == oip.key }">
								<td width="60">
									<img src="${pageContext.request.contextPath}/${ oip.value.imagelocation }"/>
								</td>
								<td>
									<a target="_blank" href="${pageContext.request.contextPath}/selectProductByPid?pid=${oip.value.pid}">
										${ oip.value.pname }
									</a>
								</td>
								<td>
									￥${ oip.value.shop_price }
								</td>
							</c:if>
						</c:forEach>
						<td class="quantity" width="60">
							${ oi.count }
						</td>
						<td width="140">
							<span class="subtotal">￥${ oi.subtotal }</span>
						</td>
						<td>
							<a href="${ pageContext.request.contextPath }/removeOrderItem?oiid=${ oi.oiid }" class="delete">删除</a>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<dl id="giftItems" class="hidden" style="display: none;"></dl>
			<div class="total">
				<em id="promotion"></em>
				赠送积分 <em id="effectivePoint">${ orderItemTotal }</em>
				商品金额 <strong id="effectivePrice">￥${ orderItemTotal }元</strong>
			</div>
			<div class="bottom">
				<a href="${ pageContext.request.contextPath }/clearCart" id="clear" class="clear">清空购物车</a>
				<a href="${ pageContext.request.contextPath }/saveOrder" id="submit" class="submit">提交订单</a>
			</div>
		</c:if>
	</div>
</div>

<%@ include file="footer.jsp" %>

</body>

</html>
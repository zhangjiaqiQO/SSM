<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0043)http://localhost:8080/mango/cart/list.jhtml -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<title>订单页面</title>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/cart.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/slider.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css"/>
</head>
<body>


	<%@ include file="header.jsp" %>
	<%@ include file="menu.jsp" %>
	

<div class="container cart">

	<div class="span24">
	
		<br />
		<font size="3" color="green">生成订单成功!</font>
		<br />
		<br />
		
		<table>
			<tbody>
			<tr>
				<th>图片</th>
				<th>商品</th>
				<th>价格</th>
				<th>数量</th>
				<th>小计</th>
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
				</tr>
			</c:forEach>						
		</tbody>
	</table>
		<dl id="giftItems" class="hidden" style="display: none;"></dl>
		<div class="total">
			<em id="promotion"></em>
			商品金额&nbsp; <strong id="effectivePrice">￥${ orderItemTotal }元</strong>
		</div>
		<form id="orderForm" action="${pageContext.request.contextPath }/order_payOrder.action" method="post">
			<div class="span24">
				<hr />
				<p style="border-bottom:0px;border-top: 0px;">
					收货地址&nbsp;<input name="order.addr" type="text" value="${ exitShopUser.address }" style="width:350px" /><br />
					收&nbsp;货&nbsp;人&nbsp;&nbsp;<input name="order.name" type="text" value="${ exitShopUser.username }" style="width:150px" /><br /> 
					联系方式&nbsp;<input name="order.phone" type="text" value="${ exitShopUser.telephone }" style="width:150px" />
				</p>
				<hr />
				<p style="border-bottom:0px;border-top: 0px;">
					选择银行<br/>
					<input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" checked="checked"/>工商银行
					<img src="${pageContext.request.contextPath}/bank_img/icbc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="pd_FrpId" value="BOC-NET-B2C"/>中国银行
					<img src="${pageContext.request.contextPath}/bank_img/bc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="pd_FrpId" value="ABC-NET-B2C"/>农业银行
					<img src="${pageContext.request.contextPath}/bank_img/abc.bmp" align="middle"/><br/>
					<input type="radio" name="pd_FrpId" value="BOCO-NET-B2C"/>交通银行
					<img src="${pageContext.request.contextPath}/bank_img/bcc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="pd_FrpId" value="PINGANBANK-NET"/>平安银行
					<img src="${pageContext.request.contextPath}/bank_img/pingan.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="pd_FrpId" value="CCB-NET-B2C"/>建设银行
					<img src="${pageContext.request.contextPath}/bank_img/ccb.bmp" align="middle"/><br/>
					<input type="radio" name="pd_FrpId" value="CEB-NET-B2C"/>光大银行
					<img src="${pageContext.request.contextPath}/bank_img/guangda.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C"/>招商银行
					<img src="${pageContext.request.contextPath}/bank_img/cmb.bmp" align="middle"/>
				</p>
				<hr />
				<p style="text-align:right;border-bottom:0px;border-top: 0px;">
<!-- ------------------------------------------------------------------------------------------- -->
					<a href="支付订单的连接">
						<img src="${pageContext.request.contextPath}/img/pay.jpg" width="195" height="38" border="0" />
					</a>
<!-- ------------------------------------------------------------------------------------------- -->
				</p>
			</div>
		</form>
	</div>
</div>

</body>
</html>
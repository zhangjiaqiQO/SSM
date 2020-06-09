<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<HTML>
<HEAD>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="${pageContext.request.contextPath}/css/Style1.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
	<script type="text/javascript">
		function addAdminUser(){
			window.location = "${pageContext.request.contextPath}/adminpage/adminuser/add.jsp";				
		}
	</script>
</HEAD>
<body>
	<br/>
	<table rules="all" style="width: 99%; WORD-BREAK: break-all; border: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word"">
		<tr>
			<td class="ta_01" align="center" bgColor="#afd1f3" colspan="5" style="border: hidden;">
				<strong>订单列表</strong>
			</td>
		</tr>
		<tr style="background-color: white;">
			<td align="center" colspan="4" style="border-right: hidden;border-left: hidden;">
				&nbsp;
			</td>
		</tr>
		<c:forEach var="a" items="${ allOrders }" >
			<tr style="font-weight: bold; font-size: 12pt; height: 25px; background-color: #afd1f3">
				<td colspan="5" align="left">
					订单号${ a.oid }
					&nbsp;&nbsp;&nbsp;总金额&nbsp;￥
						<font color="green">${ a.total }</font>
					&nbsp;&nbsp;&nbsp;&nbsp;状态&nbsp; 
						<c:if test="${ a.paystate == 1 }">
							<font color="red">未付款</font>
						</c:if>
						<c:if test="${ a.paystate == 2 }">
							<font color="green">已付款</font>
						</c:if>
						<c:if test="${ a.paystate == 3 }">
							<font color="green">等待确认收货</font>
						</c:if>
						<c:if test="${ a.paystate == 4 }">
							订单已完成
						</c:if>
				</td>
			</tr>
			<tr align="center" style="font-weight: bold; font-size: 12pt; height: 25px;">
				<td width="15%">商品图片</td>
				<td width="30%">商品名称</td>
				<td width="20%">单价</td>
				<td width="15%">数量</td>
				<td width="20%">总金额</td>
			</tr>
			<c:forEach var="p" items="${ a.products }">
				<tr align="center" onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
					<!-- 图片 -->
					<td>
						<img width="45px" height="50px" src="${ pageContext.request.contextPath }/${ p.imagelocation }"/>
					</td>
					<!-- 商品名称 -->
					<td>
						${ p.pname }
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
					<td>
						<span class="subtotal">￥${ p.subtotal }</span>
					</td>					
				</tr>
			</c:forEach>
		</c:forEach>
	</table>
</body>
</HTML>


<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<HTML>
<HEAD>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="${pageContext.request.contextPath}/css/Style1.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
	<script type="text/javascript">
		function addProduct(){
			window.location = "${pageContext.request.contextPath}/adminpage/product/add.jsp";				
		}
	</script>
</HEAD>
<body>
	<br/>
	<table rules="all" style="width: 99%; WORD-BREAK: break-all; border: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
		<tr>
			<td class="ta_01" align="center" bgColor="#afd1f3" colspan="8" style="border: hidden;">
				<strong>商品列表</strong>
			</td>
		</tr>
		<tr style="background-color: white;">
			<td align="center" colspan="4" style="border-right: hidden;border-left: hidden;">
				<font color="red" size="2">${ editFail }${ deleteFail }${ addFail }</font>
				<font color="green" size="2">${ editSuccess }${ deleteSuccess }${ addSuccess }</font>
			</td>
			<td align="center" colspan="4" style="border-right: hidden;">
				<button type="button" onclick="addProduct()">添加商品</button>
			</td>
		</tr>
		<tr style="font-weight: bold; font-size: 12pt; height: 25px; background-color: #afd1f3">
			<td width="10%" align="center">编号</td>
			<td width="10%" align="center">图片</td>
			<td width="25%" align="center">商品名</td>
			<td width="15%" align="center">商城价</td>
			<td width="15%" align="center">市场价</td>
			<td width="5%" align="center">是否热门</td>
			<!-- 不知道数据库中查出的数据的转化方法，暂时先不加上架日期 -->
<!-- 			<td width="20%" align="center">上架日期</td> -->
			<td width="10%" align="center">编辑</td>
			<td width="10%" align="center">删除</td>
		</tr>
		<c:forEach var="ap" items="${ allProducts }">
			<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
				<!-- 编号 -->
				<td align="center" style="height: 22px">
					${ ap.pid }
				</td>
				<!-- 图片 -->
				<td align="center" style="height: 22px">
					<img width="45px" height="50px" src="${pageContext.request.contextPath}/${ ap.imagelocation }">
				</td>
				<!-- 商品名 -->
				<td align="center" style="height: 22px">
					${ ap.pname }
				</td>
				<!-- 商城价 -->
				<td align="center" style="height: 22px">
					${ ap.shop_price }
				</td>
				<!-- 市场价 -->
				<td align="center" style="height: 22px">
					${ ap.market_price }
				</td>
				<!-- 是否热门 -->
				<td align="center" style="height: 22px">
					<c:if test="${ ap.hot == 1 }">是</c:if>
					<c:if test="${ ap.hot == 0 }">否</c:if>
				</td>
				<!-- 上架日期 -->
<!-- 				<td align="center" style="height: 22px"> -->
<%-- 					${ ap.date } --%>
<!-- 				</td> -->
				<td align="center" style="height: 22px">
					<a href="${pageContext.request.contextPath}/editProductPage?pid=${ ap.pid }">
						<img src="${pageContext.request.contextPath}/img/i_edit.gif" style="cursor: hand">
					</a>
				</td>
				<td align="center" style="HEIGHT: 22px">
					<a href="${pageContext.request.contextPath}/deleteProduct?pid=${ ap.pid }">
						<img src="${pageContext.request.contextPath}/img/i_del.gif" style="cursor: hand">
					</a>
				</td>
			</tr>
		</c:forEach>
		
		
		
		<!-- ---------------------------------------------- -->
		<tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
			<td align="center" colspan="8">
				第  ${ productPage.localPage }/${ productPage.totalPage }页
				<c:if test="${ productPage.localPage != 1 }">
					<a href="${ pageContext.request.contextPath }/selectProductPage?start=0">首页</a>		
					<a href="${ pageContext.request.contextPath }/selectProductPage?start=${ (productPage.localPage-2)*8 }">上一页</a>	
				</c:if>
				<c:forEach var="i" begin="1" end="${ productPage.totalPage }" step="1">
					<c:if test="${ productPage.localPage == i }">
						<span>
							<font color="blue" size="4">${ i }</font>
						</span>
					</c:if>
					<c:if test="${ productPage.localPage != i }">
						<a href="${ pageContext.request.contextPath }/selectProductPage?start=${ (i-1)*8 }">${ i }</a>
					</c:if>
				</c:forEach>
				<c:if test="${ productPage.localPage != productPage.totalPage }">
					<a href="${ pageContext.request.contextPath }/selectProductPage?start=${ productPage.localPage*8 }">下一页</a>
					<a href="${ pageContext.request.contextPath }/selectProductPage?start=${ (productPage.totalPage-1)*8 }">尾页</a>
				</c:if>	
			</td>
		</tr>
		
		
		
		<div>
			
		</div>
		
		<!-- ---------------------------------------------------------------- -->
		
		
		
		
		
		
		
	</table>
</body>
</HTML>


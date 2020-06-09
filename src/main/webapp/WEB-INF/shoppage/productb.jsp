<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>商品列表</title>
	<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/product.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css"/>
</head>
<body>


<%@ include file="header.jsp" %>
<%@ include file="menu.jsp" %>


<div class="container productList">

	<!-- 左侧一级分类二级分类列表 -->
	<%@ include file="catalogab.jsp" %>
	
			
<!-- 商品信息------------------------------------------------------------------------------------ -->				
	<div id="result" class="result table clearfix">
		<br /><br />
		<ul>
			<c:forEach var="cbp" items="${cbProduct }">
				<li>
					<a href="${pageContext.request.contextPath}/selectProductByPid?pid=${cbp.pid}">
						<!-- 商品图片 -->
						<img src="${pageContext.request.contextPath}/${ cbp.imagelocation }" width="170" height="170"  style="display: inline-block;"/>
						<!-- 商品描述 -->
						<span style='color:green'>
							${cbp.pname }
						</span>
						<!-- 商品价格 -->
						<span class="price">
							商城价  ￥${cbp.shop_price }
						</span>
					</a>
				</li>
			</c:forEach>	
		</ul>
	
				
			
<!-- 分页------------------------------------------------------------------------------------ -->	
	<div class="pagination">
		第  ${ bpage.localPage }/${ bpage.totalPage }页
		<c:if test="${ bpage.localPage != 1 }">
			<a href="${ pageContext.request.contextPath }/selectProductByCbid?cbid=${bpage.cid }&start=0" class="firstPage">&nbsp;</a>		
			<a href="${ pageContext.request.contextPath }/selectProductByCbid?cbid=${bpage.cid }&start=${ (bpage.localPage-2)*8 }" class="previousPage">&nbsp;</a>	
		</c:if>
		<c:forEach var="i" begin="1" end="${ bpage.totalPage }" step="1">
			<c:if test="${ bpage.localPage == i }">
				<span class="currentPage">${ i }</span>
			</c:if>
			<c:if test="${ bpage.localPage != i }">
				<a href="${ pageContext.request.contextPath }/selectProductByCbid?cbid=${bpage.cid }&start=${ (i-1)*8 }">${ i }</a>
			</c:if>
		</c:forEach>
		<c:if test="${ bpage.localPage != bpage.totalPage }">
			<a class="nextPage" href="${ pageContext.request.contextPath }/selectProductByCbid?cbid=${bpage.cid }&start=${ bpage.localPage*8 }">&nbsp;</a>
			<a class="lastPage" href="${ pageContext.request.contextPath }/selectProductByCbid?cbid=${bpage.cid }&start=${ (bpage.totalPage-1)*8 }">&nbsp;</a>
		</c:if>	
	</div>
</div>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>
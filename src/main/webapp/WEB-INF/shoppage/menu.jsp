<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    
<div class="container header">
	<div class="span24">
		<ul class="mainNav">
			<li>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="${ pageContext.request.contextPath }/index">首页</a>	
			</li>
			<!-- 遍历出一级分类 -->
			<c:forEach var="ca" items="${catalogaList }">
				<li>
					|<a href="${ pageContext.request.contextPath }/selectProductByCaid?caid=${ca.caid }&start=0">${ca.caname }</a>
				</li>
			</c:forEach>
			
		</ul>
	</div>
</div>
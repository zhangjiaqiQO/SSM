<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!-- 左侧一级分类二级分类列表------------------------------------------------------------------------------------ -->		

	<div class="span6">
		<div class="hotProductCategory">
			<!-- 一级分类显示 -->
			<c:forEach var="a" items="${ catalogaList }">
				<dl>
					<dt>
						<a href="${pageContext.request.contextPath}/selectProductByCaid?caid=${a.caid}&start=0">${ a.caname }</a>
					</dt>
					<!-- 二级分类显示-->
					<c:forEach var="b" items="${ catalogbList }">
						<c:if test="${ b.caid == a.caid }">
							<dd>
								<a href="${pageContext.request.contextPath}/selectProductByCbid?cbid=${b.cbid}&start=0">${ b.cbname }</a>
							</dd>
						</c:if>
					</c:forEach>
				</dl>
			</c:forEach>
		</div>
	</div>


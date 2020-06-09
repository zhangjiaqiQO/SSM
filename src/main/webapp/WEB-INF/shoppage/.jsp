<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!-- 左侧一级分类二级分类列表------------------------------------------------------------------------------------ -->		

	<div class="span6">
		<div class="hotProductCategory">
			<!-- 一级分类显示 -->
			<s:iterator var="c" value="categoryList">
				<dl>
					<dt>
						<a href="${pageContext.request.contextPath}/product_findByCid.action?cid=<s:property value="#c.cid"/>&page=1"><s:property value="#c.cname"/></a>
					</dt>
					<!-- 二级分类显示-->
					<s:iterator var="cs" value="#c.categorySeconds">
						<dd>
							<a href="${pageContext.request.contextPath}/product_findByCsid.action?csid=<s:property value="#cs.csid"/>&page=1"><s:property value="#cs.csname"/></a>
						</dd>
					</s:iterator>	
				</dl>
			</s:iterator>	
		</div>
	</div>


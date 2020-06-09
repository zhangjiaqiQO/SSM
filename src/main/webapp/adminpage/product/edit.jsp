<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<HTML>

<HEAD>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<LINK href="${pageContext.request.contextPath}/css/Style1.css" type="text/css" rel="stylesheet">
</HEAD>

<body>
	<br/>
	<form action="${pageContext.request.contextPath}/editProduct" method="post" enctype="multipart/form-data">
		<input type="hidden" name="pid" value="${ editProduct.pid }"/>
		<table rules="all" style="width: 100%; WORD-BREAK: break-all; border: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3" colspan="4" style="border: hidden;">
					<strong>编辑商品</strong>
				</td>
			</tr>
			<tr style="background-color: white;">
				<td colspan="2" style="border-right: hidden;border-left: hidden;">&nbsp;</td>
			</tr>
			<!-- 商品名称 -->
			<tr style="background-color: #f5fafe">
				<td width="50%" align="right" style="border-right: hidden;">商品名称&nbsp;&nbsp;</td>
				<td class="ta_01" >
					<input type="text" name="pname" value="${ editProduct.pname }"/>
				</td>
			</tr>
			<!-- 商品图片位置 -->
			<!-- 应该用Ajax异步交互，当用户选择一张图片时，立即上传到后台，再在前台显示 -->
			<tr style="background-color: #f5fafe">
				<td width="50%" align="right" style="border-right: hidden;">商品图片&nbsp;&nbsp;</td>
				<td class="ta_01" >
					<img width="45px" height="50px" src="${pageContext.request.contextPath}/${ editProduct.imagelocation }">
					<br/>
					<!-- 图片的原路径，防止用户修改图片信息时不上传新的图片 -->
					<input type="hidden" name=imagelocation value="${ editProduct.imagelocation }"/>
					<input type="file" name="pimage" accept="image/*" />
				</td>
			</tr>
			<!-- 商城价 -->
			<tr style="background-color: #f5fafe">
				<td width="50%" align="right" style="border-right: hidden;">商城价&nbsp;&nbsp;</td>
				<td class="ta_01" >
					<input type="text" name="shop_price" value="${ editProduct.shop_price }"/>
				</td>
			</tr>
			<!-- 市场价 -->
			<tr style="background-color: #f5fafe">
				<td width="50%" align="right" style="border-right: hidden;">市场价&nbsp;&nbsp;</td>
				<td class="ta_01" >
					<input type="text" name="market_price" value="${ editProduct.market_price }"/>
				</td>
			</tr>
			<!-- 是否热门 -->
			<tr style="background-color: #f5fafe">
				<td width="50%" align="right" style="border-right: hidden;">是否热门&nbsp;&nbsp;</td>
				<td class="ta_01" >
					<c:if test="${ editProduct.hot == 1 }">
						<input type="radio" name="hot" value="1" checked="checked">是
						<input type="radio" name="hot" value="0">否
					</c:if>
					<c:if test="${ editProduct.hot == 0 }">
						<input type="radio" name="hot" value="1">是
						<input type="radio" name="hot" value="0" checked="checked">否
					</c:if>
				</td>
			</tr>		
			<!-- 所属的二级分类 -->
			<tr style="background-color: #f5fafe">
				<td width="50%" align="right" style="border-right: hidden;">所属分类&nbsp;&nbsp;</td>
				<td class="ta_01" >
					<select name="cbid" >
						<c:forEach var="catalogb" items="${ allCatalogb }">
							<c:if test="${ editProduct.cbid == catalogb.cbid }">
								<option value="${ catalogb.cbid }" selected="selected">${ catalogb.cbname }</option>
							</c:if>
							<c:if test="${ editProduct.cbid != catalogb.cbid }">
								<option value="${ catalogb.cbid }">${ catalogb.cbname }</option>
							</c:if>
						</c:forEach>
					</select>
				</td>
			</tr>	
			<!-- 商品描述 -->
			<tr style="background-color: #f5fafe">
				<td width="50%" align="right" style="border-right: hidden;">商品描述&nbsp;&nbsp;</td>
				<td class="ta_01" >
					<textarea name="description" cols="30" rows="5" style="WIDTH: 70%">${ editProduct.description }</textarea>
				</td>
			</tr>
			<tr style="background-color: #f5fafe;" align="center">
				<td class="ta_01" colSpan="2">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="submit">确定</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="reset">重置</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" onclick="history.go(-1)" value="返回"/>
				</td>
			</tr>
		</table>
	</form>
		
</body>
</HTML>
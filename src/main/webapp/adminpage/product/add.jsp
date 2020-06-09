<%@ page language="java" pageEncoding="UTF-8" import="java.util.*" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<HTML>

<HEAD>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<LINK href="${pageContext.request.contextPath}/css/Style1.css" type="text/css" rel="stylesheet">
</HEAD>

<body>
	<br/>
	<form action="${pageContext.request.contextPath}/addProduct" method="post" enctype="multipart/form-data">
		<table rules="all" style="width: 100%; WORD-BREAK: break-all; border: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3" colspan="4" style="border: hidden;">
					<strong>添加一商品</strong>
				</td>
			</tr>
			<tr style="background-color: white;">
				<td colspan="2" style="border-right: hidden;border-left: hidden;">&nbsp;</td>
			</tr>
			<tr style="background-color: #f5fafe">
				<td width="50%" align="right" style="border-right: hidden;">商品名称&nbsp;&nbsp;</td>
				<td class="ta_01" >
					<input type="text" name="pname"/>
				</td>
			</tr>
			<tr style="background-color: #f5fafe">
				<td width="50%" align="right" style="border-right: hidden;">市场价&nbsp;&nbsp;</td>
				<td class="ta_01" >
					<input type="text" name="market_price"/>
				</td>
			</tr>
			<tr style="background-color: #f5fafe">
				<td width="50%" align="right" style="border-right: hidden;">商城价&nbsp;&nbsp;</td>
				<td class="ta_01" >
					<input type="text" name="shop_price"/>
				</td>
			</tr>
			<tr style="background-color: #f5fafe">
				<td width="50%" align="right" style="border-right: hidden;">是否热门&nbsp;&nbsp;</td>
				<td class="ta_01" >
					<input type="radio" name="hot" value="1"/>是
					<input type="radio" name="hot" value="0" checked="checked"/>否
				</td>
			</tr>
			<!-- 所属分类 -->
			<tr style="background-color: #f5fafe">
				<td width="50%" align="right" style="border-right: hidden;">所属分类&nbsp;&nbsp;</td>
				<td class="ta_01" >
					<select name="cbid">
						<c:forEach var="catalogb" items="${ allCatalogb }">
							<option value="${ catalogb.cbid }">${ catalogb.cbname }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<!-- 商品图片 -->
			<tr style="background-color: #f5fafe">
				<td width="50%" align="right" style="border-right: hidden;">商品图片&nbsp;&nbsp;</td>
				<td class="ta_01" >
					<input type="file" name="pimage" accept="image/*" />
				</td>
			</tr>
			<!-- 商品描述 -->
			<tr style="background-color: #f5fafe">
				<td width="50%" align="right" style="border-right: hidden;">商品描述&nbsp;&nbsp;</td>
				<td class="ta_01" >
					<textarea name="description" cols="30" rows="5" style="WIDTH: 70%"></textarea>
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
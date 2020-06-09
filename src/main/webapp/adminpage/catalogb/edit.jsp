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
	<form action="${pageContext.request.contextPath}/editCatalogb" method="post">
		<input type="hidden" name="cbid" value="${ editCatalogb.cbid }"/>
		<table rules="all" style="width: 100%; WORD-BREAK: break-all; border: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3" colspan="4" style="border: hidden;">
					<strong>编辑二级分类</strong>
				</td>
			</tr>
			<tr style="background-color: white;">
				<td colspan="2" style="border-right: hidden;border-left: hidden;">&nbsp;</td>
			</tr>
			<tr style="background-color: #f5fafe">
				<td width="50%" align="right" style="border-right: hidden;">二级分类名称&nbsp;&nbsp;</td>
				<td class="ta_01" >
					<input type="text" name="cbname" value="${ editCatalogb.cbname }"/>
				</td>
			</tr>
			<tr style="background-color: #f5fafe">
				<td width="50%" align="right" style="border-right: hidden;">所属的一级分类&nbsp;&nbsp;</td>
				<td class="ta_01" >
					<select name="caid">
						<c:forEach var="cataloga" items="${ allCataloga }">
							<option value="${ cataloga.caid }">${ cataloga.caname }</option>
						</c:forEach>
					</select>
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
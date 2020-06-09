<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="${pageContext.request.contextPath}/css/Style1.css" type="text/css" rel="stylesheet" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/dtree.js"></script>
		<link href="${pageContext.request.contextPath}/css/dtree.css" rel="stylesheet" type="text/css">
	</head>

<body>

	<table width="100%" border="0" height="88" border="1">
		<tr>
			<td class="ta_01" align="center" bgcolor="#afd1f3"><strong>系统首页</strong></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td width="65%" height="84" align="center" valign="top" >
				<font size="4" color="green">登录成功！</font>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<c:if test="${ exitAdminUser.username != 'root' }">
			<tr align="center">
				<td>
					<font color="blue">当前管理员${ exitAdminUser.username }权限不足！只能查看商品信息，不能进行编辑删除等操作！</font>
				</td>
			</tr>
			<tr align="center">
				<td>
					<font color="blue">若要进行编辑删除等操作，请使用管理员root登录！</font>
				</td>
			</tr>
		</c:if>
		<c:if test="${ exitAdminUser.username == 'root' }">
			<tr align="center">
				<td>
					<font size="2" color="red">当前管理员为最高权限</font>
				</td>
			</tr>
			<tr align="center">
				<td>
					<font size="2" color="red">请慎重使用编辑删除等操作</font>
				</td>
			</tr>
		</c:if>
		
	</table>

</body>

</html>
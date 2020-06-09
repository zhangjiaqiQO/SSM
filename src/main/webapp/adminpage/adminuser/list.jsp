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
	<table rules="all" style="width: 100%; WORD-BREAK: break-all; border: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
		<tr>
			<td class="ta_01" align="center" bgColor="#afd1f3" colspan="4" style="border: hidden;">
				<strong>管理员列表</strong>
			</td>
		</tr>
		<tr style="background-color: white;">
			<td align="center" colspan="2" style="border-right: hidden;border-left: hidden;">
				<font color="red" size="2">${ editFail }${ deleteFail }${ addFail }</font>
				<font color="green" size="2">${ editSuccess }${ deleteSuccess }${ addSuccess }</font>
			</td>
			<td align="center" colspan="2" style="border-right: hidden;">
				<button type="button" onclick="addAdminUser()">添加管理员</button>
			</td>
		</tr>
		<tr style="font-weight: bold; font-size: 12pt; height: 25px; background-color: #afd1f3">
			<td width="18%" align="center">管理员名称</td>
			<td width="18%" align="center">管理员密码</td>
			<td width="7%" align="center">编辑</td>
			<td width="7%" align="center">删除</td>
		</tr>
		<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
			<td align="center" style="height: 22px">
				root
			</td>
			<td align="center" style="height: 22px">
				<font color="red">不可查看</font>
			</td>
			<td align="center" style="height: 22px">
				<font color="red">不可编辑</font>
			</td>
			<td align="center" style="height: 22px">
				<font color="red">不可删除</font>
			</td>
		</tr>
		<c:forEach var="all" items="${ allAdminUser }">
			<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
				<td align="center" style="height: 22px">
					${ all.username }
				</td>
				<td align="center" style="height: 22px">
					${ all.password }
				</td>
				<td align="center" style="height: 22px">
					<a href="${pageContext.request.contextPath}/editAdminUserPage?uid=${ all.uid }">
						<img src="${pageContext.request.contextPath}/img/i_edit.gif" style="cursor: hand">
					</a>
				</td>
				<td align="center" style="HEIGHT: 22px">
					<a href="${pageContext.request.contextPath}/deleteAdminUser?uid=${ all.uid }">
						<img src="${pageContext.request.contextPath}/img/i_del.gif" style="cursor: hand">
					</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</HTML>


<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<HTML>
<HEAD>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="${pageContext.request.contextPath}/css/Style1.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
	<script type="text/javascript">
		function addCataloga(){
			window.location = "${pageContext.request.contextPath}/adminpage/cataloga/add.jsp";				
		}
	</script>
</HEAD>
<body>
	<br/>
	<table rules="all" style="width: 99%; WORD-BREAK: break-all; border: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
		<tr>
			<td class="ta_01" align="center" bgColor="#afd1f3" colspan="4" style="border: hidden;">
				<strong>一级分类列表</strong>
			</td>
		</tr>
		<tr style="background-color: white;">
			<td align="center" colspan="2" style="border-right: hidden;border-left: hidden;">
				<font color="red" size="2">${ editFail }${ deleteFail }${ addFail }</font>
				<font color="green" size="2">${ editSuccess }${ deleteSuccess }${ addSuccess }</font>
			</td>
			<td align="center" colspan="2" style="border-right: hidden;">
				<button type="button" onclick="addCataloga()">添加一级分类</button>
			</td>
		</tr>
		<tr style="font-weight: bold; font-size: 12pt; height: 25px; background-color: #afd1f3">
			<td width="18%" align="center">一级分类编号</td>
			<td width="18%" align="center">一级分类名称</td>
			<td width="7%" align="center">编辑</td>
			<td width="7%" align="center">删除</td>
		</tr>
		<c:forEach var="all" items="${ allCataloga }">
			<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
				<td align="center" style="height: 22px">
					${ all.caid }
				</td>
				<td align="center" style="height: 22px">
					${ all.caname }
				</td>
				<td align="center" style="height: 22px">
					<a href="${pageContext.request.contextPath}/editCatalogaPage?caid=${ all.caid }">
						<img src="${pageContext.request.contextPath}/img/i_edit.gif" style="cursor: hand">
					</a>
				</td>
				<td align="center" style="HEIGHT: 22px">
					<a href="${pageContext.request.contextPath}/deleteCataloga?caid=${ all.caid }">
						<img src="${pageContext.request.contextPath}/img/i_del.gif" style="cursor: hand">
					</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</HTML>


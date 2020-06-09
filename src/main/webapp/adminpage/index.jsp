<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- <html xmlns="http://www.w3.org/1999/xhtml"> -->
<head>
	<title>SSM管理中心</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>

<body style="background: #278296;color:white">

<form method="post" action="${pageContext.request.contextPath }/adminUserLogin" onsubmit="return validate()">
	<table align="center" style="margin-top: 200px">
	
		<tr>
			<td colspan="2" align="center">
				<a href="${pageContext.request.contextPath }/index" style="color:white">>>返回首页<<</a>
			</td>
		</tr>
		<tr>
			<td colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td>管理员姓名&nbsp;&nbsp;</td>
			<td>
				<input type="text" name="username" value="admin"/>
			</td>
		</tr>
		<tr>
			<td>管理员密码&nbsp;&nbsp;</td>
			<td>
				<input type="password" name="password"/>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><font color="red">${ adminUserLoginError }</font></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td align="right">
				<input type="submit" value="进入管理中心" class="button" />
			</td>
		</tr>
	</table>
</form>

</body>
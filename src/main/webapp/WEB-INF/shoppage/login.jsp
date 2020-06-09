<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
	<title>会员登录</title>
	<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css"/>
</head>

<body>

<%@ include file="header.jsp" %>




<div class="container login">
	<div class="span12">
		<div class="ad">
			<img src="${pageContext.request.contextPath}/img/login.jpg" width="500" height="330"/>
		</div>		
	</div>
		<div class="span12 last">
			<div class="wrap">
				<div class="main">
					<div class="title">
						<strong>会员登录</strong>
						<span><font size="3" color="green">${registersuccess }</font></span>
						<span><font size="3" color="red">${notlogin }</font></span>
					</div>
					<form id="loginForm" action="${pageContext.request.contextPath}/shopUser_login" method="post">
						<table>
							<tbody>
							<tr>
								<th>
									用户名
								</th>
								<td>
									<input type="text" id="username" name="username" class="text" maxlength="20" value="${registerusername}" />
								</td>
							</tr>
							<tr>
								<th>
									密&nbsp;&nbsp;码
								</th>
								<td>
									<input type="password" id="password" name="password" class="text" maxlength="20"/>
								</td>
							</tr>
							<tr>
								<th>&nbsp;</th>
								<td>
									<input type="submit" class="submit" value="登 录"/>
									<span>${login_msg }</span>
								</td>
							</tr>
							<tr class="register">
								<th>&nbsp;</th>
								<td>
									<dl>
										<dt>还没有注册账号？</dt>
										<dd>
											立即注册即可体验在线购物！
											<a href="${pageContext.request.contextPath}/register">立即注册</a>
										</dd>
									</dl>
								</td>
							</tr>
						</tbody></table>
					</form>
				</div>
			</div>
		</div>
	</div>

<%@ include file="footer.jsp" %>

</body>

</html>
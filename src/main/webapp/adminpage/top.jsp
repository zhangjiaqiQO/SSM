<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<style type="text/css">
			body {
				MARGIN: 0px;
				BACKGROUND-COLOR: #ffffff
			}
			
			body {
				FONT-SIZE: 12px;
				COLOR: #000000
			}
			
			td {
				FONT-SIZE: 12px;
				COLOR: #000000
			}
			
			th {
				FONT-SIZE: 12px;
				COLOR: #000000
			}
		</style>
		<link href="${pageContext.request.contextPath}/css/Style.css" rel="stylesheet" type="text/css">
	</HEAD>
	<body>
		<table width="100%" height="70%"  border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="100%" background="${pageContext.request.contextPath}/img/top_100.jpg"></td>
			</tr>
		</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="30" valign="bottom" background="${pageContext.request.contextPath}/img/mis_01.jpg">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="85%" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<font color="#000000"></font>
							</td>
							<td width="15%">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="16"
											background="${pageContext.request.contextPath}/img/mis_05b.jpg">
											<img src="${pageContext.request.contextPath}/img/mis_05a.jpg" width="6" height="18">
										</td>
										<td width="155" valign="bottom" background="${pageContext.request.contextPath}/img/mis_05b.jpg">
											管理员&nbsp;
											<font color="blue">${ exitAdminUser.username }</font>
<%-- 											<a style="text-decoration: none;" href="${pageContext.request.contextPath}/adminUserQuit">退出</a> --%>
										</td>
										<td width="10" align="right" background="${pageContext.request.contextPath}/img/mis_05b.jpg">
											<img src="${pageContext.request.contextPath}/img/mis_05c.jpg" width="6" height="18">
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</HTML>

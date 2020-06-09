<%@ page language="java" pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/dtree.js"></script>
		<link href="${pageContext.request.contextPath}/css/dtree.css" rel="stylesheet" type="text/css">
  </head>

<frameset rows="103,*,43" frameborder=0 border="0" framespacing="0">
  <frame src="${pageContext.request.contextPath}/adminpage/top.jsp" name="topFrame" scrolling="NO" noresize>
  <frameset cols="159,*" frameborder="0" border="0" framespacing="0">
		<frame src="${pageContext.request.contextPath}/adminpage/left.jsp" name="leftFrame" noresize scrolling="YES">
		<frame src="${pageContext.request.contextPath}/adminpage/welcome.jsp" name="mainFrame">
  </frameset>
  <frame src="${pageContext.request.contextPath}/adminpage/bottom.jsp" name="bottomFrame" scrolling="NO"  noresize>
</frameset>

</html>




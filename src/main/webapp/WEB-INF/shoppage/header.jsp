<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="container header">
	<div class="span5">
		<div class="logo" align="center">
			<a href="${pageContext.request.contextPath}/index">
				<img src="${pageContext.request.contextPath}/img/logo.png"/>
			</a>
		</div>
	</div>
	<div class="span9">
		<div class="headerAd">
			<img src="${pageContext.request.contextPath}/img/header.jpg" width="320" height="50"/>
		</div>	
	</div>
	<div class="span10 last">
		<div class="topNav clearfix">
			<ul>
				<c:if test="${ exitShopUser != null }">
					<li id="headerLogin" class="headerLogin" style="display: list-item;">
						${exitShopUser.nickname }
					</li>
					<li id="headerLogin" class="headerLogin" style="display: list-item;">
						<a href="${ pageContext.request.contextPath }/myorder?uid=${ exitShopUser.uid }">我的订单</a>|
					</li>
					<li id="headerLogin" class="headerLogin" style="display: list-item;">
						<a href="${pageContext.request.contextPath}/quit">退出</a>|
					</li>
				</c:if>
				<c:if test="${ exitShopUser == null }">
					<li id="headerLogin" class="headerLogin" style="display: list-item;">
						<a href="${pageContext.request.contextPath}/login">登录</a>|
					</li>
					<li id="headerRegister" class="headerRegister" style="display: list-item;">
						<a href="${pageContext.request.contextPath}/register">注册</a>|
					</li>
				</c:if>
			

				<li>
					<a>会员中心</a>	|
				</li>
				<li>
					<a>购物指南</a>	|
				</li>
				<li>
					<a>关于我们</a>
				</li>
			</ul>
		</div>
		<div class="cart">
			<a  href="${pageContext.request.contextPath}/cart">购物车</a>
		</div>
		<div class="phone">
			客服热线<strong>123456789</strong>
		</div>
	</div>
</div>	
	

	
	

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>注册</title>
	<link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath }/css/register.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath }/css/mycss.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath }/css/index.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
</head>

<body>

	<!-- Form表单提交校验 -->
	<script type="text/javascript">
	
		// 密码框失去焦点校验密码格式
		function checkpassword(){
			var password = document.regform.password.value;
			var passwordspan1 = document.getElementById("passwordspan1");
			var passwordspan2 = document.getElementById("passwordspan2");
			if( password == "" || password.length < 6 || password.length > 15 ){
				passwordspan1.innerHTML = "密码必须在6-15位之间！";
				passwordspan2.innerHTML = "";
			}else{
				passwordspan1.innerHTML = "";
				passwordspan2.innerHTML = "ok";
			};
		}
	
		// 确认密码框失去焦点时校验密码
		function checkrepassword(){
			var password = document.regform.password.value;
			var repassword = document.regform.repassword.value;
			var repasswordspan1 = document.getElementById("repasswordspan1");
			var repasswordspan2 = document.getElementById("repasswordspan2");
			if( repassword == "" || repassword.length == 0 ){
				repasswordspan1.innerHTML = "";
				repasswordspan2.innerHTML = "";
			}else if( repassword != password ){
				repasswordspan1.innerHTML = "两次密码不一致！";
				repasswordspan2.innerHTML = "";
			}else{
				repasswordspan1.innerHTML = "";
				repasswordspan2.innerHTML = "ok";
			};
		}
		
		// 邮箱文本框失去焦点校验格式
		function checkemail(){
			var email = document.regform.email.value;
			var emailspan1 = document.getElementById("emailspan1");
			var emailspan2 = document.getElementById("emailspan2");
			if( email == "" || email.lengh == 0 ){
				emailspan1.innerHTML = "邮箱不能为空！";
				emailspan2.innerHTML = "";
			}else if(!/.+@.+\.[a-zA-Z]{2,4}$/.test(email)){
				emailspan1.innerHTML = "邮箱格式不正确！";
				emailspan2.innerHTML = "";
			}else{
				emailspan1.innerHTML = "";
				emailspan2.innerHTML = "ok";
			};
		}
		
		// 电话文本框失去焦点校验格式
		function checktelephone(){
			var telephone = document.regform.telephone.value;
			var telephonespan1 = document.getElementById("telephonespan1");
			var telephonespan2 = document.getElementById("telephonespan2");
			if( telephone == "" || telephone.lengh == 0 ){
				telephonespan1.innerHTML = "电话不能为空！";
				telephonespan2.innerHTML = "";
			}else if(!/^1[3456789]\d{9}$/.test(telephone)){
				telephonespan1.innerHTML = "电话格式不正确！";
				telephonespan2.innerHTML = "";
			}else{
				telephonespan1.innerHTML = "";
				telephonespan2.innerHTML = "ok";
			};
		}
		
		// 点击验证码框，清空之前的错误信息
		function checkcheckcode(){
			document.getElementById("checkcodemsg").innerHTML = "";
		}
	
		// 验证码刷新
		function checkCodeRefresh(){
			var image = document.getElementById("checkcodeimage");
			image.src = "${ pageContext.request.contextPath }/checkCode.action?time="+new Date().getTime();
		}
			
			
		//提交表单,完成校验
		function checkForm(){
			var username = document.getElementById("ajaxspan").innerHTML;
			var password = document.getElementById("passwordspan2").innerHTML;
			var repassword = document.getElementById("repasswordspan2").innerHTML;
			var email = document.getElementById("emailspan2").innerHTML;
			var telephone = document.getElementById("telephonespan2").innerHTML;
			if( username!="<font color=\"green\">用户名可用！</font>" || password!="ok" || repassword!="ok" || email!="ok" || telephone!="ok" ){
				document.getElementById("submitid").innerHTML = "<h3>注册信息没有正确填写或填写不完整！</h3>";
				return false;
			}else{
				return true;
			};
		}
		
		// 异步校验用户名
		function ajaxcheckUserName(){
			var username = $("#username").val();
			$("#ajaxspan").load("${pageContext.request.contextPath}/shopUser_checkUsername?"+new Date().getTime(),{'username':username});
		}
		
	
	
	</script>



<%@ include file="header.jsp" %>
	
	

	
<div class="container register">
	<div class="span24">
		<div class="wrap">
			<div class="main clearfix">
				<div class="title">
					<strong>会员注册</strong>USER REGISTER
				</div>
					
					
				<form id="registerForm" name="regform" action="${pageContext.request.contextPath }/shopUser_register" method="post" onsubmit="return checkForm();">
					<table>
						<tbody>
						<tr>
							<th>
								<span class="requiredField">*</span>用&nbsp;户&nbsp;名
							</th>
							<td>
								<input type="text" id="username" name="username" class="text" maxlength="20" onblur="ajaxcheckUserName()"/>&nbsp;&nbsp;
								<span id="ajaxspan"></span>
							</td>
						</tr>
						<tr>
							<th>
								<span class="requiredField">*</span>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码
							</th>
							<td>
								<input type="password" id="password" name="password" class="text" maxlength="20" autocomplete="off" onblur="checkpassword()"/>&nbsp;&nbsp;
								<span id="passwordspan1" class="checkfalse"></span>
								<span id="passwordspan2" class="checktrue"></span>
							</td>
						</tr>
						<tr>
							<th>
								<span class="requiredField">*</span>确认密码
							</th>
							<td>
								<input type="password" name="repassword" class="text" maxlength="20" autocomplete="off" onblur="checkrepassword()"/>&nbsp;&nbsp;
								<span id="repasswordspan1" class="checkfalse"></span>
								<span id="repasswordspan2" class="checktrue"></span>
							</td>
						</tr>
						<tr>
							<th>
								<span class="requiredField">*</span>E-mail
							</th>
							<td>
								<input type="text" id="email" name="email" class="text" maxlength="200" onblur="checkemail()"/>&nbsp;&nbsp;
								<span id="emailspan1" class="checkfalse"></span>
								<span id="emailspan2" class="checktrue"></span>
							</td>
						</tr>
						<tr>
							<th>
								<span class="requiredField">*</span>电&nbsp;&nbsp;话
							</th>
							<td>
								<input type="text" id="telephone" name="telephone" class="text" maxlength="200"onblur="checktelephone()"/>&nbsp;&nbsp;
								<span id="telephonespan1" class="checkfalse"></span>
								<span id="telephonespan2" class="checktrue"></span>
							</td>
						</tr>
						<tr>
							<th>
								昵称
							</th>
							<td>
								<input type="text" name="nickname" class="text" maxlength="200"/>
							</td>
						</tr>
						<tr>
							<th>
								性别
							</th>
							<td>
								<span class="fieldSet">
									<label>
										<input type="radio" name="sex" value="男"/>男
									</label>
									<label>
										<input type="radio" name="sex" value="女"/>女
									</label>
								</span>
							</td>
						</tr>
						<tr>
							<th>
								收货地址
							</th>
							<td>
								<input type="text" name="address" class="text" maxlength="200"/>
							</td>
						</tr>
						<tr>
							<th>
								<span class="requiredField">*</span>验证码
							</th>
							<td>
								<span class="fieldSet">
									<input type="text" id="checkcode" name="checkcode" class="text captcha" maxlength="4" onclick="checkcheckcode()"/>
									<img id="checkcodeimage" class="captchaImage" src="${pageContext.request.contextPath}/checkCode" title="点击更换验证码" onclick="checkCodeRefresh()"/>
									<span id="checkcodemsg">${checkcodemsg }</span>
								</span>
							</td>
						</tr>
						<tr>
							<th>&nbsp;</th>
							<td>
								<input type="submit" class="submit" value="同意以下协议并注册"/>
								<span id="submitid" class="checkfalse"></span>
							</td>
						</tr>
						<tr>
							<th>&nbsp;</th>
							<td>注册协议</td>
						</tr>
						<tr>
							<th>&nbsp;</th>
							<td>
								<div id="agreement" class="agreement" style="height: 200px;">
									<p>尊敬的用户欢迎您注册成为本网站会员。请用户仔细阅读以下全部内容。如用户不同意本服务条款任意内容，请不要注册或使用本网站服务。</p> 
									<p>一、本站服务条款的确认和接纳<br>本网站涉及的各项服务的所有权和运作权归本网站所有。本网站所提供的服务必须按照其发布的服务条款和操作规则严格执行。</p> 
									<p>二、服务简介<br>本网站运用自己的操作系统通过国际互联网络为用户提供各项服务。用户必须:  1. 提供设备，如个人电脑、手机或其他上网设备。 2. 个人上网和支付与此服务有关的费用。</p> 
									<p>三、用户在不得在本网站上发布下列违法信息<br>1. 反对宪法所确定的基本原则的； 2. 危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的； 3. 损害国家荣誉和利益的； </p> 
									<p>四、有关个人资料<br>用户同意:  1. 提供及时、详尽及准确的个人资料。 2. 同意接收来自本网站的信息。 3. 不断更新注册资料，符合及时、详尽准确的要求。所有原始键入的资料将引用为注册资料。</p> 
									<p>五、服务条款的修改<br>本网站有权在必要时修改服务条款，一旦条款及服务内容产生变动，本网站将会在重要页面上提示修改内容。如果不同意所改动的内容，用户可以主动取消获得的本网站信息服务。</p> 
									<p>六、用户隐私制度<br>尊重用户个人隐私是本网站的一项基本政策。所以，本网站一定不会在未经合法用户授权时公开、编辑或透露其注册资料及保存在本网站中的非公开内容。</p> 
									<p>七、用户的帐号、密码和安全性<br>用户一旦注册成功，将获得一个密码和用户名。用户需谨慎合理的保存、使用用户名和密码。如果你不保管好自己的帐号和密码安全，将负全部责任。 </p> 
									<p>八、 拒绝提供担保 用户明确同意信息服务的使用由用户个人承担风险。本网站不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保，但会在能力范围内，避免出错。</p> 
									<p>九、有限责任<br>如因不可抗力或其它本站无法控制的原因使本站销售系统崩溃或无法正常使用导致网上交易无法完成或丢失有关的信息、记录等本站会尽可能合理地协助处理善后事宜，并努力使客户免受经济损失。</p> 
									<p>十、用户信息的储存和限制<br>本站有判定用户的行为是否符合国家法律法规规定及本站服务条款权利，如果用户违背本网站服务条款的规定，本网站有权中断对其提供服务的权利。</p> 
									<p>十一、用户管理<br>用户单独承担发布内容的责任。用户对服务的使用是根据所有适用于本站的国家法律、地方法律和国际法律标准的。</p> 
									<p>十二、通告<br>所有发给用户的通告都可通过重要页面的公告或电子邮件或常规的信件传送。服务条款的修改、服务变更、或其它重要事件的通告都会以此形式进行。</p> 
									<p>十三、信息内容的所有权<br>本网站定义的信息内容包括: 文字、软件、声音、相片、录象、图表；在广告中全部内容；本网站为用户提供的其它信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。</p> 
									<p>十四、法律<br>本协议的订立、执行和解释及争议的解决均应适用中华人民共和国的法律。用户和本网站一致同意服从本网站所在地有管辖权的法院管辖。</p>
								</div>
							</td>
						</tr>
					</tbody></table>
					<div class="login">
						<div class="ad">
							<dl>
								<dt>
									注册即享受
								</dt>
								<dd>
									正品保障、正规发票
								</dd>
								<dd>
									货到付款、会员服务
								</dd>
								<dd>
									自由退换、售后上门
								</dd>
							</dl>
						</div>							
						<dl>
							<dt>已经拥有账号了？</dt>
							<dd>
								立即登录即可体验在线购物！
							</dd>
						</dl>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


<%@ include file="footer.jsp" %>

</body>
</html>
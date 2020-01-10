<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
request.setAttribute("path", path);
%>

<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="../css/wjr/logreg.css">
		<title>登录注册页面</title>

	</head>

	<body>

		<div class="container" id="container">
			<div class="form-container sign-up-container">
				<form action="${path}/user/reg.action" method="post" onsubmit="return checkreg(this)">
					<h1>注册</h1>
					<table>
						<tr><input type="tel" name="uaccount" placeholder="账号"></tr>
						<span class="uaccount-checkmsg">&nbsp;${error_uaccount}</span>
						<tr><input type="text" name="uname" placeholder="姓名"></tr>
						<span class="uname-checkmsg">&nbsp;${error_uname}</span>
						<tr><input type="text" name="unname" placeholder="昵称"></tr>
						<span class="unname-checkmsg">&nbsp;${error_uuname}</span>
						<tr><input type="password" name="upassword" placeholder="密码"></tr>
						<span class="upassword-checkmsg">&nbsp;${error_upassword}</span>
						<tr><input type="email" name="uemail" placeholder="邮箱"></tr>
						<span class="uemail-checkmsg">&nbsp;${error_uemail}</span>
						<tr>
							<td><label class="radiofont"><input type="radio" name="usex" value="男" checked="男">男</label></td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td><label class="radiofont"><input type="radio" name="usex" value="女">女</label></td>
						</tr>
					</table><br />
					<button data-method="setTop">注册</button>
					<span style="color:red"><h2>${regerrormessage}</h2></span>

				</form>
			</div>
			<div class="form-container sign-in-container">
				<form action="${path}/user/login.action" method="post" onsubmit="return checklogin(this)">
					<h1>登录</h1><br />
					<span><h3>账号登录</h3></span><br />
					<input type="tel" name="uaccount" placeholder="账号">
					<span class="uaccount-checkmsg">&nbsp;${error_uaccount}</span><br />
					<input type="password" name="upassword" placeholder="密码">
					<span class="upassword-checkmsg">&nbsp;${error_upassword}</span><br /><br />
					<span><button>登录</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${path }/user/changepassword.action">找回密码</a></span><br />
					<span style="color:red"><h2>${logerrormessage} </h2></span>
				</form>
			</div>
			<div class="overlay-container">
				<div class="overlay">
					<div class="overlay-panel overlay-left">
						<h1>欢迎回来</h1>
						<p>
							<h3>与我们保持联系请登录您的个人信息</h3></p>
						<button class="ghost" id="signIn">登录</button>
					</div>
					<div class="overlay-panel overlay-right">
						<h1>你好</h1>
						<p>
							<h3>即刻注册与我们一起开始旅程</h3></p>
						<button class="ghost" id="signUp">注册</button>
					</div>
				</div>
			</div>
		</div>

		<script src="../js/wjr/logreg.js"></script>
		<script type="text/javascript" src="../publicUtil/jquery-3.2.1.min.js"></script>
		<script src="../js/wjr/login.js"></script>

	</body>

</html>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
request.setAttribute("path", path);
%>
<%
request.getParameter("account");
%> 
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>JSP Page</title>
		<script type="text/javascript" src="../publicUtil/jquery-3.2.1.min.js"></script>
		<link type="text/css" href="../publicUtil/layui/css/layui.css" / rel="stylesheet">
		<link type="text/css" href="../css/wjr/repwd.css" rel="stylesheet" />

	</head>

	<body>
		<div class="content">
			<div class="web-width">
				<div class="for-liucheng">
					<div class="liulist for-cur"></div>
					<div class="liulist for-cur"></div>
					<div class="liulist for-cur"></div>
					<div class="liulist"></div>
					<div class="liutextbox">
						<div class="liutext for-cur"><em>1</em><br /><strong>确认账号</strong></div>
						<div class="liutext for-cur"><em>2</em><br /><strong>验证身份</strong></div>
						<div class="liutext for-cur"><em>3</em><br /><strong>设置新密码</strong></div>
						<div class="liutext"><em>4</em><br /><strong>完成</strong></div>
					</div>
				</div>
				<!--for-liucheng/-->
				<form action="${path}/user/repwd3.action" method="post" class="forget-pwd" onsubmit="return checkpwd(this)">
					<div class="layui-form-item">
						<label class="layui-form-label"><h3>新密码</h3></label>
						<div class="layui-input-block">
							<input name="password" class="layui-input" type="password" placeholder="请输入新密码" autocomplete="off" lay-verify="title">
						</div>
					</div><br />
					<div class="layui-form-item">
						<label class="layui-form-label"><h3>确认密码</h3></label>
						<div class="layui-input-block">
							<input name="password2" class="layui-input" type="password" placeholder="再次输入以确认" autocomplete="off" lay-verify="title">
						</div>
					</div>
					<h2 style="text-align: center;"><span id="error" style="color:red;"></span></h2><br />
					<div style="text-align: center;">
						<button style="width: 106px;" class="layui-btn layui-btn-normal layui-btn-radius " type="submit">确&nbsp;&nbsp;&nbsp;定</button>
					</div>
				</form>
				<!--forget-pwd/-->
			</div>
			<!--web-width/-->
		</div>
		<!--content/-->
		<script type="text/javascript">
			function checkpwd(pwdform) {
				var pwd1 = $(pwdform).find("input[name=password]").val();
				var pwd2 = $(pwdform).find("input[name=password2]").val();
				if(pwd1.trim().length == 0 || pwd2.trim().length == 0) {

					$("#error").html("密码不能为空 ");

					return false;
				} else {
					$("#error").html("");
				}
				if(pwd1.trim().length != pwd2.trim().length) {

					$("#error").html("两次密码不一致 ,请重新输入");

					return false;
				} else {
					$("#error").html("");
				}
				return true;
			}
		</script>
	</body>

</html>
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
		<title>修改密码</title>
		<script type="text/javascript" src="../publicUtil/jquery-3.2.1.min.js"></script>
		<link type="text/css" href="../publicUtil/layui/css/layui.css" / rel="stylesheet">
		<link type="text/css" href="../css/wjr/repwd.css" rel="stylesheet" />

	</head>

	<body>

		<div class="content">
			<div class="web-width">
				<div class="for-liucheng">
					<div class="liulist for-cur"></div>
					<div class="liulist"></div>
					<div class="liulist"></div>
					<div class="liulist"></div>
					<div class="liutextbox">
						<div class="liutext for-cur"><em>1</em><br /><strong>确认账号</strong></div>
						<div class="liutext"><em>2</em><br /><strong>验证身份</strong></div>
						<div class="liutext"><em>3</em><br /><strong>设置新密码</strong></div>
						<div class="liutext"><em>4</em><br /><strong>完成</strong></div>
					</div>
				</div>
				<!--for-liucheng/-->
				<form action="${path}/user/repwd1.action" method="post" class="forget-pwd">
					<br />
					<div class="layui-form-item">
						<label class="layui-form-label"><h3>账号</h3></label>
						<div class="layui-input-block">
							<input name="account" class="layui-input" type="text" placeholder="请输入您的账号" autocomplete="off" lay-verify="title">
							<br />
							<span style="color:red;"><h2>${errormessage} </h2></span>
						</div>
					</div><br />
					<div style="text-align: center;">
						<button style="width: 106px;" class="layui-btn layui-btn-normal layui-btn-radius " type="submit">确&nbsp;&nbsp;&nbsp;定</button>
					</div>
					
				</form>
				<!--forget-pwd/-->
			</div>
			<!--web-width/-->
		</div>
		<!--content/-->

	</body>

</html>
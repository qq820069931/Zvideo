<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
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
			<div class="for-liucheng">
				<div class="liulist for-cur"></div>
				<div class="liulist for-cur"></div>
				<div class="liulist for-cur"></div>
				<div class="liulist for-cur"></div>
				<div class="liutextbox">
					<div class="liutext for-cur"><em>1</em><br /><strong>确认账号</strong></div>
					<div class="liutext for-cur"><em>2</em><br /><strong>验证身份</strong></div>
					<div class="liutext for-cur"><em>3</em><br /><strong>设置新密码</strong></div>
					<div class="liutext for-cur"><em>4</em><br /><strong>完成</strong></div>
				</div>
			</div>
			<!--for-liucheng/-->
			<div class="successs">
				<h3>恭喜您，修改成功！</h3><br />
				<div style="text-align: center;">
					<a href="${path }/user/login.action"><button class="layui-btn layui-btn-normal layui-btn-radius " type="submit">返回登录界面</button></a>
				</div>
			</div>
		</div>
		<!--web-width/-->
		</div>
		<!--content/-->
	</body>

</html>
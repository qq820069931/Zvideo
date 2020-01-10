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
		<script type="text/javascript">
			$(document).ready(function() {

				$("#send").click(function() {
					var email = $("#email").val();

					$.ajax({
						type: "post",
						url: "${path}/user/sendcode.action",
						async: true, //是否异步
						dataType: "json",
						data: {
							"email": email
						},
						success: function(data) {
							
							

							if(data.statu == 'error') {
								$("#info").html(data.message);
							} else {
								$("#info").html("");
								alert("发送成功！");
								maxTime = 60;
								countDown();
							}

						}
					});
				});

			});

			var maxTime = 0;

			function countDown() {
				if(maxTime == 0) {
					checkCode = "";
					$("#send").removeAttr("disabled");
					$("#send").html("发送验证码");
					maxTime = 60;
				} else {
					//$("#sendCheckCode").attr("href","javascript:");
					$("#send").attr("disabled","disabled");
					$("#send").html(maxTime + "秒后重新获取");
					maxTime--;
					setTimeout(countDown, 1000);
				}
			}
		</script>

	</head>

	<body>

		<div class="content">
			<div class="web-width">
				<div class="for-liucheng">
					<div class="liulist for-cur"></div>
					<div class="liulist for-cur"></div>
					<div class="liulist"></div>
					<div class="liulist"></div>
					<div class="liutextbox">
						<div class="liutext for-cur"><em>1</em><br /><strong>确认账号</strong></div>
						<div class="liutext for-cur"><em>2</em><br /><strong>验证身份</strong></div>
						<div class="liutext"><em>3</em><br /><strong>设置新密码</strong></div>
						<div class="liutext"><em>4</em><br /><strong>完成</strong></div>
					</div>
				</div>
				<!--for-liucheng/-->
				<div class="forget-pwd">
					<span style="text-align: center;"><h2>邮箱验证</h2></span><br /><br />
					<div class="layui-form-item">
						<label class="layui-form-label"><h3>邮箱账号</h3></label>
						<div class="layui-input-block">
							<input id="email" name="email" class="layui-input" type="text" placeholder="请输入您的邮箱号" autocomplete="off" lay-verify="title" value="${email}">
						</div>
						<button id="send" style="margin-top: -58px; margin-left:530px ;" class="layui-btn layui-btn-normal layui-btn-radius" type="button" >发送验证码</button>
					</div><br />
				</div>
				<form action="${path}/user/repwd2.action" method="post" style="margin-top:-280px;" class="forget-pwd">
					<div class="layui-form-item">
						<label class="layui-form-label"><h3>验证码</h3></label>
						<div class="layui-input-block">
							<input name="code" class="layui-input" type="text" placeholder="请输入您收到的验证码" autocomplete="off" lay-verify="title">
						</div><br /><br />
						<button style="width: 106px; margin-left: 230px;" class="layui-btn layui-btn-normal layui-btn-radius " type="submit">确&nbsp;&nbsp;&nbsp;定</button>
					</div>
					<h2 style="margin-left: 200px;"><span id="info" style="color:red;">${errormessage}</span></h2><br />

				</form>
				<!--forget-pwd/-->
			</div>
			<!--web-width/-->
		</div>
		<!--content/-->

	</body>

</html>
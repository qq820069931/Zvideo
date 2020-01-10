<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	request.setAttribute("path", path);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	  <meta charset="utf-8">
	  <meta name="renderer" content="webkit">
	  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    
    <title>管理员登录</title>
    
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="../publicUtil/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet" />
	<link rel="stylesheet" href="../publicUtil/layui/css/layui.css"  media="all">
	<script src="../publicUtil/layui/layui.all.js"></script>
	<script src="${path}/publicUtil/layui/layui.js"></script>
    
     
	<script type="text/javascript" src="../publicUtil/jquery-3.2.1.min.js"></script>

	<style type="text/css">
			.col-050-center {
				width: 50%;
				min-width: 1200px;
				margin: 0 auto;
				height: 300px;
			}
			
			.form-div {
				width: 50%;
				margin: 0 auto;
				margin-top:20px;
				margin-left:30%;
			}
			
			.red {
				color: red;
			}
			
			.sp {
				margin-left:100px;
				margin-top:100px;
			}
			
			a {
				cursor: pointer;
				margin-left:10px;
			}
			
			.yzm {
				width:20%;
				margin-top:23px;
			}
			
			.inputsize {
				width:80%;
			}
			
			.yz {
				display: flex;
			}
			
			h1 {
				margin-bottom:10px;
			}
			
			.up {
				background-color: #393D49;
				height:100px;
				width:100%;
				color:#C0C5C5;
				font-size:42px;
				line-height: 100px;
				padding-left:15px;
			}
			
			.pink {
				background-color: red;
				height:3px;
				width:100%;
			}
			
			.btnsize {
				width:15%;
				margin-left:-15%;
			}
			
		</style>
		
		
		<script type="text/javascript">
		var maxTime = 0;
		function countDown(){
             if (maxTime == 0){
                 checkCode = "";
                 //$("#sendCheckCode").removeAttr("disabled");
                 $("#sendCheckCode").html("获取验证码"); 
                 maxTime = 60;
             }else{
                 //$("#sendCheckCode").attr("href","javascript:");
                 $("#sendCheckCode").html(maxTime+"秒后重新获取"); 
                 maxTime--;
                 setTimeout(countDown,1000);
             }
         }
		
		
		$(document).ready(function() {
		
			/* 邮箱发验证码 */
			
			$("#sendCheckCode").click(function() {
			
					if(maxTime > 0){
						layer.alert("请等待"+maxTime+"秒");
						return;
					}
			
					var email = $("#email").val();
					if (email == null || email == ""){
	                    layer.msg("请输入邮箱！！！");
	                    return;
                	} else {
	                	/* var index = layer.open({
		                    type:3,
		                    content:"邮件发送中..."
		                }); */
                		$.ajax({
							url:"${path}/admin/sendCode",
							type:"POST",
							async: true,
							data:{"email": email},
							dataType: "json",
							success:function(data) {
								//alert(data.msg);
								if(data.msg == "邮箱有误") {
									//$("#errormsg").html(data.msg);
									layer.msg(data.msg);
									return false;
								}else if(data.msg == "发送成功") {
									layer.msg("已发送");
									maxTime=60;
									countDown();
								} else {
									layer.alert("获取失败，请重新获取");
								}
								
							},
						});
                	}
			
		            
					
		});
			
		
			$('#login').click(function() {
				var checkCode = $("#checkCode").val();
				var email = $("#email").val();
				if (email == null || email == ""){
                    layer.msg("请输入邮箱！！！");
                    return false;
               	} else if(checkCode == null || checkCode == "") {
              		layer.msg("请输入验证码！！！");
                    return false;
               	} else {
               		//alert(checkCode);
               		$.ajax({
                        url:"${path}/admin/checkCode",
                        type:"POST",
                        dataType:"json",
                        data:{"code": checkCode},
                        success:function (data) {
                        	//alert(data.msg);
                            if(data.msg == "验证码正确") {
	                            layer.msg("登录成功",function () {
	                            	window.location.href = "${path}/admin/showAdminIndex";
	                            });
                            } else {
                                layer.alert("验证码有误,登录失败");
                            }
                        }
                    });
               	}
                return false;
			});
			
			
		});	
		
		</script>

  </head>
  
  <body>
  
  	<div class="up">标题</div>
  	<div class="pink"></div>
  	
    	<div class="col-050-center">
    	
			<div class="form-div">
				<h1>管理员登录</h1>
				<form id="loginform" action="${path}/admin/showAdminIndex">
				
					<div class="input-group input-group-lg inputsize">
						<span class="input-group-addon" id="basic-addon1">
							<span class="glyphicon glyphicon-envelope"></span>
						</span>
						<input name="email" type="email" class="form-control" id="email" placeholder="请输入邮箱" aria-describedby="basic-addon1">
					</div>
					<span class="red">&nbsp;</span>
					
					<div class="yz">
						<div class="input-group input-group-lg inputsize">
							<span class="input-group-addon" id="basic-addon1">
								<span class="glyphicon glyphicon-saved"></span>
							</span>
							<input name="validate" id="checkCode" class="form-control" placeholder="请输入验证码" aria-describedby="basic-addon1">
							
						</div>
						<div class="yzm" id="sendCheckCode"><a>获取验证码</a></div>
					</div>
					
					<h3><span class="red" id="errormsg">&nbsp;${errormessage}</span></h3>
					<%-- <h2 style="margin-left: 200px;"><span id="info" style="color:red;">${errormessage}</span></h2><br /> --%>

					<center>
						<button type="submit" id="login" class="btn btn-primary btnsize">登录</button>
					</center>
				</form>
			</div>

		</div>
    
    
    
    
  </body>
</html>


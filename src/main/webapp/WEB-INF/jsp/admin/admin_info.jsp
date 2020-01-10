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
 
    <title>个人中心</title>
    
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	

	<style type="text/css">
		.layui-btn {
			margin-left:45%;
		}
	</style>
	
	<script type="text/javascript">
		$(document).ready(function() {
			  
			layui.use('layer', function(){
				var layer = layui.layer;
				$("#update").click(function() {
		  			layer.open({
				        type: 1
				        ,title: false //不显示标题栏
				        ,closeBtn: false
				        ,area: '500px;'//["width","height"]
				        ,shade: 0.8
				        ,btn: ['修改', '退出']
				        ,content:'<table class="layui-table"><tr align="center"><td>姓名:</td><td><input id="inpName" value="${sessionScope.admin.aname}"/></td></tr><tr align="center"><td>邮箱:</td><td><input id="inpEmail" value="${sessionScope.admin.aemail}"/></td></tr></table>'
				        ,success: function(layero){
				          var btn = layero.find('.layui-layer-btn');
				          /* btn.find('.layui-layer-btn0').attr({
				            href: '${path}/admin/updateAdminInfo'
				          }); */
				          updateBtn = btn.find('.layui-layer-btn0');
				          updateBtn.click(function() {
				          	var aname = $("#inpName").val();
				          	var aemail = $("#inpEmail").val();
				          	//alert(aname);
				          	var reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
				          	if (reg.test(aemail)) {
								$.post(
									"${path}/admin/updateAdminInfo",
									{"aname":aname,"aemail":aemail},
									function(data){
										//alert(data);
										if(data.msg == "修改成功") {
											layer.msg("信息修改成功！");
											$("#name").text(aname);
											$("#name").text(aemail);
											
										} else {
											layer.msg("信息修改失败！");
										}
									},
									"json"
								);
								
							} else {
								layer.msg("邮箱格式不正确");
							}
				          	
				          	
				          });
				          
				          
				        }
				      });
					
		  		}); 
					
			});
	  
	  
	  

	});
	</script>

  </head>
  
  <body>
  		
<!--   
    	<table>
    		<tr align="center">
	       			<th>编号</th>
	       			<th>姓名</th>
	       			<th>email</th>
	       			<th>操作</th>
	       	</tr>
	       	<tr align="center">
	       			<td>1</td>
	       			<td>哈哈</td>
	       			<td>1283182@qq.com</td>
	       			<td><button type="button" class="layui-btn">编辑</button></td>
	       	</tr>
    	</table>
    	 -->
    	 
    	<table class="layui-table">
    		<tr align="center">
	       			<td>编号</td>
	       			<td>${sessionScope.admin.aid}</td>
	       	</tr>
	       	<tr align="center">
	       			<td>姓名</td>
	       			<td id="name">${sessionScope.admin.aname}</td>
	       	</tr>
	       	<tr align="center">
	       		<td>email</td>
	       		<td id="email">${sessionScope.admin.aemail}</td>
	       	</tr>
    	</table>
    	<button type="button" class="layui-btn" data-method="notice" id="update">编辑</button>
  </body>
</html>

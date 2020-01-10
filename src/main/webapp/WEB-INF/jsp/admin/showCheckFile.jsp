<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
    <title>视频审核</title>
    
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	
	

	<style type="text/css">
		
	</style>
	
	<script type="text/javascript">
		$(document).ready(function() {
		
			layui.use(['layer','laypage'], function(){
				var layer = layui.layer,
				laypage = layui.laypage;
				
				//视频播放
				$(".play").click(function() {
					//window.location.href="${path}/admin/showPlay";
					//window.open("${path}/check/showPlay");
					$tr = $(this).parents("tr");
					//视频编号
					var vid = $tr.find("#vid").val();
					window.open("${path}/check/showPlay?vid="+vid);
				});
				
				//视频驳回
				$(".reject").click(function() {
					$tr = $(this).parents("tr");
					//上传者
					var uid = $tr.find("#uid").val();
					//视频编号
					var vid = $tr.find("#vid").val();
					//alert(vid);
					
					layer.open({
						type: 1
				        ,title: false
				        ,offset: 'auto'
				        ,area: ['300px', '280px']
				        ,shade: 0.8
				        ,id: 'reject'
				        ,btnAlign: 'c'
				        ,content: '<textarea class="layui-textarea" style="width:280px;height:200px;margin-top:5px;margin-left:10px;margin-right:5px;"></textarea>'
				        ,btn: '发送'
						,success: function(layero){
							var btn = layero.find('.layui-layer-btn');
							btn.click(function() {
								//视频驳回原因
								var rejectmsg = layero.find('.layui-textarea').val();
								//alert(rejectmsg);
								$.post(
									"${path}/check/rejectVideo",
									{"uid":uid,"vid":vid,"rejectmsg":rejectmsg},
									function(data){
										$tr.remove();
										layer.msg("操作成功！");
										$("#checkDiv").load("${path}/check/showCheckFile");
									},
									"json"
								);
							});
						}
					});
					
				});
				
				//视频通过
				$(".pass").click(function() {
					$tr = $(this).parents("tr");
					//上传者
					var uid = $tr.find("#uid").val();
					//视频编号
					var vid = $tr.find("#vid").val();
					
					layer.open({
						type: 1
				        ,title: false //不显示标题栏
				        ,closeBtn: false
				        ,area: '300px;'
				        ,shade: 0.8
				        ,id: 'pass' //设定一个id，防止重复弹出
				        ,btn: ['确认', '退出']
				        ,btnAlign: 'c'
				        ,moveType: 1 //拖拽模式，0或者1
				        ,content: '<div style="margin-left:3px;margin-top:3px;">是否确认通过该视频？</div>'
				        ,success: function(layero){
				        	var btn = layero.find('.layui-layer-btn');
				          	var passBtn = btn.find('.layui-layer-btn0');
				          	passBtn.click(function() {
					          	$.post(
									"${path}/check/passVideo",
									{"vid":vid},
									function(data){
										$tr.remove();
										layer.msg("操作成功！");
										$("#checkDiv").load("${path}/check/showCheckFile");
									},
									"json"
								);
							});
				        }
					});
				});
				
			
			});
			
		
		});
	</script>

  </head>
  
  <body>
  	<div id="checkDiv">
	    <table class="layui-table">
	    	  <thead>
	       		<tr align="center">
	       			<td>编号</td>
	       			<td>文件名</td>
	       			<td>上传者</td>
	       			<td>类别</td>
	       			<td>封面图</td>
	       			<td>文件大小</td>
	       			<td>操作</td>
	       		</tr>
	       	  </thead>
	       	  <tbody>
	       	  <c:forEach items="${checkFiles}" begin="${pageBean.startIndex}" end="${pageBean.endIndex}" var="checkfile" varStatus="statu">
	       	  	<tr align="center">
	       	  		<input id="vid" type="hidden" value="${checkfile.vid}"/>
	       	  		<input id="uid" type="hidden" value="${checkfile.vuid}"/>
	       			<td>${statu.index+1}</td>
	       			<td id="vname">${checkfile.vname}</td>
	       			<td>${checkfile.vnull3}</td>
	       			<td>${checkfile.vcid}</td>
	       			<td><img width="80px" height="80px" src="http://localhost:8082//fileserver/${checkfile.vphoto}" alt="暂无预览"/></td>
	       			<td>${checkfile.vsize}</td>
	       			<td>
	       				<div class="layui-btn-group">
						    <button type="button" class="layui-btn play">播放</button>
						    <button type="button" class="layui-btn reject">驳回</button>
						    <button type="button" class="layui-btn pass">通过</button>
						</div>
	       			</td>
	       		</tr>
	       	  </c:forEach>
	       	</tbody>
	       </table>
	     </div>
  </body>
</html>

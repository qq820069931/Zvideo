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
    <title>电影下架</title>
    
	
	
	<script type="text/javascript">
		$(document).ready(function() {
			layui.use(['layer','laypage'], function(){
				var $ = layui.jquery, 
				layer = layui.layer
				,laypage = layui.laypage;
				
				$(".under").on("click",function() {
					$tr = $(this).parents("tr");
					//alert($tr[0]);
					
					var movieId = $tr.find("#movieId").text();
					//alert(movieId);
					
					layer.open({
						type: 1
				        ,title: false //不显示标题栏
				        ,closeBtn: false
				        ,area: '300px;'
				        ,shade: 0.8
				        ,id: 'under' //设定一个id，防止重复弹出
				        ,btn: ['确认', '退出']
				        ,btnAlign: 'c'
				        ,moveType: 1 //拖拽模式，0或者1
				        ,content: '<div style="margin-left:3px;margin-top:3px;">确定要将该电影下架吗？</div>'
				        ,success: function(layero){
				          var btn = layero.find('.layui-layer-btn');
				          var inderBtn = btn.find('.layui-layer-btn0');
				          inderBtn.click(function() {
						         $.post(
									"${path}/movie/underMovie",
									{"movieId":movieId},
									function(data){
										//console.log(data);
										layer.msg("下架成功");
										$tr.remove();
										$("#checkDiv").load("${path}/movie/showUnderMovie");
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

  
    <table class="layui-table">
    	<thead>
    		<tr align="center">
		        	<td>编号</td>
			        <td>文件名</td>
			        <td>简介</td>
			        <td>类型</td>
			        <td>地区</td>
			        <td>操作</td>
		     </tr>
    	</thead>
    	<tbody>
    		<c:forEach items="${movies}" begin="${pageBean.startIndex}" end="${pageBean.endIndex}" var="movie" varStatus="statu">
    			<tr align="center">
    				
	       			<td id="movieId">${movie.vid}</td>
	       			<td>${movie.vname}</td>
	       			<td>${movie.vcontent}</td>
	       			<td>${movie.vtag2}</td>
	       			<td>${movie.vtag3}</td>
					<td>
						<button class="layui-btn layui-btn-sm under">下架</button>
					</td>
		       	</tr>
    		</c:forEach>
    	</tbody>
    </table>
  </body>
</html>

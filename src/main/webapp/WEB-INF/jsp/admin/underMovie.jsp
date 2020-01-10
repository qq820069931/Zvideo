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
    
	<link href="../publicUtil/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet" />
	
	
   
	<script type="text/javascript">
		$(document).ready(function() {
		
			$("#checkDiv").load("${path}/movie/showUnderMovie");
		
			layui.use(['layer','laypage'], function(){
				var $ = layui.jquery, 
				layer = layui.layer
				,laypage = layui.laypage;
				
				//调用分页
				  laypage.render({
				    elem: 'demo1'
				    ,count: "${pageBean.totalCount}"
				    ,limit:"${pageBean.pageCount}"
				    ,jump: function(obj){
				   	  //具体页码
				      //console.log(obj.curr);
				      $.post(
							"${path}/movie/pageRefresh?page="+obj.curr,
							{},
							function(data){
								$("#checkDiv").load("${path}/movie/showMovies");
							},
							"json"
						);
				      
				    }
				  });
				
			
			});
			
		});
		
			function selectname(){
				 var moviename = $("#mname").val();
					//alert(moviename);
					$.post(
						"${path}/movie/selectMovie",
						{"mname":moviename},
						function(data){
							$("#checkDiv").load("${path}/movie/showMovies");
							$("#mname").val("");
							//alert(data.count);
							layui.use(['layer','laypage'], function(){
								var $ = layui.jquery, 
								layer = layui.layer
								,laypage = layui.laypage;
								
								//调用分页
								  laypage.render({
								    elem: 'demo1'
								    ,count: data.count
								    ,limit:"${pageBean.pageCount}"
								    ,jump: function(obj){
								   	  //具体页码
								      //console.log(obj.curr);
								      $.post(
											"${path}/movie/pageRefresh?page="+obj.curr,
											{},
											function(data){
												$("#checkDiv").load("${path}/movie/showMovies");
											},
											"json"
										);
								    }
								  });
							});
							
							
						},
						"json"
					);
					return false;
			}
	</script>

  </head>
  
  <body>
          <form class="navbar-form navbar-right" onsubmit="return selectname()">
            <input id="mname" type="text" class="form-control" placeholder="请输入影片名">
            <button class="layui-btn layui-btn-sm" id="select">查询</button>
          </form>
  <div id="checkDiv"></div>
    	<center>
       		<div id="demo1"></div>
	    </center>
  </body>
</html>

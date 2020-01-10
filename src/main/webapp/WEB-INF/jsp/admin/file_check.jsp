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
		
		$("#checkDiv").load("${path}/check/showCheckFile");
		
			layui.use(['layer','laypage'], function(){
				var layer = layui.layer,
				laypage = layui.laypage;
				
				  //调用分页
				  laypage.render({
				    elem: 'demo1'
				    ,count: "${pageBean.totalCount}"
				    ,limit:"${pageBean.pageCount}"
				    ,jump: function(obj){
				   	  //具体页码
				      //console.log(obj.curr);
				      $.post(
							"${path}/check/pageRefresh?page="+obj.curr,
							{},
							function(data){
								$("#checkDiv").load("${path}/check/showCheckFile");
							},
							"json"
						);
				      
				    }
				  });
				
			
			});
			
		
		});
	</script>

  </head>
  
  <body>
  	<div id="checkDiv"></div>
	     
	    <center>
       		<div id="demo1"></div>
	    </center>
  </body>
</html>

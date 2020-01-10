<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	request.setAttribute("path", path);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">
  <head>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>管理员主页</title>
    
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	
	<link rel="stylesheet" href="../publicUtil/layui/css/layui.css"  media="all">
	
	<script src="../publicUtil/layui/layui.all.js" type="text/javascript" charset="utf-8"></script>
	
   
    <script type="text/javascript" src="../publicUtil/jquery-3.2.1.min.js"></script>

	<style type="text/css">

		.active {
			border-bottom:3px solid red;
		}
		
		.col-050-center {
			width: 50%;
			min-width: 1200px;
			margin: 0 auto;
		}
		
		.maindiv {
			width: 50%;
			margin-top: 50px;
		}
		
		.layui-layout-admin {
			margin-bottom: 20px;
		}
		
		a {
			cursor: pointer;
		}
		
	</style>
	
	  	<script type="text/javascript">
		
		$(document).ready(function() {
		
		
			//alert("asdasdasd");
			//初始化
			$("#maindiv").load("${path}/admin/showFileUpload");
			 			
 			$("#publish").click(function() {
				$("#maindiv").load("${path}/admin/showFileUpload");
				$("#check").removeClass("layui-this");
				$("#info").removeClass("layui-this");
				$("#aname").removeClass("layui-this");
				$("#underMovie").removeClass("layui-this");
    			$(this).addClass("layui-this");
			});
			
			$("#check").click(function() {
				$("#maindiv").load("${path}/check/showFileCheck",{"curPage":1});
				$("#publish").removeClass("layui-this");
				$("#info").removeClass("layui-this");
				$("#aname").removeClass("layui-this");
				$("#underMovie").removeClass("layui-this");
    			$(this).addClass("layui-this");
			});
			
			$("#underMovie").click(function() {
				$("#maindiv").load("${path}/movie/showAllMovie",{"curPage":1});
				$("#publish").removeClass("layui-this");
				$("#info").removeClass("layui-this");
				$("#check").removeClass("layui-this");
				$("#aname").removeClass("layui-this");
    			$(this).addClass("layui-this");
			});
			
			$("#info").click(function() {
				$("#maindiv").load("${path}/admin/showAdminInfo");
				$("#publish").removeClass("layui-this");
				$("#check").removeClass("layui-this");
				$("#aname").removeClass("layui-this");
				$("#underMovie").removeClass("layui-this");
    			$(this).addClass("layui-this");
			}); 
			
			$("#aname").click(function() {
				$(this).removeClass("layui-this");
				$("#maindiv").load("${path}/admin/showAdminInfo");
				$("#publish").removeClass("layui-this");
				$("#check").removeClass("layui-this");
    			$("#info").addClass("layui-this");
    			
			}); 
			
 			$.post(
				"${path}/check/showFileCheckCount",
				{},
				function(data){
					//alert(data);
					$(".layui-badge").html(data);
				},
				"json"
			);
			
			
		});
	
	</script>
	
  </head>
  
  <body class="layui-layout-body">
	
	

	<div class="layui-layout layui-layout-admin">
	  <div class="layui-header">
	    <div class="layui-logo">标题</div>
	    <!-- 头部区域 -->
	    <ul class="layui-nav layui-layout-left">
	      <li class="layui-nav-item layui-this" id="publish"><a>视频发布</a></li>
	      <li class="layui-nav-item" id="check"><a>待审核<span class="layui-badge"></span></a></li>
	      <li class="layui-nav-item" id="underMovie"><a>电影页</a></li>
	      <li class="layui-nav-item" id="info"><a>个人中心</a></li>
	     <!-- 导航有信息显示的红点  <span class="layui-badge-dot"></span> -->
	    </ul>
	    <ul class="layui-nav layui-layout-right">
	      <li class="layui-nav-item" id="aname">
	        <a>
	          <img src="${path}/img/admin_photo.jpg" class="layui-nav-img">
	          ${sessionScope.admin.aname}
	        </a>
	      </li>
	      <li class="layui-nav-item"><a href="${path}/admin/showAdminLogin">退出</a></li>
	    </ul>
	  </div>
	</div>
	
	<div class="col-050-center">
		<div id="maindiv"></div>
	</div>
		
  </body>
</html>

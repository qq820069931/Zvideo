<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% 
	String path = request.getContextPath();
	request.setAttribute("path", path);

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <meta charset="utf-8" />
		<title>个人主页</title>
		<link href="../css/zjj/index.css" rel="stylesheet" type="text/css"/>
		<link href="../css/fxz/css.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <script type="text/javascript" src="../publicUtil/jquery-3.2.1.min.js"></script>
        <script src="../publicUtil/bootstrap/js/bootstrap.min.js" charset="UTF-8"></script>
        <script src="../publicUtil/layui/layui.js"></script>
       <link rel="stylesheet" href="../publicUtil/layui/css/layui.css" media="all">
  <style>
    body{margin: 10px;}
    .demo-carousel{height: 200px; line-height: 200px; text-align: center;}
  </style>

  </head>
  
  <body class="body">

		<div class="layui-header">
			<!--
   						作者：offline
   						时间：2019-07-12
   						描述：导入头部
   					-->
			<div class="div-nav width-8e folat-l">
				<ul class="layui-nav layui-bg-blue" lay-filter="daohang">
						<li class="layui-nav-item layui-this">
							<a class="" href="${path }/index/info.action?uid=${uid}">首页</a>
						</li>
						<li class="layui-nav-item">
							<a class="" href="${path }/video/infoMovie.action?uid=${uid}">电影</a>
						</li>
						<li class="layui-nav-item">
							<a class="" href="${path }/getvideo/getvideo.action?uid=${uid}&cid=C102">科普</a>
						</li>
						<li class="layui-nav-item">
							<a class="" href="${path }/getvideo/getvideo.action?uid=${uid}&cid=C103">游戏</a>
						</li>
						<li class="layui-nav-item">
							<a class="" href="${path }/getvideo/getvideo.action?uid=${uid}&cid=C104">鬼畜</a>
						</li>
						<!--搜索框-->
						<div class="folat-r" id="mydiv">
							<!-- 输入框 -->
   							<input class="search" placeholder="搜索一下.." type="text" size="50" id="keyword" onkeyup="getMoreContents()" onblur="keywordBlur()" onfocus="getMoreContents()"/>
   							<button class="btn" lay-submit lay-filter="formDemo">
        						<i class="layui-icon" style="font-size: 20px; color: #ccc; border: none;">&#xe615;</i>
        					</button>
   							<!-- 下面是内容展示区域 -->
   							<div id="popDiv">
   								<table id="content-table" bgcolor="#FFFAFA" border="0" cellspacing="0" cellpadding="0">
   									<tbody id="content_table_body">
   									<!-- 动态查询出来的数据显示在这里 -->
   				
   									</tbody>
   								</table>
   							</div>
						</div>
					</ul>

			</div>
			<div class="div-nav width-2e folat-l">
				<ul class="layui-nav layui-bg-blue">
					<li class="layui-nav-item">
						<a href=""><img src="${user.uphoto }" class="layui-nav-img">我</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">退了</a>
							</dd>
						</dl>
					</li>
				</ul>
			</div>
		</div>
		
		<div class="layui-tab layui-tab-brief" lay-filter="demo">

			<div class="layui-tab-content">

			</div>
		</div>

		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 10px;">
			<legend>${user.uname}的小树洞</legend>
		</fieldset>

		<div>
			<div class="width-2e folat-l">
				<div class="layadmin-homepage-panel layadmin-homepage-shadow">
					<div class="layui-card text-center">
						<div class="layui-card-body">
							<div class="layadmin-homepage-pad-ver">
								<img class="layadmin-homepage-pad-img" src="http://localhost:8082//fileserver/${user.uphoto}" width="96" height="96">
							</div>
							<h4 class="layadmin-homepage-font">${user.uname}</h4>
							<p class="layadmin-homepage-min-font">${user.usex}</p>

						</div>
					</div>
					<p class="layadmin-homepage-about">
						关于我
					</p>
					<ul class="layadmin-homepage-list-group">
						<li class="list-group-item"><i class="layui-icon layui-icon-location"></i>${user.unname}</li>
						
					</ul>
					<div class="layadmin-homepage-pad-hor">
						<mdall>${user.uemail}</mdall>
					</div>
					
					<p class="layadmin-homepage-about">
						个人签名
					</p>
					<div class="layadmin-homepage-pad-hor">
						<mdall> ${user.usatement}</mdall>
					</div>
					<button type="button" id="huiyuan"  class="layui-btn layui-btn-normal layui-btn-fluid">成为会员</button>
					
				</div>
			</div>
			<div class="width-8e folat-l">
				<div class="layui-tab" lay-filter="test">
					<ul class="layui-tab-title">
						<li class="layui-this">我的作品</li>
						<li>历史观看</li>
						<li>我的收藏</li>
						<li>我的关注</li>
						<li>消息通知</li>
						<li>上传视频</li>
						<li>修改个人资料</li>

					</ul>
					<div class="layui-tab-content">
						<div class="layui-tab-item layui-show">
						<jsp:include page="myVideo.jsp"></jsp:include> 
							
						</div>
						<div class="layui-tab-item">
						<jsp:include page="history.jsp"></jsp:include> 
							
						</div>
						<div class="layui-tab-item">
						<jsp:include page="myCollect.jsp"></jsp:include>
							
						</div>
						<div class="layui-tab-item">
						<jsp:include page="myAttention.jsp"></jsp:include> 
							
						</div>
						<div class="layui-tab-item">
							<jsp:include page="inform.jsp"></jsp:include>
						</div>
						
						<!--
                        	作者：offline
                        	时间：2019-07-12
                        	描述：上传
                        -->
						<div class="layui-tab-item">
							<jsp:include page="userUpload.jsp"></jsp:include>
						</div>
						<div class="layui-tab-item layui-show">
						<jsp:include page="uploaduser.jsp"></jsp:include> 
							
						</div>
					</div>
				</div>
			</div>
		</div>

		<script>
		$(function(){
			if(${user.upower} == 1){
				$("#huiyuan").text("会员用户");
				$("#huiyuan").css("cursor", "not-allowed");
			}
		});
		
			layui.config({
				version: '1560414887155' //为了更新 js 缓存，可忽略
			});

			layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function() {
				var 
					upload = layui.upload //上传
					
					,
					slider = layui.slider //滑块
					,
				    element = layui.element;
				

				slider.render({
					elem: '#sliderDemo',
					input: true //输入框
				});

				
			});
			$("#huiyuan").click (function() {
				$.ajax({
     					type:'post',
     					url:'${path }/common/huiyuan.action',
    					data:{
    						uid:${user.uid}
    					},
    					success: function(data) {
    						alert("成为会员!");
    						//alert("${sessionScope.videoList}");
    						$("#huiyuan").text("会员用户");
                			$("#huiyuan").css("cursor", "not-allowed");
            			}
					});
			});
			
		</script>
	</body>
</html>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
request.setAttribute("path", path);
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="../css/fxz/css.css" />
		<link href="../publicUtil/bootstrap/css/bootstrap.css" rel="stylesheet">
		<link href="../publicUtil/layui/css/layui.css" rel="stylesheet" media="all">
		<script src="../publicUtil/layui/layui.js"></script>
		<script type="text/javascript" src="../publicUtil/jquery-3.2.1.min.js"></script>
		
	</head>

	<body class="col-xs-12 bgc-white">
		<div class="col-xs-10" id="clear-float">
			<div class="head">
				<!-- 导航栏 -->
				<jsp:include page="head.jsp"></jsp:include>
				<div style="height: 5px; clear:both;"></div>

			</div>

			<div class="body" style="height: 1500px;">
				<div class="width-8e folat-l height-10e">

					<div class="layui-tab">
						<ul class="layui-tab-title">
							<li class="layui-this tiger">全部</li> <input class="uphoto" style="display:none" type="text" value="0">
							<li class="tiger">${tiger[0]}</li> <input class="uphoto" style="display:none" type="text" value="1">
							<li class="tiger">${tiger[1]}</li> <input class="uphoto" style="display:none" type="text" value="2">
							<li class="tiger">${tiger[2]}</li> <input class="uphoto" style="display:none" type="text" value="3">
						</ul>
						 <div class="layui-tab-content">
							<div class=" layui-show loadDiv">
							<jsp:include   page="pageVide.jsp" flush="true"/>
							</div>
							
							
							<div class="layui-tab-item">
								<div class="list-group row">
							
									
									
									
									
									
									
								</div>
							</div>
						</div>
					</div>
					<!--
                    	作者：offline
                    	时间：2019-06-28
                    	描述：分页
                    -->
					<div class="width-5e margin-0-auto" id="test1"></div>
					<div style="height: 100px; clear:both;"></div>
				</div>
				<div class="width-2e folat-l height-10e">
					<h1 class="margin-left-15e margin-top-03e">今日排行</h1>
					<div class="inner margin-left-1e">
						<ul class="rank_list">
						<c:forEach var="videoTop"   items="${videoTopList }" end="2" varStatus="xh">
							<li class="top3" id="topimg">
								<em>${xh.count}</em>
								<a class="" href="${path }/video/video.action?vid=${videoTop.vid }">
									<table>
										<tbody>
											<tr>
												<td class="">
													<img src="${videoTop.vphoto }" width="80px" height="60px">
												</td>
												<td>
													<h4 class="font-family-a font-weight-900">${videoTop.vname }</h4>
													<span>
 														${videoTop.vtag1}--${videoTop.vtag2}--${videoTop.vtag3}
 													</span>
												</td>
											</tr>
										</tbody>
									</table>
								</a>
							</li>
						</c:forEach>
							<c:forEach var="videoTop"   items="${videoTopList }" begin="3" end="14" varStatus="xh">
									<li id="topimg">
								<em>${xh.count+3}</em>
								<a class="" href="${path }/video/video.action?vid=${videoTop.vid }">
									<table>
										<tbody>
											<tr>
												<td class="">
													<img src="${videoTop.vphoto }" width="80px" height="60px">
												</td>
												<td>
													<h4 class="font-family-a font-weight-900">${videoTop.vname }</h4>
													<span>
 														${videoTop.vtag1}--${videoTop.vtag2}--${videoTop.vtag3}
 													</span>
												</td>
											</tr>
										</tbody>
									</table>
								</a>
							</li>
								</c:forEach>
							
							
						</ul>

					</div>
				</div>
			</div>
		</div>
	</body>

	<script>
		//注意：导航 依赖 element 模块，否则无法进行功能性操作
		layui.use('element', function() {
			var element = layui.element;

			//一些事件监听
			element.on('nav(daohang)', function(data) {
				console.log(data);
				element.tabChange('daohang', 'project');
			});

			//重新渲染导航
			element.render('nav');
		});


		//分页
		layui.use('laypage', function() {
			var allager=${videocSize};
			
			 laypage = layui.laypage;

			//执行一个laypage实例
			laypage.render({
				elem: 'test1' //注意，这里的 test1 是 ID，不用加 # 号
				, limit: 16    //每页个数
	 		    ,curr: 1  //默认页数
				,count: allager //数据总数，从服务端得到
				  ,jump: function(obj)
                   
                   {	          //回调函数
					
                   //tt 当前选择的时什么类型
					   $.ajax({
			 		          type: "POST",
			 		          url: "${path}/getvideo/runPage",
			 		          data: {"page":obj.curr,   
			 		          },
			 		          dataType: "text",
			 		          success: function(data){
			 		        	  obj.curr=data;
			 		        	
			 		        	  $(".loadDiv").load("${path}/getvideo/Page");	 
			 		        	 
				 		        	
			 		        	  
			 		        	}   
			 		      }); 
					  
                   }
				
			});
		});
		
		
		$(".tiger").click(function(){
			var num= $(this).next().val();
			var tiger= $(this).html();
			
			   $.ajax({
	 		          type: "POST",
	 		          url: "${path}/getvideo/tiger",
	 		          data: {
	 		        	     "tiger":tiger,
	 		        	     "num":num
	 		          },
	 		          dataType: "text",
	 		          success: function(data){
	 		        	
	 		        	  $(".loadDiv").load("${path}/getvideo/Page");	
	 		        	  
	 		        	}   
	 		      }); 
			  
 	    });
		
	</script>

</html>
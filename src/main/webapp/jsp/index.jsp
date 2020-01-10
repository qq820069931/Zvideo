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
		<meta charset="utf-8" />
		<title></title>
		<link rel="stylesheet" href="../css/fxz/css.css" />
		<link href="../publicUtil/bootstrap/css/bootstrap.css" rel="stylesheet">
		<link href="../publicUtil/layui/css/layui.css" rel="stylesheet" media="all">
		<script src="../publicUtil/layui/layui.js"></script>
		
	</head>
	
	<body class="col-xs-12 bgc-white">
		
		<div class="col-xs-10" id="clear-float">
			<div class="head">
				<!--描述：导航栏-->
				<jsp:include page="../WEB-INF/jsp/fxz/head.jsp"></jsp:include>
				
				<div style="height: 5px; clear:both;"></div>
				<!--描述：轮播图、推荐位-->
				<div class="height-40v">
					<div class="folat-l width-6e">
						<div class="layui-carousel" id="test1">
							<div carousel-item>
								<div><img src="${path}/img/2.jpg" /></div>
								<div><img src="${path}/img/4.jpg" /></div>
								<div><img src="${path}/img/2.jpg" /></div>
								<div><img src="${path}/img/4.jpg" /></div>
								<div><img src="${path}/img/2.jpg" /></div>
							</div>
						</div>
					</div>
					<div class="folat-l width-4e  height-10e">
						<div class="margin-top-01e height-33e">
							<c:forEach var="recommendVideo"   items="${newRecommendVideo }">
								<div class="folat-l width-5e margin-top-05e">
									<a class="list-group-item rgba-3 margin-left-1e margin-right-1e" href="${path }/video/video.action?vid=${recommendVideo.vid }">
										<table>
											<tbody>
												<tr>
													<td class="">
														<img src="http://localhost:8082//fileserver/${recommendVideo.vphoto }" width="100px" height="100px">
													</td>
													<td>
														&nbsp &nbsp &nbsp &nbsp
													</td>
													<td>
														<h4 class="font-family-a font-weight-900">${recommendVideo.vname }</h4>
														<span class="text-size-1e font-family-b">
 															${recommendVideo.vcontent }
 														</span>
													</td>
												</tr>
											</tbody>
										</table>
									</a>
								</div>
							</c:forEach>
							
					</div>
				</div>

			</div>

			<div class="height-50p">
					<h2 class="margin-left-1e margin-top-01e">电影</h2>
			</div>
			<div class="body">
				<div>
					<div class="width-10e border-1e" style="height: 460px;">
						<div class="folat-l">

							<div class="folat-l width-7e">
								<div class="list-group row">
								<c:forEach var="videoC101"   items="${vListC101 }" end="5">
									<a class="list-group-item col-xs-10 col-sm-5 rgba-3 margin-right-1e margin-left-2e margin-top-03e" href="${path }/video/video.action?vid=${videoC101.vid }">
										<table>
											<tbody>
												<tr>
													<td class="">
														<img src="http://localhost:8082//fileserver/${videoC101.vphoto }" width="100px" height="100px">
													</td>
													<td>
														&nbsp &nbsp &nbsp &nbsp
													</td>
													<td>
														<h4 class="font-family-a font-weight-900">${videoC101.vname }</h4>
														<span>
 														${videoC101.vcontent }
 														</span>
													</td>
												</tr>
											</tbody>
										</table>
									</a>
								</c:forEach>
									
									
								</div>
								<div>
									<a href="${path }/video/infoMovie.action" class="layui-btn layui-btn-normal folat-r margin-right-2e margin-top-04e">更多>>></a>
								</div>
							</div>
							<div class="folat-l width-3e">
							<h2 class="margin-left-1e margin-top-01e">今日电影排行</h2>
							<div class="inner">
							<ul class="rank_list">
								<c:forEach var="vListTopC101"   items="${vListTopC101 }" end="2" varStatus="xh">
									<li class="top3">
										<em>${xh.count}</em>
										<a href="${path }/video/video.action?vid=${vListTopC101.vid }">${vListTopC101.vname}</a>
										<span>${vListTopC101.vtag1}-${vListTopC101.vtag2}-${vListTopC101.vtag3}</span>
									</li>
								</c:forEach>
								<c:forEach var="vListTopC101"   items="${vListTopC101 }" begin="3" end="9" varStatus="xh">
									<li class="">
										<em>${xh.count+3}</em>
										<a href="${path }/video/video.action?vid=${vListTopC101.vid }">${vListTopC101.vname}</a>
										<span>${vListTopC101.vtag1}-${vListTopC101.vtag2}-${vListTopC101.vtag3}</span>
									</li>
								</c:forEach>
								</ul>

							</div>
							<div>
								<a href="${path }/video/infoMovie.action" class="layui-btn layui-btn-fluid layui-btn-normal">查看更多></a>
							</div>
</div>
						</div>
					</div>
				</div>

				<div class="height-50p">
					<h2 class="margin-left-1e margin-top-01e">科普</h2>
				</div>

				<div>
					<div class="width-10e border-1e" style="height: 460px;">
						<div class="folat-l">

							<div class="folat-l width-7e">
								
								<div class="list-group row">
									<c:forEach var="videoC102"   items="${vListC102 }" end="5">
									<a class="list-group-item col-xs-10 col-sm-5 rgba-3 margin-right-1e margin-left-2e margin-top-03e" href="${path }/video/video.action?vid=${videoC102.vid }">
										<table>
											<tbody>
												<tr>
													<td class="">
														<img src="http://localhost:8082//fileserver/${videoC102.vphoto }" width="100px" height="100px">
													</td>
													<td>
														&nbsp &nbsp &nbsp &nbsp
													</td>
													<td>
														<h4 class="font-family-a font-weight-900">${videoC102.vname }</h4>
														<span>
 														${videoC102.vcontent }
 														</span>
													</td>
												</tr>
											</tbody>
										</table>
									</a>
								</c:forEach>
								</div>
								<div>
									<a href="${path }/getvideo/getvideo.action?cid=C102" class="layui-btn layui-btn-normal folat-r margin-right-2e margin-top-04e">更多>>></a>
								</div>
							</div>
							<div class="folat-l width-3e">
							<h2 class="margin-left-1e margin-top-01e">今日排行</h2>
							<div class="inner">
								<ul class="rank_list">
									<c:forEach var="vListTopC102"   items="${vListTopC102 }" end="2" varStatus="xh">
									<li class="top3">
										<em>${xh.count}</em>
										<a href="${path }/video/video.action?vid=${vListTopC102.vid }">${vListTopC102.vname}</a>
										<span>${vListTopC102.vtag1}-${vListTopC102.vtag2}-${vListTopC102.vtag3}</span>
									</li>
								</c:forEach>
								<c:forEach var="vListTopC102"   items="${vListTopC102 }" begin="3" end="9" varStatus="xh">
									<li class="">
										<em>${xh.count+3}</em>
										<a href="${path }/video/video.action?vid=${vListTopC102.vid }">${vListTopC102.vname}</a>
										<span>${vListTopC102.vtag1}-${vListTopC102.vtag2}-${vListTopC102.vtag3}</span>
									</li>
								</c:forEach>
								</ul>

							</div>
							<div>
								<a href="${path }/getvideo/getvideo.action?cid=C102" class="layui-btn layui-btn-fluid layui-btn-normal">查看更多></a>
							</div>
</div>
						</div>
					</div>
				</div>

				<div class="height-50p">
					<h2 class="margin-left-1e margin-top-01e">游戏</h2>
				</div>

				<div>
					<div class="width-10e border-1e" style="height: 460px;">
						<div class="folat-l">

							<div class="folat-l width-7e">
								
								<div class="list-group row">
									<c:forEach var="videoC103"   items="${vListC103 }" end="5">
									<a class="list-group-item col-xs-10 col-sm-5 rgba-3 margin-right-1e margin-left-2e margin-top-03e" href="${path }/video/video.action?vid=${videoC103.vid }">
										<table>
											<tbody>
												<tr>
													<td class="">
														<img src="http://localhost:8082//fileserver/${videoC103.vphoto }" width="100px" height="100px">
													</td>
													<td>
														&nbsp &nbsp &nbsp &nbsp
													</td>
													<td>
														<h4 class="font-family-a font-weight-900">${videoC103.vname }</h4>
														<span>
 														${videoC103.vcontent }
 														</span>
													</td>
												</tr>
											</tbody>
										</table>
									</a>
								</c:forEach>
								</div>
								<div>
									<a href="${path }/getvideo/getvideo.action?cid=C103" class="layui-btn layui-btn-normal folat-r margin-right-2e margin-top-04e">更多>>></a>
								</div>
							</div>
							<div class="folat-l width-3e">
							<h2 class="margin-left-1e margin-top-01e">今日排行</h2>
							<div class="inner">
								<ul class="rank_list">
									<c:forEach var="vListTopC103"   items="${vListTopC103 }" end="2" varStatus="xh">
									<li class="top3">
										<em>${xh.count}</em>
										<a href="${path }/video/video.action?vid=${vListTopC103.vid }">${vListTopC103.vname}</a>
										<span>${vListTopC103.vtag1}-${vListTopC103.vtag2}-${vListTopC103.vtag3}</span>
									</li>
								</c:forEach>
								<c:forEach var="vListTopC103"   items="${vListTopC103 }" begin="3" end="9" varStatus="xh">
									<li class="">
										<em>${xh.count+3}</em>
										<a href="${path }/video/video.action?vid=${vListTopC103.vid }">${vListTopC103.vname}</a>
										<span>${vListTopC103.vtag1}-${vListTopC103.vtag2}-${vListTopC103.vtag3}</span>
									</li>
								</c:forEach>
								</ul>

							</div>
							<div>
								<a href="${path }/getvideo/getvideo.action?cid=C103" class="layui-btn layui-btn-fluid layui-btn-normal">查看更多></a>
							</div>
</div>
						</div>
					</div>
				</div>

				<div class="height-50p">
					<h2 class="margin-left-1e margin-top-01e">鬼畜</h2>
				</div>

				<div>
					<div class="width-10e border-1e" style="height: 460px;">
						<div class="folat-l">

							<div class="folat-l width-7e">
								
								<div class="list-group row">
									<c:forEach var="videoC104"   items="${vListC104 }" end="5">
									<a class="list-group-item col-xs-10 col-sm-5 rgba-3 margin-right-1e margin-left-2e margin-top-03e" href="${path }/video/video.action?vid=${videoC104.vid }">
										<table>
											<tbody>
												<tr>
													<td class="">
														<img src="http://localhost:8082//fileserver/${videoC104.vphoto }" width="100px" height="100px">
													</td>
													<td>
														&nbsp &nbsp &nbsp &nbsp
													</td>
													<td>
														<h4 class="font-family-a font-weight-900">${videoC104.vname }</h4>
														<span>
 														${videoC104.vcontent }
 														</span>
													</td>
												</tr>
											</tbody>
										</table>
									</a>
								</c:forEach>
								</div>
								<div>
									<a href="${path }/getvideo/getvideo.action?cid=C104" class="layui-btn layui-btn-normal folat-r margin-right-2e margin-top-04e">更多>>></a>
								</div>
							</div>
							<div class="folat-l width-3e">
							<h2 class="margin-left-1e margin-top-01e">今日排行</h2>
							<div class="inner">
								<ul class="rank_list">
									<c:forEach var="vListTopC104"   items="${vListTopC104 }" end="2" varStatus="xh">
									<li class="top3">
										<em>${xh.count}</em>
										<a href="${path }/video/video.action?vid=${vListTopC104.vid }">${vListTopC104.vname}</a>
										<span>${vListTopC104.vtag1}-${vListTopC104.vtag2}-${vListTopC104.vtag3}</span>
									</li>
								</c:forEach>
								<c:forEach var="vListTopC104"   items="${vListTopC104 }" begin="3" end="9" varStatus="xh">
									<li class="">
										<em>${xh.count+3}</em>
										<a href="${path }/video/video.action?vid=${vListTopC104.vid }">${vListTopC104.vname}</a>
										<span>${vListTopC104.vtag1}-${vListTopC104.vtag2}-${vListTopC104.vtag3}</span>
									</li>
								</c:forEach>
								</ul>

							</div>
							<div>
								<a href="${path }/getvideo/getvideo.action?cid=C104" class="layui-btn layui-btn-fluid layui-btn-normal">查看更多></a>
							</div>
</div>
						</div>
					</div>
				</div>
			</div>
		</div>

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

			//轮播图
			layui.use('carousel', function() {
				var carousel = layui.carousel;
				//建造实例
				carousel.render({
					elem: '#test1',
					height: '40vh',
					width: '100%', //设置容器宽度

					arrow: 'always' //始终显示箭头
					//,anim: 'updown' //切换动画方式
				});
			});

			
			
		</script>
	</body>

</html>
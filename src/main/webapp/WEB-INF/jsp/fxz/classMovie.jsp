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
				<div class="width-10e height-300p navphoto">
					<h1>电影</h1>
					<h2 class="selecttime">2019</h2>
					<h2 class="selectadd">动作</h2>
					<h2 class="selectclass">美国</h2>
				</div>
			</div>
			<div style="height: 5px; clear:both;"></div>

			<div class="body" style="height: 1500px;">
				<div class="width-8e folat-l height-10e">
					<div>
						<div class="selectNumberScreen">

							<div id="selectList" class="screenBox screenBackground">

								<dl class="listIndex folat-l width-10e" attr="terminal_brand_s">

									<dd class="folat-l">
										<span>时间：</span>
										<a href="javascript:void(0)" values="1" attrval="更早">更早</a>
										<a href="javascript:void(0)" values="1" attrval="2002">2002</a>
										<a href="javascript:void(0)" values="1" attrval="2003">2003</a>
										<a href="javascript:void(0)" values="1" attrval="2004">2004</a>
										<a href="javascript:void(0)" values="1" attrval="2005">2005</a>
										<a href="javascript:void(0)" values="1" attrval="2006">2006</a>
										<a href="javascript:void(0)" values="1" attrval="2007">2007</a>
										<a href="javascript:void(0)" values="1" attrval="2008">2008</a>
										<a href="javascript:void(0)" values="1" attrval="2009">2009</a>
										<a href="javascript:void(0)" values="1" attrval="2010">2010</a>
										<a href="javascript:void(0)" values="1" attrval="2011">2011</a>
										<a href="javascript:void(0)" values="1" attrval="2012">2012</a>
										<a href="javascript:void(0)" values="1" attrval="2013">2013</a>
										<a href="javascript:void(0)" values="1" attrval="2014">2014</a>
										<a href="javascript:void(0)" values="1" attrval="2015">2015</a>
										<a href="javascript:void(0)" values="1" attrval="2016">2016</a>
										<a href="javascript:void(0)" values="1" attrval="2017">2017</a>
										<a href="javascript:void(0)" values="1" attrval="2018">2018</a>
										<a href="javascript:void(0)" values="1" attrval="2019">2019</a>
									</dd>
								</dl>

								<dl class=" listIndex folat-l width-10e" attr="terminal_os_s">

									<dd class="folat-l">
										<span>类型：</span>
										<a href="javascript:void(0)" values="2" attrval="剧情">剧情</a>
										<a href="javascript:void(0)" values="2" attrval="喜剧">喜剧</a>
										<a href="javascript:void(0)" values="2" attrval="动作">动作</a>
										<a href="javascript:void(0)" values="2" attrval="爱情">爱情</a>
										<a href="javascript:void(0)" values="2" attrval="惊悚">惊悚</a>
										<a href="javascript:void(0)" values="2" attrval="犯罪">犯罪</a>
										<a href="javascript:void(0)" values="2" attrval="悬疑">悬疑</a>
										<a href="javascript:void(0)" values="2" attrval="战争">战争</a>
										<a href="javascript:void(0)" values="2" attrval="科幻">科幻</a>
										<a href="javascript:void(0)" values="2" attrval="动画">动画</a>
										<a href="javascript:void(0)" values="2" attrval="恐怖">恐怖</a>
										<a href="javascript:void(0)" values="2" attrval="冒险">冒险</a>
										<a href="javascript:void(0)" values="2" attrval="历史">历史</a>
										<a href="javascript:void(0)" values="2" attrval="纪录">纪录</a>
										<a href="javascript:void(0)" values="2" attrval="家庭">家庭</a>
										<a href="javascript:void(0)" values="2" attrval="传记">传记</a>
									</dd>
								</dl>

								<dl class=" listIndex folat-l width-10e" attr="terminal_activity_s">

									<dd class="folat-l">
										<span>地区：</span>
										<a href="javascript:void(0)" values="3" attrval="内地">内地</a>
										<a href="javascript:void(0)" values="3" attrval="香港">香港</a>
										<a href="javascript:void(0)" values="3" attrval="美国">美国</a>
										<a href="javascript:void(0)" values="3" attrval="台湾">台湾</a>
										<a href="javascript:void(0)" values="3" attrval="日本">日本</a>
										<a href="javascript:void(0)" values="3" attrval="韩国">韩国</a>
										<a href="javascript:void(0)" values="3" attrval="印度">印度</a>
										<a href="javascript:void(0)" values="3" attrval="泰国">泰国</a>
										<a href="javascript:void(0)" values="3" attrval="英国">英国</a>
										<a href="javascript:void(0)" values="3" attrval="法国">法国</a>
										<a href="javascript:void(0)" values="3" attrval="意大利">意大利</a>
										<a href="javascript:void(0)" values="3" attrval="西班牙">西班牙</a>
										<a href="javascript:void(0)" values="3" attrval="其他">其他</a>
									</dd>
								</dl>
							</div>
							</div>
					</div>
					<div id="videoview">
						<jsp:include page="videoview.jsp" />
					</div>
					
					<!--
                    	作者：offline
                    	时间：2019-06-28
                    	描述：分页
                    -->
					<div style="text-align:center;" id="test1"></div>
					
					<div style="height: 100px; clear:both;"></div>
				</div>
				<div class="width-2e folat-l height-10e">
					<h1 class="margin-left-15e margin-top-03e">今日电影排行</h1>
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
													<img src="http://localhost:8082//fileserver/${videoTop.vphoto }" width="80px" height="60px">
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
													<img src="http://localhost:8082//fileserver/${videoTop.vphoto }" width="80px" height="60px">
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

		

		//分类选择
		var dlNum = $("#selectList").find("dl");
		var tag1;
		var tag2;
		var tag3;
		$(".listIndex a ").click (function() {
			var text = $(this).text(); //<a>的数据
			
			var textTypeIndex = $(this).parents("dl").index();
			var textType = $(this).parent("dd").siblings("dt").text();
			index = textTypeIndex - (2);
			//该位置显示参数。。。。。
			//判断是哪个大标签
			if(textTypeIndex == 0) {
				//判断点击的<a>中是否有cslected的class
				if($(this).hasClass('selected')){
					//有就删除
					$(this).removeClass("selected");
					//清空tag
					tag1 = null;
				}else{
					//没有就添加，并将之前带有该样式的<a>标签中的该样式删除
					$(this).addClass("selected").siblings().removeClass("selected");
					//tag赋值
					tag1 = $(this).text();
					//alert(tag1);
				}
				//改变头部time标签信息
				$(".selecttime").text(text);
			//判断是哪个大标签
			} else if(textTypeIndex == 1) {
				//判断点击的<a>中是否有cslected的class
				if($(this).hasClass('selected')){
					//有就删除
					$(this).removeClass("selected");
					//清空tag
					tag2 = null;
					
				}else{
					//没有就添加
					$(this).addClass("selected").siblings().removeClass("selected");
					//向tag[]数组中添加参数
					tag2 = $(this).text();
				}
				//改变头部add标签信息
				$(".selectadd").text(text);
				var cimg = $(".selectadd").text(text);
				//alert(cimg.text());
				if(cimg.text() == '剧情'){
					$(".navphoto").css("background-image","url(../img/0.jpg)");
				}else if(cimg.text() == '喜剧'){
					$(".navphoto").css("background-image","url(${path}/img/1.jpg)");
				}else if(cimg.text() == '动作'){
					$(".navphoto").css("background-image","url(${path}/img/2.jpg)");
				}else if(cimg.text() == '爱情'){
					$(".navphoto").css("background-image","url(${path}/img/3.jpg)");
				}else if(cimg.text() == '惊悚'){
					$(".navphoto").css("background-image","url(${path}/img/4.jpg)");
				}else if(cimg.text() == '犯罪'){
					$(".navphoto").css("background-image","url(${path}/img/5.jpg)");
				}else if(cimg.text() == '悬疑'){
					$(".navphoto").css("background-image","url(${path}/img/6.jpg)");
				}else if(cimg.text() == '战争'){
					$(".navphoto").css("background-image","url(${path}/img/7.jpg)");
				}else if(cimg.text() == '科幻'){
					$(".navphoto").css("background-image","url(${path}/img/8.jpg)");
				}else if(cimg.text() == '动画'){
					$(".navphoto").css("background-image","url(${path}/img/9.jpg)");
				}else if(cimg.text() == '恐怖'){
					$(".navphoto").css("background-image","url(${path}/img/10.jpg)");
				}else if(cimg.text() == '冒险'){
					$(".navphoto").css("background-image","url(${path}/img/11.jpg)");
				}else if(cimg.text() == '历史'){
					$(".navphoto").css("background-image","url(${path}/img/12.jpg)");
				}else if(cimg.text() == '纪录'){
					$(".navphoto").css("background-image","url(${path}/img/13.jpg)");
				}else if(cimg.text() == '家庭'){
					$(".navphoto").css("background-image","url(${path}/img/14.jpg)");
				}else if(cimg.text() == '自传'){
					$(".navphoto").css("background-image","url(${path}/img/15.jpg)");
				}
				
			} else {
				if($(this).hasClass('selected')){
					$(this).removeClass("selected");
					tag3 = null;
				}else{
					$(this).addClass("selected").siblings().removeClass("selected");
					tag3 = $(this).text();
				}
				$(".selectclass").text(text);
				
			}
			
			//ajax异步刷新
			
			$.ajax({
     					type:'post',
     					url:'${path }/video/change.action',
    					data:{
    						tag1:tag1,
    						tag2:tag2,
    						tag3:tag3
    					},
    					success: function() {
    						//alert("成功返回！");
    						//alert("${sessionScope.videoList}");
                			$("#videoview").load("${path }/video/change.action");
            			}
					});
		});
		
		//分页
		layui.use('laypage', function() {
			var laypage = layui.laypage;
			//console.log(pageBean.totalCount);
			
			//执行一个laypage实例
			var tcount = ${pageBean.totalCount};
			laypage.render({
				elem: 'test1', //注意，这里的 test1 是 ID，不用加 # 号
				
				count: tcount, //数据总数，从服务端得到
				limit: 25,//每页条数
				theme:'#1E9FFF',
				jump: function(obj, first){
    				
      				var curPage=obj.curr;
    				
    				$.ajax({
     					type:'post',
     					url:'${path }/video/videoview.action',
    					data:{
    						page:curPage
    					},
    					success: function() {
    						//alert("成功返回！");
    						//alert("${sessionScope.videoList}");
                			$("#videoview").load("${path }/video/newvideoview.action");
            			}
					});
    			
   					
  				}
			});
		});
	</script>

</html>
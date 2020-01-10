<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
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
		<script src="../js/fxz/ssk.js"></script>
	</head>

	<body>
		<div class="div-nav width-8e folat-l">
					<ul class="layui-nav layui-bg-blue" lay-filter="daohang">
						<li class="layui-nav-item layui-this">
							<a class="" href="${path }/index/info.action">首页</a>
						</li>
						<li class="layui-nav-item">
							<a class="" href="${path }/video/infoMovie.action">电影</a>
						</li>
						<li class="layui-nav-item">
							<a class="" href="${path }/getvideo/getvideo.action?cid=C102">科普</a>
						</li>
						<li class="layui-nav-item">
							<a class="" href="${path }/getvideo/getvideo.action?cid=C103">游戏</a>
						</li>
						<li class="layui-nav-item">
							<a class="" href="${path }/getvideo/getvideo.action?cid=C104">鬼畜</a>
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
							<a href="${path }/common/video.action?uid=${user.uid}">个人中心<span class="layui-badge-dot"></span></a>
						</li>
						<li class="layui-nav-item">
							<a href="${path }/common/video.action?uid=${user.uid}"><img src="//t.cn/RCzsdCq" class="layui-nav-img">我</a>
							<dl class="layui-nav-child">
								<dd>
									<a href="javascript:;">退了</a>
								</dd>
							</dl>
						</li>
					</ul>
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

			
		</script>
	</body>

</html>

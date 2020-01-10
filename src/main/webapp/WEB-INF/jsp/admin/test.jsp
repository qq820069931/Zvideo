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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>jquery+video实现点击播弹窗放视频功能</title>
    
    <link href="../publicUtil/bootstrap/css/bootstrap.css" rel="stylesheet">
		
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	<style type="text/css">
		body{background-color: #222}
	  .videolist { position:relative; float:left; width:500px; height:300px; margin-right:50px; margin-top:15px; margin-bottom:30px; }
	  .videolist:hover{ cursor: pointer; }
	  .videoed { display:none; width:50px; height:50px; position: absolute; left:45%; top:45%; z-index:99; border-radius:100%; }
	  .videos{ display:none; border: 1px solid #080808; position:fixed; left:50%; top:50%; margin-left:-320px; margin-top:-210px; z-index:100; width:640px; height:360px; }
	  .vclose { position:absolute;right:1%; top:1%; border-radius:100%; cursor: pointer; }
	</style>

  </head>
  
  <body>
    <html lang="zh-CN">
  
  <body>
	<div class="video">
		<div class="container" style="margin-top: 100px">
			 <c:forEach items="${checkFiles}" var="checkfile" varStatus="statu">
                   	 	<div class="videolist" vpath="http://localhost:8082//fileserver/${checkfile.vphoto}" ipath="http://localhost:8082//fileserver/${checkfile.vurl}">
							<div class="vtit">视频一</div>
							<img src="http://localhost:8082//fileserver/${checkfile.vphoto}" width="540px" height="300px" />
							<div class="vtime">2018-06-22</div>
							<img src="../img/play2.png" class="videoed"/>
						</div>
              </c:forEach>
			<!-- <div class="videolist" vpath="v1.jpg" ipath="https://blz-videos.nosdn.127.net/1/OverWatch/OVR-S03_E03_McCree_REUNION_zhCN_1080P_mb78.mp4">
				<div class="vtit">视频一</div>
				<img src="v1.jpg" width="540px" height="300px" />
				<div class="vtime">2018-06-22</div>
				<img src="play.png" class="videoed"/>
			</div>
			<div class="videolist" vpath="v2.jpg" ipath="https://blz-videos.nosdn.127.net/1/OverWatch/AnimatedShots/Overwatch_AnimatedShot_CinematicTrailer.mp4">
				<div class="vtit">视频一</div>
				<img src="v2.jpg" width="540px" height="300px" />
				<div class="vtime">2018-06-22</div>
				<img src="play.png" class="videoed"/>
			</div> -->
			
			<div class="videos"></div>
		</div>
	</div>

    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
	<script>
        $('.videolist').each(function(){ //遍历视频列表
            $(this).hover(function(){ //鼠标移上来后显示播放按钮
                $(this).find('.videoed').show();
            },function(){
                $(this).find('.videoed').hide();
            });
            $(this).click(function(){ //这个视频被点击后执行
                var img = $(this).attr('vpath');//获取视频预览图
                var video = $(this).attr('ipath');//获取视频路径
                $('.videos').html("<video id=\"video\" poster='"+img+"' style='width: 640px' src='"+video+"' preload=\"auto\" controls=\"controls\" autoplay=\"autoplay\"></video><img onClick=\"close1()\" class=\"vclose\" src=\"../img/gb.png\" width=\"25\" height=\"25\"/>");
                $('.videos').show();
            });
        });

        function close1(){
            var v = document.getElementById('video');//获取视频节点
            $('.videos').hide();//点击关闭按钮关闭暂停视频
            v.pause();
            $('.videos').html();
        }
	</script>
  </body>
</html>
  </body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <!-- 直播页面 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/video.js/7.3.0/video-js.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/video.js/7.3.0/video.min.js"></script>
    <script src="http://vjs.zencdn.net/5.5.3/video.js"></script>


<!-- <link rel="stylesheet" href="<%=basePath%>css/gx/videoCT.css" type="text/css"></link>
    <link rel="stylesheet" href="<%=basePath%>css/gx/index.css" type="text/css"></link>
-->



</head>
<body>

<video
        id="my-video"
        class="video-js"
        controls
        preload="auto"
        width="740px"
        height="500px"
        poster="http://ppt.downhot.com/d/file/p/2014/08/12/9d92575b4962a981bd9af247ef142449.jpg"
        data-setup="{}">

    <!-- 直播地址 -->
    <source src="rtmp://127.0.0.1/live/tiger" type="rtmp/flv">

</video>
<!-- <section>
	<video width="100%" height="100%" id="video1"></video>
</section>
-->

</body>
<script type="text/javascript">
    var myPlayer = videojs('my-video');
    videojs("my-video").ready(function(){
        var myPlayer = this;
        myPlayer.play();
    });
</script>


</html>
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
    <!-- 视频页面 -->




    <link rel="stylesheet" href="<%=basePath%>css/gx/main.css"  type="text/css">
    <link  href="<%=basePath%>css/gx/colpick.css" rel="stylesheet"  type="text/css">
    <link  href="<%=basePath%>css/gx/scojs.css" rel="stylesheet"  type="text/css">
    <link  href="<%=basePath%>css/gx/bootstrap.css" rel="stylesheet"  type="text/css">

    <script type="text/javascript" src="<%=basePath%>js/gx/jquery-2.1.4.min.js"></script>

    <script type="text/javascript" src="<%=basePath%>js/gx/colpick.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/gx/jquery.danmu.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/gx/jquery.shCircleLoader.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/gx/main.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/gx/sco.tooltip.js"></script>

</head>
<body>


<div id="danmup" class="danmu-player"></div>


</body>

<script >
    var vids=getUrlParam("vid");

    $("#danmup").DanmuPlayer({

        src:"https://blz-videos.nosdn.127.net/1/OverWatch/OVR-S03_E03_McCree_REUNION_zhCN_1080P_mb78.mp4",       //视频源

        width:1057,			//视频宽度

        height:685,			//视频高度
        urlToGetDanmu:"/video/GetDanmu?vid="+vids       //取出数据 json格式
        ,urlToPostDanmu:"/video/SetDanmu?vid="+vids             //发送弹幕是保存进入数据库
    });

    function getUrlParam(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
        var r = window.location.search.substr(1).match(reg); //匹配目标参数
        if (r != null) return unescape(r[2]); return null; //返回参数值
    }

</script>
</html>

</html>
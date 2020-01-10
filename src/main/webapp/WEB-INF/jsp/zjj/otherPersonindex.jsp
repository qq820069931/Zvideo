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
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <script type="text/javascript" src="../publicUtil/jquery-3.2.1.min.js"></script>
        <script src="../publicUtil/bootstrap/js/bootstrap.min.js" charset="UTF-8"></script>
       <link rel="stylesheet" href="../publicUtil/layui/css/layui.css" media="all">
        <link rel="stylesheet" href="../publicUtil/layui/css/template.css" media="all">
      <link rel="stylesheet" href="../publicUtil/layui/css/admin.css" media="all">
  <style>
    body{margin: 10px;}
    .demo-carousel{height: 200px; line-height: 200px; text-align: center;}
  </style>

  </head>
  
  <body class="body" onload="init();">
    <div class="head">
			  	<img src="../common/image/3.jpg"  style="height: 200px; width: 100%;"/> 
			  </div>
			  <div class="class=layui-layout-body">
			  	<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">个人主页</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <!--<li class="layui-nav-item"><a href="Mycomposition.html">我的作品</a></li>
      <li class="layui-nav-item"><a href="">历史观看</a></li>
      <li class="layui-nav-item"><a href="">我的收藏</a></li>
      <li class="layui-nav-item"><a href="">我的关注</a></li>-->
     <!-- <li class="layui-nav-item"><a href="">消息通知</a></li>
      <li class="layui-nav-item"><a href="">消息通知页面</a></li>
      <li class="layui-nav-item">
        <a href="javascript:;">其它系统</a>
        <dl class="layui-nav-child">
          <dd><a href="">个人信息管理</a></dd>
          <dd><a href="">消息管理</a></dd>
        </dl>
      </li>-->
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="../common/image/${user.u_photo}" class="layui-nav-img">
          ${user.u_name}
        </a>
           
        <dl class="layui-nav-child">
          <dd><a href="">基本资料</a></dd>
          <dd><a href="">安全设置</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="">退出</a></li>
    </ul>
  </div>
  
  
    
  
  <div class="layui-tab layui-tab-brief" lay-filter="demo">
  <ul class="layui-tab-title">
    <li class="layui-this">精品视频</li>
    
  </ul>
  <div class="layui-tab-content">
    <div class="layui-tab-item layui-show">
    
      <div class="layui-carousel" id="test1">
        <div carousel-item>
          <div><p class="layui-bg-green demo-carousel">欢迎来到家骏的个人主页</p></div>
          <div><p class="layui-bg-red demo-carousel">你知道吗？用户也可以发布作品噢</p></div>
          <div><p class="layui-bg-blue demo-carousel">用户可以根据类型搜索作品</p></div>
          <div><p class="layui-bg-orange demo-carousel">家骏小助手提示：用户也可以发布作品噢</p></div>
          <div><p class="layui-bg-cyan demo-carousel">你可以将鼠标移入导航区域，然后滑动鼠标滚轮即可</p></div>
        </div>
      </div>
    </div>
    
  </div>
</div>


  
  <!--<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
       左侧导航区域（可配合layui已有的垂直导航） 
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">所有商品</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;">列表一</a></dd>
            <dd><a href="javascript:;">列表二</a></dd>
            <dd><a href="javascript:;">列表三</a></dd>
            <dd><a href="">超链接</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">解决方案</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;">列表一</a></dd>
            <dd><a href="javascript:;">列表二</a></dd>
            <dd><a href="">超链接</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item"><a href="">云市场</a></li>
        <li class="layui-nav-item"><a href="">发布商品</a></li>
      </ul>
    </div>
  </div>-->
 


<!--<ins class="adsbygoogle" style="display:inline-block;width:970px;height:90px" data-ad-client="ca-pub-6111334333458862" data-ad-slot="3820120620"></ins>-->
  
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
  <legend>${other.u_name}的小树洞</legend>
</fieldset>
<div class="layui-tab" lay-filter="test">
  <ul class="layui-tab-title">
  	
    <li class="layui-this" lay-id="11">个人信息</li>
    <li lay-id="22">我的作品</li>
    <li lay-id="33">我的收藏</li>
    <li lay-id="44">我的关注</li>
    <li lay-id="55">留言</li>
   
    
     
  </ul>
  <div class="layui-tab-content">
    <div class="layui-tab-item  layui-show">
      <div class="layui-fluid layadmin-homepage-fluid">
  <div class="layui-row layui-col-space8">
    <div class="layui-col-md2">
      <div class="layadmin-homepage-panel layadmin-homepage-shadow">
        <div class="layui-card text-center">
          <div class="layui-card-body">
            <div class="layadmin-homepage-pad-ver">
              <img class="layadmin-homepage-pad-img" src="../common/image/${other.u_photo}" width="96" height="96">
            </div>
            <h4 class="layadmin-homepage-font">${other.u_name}</h4>
            <p class="layadmin-homepage-min-font">${other.u_sex}</p>
            <div class="layadmin-homepage-pad-ver">
              <a href="javascript:;" class="layui-icon layui-icon-cellphone"></a>
              <a href="javascript:;" class="layui-icon layui-icon-vercode"></a>
              <a href="javascript:;" class="layui-icon layui-icon-login-wechat"></a>
              <a href="javascript:;" class="layui-icon layui-icon-login-qq"></a>
            </div>
            <button class="layui-btn layui-btn-fluid" id="guanzhu">关注</button>
          </div>
        </div>
        <p class="layadmin-homepage-about">
          关于我
        </p>
        <ul class="layadmin-homepage-list-group">
          <li class="list-group-item"><i class="layui-icon layui-icon-location"></i>${other.u_email}</li>
          <li class="list-group-item"><a href="javascript:;" class="color"><i class="layui-icon layui-icon-snowflake"></i><span style="word-wrap:break-word;">https://weibo.com/hu_ge</span></a></li>
        </ul>
        <div class="layadmin-homepage-pad-hor">
          <mdall>${other.u_email}</mdall>
        </div>
        <p class="layadmin-homepage-about">
          个人签名
        </p>
        <div class="layadmin-homepage-pad-hor">
       <mdall> ${other.u_satement}</mdall>
       </div>
       <!-- <ul class="layadmin-homepage-list-inline">
          <a href="javascript:;" class="layui-btn layui-btn-primary">演员</a>
          <a href="javascript:;" class="layui-btn layui-btn-primary">主持人</a>
          <a href="javascript:;" class="layui-btn layui-btn-primary">摄影师</a>
          <a href="javascript:;" class="layui-btn layui-btn-primary">导演</a>
          <a href="javascript:;" class="layui-btn layui-btn-primary">公共人物</a>
        </ul>-->
      </div>
    </div>
    <div class="layui-col-md10">
      <div class="layui-fluid layadmin-homepage-content">
        <div class="layui-row  layadmin-homepage-padding15">
          <hr class="new-section-xs"></hr>
          <div class="layui-col-md7 layadmin-homepage-padding8">
            <div class="layui-row layadmin-homepage-text-center">
              <div class="layui-col-md3 layui-col-sm3 layui-col-xs3">
                <p class="h4">52K</p>
                <mdall>关注</mdall>
              </div>
              <div class="layui-col-md3 layui-col-sm3 layui-col-xs3">
                <p class="h4">72K</p>
                <mdall>以下</mdall>
              </div>
              <div class="layui-col-md3 layui-col-sm3 layui-col-xs3">
                <p class="h4">5343</p>
                <mdall>照片</mdall>
              </div>
              <div class="layui-col-md3 layui-col-sm3 layui-col-xs3">
                <p class="h4"><i class="layui-icon layui-icon-rate-solid"></i>4.5</p>
                <mdall>排行</mdall>
              </div>
            </div>
          </div>
          <div class="layui-col-md5">
              <a href="javascript:;" class="layui-btn layui-btn-normal">下载简历</a>
              <a href="javascript:;" class="layui-btn">发信息</a>
          </div>
        </div>
        <div class="layui-row layui-col-space20 layadmin-homepage-list-imgtxt">
          <div class="layui-col-md9">
            <div class="grid-demo">
              <div class="panel-body layadmin-homepage-shadow">
                <a href="javascript:;" class="media-left">
                  <img src="image/4.jpg"46px" width="46px">
                </a>
                <div class="media-body">
                  <div class="pad-btm">
                    <p class="fontColor"><a href="javascript:;">周家骏</a>发布<span>了</span>新的<span>照片</span></p>
                    <p class="min-font">
                      <span class="layui-breadcrumb" lay-separator="-">
                        <a href="javascript:;" class="layui-icon layui-icon-cellphone"></a>
                        <a href="javascript:;">时间：</a>
                        <a href="javascript:;">${newvideo.v_time}</a>
                      </span>
                    </p>         
                  </div>
                  <p>${newvideo.v_content}</p>
                  <img class="h-img" src="../common/image/${newvideo.v_photo}" >
                  <div class="media">
                    <div class="media-right">
                      <ul class="list-inline">
                        <li>
                          <i class="layui-icon layui-icon-camera-fill"></i>
                          <span>107</span>
                        </li>
                        <li>
                          <i class="layui-icon layui-icon-group"></i>
                          <span>95</span>
                        </li>
                      </ul>
                    </div>
                    <div class="media-left">
                      <ul class="list-inline">
                        <li>
                          <a href="javascript:;">
                            <img class="img-xs" src="image/portrait.png">
                            
                          </a>
                        </li>
                        <li>
                          <a href="javascript:;">
                            <img class="img-xs" src="image/portrait.png">
                          </a>
                        </li>
                        <li>
                          <a href="javascript:;">
                            <img class="img-xs" src="image/portrait.png">
                          </a>
                        </li>
                        <li>
                          <a href="javascript:;" class="

                          ">
                            14+
                          </a>
                        </li>
                      </ul>
                    </div>
                  </div>
                  <div class="media-list">
                    <div class="media-item">
                      <a href="javascript:;" class="media-item-left">
                        <img class="img-xs" src="image/portrait.png">
                      </a>
                      <div class="media-text">
                        <div>
                            <a href="javascript:;">周家骏</a>
                            <mdall> 3月21日 19:56</mdall>
                        </div>
                        <div>一次难忘更难得的拍摄经历 谢谢</div>
                      </div>
                    </div>
                    <div class="media-item">
                      <a href="javascript:;" class="media-item-left">
                        <img class="img-xs" src="image/portrait.png">
                      </a>
                      <div class="media-text">
                        <div>
                            <a href="javascript:;">周家骏</a>
                            <mdall> 3月21日 19:56</mdall>
                        </div>
                        <div>一次难忘更难得的拍摄经历 谢谢</div>
                      </div>
                    </div>
                    <div class="media-item">
                      <a href="javascript:;" class="media-item-left">
                        <img class="img-xs" src="image/portrait.png">
                      </a>
                      <div class="media-text">
                        <div>
                            <a href="javascript:;">胡歌</a>
                            <mdall> 3月21日 19:56</mdall>
                        </div>
                        <div>一次难忘更难得的拍摄经历 谢谢</div>
                      </div>
                    </div>
                   <a href="javascript:;" class="layui-btn">更多</a>
                  </div>
                </div>
              </div>
              <div class="panel-body layadmin-homepage-shadow">
                <a href="javascript:;" class="media-left">
                  <img src="../../layuiadmin/style/res/template/portrait.png" height="46px" width="46px">
                </a>
                <div class="media-body">
                  <div class="pad-btm">
                    <p class="fontColor"><a href="javascript:;">周家骏</a>为<span>普通照片</span>添加了新的<span>照片</span></p>
                    <p class="min-font">
                      <span class="layui-breadcrumb" lay-separator="-">
                        <a href="javascript:;" class="layui-icon layui-icon-cellphone"></a>
                        <a href="javascript:;">从移动</a>
                        <a href="javascript:;">11分钟前</a>
                      </span>
                    </p>         
                  </div>
                  <p>历经打磨，@索尼中国 再献新作品—OLED电视A8F完美诞生。很开心一起参加了A8F的“首映礼”！[鼓掌]正如我们演员对舞台的热爱，索尼对科技与艺术的追求才创造出了让人惊喜的作品。作为A1兄弟款，A8F沿袭了黑科技“屏幕发声技术”和高清画质，色彩的出众表现和高端音质，让人在体验的时候如同身临其境。A8F，这次的“视帝”要颁发给你！  索尼官网预售： O网页链接 索尼旗舰店预售：</p>
                  <div class="media">
                    <div class="media-right">
                      <ul class="list-inline">
                        <li>
                          <i class="layui-icon layui-icon-camera-fill"></i>
                          <span>107</span>
                        </li>
                        <li>
                          <i class="layui-icon layui-icon-group"></i>
                          <span>95</span>
                        </li>
                      </ul>
                    </div>
                    <div class="media-left">
                      <ul class="list-inline">
                        <li>
                          <a href="javascript:;">
                            <img class="img-xs" src="">
                          </a>
                        </li>
                        <li>
                          <a href="javascript:;">
                            <img class="img-xs" src="../../layuiadmin/style/res/template/portrait.png">
                          </a>
                        </li>
                        <li>
                          <a href="javascript:;">
                            <img class="img-xs" src="../../layuiadmin/style/res/template/portrait.png">
                          </a>
                        </li>
                        <li>
                          <a href="javascript:;" class="

                          ">
                            14+
                          </a>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="layui-col-md3">
            <div class="grid-demo">
              <div class="layui-card homepage-top">
                <div class="layui-card-header">
                  <h3 class="panel-title">
                    <i class="layui-icon layui-icon-picture"></i>
                    我的封面
                  </h3>
                </div>
                <div class="layui-card-body">
                  <div class="layui-row layui-col-space15">
                  <c:forEach items="${video}" var="video" >
                    <div class="layui-col-md4">
                      <img src="../common/image/${video.v_photo}" style="width: 45px; height: 45px;">
                    </div>
                   </c:forEach>
                  </div>
                </div>
              </div>
              <div class="layui-card homepage-bottom">
                <div class="layui-card-header">
                  <h3 class="panel-title">
                    <i class="layui-icon layui-icon-user"></i>
                    我的留言
                  </h3>
                </div>
                
                <div class="layui-card-body">
                   <c:forEach items="${lyUser}" var="uitem" >
                    <a href="javascript:;" class="layadmin-privateletterlist-item">
                      <div class="meida-left">
                        <img src="../common/image/${uitem.user.u_photo}">
                      </div>
                      <div class="meida-right">
                        <p>${uitem.user.u_name}</p>
                        <mdall>${uitem.icontent}</mdall>
                      </div>
                    </a>
                    </c:forEach>
                  </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
    </div>
    <div class="layui-tab-item ">
    	
</div>
    </div>
    <div class="layui-tab-item">
    	<div class="layui-fluid layadmin-cmdlist-fluid">
  <div class="layui-row layui-col-space30">
          
    
    <c:forEach items="${video}" var="video" >
     <div class="layui-col-md2 layui-col-sm4">
        <div class="cmdlist-container">
            <a href="javascript:;">
               <img src="../common/image/${video.v_photo}" style="width: 218px; height: 195px;">
            </a>
            <a href="javascript:;">
              <div class="cmdlist-text">
                <p class="info"><h4>${video.v_name}</p>
                <div class="price">
               
                    <span class="flow">
                      
                    </span>
                </div>
              </div>
            </a>
        </div>
    </div>
    </c:forEach>
    
    <div class="layui-col-md12 layui-col-sm12">
        <div id="demo0"></div>
    </div>
  </div>
</div>	
    </div>
   
    <div class="layui-tab-item">
    	<div class="layui-fluid layadmin-cmdlist-fluid">
  <div class="layui-row layui-col-space30">
     
    
    <c:forEach items="${collect.video}" var="citem" >
     <div class="layui-col-md2 layui-col-sm4">
        <div class="cmdlist-container">
            <a href="javascript:;">
               <img src="../common/image/${citem.v_photo}" style="width: 218px; height: 195px;">
            </a>
            <a href="javascript:;">
              <div class="cmdlist-text">
                <p class="info">${citem.v_name}</p>
                <div class="price">
               
                    <span class="flow">
                      
                    </span>
                </div>
              </div>
            </a>
        </div>
    </div>
    </c:forEach>
    <div class="layui-col-md12 layui-col-sm12">
        <div id="demo0"></div>
    </div>
  </div>
</div>	
    </div>
    
    
    
    <div class="layui-tab-item">
    	<div class="layui-fluid layadmin-cmdlist-fluid">
  <div class="layui-row layui-col-space30">
    <div class="layui-fluid layadmin-maillist-fluid">
  <div class="layui-row layui-col-space15">   
    
     <div class="layui-col-md4 layui-col-sm6">
      <div class="layadmin-contact-box" > 
          <div class="layui-col-md4 layui-col-sm6">
            <a href="javascript:;">
              <div class="layadmin-text-center">
                <img src="../../layuiadmin/style/res/template/character.jpg">
                <div class="layadmin-maillist-img layadmin-font-blod">演员</div>
              </div>
            </a>
          </div>
        
        <div class="layui-col-md8 layadmin-padding-left20 layui-col-sm6">
          <a href="javascript:;">
            <h3 class="layadmin-title">
              <strong>胡歌</strong>
            </h3>
            <p class="layadmin-textimg">
              <i class="layui-icon layui-icon-location"></i>
              上海
            </p>
          </a>
          <div class="layadmin-address">
            <a href="javascript:;">
              <strong>Hu Ge studio</strong>
              <br>
              E-mail:xxx@baidu.com
              <br>
              Weibo: https://weibo.com/hu_ge 
              <br>
              <addr title="phone">Tel:</addr>
              (123) 456-7890
            </a>
          </div>
        </div>
      </div>
    </div>
    
       
  </div>
</div>
    <div class="layui-col-md12 layui-col-sm12">
        <div id="demo0"></div>
    </div>
  </div>
</div>	
    	
    </div>
    
    
     <div class="layui-tab-item">
    	<div class="layui-fluid layadmin-cmdlist-fluid">
  <div class="layui-row layui-col-space30">
    
    
    <div class="layui-fluid layadmin-message-fluid">
  <div class="layui-row">
    <div class="layui-col-md12">
      <form class="layui-form">
        <div class="layui-form-item layui-form-text">
          <div class="layui-input-block">
            <textarea name="desc"  placeholder="请输入内容" class="layui-textarea" id="liuyantext"></textarea>
          </div>
        </div>

        <div class="layui-form-item" style="overflow: hidden;">
          <div class="layui-input-block layui-input-right">
            <button class="layui-btn" lay-submit lay-filter="formDemo" id="liuyan">留言</button>
          </div>
          <div class="layadmin-messag-icon">
            <a href="javascript:;"><i class="layui-icon layui-icon-face-smile-b"></i></a>
            <a href="javascript:;"><i class="layui-icon layui-icon-picture"></i></a>
            <a href="javascript:;"><i class="layui-icon layui-icon-link"></i></a>
          </div>
        </div>
      </form>
    </div>
    
    <div class="layui-col-md12 layadmin-homepage-list-imgtxt message-content" id="liuyanitem">
        <c:forEach items="${lyUser}" var="uitem" >
       <div class="media-body" >
          <a href="javascript:;" class="media-left" style="float: left;">
             <img src="../common/image/${uitem.user.u_photo}" style="width: 45px; height: 45px;">
          </a>
          <div class="pad-btm">
            <p class="fontColor"><a href="javascript:;">${uitem.user.u_name}</a></p>
            <p class="min-font">
              <span class="layui-breadcrumb" lay-separator="-">
                <a href="javascript:;" class="layui-icon layui-icon-cellphone"></a>
                <a href="javascript:;">时间：</a>
                <a href="javascript:;">${uitem.itime}</a>
              </span>
            </p>         
         </div>
          <p class="message-text">${uitem.icontent}</p>
       </div>
       </c:forEach>
       
         <div class="layui-row message-content-btn">
          <a href="javascript:;" class="layui-btn">更多</a>
       </div>
       
     </div>

    </div>
  </div>
</div>
    
    
    
    <div class="layui-col-md12 layui-col-sm12">
        <div id="demo0"></div>
    </div>
  </div>
</div>	
    	
    </div>
    
  </div>
</div>



<blockquote class="layui-elem-quote layui-quote-nm layui-hide" id="footer">zhoujiajun{{ layui.v }} 提供强力驱动</blockquote>



  
  
</div>
<div class="layui-footer">
    <!-- 底部固定区域 -->
    © zhoujiajun.com - 底部固定区域
  </div>
  
<script src="../publicUtil/layui/layui.js"></script>
<script src="../publicUtil/layui/adminlayui.js"></script>
<script>
 function init(){
layui.config({
  version: '1560414887155' //为了更新 js 缓存，可忽略
});
 
layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function(){
  var laydate = layui.laydate //日期
  ,laypage = layui.laypage //分页
  ,layer = layui.layer //弹层
  ,table = layui.table //表格
  ,carousel = layui.carousel //轮播
  ,upload = layui.upload //上传
  ,element = layui.element //元素操作
  ,slider = layui.slider //滑块
  
  //向世界问个好
  layer.msg('Hello World');
  
  //监听Tab切换
  element.on('tab(demo)', function(data){
    layer.tips('切换了 '+ data.index +'：'+ this.innerHTML, this, {
      tips: 1
    });
  });
  
  //执行一个 table 实例
  table.render({
    elem: '#demo'
    ,height: 420
    ,url: '/demo/table/user/' //数据接口
    ,title: '用户表'
    ,page: true //开启分页
    ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
    ,totalRow: true //开启合计行
    ,cols: [[ //表头
      {type: 'checkbox', fixed: 'left'}
      ,{field: 'id', title: 'ID', width:80, sort: true, fixed: 'left', totalRowText: '合计：'}
      ,{field: 'username', title: '用户名', width:80}
      ,{field: 'experience', title: '积分', width: 90, sort: true, totalRow: true}
      ,{field: 'sex', title: '性别', width:80, sort: true}
      ,{field: 'score', title: '评分', width: 80, sort: true, totalRow: true}
      ,{field: 'city', title: '城市', width:150} 
      ,{field: 'sign', title: '签名', width: 200}
      ,{field: 'classify', title: '职业', width: 100}
      ,{field: 'wealth', title: '财富', width: 135, sort: true, totalRow: true}
      ,{fixed: 'right', width: 165, align:'center', toolbar: '#barDemo'}
    ]]
  });
  
  //监听头工具栏事件
  table.on('toolbar(test)', function(obj){
    var checkStatus = table.checkStatus(obj.config.id)
    ,data = checkStatus.data; //获取选中的数据
    switch(obj.event){
      case 'add':
        layer.msg('添加');
      break;
      case 'update':
        if(data.length === 0){
          layer.msg('请选择一行');
        } else if(data.length > 1){
          layer.msg('只能同时编辑一个');
        } else {
          layer.alert('编辑 [id]：'+ checkStatus.data[0].id);
        }
      break;
      case 'delete':
        if(data.length === 0){
          layer.msg('请选择一行');
        } else {
          layer.msg('删除');
        }
      break;
    };
  });
  
  //监听行工具事件
  table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
    var data = obj.data //获得当前行数据
    ,layEvent = obj.event; //获得 lay-event 对应的值
    if(layEvent === 'detail'){
      layer.msg('查看操作');
    } else if(layEvent === 'del'){
      layer.confirm('真的删除行么', function(index){
        obj.del(); //删除对应行（tr）的DOM结构
        layer.close(index);
        //向服务端发送删除指令
      });
    } else if(layEvent === 'edit'){
      layer.msg('编辑操作');
    }
  });
  
  //执行一个轮播实例
  carousel.render({
    elem: '#test1'
    ,width: '100%' //设置容器宽度
    ,height: 200
    ,arrow: 'none' //不显示箭头
    ,anim: 'fade' //切换动画方式
  });
  
  //将日期直接嵌套在指定容器中
  var dateIns = laydate.render({
    elem: '#laydateDemo'
    ,position: 'static'
    ,calendar: true //是否开启公历重要节日
    ,mark: { //标记重要日子
      '0-10-14': '生日'
      ,'2018-08-28': '新版'
      ,'2018-10-08': '神秘'
    } 
    ,done: function(value, date, endDate){
      if(date.year == 2017 && date.month == 11 && date.date == 30){
        dateIns.hint('一不小心就月底了呢');
      }
    }
    ,change: function(value, date, endDate){
      layer.msg(value)
    }
  });
  
  //分页
  laypage.render({
    elem: 'pageDemo' //分页容器的id
    ,count: 100 //总页数
    ,skin: '#1E9FFF' //自定义选中色值
    //,skip: true //开启跳页
    ,jump: function(obj, first){
      if(!first){
        layer.msg('第'+ obj.curr +'页', {offset: 'b'});
      }
    }
  });
  
  //上传视频
  upload.render({
    elem: '#uploadDemo',
    accept:'file',
    size:0,
    url: '${path}/upload/upload' //上传接口
    ,done: function(res){
      alert("上传视频成功");
      $("input[name=v_time]").val(res.time);
      $("input[name=v_url]").val(res.path);
    } 
  });
  
  //上传图片
  upload.render({
    elem: '#uploadDemo1'
    ,url: '${path}/upload/uploadimage' //上传接口
    ,done: function(res){
      console.log(res)
      alert("上传图片成功");
      
      $("input[name=v_time]").val(res.time);
      $("input[name=v_photo]").val(res.path);
    }
  });
  
  $("#guanzhu").on("click",function(){
  		
       $.post(
        "${path}/common/guanzhu",
        {
        "a_uid":${user.u_id},
        "u_id":${other.u_id},
        },
        function(data){
        	if(data == 'success'){
        	alert("关注成功");
        	    $("#guanzhu").removeClass("layui-btn layui-btn-fluid");
        		$("#guanzhu").addClass("layui-btn layui-btn-disabled");
        		$("#guanzhu").text("已关注");
        	}
        },
        "text"
       )
  })
  
 
  $("#liuyan").on("click",function(){
     $.post(
        "${path}/common/addliuyan",
        {
        "i_uid":${other.u_id},
        "u_id":${user.u_id},
        "icontent":document.getElementById("liuyantext").value,
        }, 
        function(data){
        console.log(data)
        alert("留言成功")
        $item =$(
           "<div class='media-body'>"
           +"<a href='javascript:;' class='media-left' style='float: left;'>"+"<img src='../common/image/"+data.user.u_photo+"' style='width: 45px; height: 45px;'/>"+"</a>"
           +"<div class='pad-btm'>"+"<p class='fontColor'><a href='javascript:;'>"+data.user.u_name+"</a></p>"
           +"<p class='min-font'>"
           +"<span class='layui-breadcrumb' lay-separator='-' style='visibility: visible;'>"
           +"<a href='javascript:;' class='layui-icon layui-icon-cellphone'>"
           +"<a href='javascript:;'>"+"时间"+"</a>"
           +"<a href='javascript:;'>"+data.itime+"</a>"
           +"</a>"
           +"</span>"
           +"</p>"
           +"</div>"
           +"<p class='message-text'>"+data.icontent+"</p>"
           +"</div>"
        )
        $("#liuyanitem").prepend($item);
        $("#liuyantext").val("").focus();
        },
        "json"
       )
  }) 
  
  
  
  slider.render({
    elem: '#sliderDemo'
    ,input: true //输入框
  });
  
  //底部信息
  var footerTpl = lay('#footer')[0].innerHTML;
  lay('#footer').html(layui.laytpl(footerTpl).render({}))
  .removeClass('layui-hide');
});
layui.config({
    base: '../../layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index']);
  
  
  layui.config({
    base: '../../layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index']);
  layui.use(['layer','form'],function(){
    var form = layui.form;
    form.on('submit(formDemo)', function(data){
      // layer.msg(JSON.stringify(data.field));
      return false;
    });
  })
  
  }
  
</script>
  </body>
</html>

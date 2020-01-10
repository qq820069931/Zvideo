<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
	String path = request.getContextPath();
	request.setAttribute("path", path);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>视频播放</title>
    
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<link href="${path}/publicUtil/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet" />
	<link rel="stylesheet" href="${path}/publicUtil/layui/css/layui.css"  media="all">
    <script src="${path}/publicUtil/layui/layui.js" type="text/javascript" charset="utf-8"></script>
     
	<script type="text/javascript" src="../publicUtil/jquery-3.2.1.min.js"></script>

	<style type="text/css">
		*{ margin:0; padding:0;}
		img {border:none; }
		em,i{ font-style:normal;}
		body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, form, fieldset, input, textarea, p, blockquote, th, td, font { padding: 0; margin: 0; font-family:"微软雅黑"; }
		table { border-collapse: collapse; border-spacing: 0; width: 100%; }
		h1, h2, h3, h4, h5, h6 { font-weight: normal; font-size: 100%; }
		ol, ul, li, dl, dt, dd { list-style: none; }
		input, button, textarea, checkbox, select, radio, form { vertical-align: top; }
		a{ color: #000; text-decoration: none; }
		a:link, a:visited { text-decoration: none; }
		.public_width{ width: 100%;max-width: 1200px; height: auto; overflow: hidden; margin: 0 auto;  }
		/*视频*/
		.video_con{ background: #282828; color: #fff; }
		.video_con .video_con_title{ width: 100%;height: 70px; line-height: 70px;font-size: 30px; font-weight: bold;text-indent: 1em; color: #fff; background-color: #333;}
		.video_con .video_con_show{}
		.video_con_show{ width: 100%;height: 630px; font-size: 0; }
		.video_con_show .video_bofang{ display: inline-block; width: 900px;height: 630px; font-size: 24px; vertical-align: top;}
		.video_con_show .video_show_zs{ display: inline-block; width: 300px;height: 630px;font-size: 24px; border-left: 2px solid #444; box-sizing: border-box;}
		.video_show_zs	.video_show_zj{ width: 100%;height: auto; padding: 20px 0; background-color: #444;}
		.video_show_zj  .video_show_zj_img{ display: inline-block; width: 66px; vertical-align: middle;margin: 0 20px; }
		.video_show_zj  .video_show_zj_js{ display: inline-block; width: 180px; vertical-align: middle;  color: #fff;}
		.video_show_zj_js .video_show_zj_name{ display: block; font-size: 28px; }
		.video_show_zj_js .video_show_zj_zc{display: block; font-size: 22px; }
		
		.video_show_zs .video_show_title{ font-size: 14px; margin: 10px;}
		.video_show_zs .video_show_con{margin: 10px;height: 473px; overflow-y:auto;}
		.video_show_con .video_show_list{ font-size: 14px;width: 100%;height: auto;overflow: hidden; color: #fff; margin-top: 20px;}
		.video_show_list img{ display: inline-block; width: 120px;vertical-align: middle;margin-right: 10px; }
		.video_show_list span{ display: inline-block; width: 130px; }
		
		.tab-box .video_con_show_con{width:820px;height:630px;display:none;}
		/* 让第一个框显示出来 */
		.tab-box div:first-Child{display:block;} 
		/* 改变选项卡选中时候的样式 */
		.change{background:rgba(255,255,255,0.6);} 
		
		.video_show_con::-webkit-scrollbar {/*滚动条整体样式*/
		    width: 10px;     /*高宽分别对应横竖滚动条的尺寸*/
		    height: 1px;
		}
		.video_show_con::-webkit-scrollbar-thumb {/*滚动条里面小方块*/
		        border-radius: 10px;
		background-color: #555;
		
		    }
		.video_show_con::-webkit-scrollbar-track {/*滚动条里面轨道*/
		        -webkit-box-shadow: inset 0 0 5px rgba(0,0,0,0.2);
		        /*border-radius: 10px;*/
		        background: #282828;
		    }
		    
	</style>
	
	<script type="text/javascript">
		$().ready(function(){
			$(".tab-menu li").click(function(){
			//通过 .index()方法获取元素下标，从0开始，赋值给某个变量
			var _index = $(this).index();
			//让内容框的第 _index 个显示出来，其他的被隐藏
			$(".tab-box>div").eq(_index).show().siblings().hide();
			//改变选中时候的选项框的样式，移除其他几个选项的样式
			$(this).addClass("change").siblings().removeClass("change");
			});
		});
	</script>

  </head>
  
  <body>
    <section class="public_width">
    <dl class="video_con">
    		
                <dt class="video_con_title">${checkfilePlay.vname}</dt>
                <figure class="video_con_show tab">
                    <div class="video_bofang tab-box">
                    <c:forEach items="${checkFiles}" var="checkfile" varStatus="statu">
                   	 	<div class="video_con_show_con">
                            <video width="900" height="630" controls>
                              <source src="http://localhost:8082//fileserver/${checkfile.vurl}" type="wmv">
                            </video>
                        </div>
                     </c:forEach>
                    	
                        
                    </div>
                    <figcaption class="video_show_zs">
                        <div class="video_show_zj">
                            <img class="video_show_zj_img" src="${checkfilePlay.vphoto}">
                            <p class="video_show_zj_js">
                                <b class="video_show_zj_name">${checkfilePlay.vname}</b>
                                <span class="video_show_zj_zc">${checkfilePlay.vtag2}</span>
                            </p>
                        </div>
                     
                        <span class="video_show_title">播放列表</span>
                        <ul class="video_show_con tab-menu">
                        	<c:forEach items="${checkFiles}" var="checkfile" varStatus="statu">
                        		<li class="video_show_list"><img src="${checkfile.vphoto}"><span>${checkfile.vname}</span></li>
                        	</c:forEach>
                            
                        </ul>
                    </figcaption>
                </figure>
             
            </dl>
    </section>
    
    
  </body>
</html>

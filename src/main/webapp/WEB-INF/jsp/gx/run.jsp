<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <script type="text/javascript" src="<%=basePath%>publicUtil/jquery-3.2.1.min.js"></script>

        <script type="text/javascript" src="<%=basePath%>publicUtil/layui/layui.js"></script>
         <script type="text/javascript" src="<%=basePath%>publicUtil/bootstrap/js/bootstrap.min.js"></script>
          <link rel="stylesheet" href="<%=basePath%>publicUtil/layui/css/layui.css" type="text/css"></link>
      
        <link rel="stylesheet" href="<%=basePath%>publicUtil/bootstrap/css/bootstrap.min.css" type="text/css"></link>
        <link rel="stylesheet" href="<%=basePath%>css/gx/rd.css" type="text/css"></link>          
      
       <link rel="stylesheet" href="<%=basePath%>css/gx/index.css" type="text/css"></link>
         <link rel="stylesheet" href="<%=basePath%>css/fxz/css.css" type="text/css"></link>
        
         
          </head>
    <body >
               <jsp:include page="${path}/jsp/head.jsp" flush="true"/>
    	<div class="runs" >
	

    	<div class=" left" >
    	<ol>
             <li>
             <!--
             	作者：8200069931@qq.com
             	时间：2019-06-24
             	描述：下面是视频的头  标题  类型  时间等
             -->
            
             <div style="margin-top: 30px;" class="redeoHead">
                                           
                <span><h2>${video.vname}</h2></span></br>
                <span>
                    <a href="/getvideo/getvideo?cid=${video.vcid}">${video.dmclass.cname}></a>
                    <a href="/getvideo/getvideo?cid=${video.vcid}">${video.vtag1}</a><a href="/getvideo/getvideo?cid=${video.vcid}">${video.vtag2}</a><a  href="/getvideo/getvideo?cid=${video.vcid}">${video.vtag3}</a>
                    &nbsp;&nbsp;&nbsp;${video.vtime}
                </span></br></br>
                
                <span >
                   ${video.vclick}播放&nbsp;.&nbsp${replyNumber}评论&nbsp;. ${danmusize}弹幕
                
                </span></br>
                                  
             </div>
             
             
             </li>
             <li>
             <!--
             	作者：8200069931@qq.com
             	时间：2019-06-24
             	描述：视频播放的div
             -->
             
             <div class="video">
      <jsp:include   page="barrageVideo.jsp" flush="true"/>
             
             
           
             
             
             </div></li>
             <li>
             <!--
             	作者：8200069931@qq.com
             	时间：2019-06-24
             	描述：下面写视频的描述
             -->
             <div class="synopsis"> 
             </br> </br>
                         简介:   ${video.vcontent }
             </br>
              </br>
             </div>
             
             
             </li>
  
             </li>
             <li>
             <!--
             	作者：8200069931@qq.com
             	时间：2019-06-24
             	描述：下面是所有评论加评论框
             
             -->
             <div style="margin-top: 10px;border-bottom:1px solid  #000000;height: 170px;">
              <span><h3>${replyNumber}&nbsp;评论</h3></span></br>
                  <div class="headImg"><img src="../img/touxiang.jpg" /></div>   <!-- 我的头像 -->
                    <div class="textarea "><textarea class="replytextarea" rows="4" cols="119"></textarea>   
                    </div>
                            <button type="button" class=" button videoReply">发送评论</button>
            
             </div> 
                    
             </li>
             
                        
            <li>
                <!--
            	作者：8200069931@qq.com
            	时间：2019-06-24
            	描述：导入评论页面
            
            -->
            <div class="loadDiv"> 
            <jsp:include   page="commentTwo.jsp" flush="true"/>
           
              </div>
               <div id="demo1"></div>
        
           
            </li>
                	<div style="clear: both; margin-left: 0px;">
              </br></br></br> 
                   <div >
              
                    <div class="headImg"><a href="/common/video"><img src="../img/touxiang.jpg" /></a></div>   <!-- 我的头像 -->
                    <div class="textarea"><textarea class="replytextarea2   " rows="4" cols="119"></textarea>   
                    </div>
                            <button type="button" class=" button videoReply2">发送评论</button>
            
             </div> 
             </br></br></br>
            </div>
            
            
        </ol>
    	
    	
    	</div>
    	<div class=" right"  >
    		<ol><li>
    	<!--
        	作者：8200069931@qq.com
        	时间：2019-06-24
        	描述：作者信息
        -->
    	<div class="author">
    	<div class="headImg3">
       <a href="/common/othervideo?uid=${video.vuid}"><img src=" ../img/touxiang.jpg"/></a>
    	
    	</div>
    	<div style="margin-left: 55px;" ><span style="font-size:19px;">
    	<a style="color:#f8d5ce"  href="/common/othervideo?uid=${video.vuid}" ><h6>${video.use.unname}</a>
    	
    	&nbsp;&nbsp;&nbsp;
    	 </h6>
    	 
    	 </span>
    	<span><h6>简介:${video.use.usatement}</h6></span>
    	
    	</div>
    	<button style="width: 135px"   type="button" class="layui-btn layui-btn-sm addButten dmattBut" >&nbsp;&nbsp;&nbsp;<span class="dmatt"></span>&nbsp;<span class="dmattNum">${allDmres}</span>&nbsp;&nbsp;&nbsp;</button>
    	<button style="width: 135px"   type="button" class="layui-btn layui-btn-sm addButten dmcollBut" >&nbsp;&nbsp;&nbsp;<span class="dmcoll"></span>&nbsp;<span class="dmcollNum">${dmresb}</span>&nbsp;&nbsp;&nbsp;</button>
    	
    	</div>    	
    	</li>
    	




                <!--
                    作者：8200069931@qq.com
                    时间：2019-06-25
                    描述：下面是猜你喜欢
                -->
    		
    		<li>
    		<span><h3>猜你喜欢</h3></span></br>
    	<c:forEach items="${videoa}" end="5" var="videoa">
    	
    		<div class="videos" style="width: 360px; height: 100px;">
    		<div style="float: left;"> <a href="/video/video?vid=${videoa.vid}"><img  style="width: 100px; height: 100px;" src="http://localhost:8082//fileserver/${videC.vphoto}${videoa.vphoto}" /></a></div>
    	        <div style="width : 248px;margin-left: 100px;">
    	        <div style="height:60px;font-size:19px;"> <a href="/video/video?vid=${videoa.vid}">${videoa.vname}</a></div>
    	       <div style="height: 10px;"> <span><h6><a hred="/common/othervideo?uid=${videoa.vuid}">作者:${videoa.use.unname}</a></h6></span></div>
    	        <span><h6>${videoa.vclick}播放&nbsp;</h6></span>
    	        </div> 
    	          
    		</div>
    		</br>
    </c:forEach>
    		
    		</li>
    		
    		
    		
    		
    		
    		</ol>
    		
    	</div>
    
        
  
	</div>
	       <input class="nickname" style="display:none" type="text" value="${use.uaccount}">
	       <input class="unname" style="display:none" type="text" value="${use.unname}">
	       <input class="uphoto" style="display:none" type="text" value="${use.uphoto}">
	       <input class="VideoUrl" style="display:none" type="text" value="${video.vurl}">
	        <input class="Title" style="display:none" type="text" value="${video.vname}">
           
 	</body>
 	<script type="text/javascript">
 	
 	layui.use(['laypage', 'layer'], function(){
 		  var laypage = layui.laypage
 		  ,layer = layui.layer;
 		  
 		var AllPag=${replySize};
 		  
 		  //总页数大于页码总数
 		    laypage.render({
 		    elem: 'demo1'
 		    ,count: AllPag//数据总数
 		    ,limit: 5    //每页个数
 		    ,curr: 1  //默认页数
 		    ,jump: function(obj)
 		                     //回调函数
 		    {	
 		  //   alert(obj.curr);
 		  	   $.ajax({
 		          type: "POST",
 		          url: "<%=basePath%>/pages/replyPage",
 		          data: {"page":obj.curr,   
 		          },
 		          dataType: "text",
 		          success: function(data){
 		        	  
 		        	 obj.curr=data;
 		        	  $(".loadDiv").load("<%=basePath%>/video/comment")	
 		        	  
 		          
 		        	  
 		        	}   
 		      });    
 		    }
 		  });
 		});
 	
 	
 	
 	
 	
 	layui.use('element', function(){
 		  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
 		  
 		  //监听导航点击
 		  element.on('nav(demo)', function(elem){
 		    //console.log(elem)
 		    layer.msg(elem.text());
 		  });
 		});

  
   $(".videoReply").on("click", replys);
   
   function replys(){
	   var txtlengih= $(".replytextarea").val().length;
	  
	   var tex=$(".replytextarea").val();
	  
	  if(tex==""){
		  
		  alert("内容不能为空");
		  
	  } 

		  
	  
	  if(tex!=""){
		
		 if(txtlengih>200){
			 
			 alert("您评论字数过多");
		 }
		 else{
		  $.ajax({
	             type: "POST",
	             url: "<%=basePath%>/reply/addReply",
	             data: {"txt":tex},
	             dataType: "text",
	             success: function(data){
	            	if(data=="1"){
	            		
	            		alert("评论成功");
	            		
	            		  $(".loadDiv").load("<%=basePath%>/video/comment");	
	            	}
	            	else if(data=="-1"){
	            		
	            		alert("值不能为空");
	            	}
	            	else{
	            		alert("出了点小问题  请重新评论");
	            	}
	            	 
	            	 
	            	 
	            	 $(".replytextarea").val("");  //清空Text里面的所有内容
	                      
	                        
	                      }
	         });
		 }
	  
	  }
   }
   

   $(".videoReply2").on("click", replys2);

   function replys2(){
	   var txtlengih= $(".replytextarea2").val().length;
   	   var tex=$(".replytextarea2").val();
   	  
   	  if(tex==""){
   		  
   		  alert("内容不能为空");
   		  
   	  } 
   	  if(tex!=""){
   		if(txtlengih>200){alert("您评论的字数过多")}   
   		else{
   		  $.ajax({
   	             type: "POST",
   	             url: "<%=basePath%>/reply/addReply",
   	             data: {"txt":tex},
   	             dataType: "text",
   	             success: function(data){
   	            	if(data=="1"){
   	            	  $(".loadDiv").load("<%=basePath%>/video/comment");
   	            		alert("评论成功");
   	            		
   	            	}
                       else if(data=="-1"){
   	            		
   	            		alert("值不能为空");
   	            	}
   	            	else{
   	            		alert("出了点小问题  请重新评论");
   	            	}
   	            	 
   	            	 
   	            	 
   	            	 $(".replytextarea2").val("");  //清空Text里面的所有内容
   	                      
   	                        
   	                      }
   	         });	
   		}
   	  }   
   }
   $(".dmattBut").on("click", dmatt);
   function dmatt(){//关注按钮点击方法
	var tex= $(".dmatt").text();
  
	var Num=$(".dmattNum").text();
	var Num1=parseInt(Num);
		  $.ajax({
	             type: "POST",
	             url: "<%=basePath%>/dmatten/add",
	             data: {"txt":tex},
	             dataType: "text",
	             success: function(data){
	            if(data==-1){alert("出了点小问题")  }
	            else{
	            	if(data=="取消关注"){
	            		
	            		$(".dmattNum").html(Num1+1);
	            		
	            	}
	            	else{
	            		$(".dmattNum").html(Num1-1);
	            	}
	            	
	            	  $(".dmatt").html(data);
	            	  
	            }
	            	 
	            	 
	            	
	                      
	                        
	                      }
	         });
	   
	   
   } 
   $(".dmcollBut").on("click", dmcoll);
   function dmcoll(){            //收藏按钮点击
	   
		var tex= $(".dmcoll").text();
		  
		var Num=$(".dmcollNum").text();
		var Num1=parseInt(Num);
			  $.ajax({
		             type: "POST",
		             url: "<%=basePath%>/dmcollect/addDmcollect",
		             data: {"txt":tex},
		             dataType: "text",
		             success: function(data){
		            if(data==-1){alert("出了点小问题")  }
		            else{
		            	if(data=="取消收藏"){
		            		
		            		$(".dmcollNum").html(Num1+1);
		            		
		            	}
		            	else{
		            		$(".dmcollNum").html(Num1-1);
		            	}
		            	
		            	  $(".dmcoll").html(data);
		            	  
		            }
		            	 
		            	 
		            	
		                      
		                        
		                      }
		         });
	   
	   
	   
   }
   
   
   function dmadmc(){
	   var dmcoll=${dmcosc};
	   var dmatt=${dmresa};
	   if(dmatt==0){
		   $(".dmatt").html("关注作者");
		   
	   }
	   else{
		   
		   $(".dmatt").html("取消关注");
	   }
	   
	   if(dmcoll==0){
		   
		   $(".dmcoll").html("收藏视频");
		   
	   }
	   else{
		   
		   $(".dmcoll").html("取消收藏");
	   }
	   
   }
   
 	
 	$(function(){
 		
 		dmadmc()
 		
 		
 		
 		

 
 		//隐藏评论人的ID
 		
 	   $(".comme").hide();//聊天内容与在线人的隐藏与显示
 	   $(".member").hide();
 	   $(".buttchar").css("background-color","#D5D5D5");
 	  // $(".addButten").attr("disabled", true); 
 	  
 	});
 	$(".commentButt").click(function(){
 		$(".comme").hide();
 		$(".comme").show();
 		
 	});

 	$(".buttman").click(function(){
 		$(".charRoom").hide();
 		 $(".member").show();
 		
 		$(".buttman").css("background-color","#D5D5D5"); //变灰色
 		$(".buttchar").css("background-color","#FFFFFF");  //变白色
 	});
	$(".buttchar").click(function(){
		 $(".member").hide();
		 $(".charRoom").show();
		
		$(".buttchar").css("background-color","#D5D5D5"); //变灰色
		$(".buttman").css("background-color","#FFFFFF");  //变白色
	});
	

	

	
 	</script>
 	
</html>
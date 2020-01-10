<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
		  <link rel="stylesheet" href="../css/gx/rd.css" type="text/css"></link>  
	</head>

	<body class="col-xs-12 bgc-white">
		<div class="col-xs-10" id="clear-float">
			<div class="head">
				<!-- 导航栏 -->
				<jsp:include page="head.jsp"></jsp:include>
				<div style="height: 5px; clear:both;"></div>

			</div>

			<div class="body" style="height: 1500px;">
			<div>
				<div class="author">
    	<div class="headImg3">
       <a href="#1"><img src=" ${video.use.uphoto}"/></a>
    	
    	</div>
    	<div style="margin-left: 55px;" ><span style="font-size:19px;">
    	<a style="color:#f8d5ce"  href="#1" ><h6>${user.unname}</a>
    	
    	&nbsp;&nbsp;&nbsp;
    	
    	 
    	 </span>
    	<span><h6>简介:${user.usatement}</h6></span>
    	
    	</div>
    	<button style="width: 135px"   type="button" class="layui-btn layui-btn-sm addButten dmattBut" >&nbsp;&nbsp;&nbsp;<span class="dmatt"></span>&nbsp;<span class="dmattNum">${allDmres}</span>&nbsp;&nbsp;&nbsp;</button>
    	
    	
    	</div>   </div>   <!-- 我的头像 -->     <!-- 头像 基本信息 -->
			
			
			
			
			
				<div class="width-8e folat-l height-10e">

					<div class="layui-tab">
						<ul class="layui-tab-title">
							<li class="layui-this tiger">TA的最新视频</li> 
							
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
		   
			function dmadmc(){                    //是否关注
				  
				   var dmatt=${dmres};
				   
				   if(dmatt==0){
					  
					   $(".dmatt").html("关注作者");
					   
				   }
				   else{
					
					   $(".dmatt").html("取消关注");
				   }
				   
				
				   
			}
		
		
		$(function(){
			dmadmc()

			
			
			
		})
		
	</script>

</html>
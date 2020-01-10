<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>



<div class="left" >

<!-- 

循环遍历开始
 -->
<c:forEach items="${reply}" end="5" var="commentsas">
<div class="coome" style=" border-bottom:1px solid saddlebrown;float: left; margin-left:-47px; width: 100%">
 <div style=" float:right; margin-top: 10px; margin-right: 10px;">
               <span class="showId" style="display: none;">${commentsas.cid}</span><button type="button" class="commentButt ids butt">评论</button>
               
               
               </div>
 <!-- 
 ids 视频评论的唯一主ID
 id 被评论的ID
  -->                                                                   
<div class="headImg2" ><a href="/common/othervideo?${commentsas.use.uid}"><img src="../img/touxiang.jpg" /></a></div>
<div style="float: left;" class="bodys">  
<div> 

    <span style="font-size:18px;height: 40px"><a style="color:#a67268" href="/common/othervideo?${commentsas.use.uid}">${commentsas.use.unname}</a></span>
    <span><h4>${commentsas.ccontent}</h4></span>
    <span style="font-size: 13px">&nbsp;${commentsas.ctime}</span>
 </div>  
 <c:forEach items="${commentsas.comment}"  var="comment">
    <div class="reply" style="margin-top: 10px">
    <div class="headImg3" ><a href="/common/othervideo?${comment.use.uid}"><img src="../img/touxiang.jpg" /></a></div>
     <div style="height: 40px;margin-left: 55px;margin-top: 25px">
     <span style="font-size: 15px "><a href="/common/othervideo?${comment.use.uid}" style="color:#ef973c">${comment.use.unname}</a></span>:<span >${comment.ccontent}</span></br>
      <span style="font-size: 13px">&nbsp;${comment.ctime}</span>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
     </div> 
    </br>
    
    </div>  
  </c:forEach>
     
    
     
</div>
<div style="clear: both; margin-left: -10px"class="replys  ${commentsas.cid}">

                  <div style="margin-top: 10px;height: 100px;">
                   <div class="headImg"><a href="/common/video"><img src="../img/touxiang.jpg" /></a></div>
                    <div class="textarea"><textarea class="replysb${commentsas.cid}" rows="4" cols="119"></textarea>   
                    </div>
                            <button type="button" class=" button replysab">发送评论</button><input style="display:none"  type="text" value="${commentsas.cid}">
            
             </div> 
             
</div>
 




</div>

</c:forEach>

<!-- 
循环遍历结束

 -->

 



</div>



</body>
<script type="text/javascript">

$(".commentButt").click(function(){
	var tex=$(this).prev().html();
	
	$(".replys").hide();
	$("."+tex+"").show();
	
	
});

$(function(){
//	dmadmc();
		
    $(".replys").hide();
    $(".showId").hide();
	$(".replys").hide();
	
})

	
//	var shows="."+$(this).prev().text();
//	$(shows).show();



$(".replysab").click(function(){
	 var txtlengih= $(this).next().val().length;     
	var txt=$(this).next().val();
	var con=$(".replysb"+txt+"").val();
	
	if(con==""){
		
		alert("内容不为空")
	}
	else{  
		if(txtlengih>50){alert("您评论的字数过多")}
		else{
		  $.ajax({
	          type: "POST",
	          url: "<%=basePath%>/reply/ReplyPuls",
	          data: {"txt":txt, 
	        	      "cont":con
	          },
	          dataType: "text",
	          success: function(data){
	              if(data==-1){
	            	  alert("值不能为空");
	            	  
	              }
	              else if(data==0){ alert("评论失败");  }
	              else{ alert("评论成功")  
	            	  $(".loadDiv").load("<%=basePath%>/video/comment");
	            	  var con=$(".replysb"+txt+"").val("");
	              
	              
	              }
	        	  
	        	  
	        	
	                   }
	      });
		}
	}
	
	
	
	
	
})







</script>
</html>
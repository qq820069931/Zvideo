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
<script type="text/javascript" src="../publicUtil/jquery-3.2.1.min.js"></script>






</head>
</head>
<body>
                  <div>
                   <form action=""> 
                   <input type="file"><span>请选择你的头像</span>
                   </form></br>
                   <form action="<%=basePath%>/dataup/data" id="dataUps"  method="post">
                   <input type="text" value="sssss" name="uname" class="uname"><span>你的名字</span></br></br>
                   <input type="text" value="sss" name="unname" class="unname"><span>你的昵称</span></br></br>
                   <input style="height: 20px;width: 250px" type="text" value="ssss" name="usatement" class="usatement"><span>你的简介</span></br></br>
                   <input type="text" value="sss" name="uemail" class="uemail"><span>你的邮箱</span> 
                   </form></br></br>
                  
                  <button class="dataUp">提交</button>
                  </div>


</body>
<script type="text/javascript">

function uodate(){
	var name=$(".uname").val();
	
	if(name==""){
		alert("名字不能为空");
		
		
	}
	else{
		if($(".unname").val()==""){
			alert("昵称不能为空");
		}
		else{
			
			if($(".uemail").val()==""){
				
				alert("邮箱不能为空")
			}
			else{
				$("#dataUps").submit();
				
			}
			
		}
		
	}
	
	
	
};

$(".dataUp").on("click", uodate);
	
</script>


</html>
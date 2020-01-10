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
	  <meta name="renderer" content="webkit">
	  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>电影信息</title>
    
	<link href="${path}/publicUtil/layui/css/modules/laydate/default/laydate.css" rel="stylesheet" type="text/css" />
	
	
	<link rel="stylesheet" href="${path}/publicUtil/layui/css/layui.css"  media="all">

    <script src="${path}/publicUtil/layui/layui.js" type="text/javascript" charset="utf-8"></script>
     
	<script type="text/javascript" src="../publicUtil/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		
	$(document).ready(function() {
		
			$("input[name=movieType]").on("change",function(){
				
				var content = "";
				
				$(this).parent().find("input:checked[name=movieType]").each(function(index,obj){
					//console.log(index+"--"+obj.value);
					content+=(obj.value+",");
				});
				content = content.substring(0,content.length-1);
				
				//console.log(content);
				
				$(this).parent().find("input[name=check-movietype]").val(content);
				
				return false;
			});
			
			
			
			$(".save").on("click",function(){
				
				$tr = $(this).parents("tr");
				//alert($tr[0]);
				
				//文件名
				var filename = $tr.find("#filename").text();
				//alert(filename);
				
				//简介
				var introduce = $tr.find("textarea[name=movie-introduce]").val();
				//console.log(introduce);
				
				//时间
				//alert(timeTag);
				
				//类型
				var movietypes = $tr.find("input[name=check-movietype]").val();
				//console.log(movietypes);
				
				//地区
				var country = $tr.find("option:selected").text();
				//console.log(country);
				//alert(country);
				
				//封面地址
				//alert(photoUrl);
				
				if(introduce=="" || timeTag==null || movietypes=="" || country=="请选择" || photoUrl==null) {
					layer.alert("请将信息填写完整",{title: "提示"});
				} else{
					//发送ajax请求
					$.post(
						"${path}/upload/addMovieInfo",
						{"filename":filename,"introduce":introduce,"timeTag":timeTag,"movietypes":movietypes,"country":country,"photoUrl":photoUrl},
						
						function(data){
							//console.log(data);
							$tr.remove();
							layer.msg("保存成功！");
						},
						"json"
					);
				}
				return false;	
			});
			
			$(".exit").click(function() {
				window.open("${path}/admin/showAdminIndex","_self");
			});
			
		});
		
/* 		function exit() {
			window.open("${path}/admin/showAdminIndex");
		} */
		
		
		
	</script>

  </head>
  
  <body>
    	<div class="layui-upload"> 
		  <div class="layui-upload-list">
		    <table class="layui-table" id="test">
		    
		      <thead>
		        <tr align="center">
		        	<td>编号</td>
			        <td>文件名</td>
			        <td>简介</td>
			        <td>时间</td>
			        <td>类型</td>
			        <td>地区</td>
			        <td>封面</td>
			        <td>操作</td>
		      	</tr>
		      </thead>
		      <tbody>
		      
      	       	<c:forEach items="${uploadFiles}" var="uploadfile" varStatus="statu">
     			  
		       		<tr align="center">
		       			<form class="layui-form" onsubmit="return submitform(this)">
						
		       			<td>${statu.index+1}</td>
		       			<td id="filename">${uploadfile.value.vname}</td>
		       			
		       			<td>
		       				<div class="layui-inline">
							  <div class="layui-input-inline">
		       					<textarea name="movie-introduce" required lay-verify="required" placeholder="请输入" class="layui-textarea"></textarea>
		       				 </div>
							</div>
		       			</td>
		       			<td>
					       <!--  <input type="text" class="layui-input" id="test1" placeholder="yyyy-MM-dd"> -->
					           <div class="layui-inline">
							      <div class="layui-input-inline">
							       <%--  <input type="text" name="date" id="date${statu.index}" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input"> --%>
							        <input type="text" name="date" class="layui-input" id="date${statu.index}" placeholder="yyyy" autocomplete="off">
							      </div>
							    </div>
		       			</td>
		       			<td>
		       			  <div class="layui-form-item">
		       			  
		       			  	  <input type="hidden" name="check-movietype"/>
						    <!-- <div class="layui-input-block"> -->
	       				      <input type="checkbox" name="movieType" value="剧情">剧情
						      <input type="checkbox" name="movieType" value="喜剧">喜剧
						      <input type="checkbox" name="movieType" value="动作">动作
						      <input type="checkbox" name="movieType" value="爱情">爱情<br>
						      <input type="checkbox" name="movieType" value="惊悚">惊悚
						      <input type="checkbox" name="movieType" value="犯罪">犯罪
						      <input type="checkbox" name="movieType" value="悬疑">悬疑
						      <input type="checkbox" name="movieType" value="战争">战争<br>
						      <input type="checkbox" name="movieType" value="科幻">科幻
						      <input type="checkbox" name="movieType" value="动画">动画
						      <input type="checkbox" name="movieType" value="恐怖">恐怖
						      <input type="checkbox" name="movieType" value="冒险">冒险<br>
						      <input type="checkbox" name="movieType" value="历史">历史
						      <input type="checkbox" name="movieType" value="记录">记录
						      <input type="checkbox" name="movieType" value="家庭">家庭
						      <input type="checkbox" name="movieType" value="传记">传记
						    </div>
						   <!-- </div> -->
		       			</td>
		       			<td>
		       				<select name="countries">
					          <option value="">请选择</option>
					          <option value="1">内地</option>
					          <option value="2">香港</option>
					          <option value="3">美国</option>
					          <option value="4">台湾</option>
					          <option value="5">日本</option>
					          <option value="6">韩国</option>
					          <option value="7">印度</option>
					          <option value="8">泰国</option>
					          <option value="9">英国</option>
					          <option value="10">法国</option>
					          <option value="11">意大利</option>
					          <option value="12">西班牙</option>
					          <option value="13">其他</option>
					        </select>
		       			</td>
		       			<td><div class="layui-upload">
							  <button type="button" class="layui-btn demo${statu.index}">上传图片</button>
							  <div class="layui-upload-list">
							    <img class="layui-upload-img" id="demo${statu.index}">
							    <p id="demoText${statu.index}"></p>
							  </div>
							</div> 
							
	<script type="text/javascript">
		//封面地址
		var photoUrl;
		//时间
		var timeTag; 
		
		layui.use(['upload', 'laydate','layer'], function(){
  			  var upload = layui.upload,
  			  laydate = layui.laydate
  			  ,$ = layui.jquery, 
  			  layer = layui.layer;
				
				//时间选择器
				laydate.render({
				    elem: '#date${statu.index}'
				    ,type: 'year'
	        		,done: function(value, date){
				      //layer.alert('你选择的日期是：' + value + '<br>获得的对象是' + JSON.stringify(date));
				      //var year = date.year;
				      //alert(year);
				      //var month = date.month;
				      //var date = date.date;
				      timeTag = value;
				    }
				});
			
			//图片上传
			  var uploadInst = upload.render({
			    elem: ".demo${statu.index}"
			    ,url: '${path}/upload/getPicUrl'
			    ,before: function(obj){
			    	//console.log(obj)
			      //预读本地文件示例，不支持ie8
			      obj.preview(function(index, file, result){
			      	//alert(index);
			        $("#demo${statu.index}").attr('src', result); //图片链接（base64）
			      });
			    }
			    ,done: function(res){
			      //如果上传失败
			      if(res.code > 0){
			        return layer.msg('上传失败');
			      }
			      //上传成功
			      //console.log(res);
			      $("#demoText${statu.index}").html("");
			      photoUrl = res.photoUrl;
			      //console.log(photoUrl);
			    }
			    ,error: function(){
			      //演示失败状态，并实现重传
			      var demoText = $("#demoText${statu.index}");
			      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
			      demoText.find('.demo-reload').on('click', function(){
			        uploadInst.upload();
			      });
			    }
			  
			});
			
			
			
	});
								
	</script>
							
						</td>
						<td><button class="layui-btn layui-btn-sm save">保存</button></td>
		       		 
		       		 	</form>
		       		</tr>
		       	 
		       	</c:forEach>
				       	
		      </tbody>
		    </table>
		  </div>
		</div>   <!-- onclick="exit();" -->
	<button class="layui-btn exit"  style="margin-left:50%;margin-top:15px;">退出</button>
		
  </body>
</html>

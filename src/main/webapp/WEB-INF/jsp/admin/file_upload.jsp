<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    <title>视频发布</title>
    
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	
	
	<script type="text/javascript">
	
	$(document).ready(function() {
	
	var files=[];
	layui.use('upload', function(){
		  var $ = layui.jquery
		  ,upload = layui.upload;
		  
		  //多文件列表示例
		  var demoListView = $('#demoList'),
		  uploadListIns = upload.render({
		    elem: '#testList',
		    url: '${path}/upload/uploads?cate=movie',
		    accept: 'file',
		    multiple: true,
		    auto: false,
		    bindAction: '#testListAction',
		    choose: function(obj){   
		      var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
		      //读取本地文件
		      obj.preview(function(index, file, result){
		        var tr = $(['<tr id="upload-'+ index +'">'
		          ,'<td>'+ file.name +'</td>'
		          ,'<td>'+ (file.size/1014).toFixed(1) +'kb</td>'
		          ,'<td>等待上传</td>'
		          ,'<td>'
		            ,'<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>'
		            ,'<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>'
		          ,'</td>'
		        ,'</tr>'].join(''));
		        
		        
		        //单个重传
		        tr.find('.demo-reload').on('click', function(){
		          obj.upload(index, file);
		        });
		        
		        //删除
		        tr.find('.demo-delete').on('click', function(){
		          delete files[index]; //删除对应的文件
		          tr.remove();
		          uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
		        });
		        demoListView.append(tr);
		      });
		    }
		    ,done: function(res, index, upload){
		    	//alert(res.code);
		      if(res.code == 0){ //上传成功
		      
		      	files.push({"fileName":res.fileName,"fileUrl":res.fileUrl,"fileSize":res.fileSize});//,"photoUrl":res.photoUrl
                var json = JSON.stringify(files);
                //将上传的文件信息加入到集合中并转换成json字符串
                $("#fileJson").attr("value", json);
 				var fileUrl=res.fileUrl;
		      	
		        var tr = demoListView.find('tr#upload-'+ index)
		        ,tds = tr.children();
		        tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
		        tds.eq(3).html(''); //清空操作
		        $("#testListAction").html('编辑');
		        $("#testListAction").click(function() {
		        	window.open('${path}/upload/showMovieInfo','_self');
		        });
		        return delete this.files[index]; //删除文件队列已经上传成功的文件
		        
		      }
		      this.error(index, upload);
		    }
		    ,error: function(index, upload){
		      var tr = demoListView.find('tr#upload-'+ index)
		      ,tds = tr.children();
		      tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
		      tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
		    }
		    
		  });
		  
		  
		  //图片上传
/* 		    var uploadInst = upload.render({
			    elem: '#test1'
			    ,url: ''
			    ,before: function(obj){
			      //预读本地文件示例，不支持ie8
			      obj.preview(function(index, file, result){
			        $('#demo1').attr('src', result); //图片链接（base64）
			      });
			    }
			    ,done: function(res){
			      //如果上传失败
			      if(res.code > 0){
			        return layer.msg('上传失败');
			      }
			      //上传成功
			    }
			    ,error: function(){
			      //演示失败状态，并实现重传
			      var demoText = $('#demoText');
			      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
			      demoText.find('.demo-reload').on('click', function(){
			        uploadInst.upload();
			      });
			    }
			  }); */
		  
		});
		
  });
  
  			
		function getPicUrl() {
			//window.location.href='${path}/admin/showAdminInfo';
			//target = '_blank';
			window.open('${path}/upload/showMovieInfo','_blank');
			
		}
  
	</script>

	
  </head>
  
  <body>
<%--   	 <form action="${path}/upload/uploads.action" method="post" enctype="multipart/form-data">
    	<input type="file" name="uploadfiles"><br/>
    	<input type="file" name="uploadfiles"><br/>
    	<input type="file" name="uploadfiles"><br/>
    	<button type="button" class="layui-btn" id="upload">
    		<i class="layui-icon"></i>上传文件
    	</button>
    </form> --%>
    
	
	    <div class="layui-upload">
		  <button type="button" class="layui-btn layui-btn-normal" id="testList">选择多文件</button> 
		  <div class="layui-upload-list">
		    <table class="layui-table">
		      <thead>
		        <tr align="center">
			        <td>文件名</td>
			        <td>大小</td>
			        <td>状态</td>
			        <td>操作</td>
		      	</tr>
		      </thead>
		      <tbody id="demoList"></tbody>
		    </table>
		  </div>
		  <button type="button" class="layui-btn" id="testListAction">开始上传</button> <!-- onclick="getPicUrl();" -->
		</div>
		
<!-- 		<div class="layui-upload"><button type="button" class="layui-btn" id="test1">上传图片</button><div class="layui-upload-list"><img class="layui-upload-img" id="demo1"><p id="demoText"></p></div></div>
 -->  
 </body>
</html>

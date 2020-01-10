<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="../publicUtil/jquery-3.2.1.min.js"></script>
    </head>
    <body>
    	
    	
								<div class="layui-upload-drag" id="uploadDemo">
									<i class="layui-icon"></i>
									<p>点击上传视频，或将文件拖拽到此处</p>
								</div>

								<div class="layui-upload-drag" id="uploadDemo1">
									<i class="layui-icon"></i>
									<p>点击上传视频封面，或将文件拖拽到此处</p>
								</div>
								<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
									<legend>作品上传区</legend>
								</fieldset>
							<form class="layui-form" 
    						action="/uploades/uploadone" method="post" >
								<div class="layui-form-item">
									<label class="layui-form-label">作品名称</label>
									<div class="layui-input-block">
										<input type="text" name="vname" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">

									<div class="layui-inline">
										<label class="layui-form-label">视频板块</label>
										<div class="layui-input-inline">
										<input type="hidden" name="vcid" id="vcid" />
											<select id="option" lay-filter="leibie">
												<option value="C102" id="bk">科普</option>
												<option value="C103" id="bk">游戏</option>
												<option value="C104" id="bk">鬼畜</option>
											</select>
										</div>
										
										
    									</div> 
									</div>
								
								<div style="display:none">
									<input name="vuid" value="${user.uid}" />
									<input name="vclick" value="1" />
									<input name="vphoto" value="1" />
								</div>
								
								<input name="vurl" type="hidden" value="1" />
								
								<div class="layui-form-item layui-form-text">
								<label class="layui-form-label">类型</label>
								<div class="layui-input-inline">
  										
  										<input name="vtag1" id="val1" type="checkbox" value="科学" /><span id="a">科学</span>
  										<input name="vtag2" id="val2" type="checkbox" value="文史" /><span id="b">文史</span>
  										<input name="vtag3" id="val3" type="checkbox" value="生活" /><span id="c">生活</span>
  										
								</div>
								</div>
								
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">作品内容</label>
									<div class="layui-input-block">
										<textarea placeholder="请输入内容" name="vcontent" class="layui-textarea"></textarea>
									</div>
								</div>

								<div class="layui-form-item">
									<div class="layui-input-block">
										<button id="butdemo1" class="layui-btn" lay-submit="" lay-filter="demo1">上传</button>
										<button type="reset" class="layui-btn layui-btn-primary">重置</button>
									</div>
								</div>
							</form>
 	</body>
 	<script type="text/javascript">
 	//alert(1);
 	layui.use(['form','upload'], function(){
  		var form = layui.form
  		,upload = layui.upload;
  		//各种基于事件的操作，下面会有进一步介绍
  		//alert(2);
  		
  		form.on('select(leibie)', function(data){
  			var vc = data.value;
  			
  			
  			if(data.value == 'C102'){
  			$("#vcid").val("C102");
  				$("#val1").val("科学");
				$("#a").text("科学");
  				$("#val2").val("文史");
  				$("#b").text.text("文史");
  				$("#val3").val("生活");
  				$("#c").text("生活");
  				
  			}else if(data.value == 'C103'){
  			$("#vcid").val("C103");
  				$("#val1").val("网络游戏");
				$("#a").text("网络游戏");
  				$("#val2").val("单机游戏");
  				$("#b").text("单机游戏");
  				$("#val3").val("手机游戏");
  				$("#c").text("手机游戏");
  				
  			}else if(data.value == 'C104'){
  			$("#vcid").val("C104");
  				$("#val1").val("原创");
				$("#a").text("原创");
  				$("#val2").val("明星");
  				$("#b").text("明星");
  				$("#val3").val("搞笑");
  				$("#c").text("搞笑");
  			}
		});
		
		
		//上传视频
				upload.render({
					elem: '#uploadDemo',
					accept: 'file',
					size: 0,
					url: '${path}/uploades/uploades' //上传接口
						,
					done: function(res) {
						alert("上传成功!");
						
						
						$("input[name=vurl] ").val(res.path);
					}
				});

				//上传图片
				upload.render({
					elem: '#uploadDemo1',
					url: '${path}/uploades/uploadimage' //上传接口
						,
					done: function(res) {
						console.log(res)
						alert("上传成功!");
						
						$("input[name=vphoto] ").val(res.path);
					}
				});
				
				
	});
 		
 	</script>
</html>
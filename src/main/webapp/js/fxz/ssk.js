		
		
		var xmlHttp;
    	//1.获得用户输入内容的关联信息的函数
    	function getMoreContents(){
	    	//首先获得用户输入
	    	var content = document.getElementById("keyword");
	    	//alert(content);
	    	if(content.value == ""){
	    		//当输入框为空时，清空之前的数据
	    		clearContent();
	    		return;
	    	}
	    	//alert(content.value);
	    	//给服务器发送用户输入的内容,ajax异步发送数据
	    	//xmlHttp = 获得xmlHttp对象;
			xmlHttp = createXMLHttp();  
			//alert(xmlHttp);  	
	    	var url = "${path}/index/ajax?keyword="+escape(content.value);
	    	//true表示JavaScript脚本会在send()方法之后继续执行，而不会等待来自服务器的响应。
	    	xmlHttp.open("GET",url,true);
	    	//xmlHttp绑定回调方法，这个回调方法会在xmlHttp状态改变的时候会被调用
	    	xmlHttp.onreadystatechange = callback;
	    	xmlHttp.send(null);
    	}
    	//获得xmlHttp对象
    	function createXMLHttp(){
    		//对于大多数浏览器都适用的
    		var xmlHttp;
    		if(window.XMLHttpRequest){
    			xmlHttp = new XMLHttpRequest();
    		}
    		//考虑浏览器的兼容性
    		if(window.ActiveXObject){
    			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
    			//如果浏览器有ActiveXObject对象，但没有Microsoft.XMLHTTP的参数
    			if(!xmlHttp){
    				xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
    			}
    		}
    		return xmlHttp;
    	}
    	//回调函数
    	function callback(){
    		//4表示完成
    		if(xmlHttp.readyState == 4){
    			//200代表服务器响应成功，404代表资源未找到，500代表服务器内部错误
    			if(xmlHttp.status == 200){
    				//交互成功，获得相应的数据，是文本格式。
    				var result = xmlHttp.responseText;
    				//解析获得的数据
    				var json = eval("("+result+")");
    				//获得这些数据之后，就可以动态的显示数据了。把这些数据展示到输入框下面。
    				//alert(json);
    				setContent(json);
    			}
    		}
    	}
    	//设置关联数据的展示，参数代表服务器传递过来的关联数据
    	function setContent(contents){
    		//清空之前的数据
    		clearContent();
    		//设置位置
    		setLocaltion();
    		//首先获得关联数据的长度，以此来确定生成多少个<tr></tr>
    		var size = contents.length;
    		//设置内容
    		for(var i =0;i < size;i++){
    			var nextNode = contents[i];//代表json数据的第i个元素
    			var tr = document.createElement("tr");
    			var td = document.createElement("td");
    			td.setAttribute("borde","0");
    			td.setAttribute("gbcolor","#FFFAFA");
    			//为td绑定两个样式（鼠标进入和鼠标移出时事件）
    			td.onmouseover = function(){
    				this.className = 'mouseOver';
    			};
    			td.onmouseout = function(){
    				this.className = 'mouseOut';
    			};
    			td.onclick = function(){
    				//这个方法实现的是，当用鼠标点击一个关联数据时，关联数据自动填充到输入框中。
    				
    			};
    			td.onmousedown = function(){
	            	//当鼠标点击一个关联数据时，自动在输入框添加数据
	            	document.getElementById("keyword").value =this.innerText;
	
	           };
	           //鼠标悬浮于关联数据上时，自动添加到输入框中
    			 /* td.onmouseover = function(){
		             this.className = 'mouseOver';
		             if(td.innerText != null)
		             document.getElementById("keyword").value =this.innerText;
				
				} */
    			//创建一个文本节点
    			var text = document.createTextNode(nextNode);
    			td.appendChild(text);
    			tr.appendChild(td);
    			document.getElementById("content_table_body").appendChild(tr);
    		}
    	}
    		//清空之前的数据
    		function clearContent(){
    			var contentTableBody = document.getElementById("content_table_body");
    			var size = contentTableBody.childNodes.length;
    			//删除时，从下往上删
    			for(var i = size-1;i>=0;i--){
    				//指定删除第i个子节点
    				contentTableBody.removeChild(contentTableBody.childNodes[i]);
    			}
    			//清除关联数据的外边框
    			var popDiv = document.getElementById("popDiv").style.border="none";
    		
    		}
    		//当输入框失去焦点时，清空之前的数据
    		function keywordBlur(){
    			clearContent();
    		}
    		//设置显示关联信息的位置
    		function setLocaltion(){
    			//关联信息的显示位置要和输入框一致
    			var content = document.getElementById("keyword");
    			var width = content.offsetWidth;//输入框的长度
    			var left = content["offsetLeft"];//到左边框的距离
    			var top = content["offsetTop"]+content.offsetHeight;//到顶部的距离(加上输入框本身的高度)
    			//获得显示数据的div
    			var popDiv = document.getElementById("popDiv");
    			popDiv.style.border = "gray 1px solid";
    			popDiv.style.left = left+"px";
    			popDiv.style.top = top+"px";
    			popDiv.style.width = width+"px";
    			document.getElementById("content-table").style.width = width+"px";
    		}
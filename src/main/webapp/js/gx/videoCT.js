'use strict';
function getUrlParam(name) {
 	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
 	var r = window.location.search.substr(1).match(reg); //匹配目标参数
 	if (r != null) return unescape(r[2]); return null; //返回参数值
 	}
var nickname;
var roomid;
var $videoCt;
var doocom;//unname
var uphoto;//头像
var VideoUrl;
var Tlile;
 	$(function(){
alert()
 		Tlile=$(".Title").val();   //视频标题
 		
 		
 		VideoUrl=$(".VideoUrl").val();  //视频url
        alert(VideoUrl);
 	    //初始化
 	    var video = $('#video1').videoCt({
 	        title: Tlile,              //标题
 	        volume: 0.2,                //音量
 	        barrage: true,              //弹幕开关
 	        comment: true,              //弹幕
 	        reversal: true,             //镜像翻转
 	        playSpeed: true,            //播放速度
 	        update: true,               //下载
 	        autoplay: false,            //自动播放
            //https://blz-videos.nosdn.127.net/1/OverWatch/OVR-S03_E03_McCree_REUNION_zhCN_1080P_mb78.mp4  http://localhost:8082//fileserver/"+VideoUrl+""
 	        clarity: {
 	            type: ['360P','480P'],            //清晰度
 	            src: ["https://blz-videos.nosdn.127.net/1/OverWatch/OVR-S03_E03_McCree_REUNION_zhCN_1080P_mb78.mp4"              ,
 	                  "https://blz-videos.nosdn.127.net/1/OverWatch/OVR-S03_E03_McCree_REUNION_zhCN_1080P_mb78.mp4"  ]     //链接地址
 	        },

 	    });

 	    //扩展
 	    video.title;                    //标题
 	    video.status;                   //状态
 	    video.currentTime;              //当前时长
 	    video.duration;                 //总时长
 	    video.volume;                   //音量
 	    video.clarityType;              //清晰度
 	    video.claritySrc;               //链接地址
 	    video.fullScreen;               //全屏
 	    video.reversal;                 //镜像翻转
 	    video.playSpeed;                //播放速度
 	    video.cutover;                  //切换下个视频是否自动播放
 	    video.commentTitle;             //弹幕标题
 	    video.commentId;                //弹幕id
 	    video.commentClass;             //弹幕类型
 	    video.commentSwitch;            //弹幕是否打开
 	    $('#video1').bind('ended', function() {
 	        console.log('弹幕json数据：\n'+ video.comment());              //获取弹幕json数据
 	    });
 		
 		//var roomid=$(".roomid").html();//房间名
 		 roomid =getUrlParam("vid");
 		
 		 doocom=$(".unname").val();   //昵称
 		 nickname = $(".nickname").val();  //唯一id
 		uphoto=$(".uphoto").val();   //头像
 		 
 			
 			//$(".uname").html();//自己的昵称
 		var flag = "join";
 		var info = flag + "|" +roomid + "|" +nickname;
 		//建立一条与服务器之间的连接
 		var socket = new WebSocket('ws://localhost:8082/websocket/'+info);
 		
 		var text = "";
 		var welcome = JSON.stringify({			//加入房间时的欢迎消息
 							nickname:nickname,    //用户名
 							content:text,		//消息内容
 							vidoocom:doocom,
 							uphoto:uphoto,    //头像
 							target:roomid,		//推送到目标房间
 							flag:"chatroom"});	//推送标识
 							
 		var exitroom = JSON.stringify({		//退出房间
 			nickname:nickname,
 			flag:"exitroom",
 			roomid:roomid
 		})
 		//接收服务器的消息
 		socket.onmessage=function(ev){
 			var obj = eval(   '('+ev.data+')' );
 			//alert(obj.content);
 			//aa(obj.content)
 			
 			
 			// $('.video-comment span').off('click').on('click', aa(obj.content));
 			addMessage(obj)
 		};
 		//当服务端执行onopen后触发此方法
 		socket.onopen = function(){
 			socket.send(welcome); 
 		};
 		//发送按钮被点击时
 		$(".ensure button").click(function(){
 		
 		    ensure();
 		    
 	    });
 		
 		$("body").keyup(function (event) {//监听回车键
 			if (event.keyCode == "13") {//keyCode=13是回车键
 				$(".ensure button").trigger("click");
 			}
 		});
 		
 		function ensure(){
 			
 			//获取输入框的内容
 		    var txt = $(".commentInput").val()
 		   
 			if(txt==''){
 				  alert("不能发送空内容")
 			}else{
 		    	//构建一个标准格式的JSON对象
 		    	var obj = JSON.stringify({
 			    		nickname:nickname,    //用户名
 						content:txt,		//消息内容
 						vidoocom:doocom,
 						uphoto:uphoto,    //头像
 						flag:'chatroom',			//标识--chatroom代表是聊天室的消息
 						target:roomid	//消息推送的目的地
 					});	
 		        // 向服务器发送消息
 		        socket.send(obj);
 		     	// 清空消息输入框
 		        $(".center-input").val("")
 		        // 消息输入框获取焦点
 		        $(".center-input").focus(); 
 			}
 		}
 		
 		function addMessage(msg){
 			//alert(msg.phot);  得到照片url
 			if(msg.isSelf&&msg.content==""){ //该消息是自己发送的，并且内容为空
 				$(".charRoom").append("<div class='welcome'>欢迎你加入群聊</div>");
 				
 				refreshMember(msg.uname);  //刷新成员 
 			}
 			if(!msg.isSelf&&msg.content==""){//该消息是别人发送的，并且内容为空
 				$(".charRoom").append("<div class='welcome'>欢迎"+msg.vidoocom+"加入群聊</div>");
 				//刷新成员列表
 				refreshMember(msg.uname)
 			} 
 			if(!msg.content==""){			//内容不为空时 
 				var align;
 				if(msg.isSelf){
 					align = "right";
 				}else{
 					align = "left";
 				}
 				
 				bb(msg.content);
 				$(".charRoom").append(
 						"<div class='basicInfo' style=float:"+align+">"+
 						"<div class='basicInfo-left' style=float:"+align+">"+
 						  "<a hred='/common/othervideo?uid="+msg.uid+"' >"+                 //<a hred="/common/othervideo?uid=${videoa.vuid}">作者:${videoa.use.unname}</a>
 							"<img src='../img/touxiang.jpg'/>"+           //头像
 							""+
 						"</div>"+                               
 						"<div class='basicInfo-right' style=float:"+align+">"+
 							"<div class='username' style=text-align:"+align+">"+
 								"<span style=font-size:10px>"+msg.vidoocom+"</span>&nbsp;"+   //名字
 								"<span>"+msg.date+"</span>"+                 //当前时间
 							"</div>"+
 							"<div class='context'>"+
 								"<span>"
 								+msg.content+                        //内容
 								"</span>"+
 							"</div>"+
 						"</div>"+
 					"</div>"
 				); 
 			}
 			if(msg.flag == "exitroom"){		//退出房间
 				$(".center-info").append("<div class='welcome'>"+msg.message+"</div>");
 				//刷新成员列表
 				refreshMember(msg.uname)
 			}
 			
 		}

 		$("a").click(function(){			//退出房间
 			socket.send(exitroom); //向服务器发送退出房间的信号
 		
 		})
 		
 		function refreshMember(data){
 			$(".member").html("");
 			var c=$("#number").html(data.length);
 			
 			for(var i=0;i<data.length;i++){
 			//	data[i].uphoto  
 				$(".member").append(
 					"<div class='memberInfo'>"+                                //  //<a hred="/common/othervideo?uid=${videoa.vuid}">作者:${videoa.use.unname}</a>
 						"<div class='userpic'>"+
 						"<a hred='/common/othervideo?uid="+data[i].uid+"'>"+
 							"<img src='../img/touxiang.jpg'/>"+                //头像的url
 							"</a>"+
 						"</div>"+
 						"<span class='username'>"+data[i].unname+"</span>"+  //得到昵称
 					"</div>"
 				)
 			}
 		}
 	   function  aa() {
         	   ensure();
               var $that = $('.video-comment');
              
                    $that.find('.setBox').fadeOut();
                    $that.removeClass('commentActive');
                    var name = parseInt($videoCt[0].currentTime) + 1,
                   action = $that.find('input[name=action]:checked').val(),
                   speed = $that.find('input[name=speed]').val(),
                   color = $that.find('input[type=color]').val(),
                   top = $that.find('input[name=top]').val(),
                   fontSize = $that.find('input[name=fontSize]').val(),
                   word = $that.find('input[type=text]').val();
                   
              // word=txt;
                   
               
               var cons='<p name='+ name +' class="screenShoot" data-status="0" data-action='+ action +' data-speed='+ speed +' style="color: '+ color +';top: '+ top +'%;font-size: '+ fontSize +'px">'+ word +'</p>'
               $('.screenShootBox').append(cons);
               $(".center-info").append(cons);
              // addMessage();
             
               $('.video-comment input[type=text]').val("");
              
             
		};
		
	 	   function  bb(txt) {
         	   
               var $that = $('.video-comment');
              
                    $that.find('.setBox').fadeOut();
                    $that.removeClass('commentActive');
                    var name = parseInt($videoCt[0].currentTime) + 1,
                   action = $that.find('input[name=action]:checked').val(),
                   speed = $that.find('input[name=speed]').val(),
                   color = $that.find('input[type=color]').val(),
                   top = $that.find('input[name=top]').val(),
                   fontSize = $that.find('input[name=fontSize]').val(),
                 //  word = $that.find('input[type=text]').val();
                   
               word=txt;
                   
               
               var cons='<p name='+ name +' class="screenShoot" data-status="0" data-action='+ action +' data-speed='+ speed +' style="color: '+ color +';top: '+ top +'%;font-size: '+ fontSize +'px">'+ word +'</p>'
               $('.screenShootBox').append(cons);
               $(".center-info").append(cons);
              // addMessage();
             
               $('.video-comment input[type=text]').val("");
              
             
		};

		 $('.video-comment span').on("click", aa);
 		
 	}) ;

	
	
	
	
$.fn.videoCt = function (options) {

    //设置默认值
    var defaults = {
        title: '',
        volume: 0.2,
        barrage: false,
        comment: false,
        reversal: false,
        playSpeed: false,
        update: false,
        autoplay: false,
        clarity: {
            type: [],
            src: []
        },
        theme: 'blue',
        commentFile: 'comment.json'
    };
    var opts = $.extend({},defaults, options);
    var intOpts = {
        title: '',
        status: false,
        currentTime: '0.00001',
        duration: '',
        volume: '',
        clarityType: '',
        claritySrc: '',
        fullScreen: false,
        reversal: false,
        playSpeed: 1,
        cutover: true,
        commentTitle: '',
        commentId: '',
        commentClass: '',
        comment: {},
        commentSwitch: true,
    };

    // 控件结构
     $videoCt = $(this);
   
    var $videoCtBox = $('<div></div>').addClass('video-player').addClass(opts.theme);
    var $videoCtControls = $('<div class="video-controls">\
                                <!--进度条-->\
                                <div class="video-seek">\
                                    <div class="seek-buffer"></div>\
                                    <div class="seek-con"></div>\
                                    <div class="seek-slider"></div>\
                                    <div class="viewBox">\
                                        <video></video>\
                                        <span>00:00</span>\
                                        <i></i>\
                                    </div>\
                                </div>\
                                <!--播放/暂停-->\
                                <a class="video-play" title="Play/Pause"></a>\
                                <!--计时器-->\
                                <div class="video-timer">\
                                    <span class="realTime">00:00</span>\
                                    /&nbsp;<span>00:00</span>\
                                </div>\
                                <!--音量控制-->\
                                <div class="video-audio">\
                                    <a class="audio-button" title="Mute/Unmute"></a>\
                                    <div class="audio-box">\
                                        <div class="audio-con"></div>\
                                        <div class="audio-slider"></div>\
                                    </div>\
                                </div>\
                                <!--全屏-->\
                                <div class="video-screen"></div>\
                                <div class="video-status"></div>\
                            </div>');
    $videoCt.wrap($videoCtBox);
    $videoCt.after($videoCtControls);
    $videoCt.after($('<div class="video-prompt">视频加载中。。。</div>'));
    videoDom(opts);

    var getVideoTimer;
    var comStayTimer = [];
    var comTimer = 0;
    var comStroeStatus = 0;
    var $video_container = $videoCt.parent('.video-player');
    var $videoCt_title = $('.video-title', $video_container);
    var $videoCt_play = $('.video-play', $video_container);
    var $videoCt_seek = $('.video-seek', $video_container);
    var $videoCt_timer = $('.video-timer', $video_container);
    var $videoCt_audio = $('.video-audio', $video_container);
    var $videoCt_clarity = $('.video-clarity', $video_container);
    var $videoCt_screen = $('.video-screen', $video_container);

    $videoCt.attr('src',opts.clarity.src[0]);
    $('.video-seek video').attr('src', opts.clarity.src[0]);
    intOpts.clarityType = opts.clarity.type[0];
    intOpts.claritySrc = opts.clarity.src[0];
    $videoCt_clarity.find('span').eq(0).addClass('disabled');

    var getVideoInf = function (){
        var setTimer;
        var key = true;
        if ($videoCt[0].readyState != 4 && $('.video-seek video')[0].readyState != 4) {
            $('.video-prompt').fadeOut();
            getVideoTimer = setTimeout(getVideoInf, 100);
        } else {
            $('.video-prompt').fadeOut();

            //视频播放状态
            if (intOpts.status) {
                $videoCt[0].play();
            }

            //标题
            if (!intOpts.title) {
                intOpts.title = opts.title;
            }
            $videoCt_title.text(intOpts.title);

            //载入弹幕
            if(intOpts.cutover && opts.comment){
                $.getJSON(opts.commentFile,function (data,status) {
                    if(status == 'success'){
                        $('.screenShootBox').empty();
                        intOpts.commentTitle = data.title;
                        intOpts.commentId = data.id;
                        intOpts.commentClass = data.class;
                        $.each(data.data,function (index,obj) {
                            $('.screenShootBox').append($('<p name="'+ obj.time +'" class="screenShoot" data-status="0" data-action="'+ obj.action +'" data-speed="'+ obj.speed +'" style="color: '+ obj.color +';top: '+ obj.top +'%;font-size: '+ obj.fontSize +'px">'+ obj.word +'</p>'));
                        })
                    }
                });
            }

            //进度条/暂停播放
            if (!intOpts.currentTime) {
                intOpts.currentTime = $videoCt[0].currentTime;
            }
            $videoCt[0].currentTime = intOpts.currentTime;
            if (!intOpts.duration) {
                intOpts.duration = $videoCt[0].duration;
            }
            move($('.seek-slider'), $videoCt_seek, $('.seek-con'), 8, videoJump, $('.realTime'), true);
            $('.seek-slider').css('left', intOpts.currentTime / intOpts.duration * $('.video-seek').width() - 8);
            $('.seek-con').css('width', intOpts.currentTime / intOpts.duration * $('.video-seek').width());
            $('.video-seek').hover(function () {
                key = true;
                $(document).mousemove(function(e){
                    clearTimeout(setTimer);
                    if(key){hoverPlay(e);}
                });
            },function () {
                key = false;
                clearTimeout(setTimer);
                $('.video-seek .viewBox').fadeOut();
            });

            //时间
            $videoCt_timer.find('span').eq(0).text(gTimeFormat(intOpts.currentTime));
            $videoCt_timer.find('span').eq(1).text(gTimeFormat(intOpts.duration));

            //声音
            if (!intOpts.volume) {
                intOpts.volume = opts.volume;
            }
            $videoCt[0].volume = intOpts.volume;
            $videoCt_audio.find('.audio-button').removeClass('audio-mute');
            move($('.audio-slider'), $('.audio-box'), $('.audio-con'), 6, audioJump);
            $('.audio-slider').css('left', intOpts.volume * $('.audio-box').width() - 6);
            $('.audio-con').css('width', intOpts.volume * $('.audio-box').width());
            $videoCt_audio.find('.audio-button').off('click').on('click', function () {
                $(this).toggleClass('audio-mute');
                if ($videoCt[0].volume == 0) {
                    $videoCt[0].volume = intOpts.volume;
                } else {
                    $videoCt[0].volume = 0;
                }
            })

            //弹幕
            $('.video-comment input[type=text]').off('focus').on('focus', function () {
                $('.video-comment').addClass('commentActive');
            });
            $('.video-comment p').off('click').on('click', function () {
                $('.video-comment .setBox').fadeToggle();
            });
            $('.video-comment .close').off('click').on('click', function () {
                $('.video-comment .setBox').fadeOut();
            });
            $('.video-comment input[type=color]').on('input', function () {
                var wordColor = $(this).val();
                $('.video-comment input[type=text]').css('color', wordColor);
            });

            
         
		
			
            //发送弹幕
         //  $('.video-comment span').off('click').on('click', aa);

		
            
			
            
            
            
            
            //弹幕开关
            $('.video-barrage').off('click').on('click',function () {
                if(intOpts.commentSwitch){
                    intOpts.commentSwitch = false;
                    $('.screenShootBox').fadeOut();
                    $(this).addClass('barrageClose');
                    $('.video-comment').fadeOut();
                }else{
                    intOpts.commentSwitch = true;
                    $('.screenShootBox').fadeIn();
                    $(this).removeClass('barrageClose');
                    $('.video-comment').fadeIn();
                }
            });

            //反转
            $('.video-reversal').off('click').on('click',function () {
                $videoCt.toggleClass('videoStatus');
            });

            //播放速度
            $('.video-playSpeed').off('click').on('click',function () {
                comStop();
                var value = parseFloat($(this).text().split('x').join(""));
                if(value >= 3){
                    value = 0;
                }
                value = value + 0.5;
                $videoCt[0].playbackRate = value;
                intOpts.playSpeed = value;
                $(this).text(value + 'x');
            });

            //清晰度
            $videoCt_clarity.find('span').off("click").on('click', function () {
                var ind = $(this).index();
                $videoCt_clarity.find('span').removeClass('disabled');
                $(this).addClass('disabled');
                $videoCt_clarity.find('p').text($(this).text());
                intOpts.clarityType = opts.clarity.type[ind];
                intOpts.claritySrc = opts.clarity.src[ind];
                $videoCt.attr('src', intOpts.claritySrc);
                $('.video-seek video').attr('src', intOpts.claritySrc);
                alert(intOpts.claritySrc);
                opts.autoplay = true;
                intOpts.cutover = false;
                $videoCt[0].currentTime = intOpts.currentTime;
                getVideoInf();
            })

            //下载
            $('.video-update').attr('download',intOpts.title);
            $('.video-update').attr('href',intOpts.claritySrc);

            //全屏
            $videoCt_screen.off('click').on('click', function () {
                if (intOpts.fullScreen == true) {
                    exitFullscreen();
                    $('body').removeClass('fullScreen');
                    intOpts.fullScreen = false;
                } else {
                    requestFullScreen();
                    $('body').addClass('fullScreen');
                    intOpts.fullScreen = true;
                }
                $('.seek-slider').css('left', intOpts.currentTime / intOpts.duration * $('.video-seek').width() - 8);
                $('.seek-con').css('width', intOpts.currentTime / intOpts.duration * $('.video-seek').width());
            })

        }
    }
    getVideoInf();

    //slider
    function move(slider, box, con, radius, fn, vBox, vFollow) {
        var vBox = vBox || false;
        var vFollow = vFollow || false;
        var moveStatus = false;
        var sL = slider.offset().left;
        slider.click(function(){
        }).mousedown(function(e){
            moveStatus = true;
            sL = e.pageX - parseInt(slider.css('left'));
        })
        $(document).mousemove(function(e){
            if(moveStatus){
                var diffL = e.pageX - sL;
                show(diffL);
            }
        }).mouseup(function(){
            moveStatus = false;
        });
        box.off('click').on('click',function (e) {
            var diffL = e.pageX - box.offset().left - radius;
            show(diffL);
        });
        function show(x) {
            if( x >= -1*radius && x <= parseInt(box.width() - radius)){
                slider.css('left',x);
                con.css('width',x+radius);
                if(vBox){
                    var fnIndex = $videoCt[0].duration * (x+radius)/box.width();
                    intOpts.currentTime = fnIndex;
                    comClear();
                    vBox.text(gTimeFormat(fnIndex));
                }else{
                    var fnIndex = (x+radius)/box.width();
                }
                fn(fnIndex);
            }
        }
        if(vFollow){
            //暂停播放
            var seTimer;
            var vPlay = function() {
                if(!intOpts.status) {
                    $videoCt[0].play();
                    intOpts.status = true;
                    seTimer = setInterval(function () {
                        var vprpo = $videoCt[0].currentTime/$videoCt[0].duration;
                        if(intOpts.cutover){
                            var vBTime = $videoCt[0].buffered.end(0)/$videoCt[0].duration;
                        }
                        if( vprpo < 1){
                            var tl = vprpo * (box.width() - radius);
                            var bL = vBTime * box.width();
                            intOpts.currentTime = $videoCt[0].currentTime;
                            vBox.text(gTimeFormat($videoCt[0].currentTime));
                            slider.css('left',tl);
                            con.css('width',tl+radius);
                            $('.seek-buffer').css('width',bL);
                            intStatus();
                            if($videoCt[0].duration - $videoCt[0].currentTime > 6){
                                comRun(parseInt($videoCt[0].currentTime));
                            }else{
                                comStore();
                            }
                        }else if(vprpo == 1){
                            clearInterval(seTimer);
                            intOpts.status = false;
                            return true;
                        }else{
                            clearInterval(seTimer);
                            intOpts.status = true;
                            return true;
                        }
                    },10);
                } else {
                    $videoCt[0].pause();
                    intOpts.status = false;
                    comStop();
                    clearInterval(seTimer);
                }
            };

            if((intOpts.status || intOpts.cutover) && opts.autoplay){
                intOpts.status = false;
                vPlay();
            }

            $videoCt_play.removeClass('video-pause');
            $videoCt_play.off('click').on('click',vPlay);
            $videoCt.off('click').on('click',vPlay);

            $videoCt.bind('play', function() {
                $videoCt_play.addClass('video-pause');
            });

            $videoCt.bind('pause', function() {
                $videoCt_play.removeClass('video-pause');
            });

            $videoCt.bind('ended', function() {
                $videoCt_play.removeClass('video-pause');
            });
        }
    }

    //时间格式化
    var gTimeFormat = function (seconds) {
        var m = Math.floor(seconds / 60) < 10 ? "0" + Math.floor(seconds / 60) : Math.floor(seconds / 60);
        var s = Math.floor(seconds - (m * 60)) < 10 ? "0" + Math.floor(seconds - (m * 60)) : Math.floor(seconds - (m * 60));
        return m + ":" + s;
    };

    //进度条显示
    function hoverPlay(e) {
        var view = e.pageX - $('.video-seek').offset().left + 1;
        var time = $videoCt[0].duration * view / $('.video-seek').width();
        if(view <= 30){
            $('.video-seek .viewBox').css('left',-20);
            $('.video-seek .viewBox i').css('left',view+15);
        }else if(view >= ($('.video-seek').width()-30)){
            $('.video-seek .viewBox').css('left',$('.video-seek').width()-80);
            $('.video-seek .viewBox i').css('left',view-$('.video-seek').width()+75);
        }else{
            $('.video-seek .viewBox').css('left',view - 50);
            $('.video-seek .viewBox i').css('left',44);
        }
        $('.video-seek video')[0].currentTime = time;
        $('.video-seek span').text(gTimeFormat(time));
        $('.video-seek .viewBox').fadeIn();
    }

    //视频跳转
    function videoJump( timer ) {
        $videoCt[0].currentTime = timer;
    }

    //视频网络卡端
    function intStatus(){
        if($videoCt[0].readyState == 4){
            $('.video-status').fadeOut();
        }else{
            $('.video-status').fadeIn();
            comStop();
        }
    }

    //音量调节
    function audioJump( volume ) {
        opts.volume = volume;
        $videoCt[0].volume = volume;
    }

    //弹幕运行
    function comRun(time) {
        if(comTimer != time){
            $(".screenShoot[name="+ time +"][data-status='0']").each(function () {
                var that = $(this);
                var i = that.index();
                var t = that.data('speed')*1000/intOpts.playSpeed;
                if(that.data('action') == 'stay'){
                    that.fadeIn();
                    comStayTimer[i] = setTimeout(function () {
                        that.attr('data-status',3);
                    },t);
                }else{
                    that.css('display','block');
                    that.animate({'left': -40 + '%'},t,'linear');
                    comStayTimer[i] = setTimeout(function () {
                        that.attr('data-status',3);
                    },t);
                }
                that.attr('data-status',1);
            });
            $(".screenShoot[data-status='2']").each(function () {
                var that = $(this);
                var i = that.index();
                var difTime = 1000*(that.data('speed') - (time - that.attr('name')))/intOpts.playSpeed;
                if(that.data('action') == 'stay'){
                    comStayTimer[i] = setTimeout(function () {
                        that.attr('data-status',3);
                    },difTime);
                }else{
                    that.animate({'left': -40 + '%'},difTime,'linear');
                    comStayTimer[i] = setTimeout(function () {
                        that.attr('data-status',3);
                    },difTime);
                }
                that.attr('data-status',1);
            });
            $(".screenShoot[data-status='3']").each(function () {
                if($(this).data('action') == 'marquee'){
                    $(this).css('left', 110 + '%');
                }
                $(this).css('display','none');
                $(this).attr('data-status',0);
            });
            comTimer = time;
        }
    }

    //弹幕停止
    function comStop() {
        $(".screenShoot[data-status='1']").each(function () {
            var that = $(this);
            var i = that.index();
            if(that.data('action') == 'marquee'){
                that.stop();
            }
            clearTimeout(comStayTimer[i]);
            that.attr('data-status',2);
        });
    }

    //弹幕清除
    function comClear() {
        $(".screenShoot[data-status='1']").each(function () {
            var that = $(this);
            var i = that.index();
            clearTimeout(comStayTimer[i]);
            if(that.data('action') == 'marquee'){
                $(this).stop();
                $(this).css('left', 110 + '%');
            }
            $(this).fadeOut();
            that.attr('data-status',0);
        });
    }

    //弹幕存储
    function comStore() {
        if(comStroeStatus == 0){
            var dataArr = [];
            var date = new Date();
            var time= date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
            $('.screenShoot').each(function () {
                var data = {
                    "word": $(this).text(),
                    "color": $(this).css('color'),
                    "speed": $(this).data('speed'),
                    "top": $(this).css('top').split('%').join(''),
                    "fontSize": $(this).css('fontSize').split('px').join(''),
                    "action": $(this).data('action'),
                    "time": $(this).attr('name')
                };
                dataArr.push(data);
            })
            var obj = {
                "title": intOpts.commentTitle,
                "id": intOpts.commentId,
                "time": time,
                "number": $('.screenShoot').length,
                "class": intOpts.commentClass,
                "data": dataArr
            }
            intOpts.comment = JSON.stringify(obj, null, '  ');
            comStroeStatus = 1;
        }
    }

    //进入全屏
    function requestFullScreen() {
        var de = document.documentElement;
        if (de.requestFullscreen) {
            de.requestFullscreen();
        } else if (de.mozRequestFullScreen) {
            de.mozRequestFullScreen();
        } else if (de.webkitRequestFullScreen) {
            de.webkitRequestFullScreen();
        }
    }

    //退出全屏
    function exitFullscreen() {
        var de = document;
        if (de.exitFullscreen) {
            de.exitFullscreen();
        } else if (de.mozCancelFullScreen) {
            de.mozCancelFullScreen();
        } else if (de.webkitCancelFullScreen) {
            de.webkitCancelFullScreen();
        }
    }

    //扩展功能
    function videoDom( opts ) {
        var title = $('<!--标题--><div class="video-title"></div>');
        var barrage = $('<!--弹幕--><div class="video-barrage"></div>');
        var comment = $('<!--评论-->\
                       <form class="video-comment">\
                            <input class="commentInput" type="text" placeHolder="输入评论" />\
                            <div>\
                                <p></p>\
                                <span class="runs">确定</span>\
                            </div>\
                            <div class="setBox">\
                                <div class="group">\
                                    <label>颜色：</label><input type="color" name="color" value="#ffffff">\
                                    <label>大小：</label><input type="number" name="fontSize" value="16" step="1" min="12" max="30"><span>像素</span>\
                                </div>\
                                <div class="group">\
                                    <label>位置：</label><input type="number" name="top" value="10" step="1" min="0" max="80"><span>%</span>\
                                    <label>时间：</label><input type="number" name="speed" value="10" step="1" min="5" max="30"><span>秒</span>\
                                </div>\
                                <div class="group">\
                                    <label>动作：</label>\
                                    <input type="radio" name="action" value="marquee" checked><span>滚动</span>\
                                    <input type="radio" name="action" value="stay"><span>停留</span>\
                                </div>\
                                <i class="close">×</i>\
                            </div>\
                       </form>');
        var reversal = $('<!--翻转--><div class="video-reversal"></div>');
        var playSpeed = $('<!--播放速度--><div class="video-playSpeed">1x</div>');
        var update = $('<!--下载--><a class="video-update"></a>');
        if( opts.title ){$videoCt.after(title)}
        if( opts.barrage ){
            barrage.appendTo($(".video-controls"));
            $(".video-controls").after($('<div class="screenShootBox"></div>'));
        }
        if( opts.reversal ){reversal.appendTo($(".video-controls"))}
        if( opts.playSpeed ){playSpeed.appendTo($(".video-controls"))}
        if( opts.update ){update.appendTo($(".video-controls"))}
        if( opts.clarity.type && opts.clarity.src ){
            var str = '';
            for(var i = 0;i < opts.clarity.type.length;i++){
                str = str + '<span>' + opts.clarity.type[i] + '</span>';
            }
            var clarity = '<!--清晰度--><div class="video-clarity"><p>'+ opts.clarity.type[0] +'</p><nav>'+ str +'</nav></div>';
            $(clarity).appendTo($(".video-controls"));
        }
        if( opts.comment ){comment.appendTo($(".video-controls"))}
    }

    return {
        title: '',
        status: false,
        currentTime: '0.00001',
        duration: '',
        volume: '',
        clarityType: '',
        claritySrc: '',
        fullScreen: false,
        reversal: false,
        playSpeed: 1,
        cutover: true,
        commentTitle: '',
        commentId: '',
        commentClass: '',
        commentSwitch: true,
        comment: function () {
            return intOpts.comment;
        }
    }
}

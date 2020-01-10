function getUrlParam(name) {      //获得url中的参数
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

    Tlile=$(".Title").val();   //视频标题
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
        var txt = $(".center-input").val()

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


            $(".center-info").append(
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
        $(".center-info").scrollTop(999999); //让滚动条始终保持在最下
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



}) ;


package com.joinlabs.action.gx;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSONObject;
import com.joinlabs.entity.User;


@Component
@ServerEndpoint(value ="/websocket/{info}",configurator=GetHttpSessionConfigurator.class)
public class WebSocketService {
	private static SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");//创建时间格式对象
	//concurrent包的线程安全Set，用来存放每个客户端对应的WebSocketService对象。
	//创建一个房间的集合，用来存放房间
	private static ConcurrentHashMap<String,ConcurrentHashMap<User, WebSocketService>> roomList = new  ConcurrentHashMap<String,ConcurrentHashMap<User, WebSocketService>>();
	//与某个客户端的连接会话，需要通过它来给客户端发送数据
	private Session session;
    //重新加入房间的标示；
    private int rejoin = 0;
    private static User use=new User();
    private static String roons=null;
    private HttpSession httpSession;
	/**
	 * 用户接入
	 * @param session 
	 */
	@OnOpen
	public void onOpen(@PathParam(value = "info") String param,Session session,EndpointConfig config){
		
		
		
		this.session = session;
		 this.httpSession = (HttpSession) config.getUserProperties()
	                        .get(HttpSession.class.getName());
		use=(User) httpSession.getAttribute("use");
		System.out.println("usert_________________________________"+use+"--------------------------------------------");
		System.out.println("open");
		String flag = param.split("[|]")[0]; 		//标识
		String member = param.split("[|]")[1];		//成员名  房间名  单独标识
		 if (!roomList.containsKey(member)) {   //房间不存在
			        roomList.put(member, new ConcurrentHashMap<User, WebSocketService>());      //创建房间
 
		 }
	//	roons=member;
	//	addRoom();
		if(flag.equals("join")){
			         //用户名    //可以从sesson中获取
			
	     	 
			joinRoom(member,use.getUaccount());
			
		}
	}
	
   

	//加入房间
	public void joinRoom(String member,String user){
		
		ConcurrentHashMap<User, WebSocketService> r =  roomList.get(member);    //根据房间号ID获取这个房间
		if(r.get(user) != null){		//用户存在
			this.rejoin = 1;
			
			r.put(use, this);
		}
		
		
		else{r.put(use, this);}//将此用户加入房间中
	}
	public void sendMessage(String message) throws IOException {
        this.session.getBasicRemote().sendText(message);
    }
	/**
	 * 接收到来自用户的消息
	 * @param message
	 * @param session
	 * @throws IOException 
	 */
	@OnMessage
	public void onMessage(String message,Session session) throws IOException{
		User us=new User();
		//把用户发来的消息解析为JSON对象
		JSONObject obj = JSONObject.parseObject(message);
	
		if(obj.get("flag").toString().equals("exitroom")){		//退出房间操作
			String roomid = obj.get("roomid").toString();
			
			//将用户从聊天室中移除
			int f2 = 1;
			roomList.get(roomid).remove(use);//将用户直接移除
			if(roomList.get(roomid).size() == 0){//判断房间该房间是否还有用户，如果没有，则将此房间也移除
				f2 = 2;
			}
			
			if(f2 == 1){		//证明该房间还有其它成员，则通知其它成员更新列表
				
				obj.put("flag","exitroom");
				String m = use.getUnname()+" 退出了房间";
				obj.put("message", m);
				ConcurrentHashMap<User, WebSocketService> r =roomList.get(roomid);
				List<User> uname = new ArrayList<User>();
				for(User u:r.keySet()){
					uname.add(u);
				}
				obj.put("uname", uname.toArray());
				for(User i:r.keySet()){  //遍历该房间
					r.get(i).sendMessage(obj.toString());//调用方法 将消息推送
				}
			}
		}else if(obj.get("flag").toString().equals("chatroom")){		//聊天室的消息 加入房间/发送消息
			//向JSON对象中添加发送时间
			obj.put("date", df.format(new Date()));
			//获取客户端发送的数据中的内容---房间�? 用于区别该消息是来自于哪个房间
			String roomid = obj.get("target").toString();  //vid
			//获取客户端发送的数据中的内容---用户
			String username = obj.get("nickname").toString();
			//从房间列表中定位到该房间
			ConcurrentHashMap<User, WebSocketService> r =roomList.get(roomid);
			List<User> uname = new ArrayList<User>();
			
			
			for(User u:r.keySet()){
				uname.add(u);
				
			if(u.getUaccount().equals(username)){
				
				us=u;
				
			}	
				
			}
			
			
			
			obj.put("uname", uname.toArray());
			System.out.println( username);
			
			
			
			
			
			if(r.get(us).rejoin == 0){			//证明不是退出重连
				for(User i:r.keySet()){  //遍历该房间
					
					obj.put("isSelf", us.equals(i));//设置消息是否为自己的
					obj.put("phot", use.getUphoto());
					obj.put("uid", use.getUid());
					System.out.println(obj.toString());
					r.get(i).sendMessage(obj.toString());//调用方法 将消息推送
					System.out.println("消息发送");
				}
			}else{
				
				obj.put("isSelf", true);
				r.get(us).sendMessage(obj.toString());
			}
			r.get(us).rejoin = 0;
		}
		
	}
	
	/**
	 * 用户断开
	 * @param session
	 */
	@OnClose
	public void onClose(Session session){

	}
	
	/**
	 * 用户连接异常
	 * @param t
	 */
	@OnError
	public void onError(Throwable t){
		
	}
}

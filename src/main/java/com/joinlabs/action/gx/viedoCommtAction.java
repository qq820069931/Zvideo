package com.joinlabs.action.gx;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.joinlabs.entity.*;
import com.joinlabs.service.gx.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.joinlabs.service.RecommendService;
import com.joinlabs.service.VideoService;

@RequestMapping("/video")
@Controller
public class viedoCommtAction {
	static public int Vid;
	@Resource
    private  replyService reply;
	@Resource
    private  VideoService video;
	@Resource 
	private RecommendService dmrecomm;
	@Resource
	private dmhistoryService dmhi;
	
	@Resource
	private dmattentionService dmre;

	@Resource
	private DanmuService Danmus;


	@Resource 
	private dmcollectService dmco;
	@Resource
	private dmhistoryService hist;
	static public  History history =new History();
    static public User use=new User();
	static public Video videos =new Video();
    static public  List<Comment> commentsa=new ArrayList<Comment>();
    
       @RequestMapping("/video")
       public ModelAndView runs(HttpServletRequest request ,HttpSession session) throws ParseException {
    
    	   init(request, session);    //初始化方法
    	   
		return new ModelAndView("gx/run");
    	   
       }
         
	
       public void init(HttpServletRequest request ,HttpSession session ) throws ParseException {
    	   
    		 //  SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
       	//  df.format(new Date());// new Date()为获取当前系统时间
       	//   new java.sql.Date(new Date().getTime());
       	//   System.out.println(new Date());
       //	 History history =new History(0,1,7,new Date());new Date()//当前时间
    	   System.out.println("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
    	   use= (User)session.getAttribute("use");
       	   String vid=  request.getParameter("vid");  //获得视频id
       	  
       	   Vid=Integer.parseInt(vid);         //把id转换为int
       	   System.out.println(Vid+"-------------------");
       	   List<Comment> comments= reply.FindAllReply(Vid);                 //获得所有视频的评论个数
           commentsa=	reply.getRrplys(Vid);                  //获得评论详情
           System.out.println(commentsa.toString());
       	    videos=  video.FindeVideo(Vid);     //根据传入的视频ID获得 电影详情  发布人      类型
       	 System.out.println(videos+"------------------");
       	   video.AdeeClick(videos.getVid());       //把视频的点击量+1
       	   System.out.println(videos.getVcid());
       	   
       	   
        	System.out.println(use.getUid());
        	
        	System.out.println(videos.getVcid());
         //  int a=   dmrecomm.AddClick(videos.getVcid(), videos.getVcid(), use.getUid()); //用户喜好+1
       	   List<Video> videoa=  video.FindeVideoLen(videos.getVcid(),videos.getVid());              //找到同一板块所以视频
       	List<Attention> dmres= dmre.FindDmattention(use.getUid(), videos.getVuid());     //判断是否关注
    	List<Collect> dmcos=   dmco.FindDmcollect(use.getUid(), videos.getVid());            //判断是否收藏
    	List<Attention> allDmres=dmre.FindAllDmattention(videos.getVuid());              //所有关注作者的人
       	List<Collect> dmcoss=dmco.FindAllDmcollect(videos.getVid());                   //所有收藏视频的人
       	   System.out.println();
       	  history.setHuid(use.getUid());
       	 
       	  history.setHvid(videos.getVid());
       	  history.setCtime(new Date());
       	  hist.AddDmhistory(history);                                      //添加到历史
		   request.setAttribute("danmusize",Danmus.getNumber(Vid));             //一共多少关注                        //  修改
       	request.setAttribute("allDmres", allDmres.size());             //一共多少关注                        //  修改
    	  request.setAttribute("videoa", videoa);                    //找到同一板块所以视频
    	  request.setAttribute("dmresa", dmres.size());               //是否关注                           //  修改
       	  request.setAttribute("dmresb", dmcoss.size());              //一共多少收藏                        //  修改
      	   request.setAttribute("dmcosc", dmcos.size());               //是否收藏                               //  修改

		   request.setAttribute("video", videos);                    //视频详情

        	session.setAttribute("reply", commentsa);                //评论详情
       	   request.setAttribute("replySize", commentsa.size());      //评论详情总数
         //	session.setAttribute("reply", commentsa);
       	   request.setAttribute("replyNumber", comments.size());    //评论总数                                      //  修改
        	request.setAttribute("ranVideo", videoa);              //找到同一板块所以视频   推荐
       	   
       	   System.out.println("replySize 视频详情----------"+commentsa.size());           //评论总数                   //  修改
       	 System.out.println("videos 视频详情----------"+videos);           //视频详情
       	   
       	   System.out.println("reply 评论详情----------"+commentsa);         //评论详情
       	 
       	   System.out.println("comments.size()  评论总数----------"+comments.size());
       
     	   System.out.println("dmresa   是否关注----------"+dmres.size());
     	   System.out.println("allDmres 所有关注作者的人----------"+allDmres.size());
     	  System.out.println("dmcosc  是否收藏----------"+dmcos.size());
    	  System.out.println("dmresb  所有收藏视频的人数----------"+dmcoss.size());
    	 // System.out.println("大数据----------"+a);
       	
       	  
       	  
       	  System.out.println("videoa----------"+videoa);
      	//	   
       	//   reply.getRrplys(Vid, 0,5);   //视频ID  和page  页数  //第一次进入 评论前5条内容
       //	Video videos =  video.FindeVideo(Vid);    
       	
       //	   video.AdeeClick(Vid);
       //	   dmrecomm.AddClick(Vid,Vid,0);//useID
       	   
    	   
    	   
       }
       
       @RequestMapping("comment")
       public ModelAndView comment(HttpSession session){
    	   
    	   commentsa=	reply.getRrplys(Vid);                  //获得评论详情
    	   session.setAttribute("reply", commentsa);                //评论详情
    	   
    	   
		return new ModelAndView("gx/commentTwo");  
		
		
       }

	@ResponseBody
	@RequestMapping("GetDanmu")
	public  List<String> text(int vid){     //vid 视频id

System.out.println("进来了");

       	return Danmus.getDanmu(vid) ;
	}

	@RequestMapping("SetDanmu")
	public void setDanmu(String danmu,int vid){          //vid 视频id

		Danmus.setDanmu(vid,danmu);
	}
}

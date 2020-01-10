package com.joinlabs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import com.joinlabs.entity.History;
import com.joinlabs.entity.User;
import com.joinlabs.entity.Video;
import com.joinlabs.entity.zjj.GzUser;
import com.joinlabs.entity.zjj.GzUseritem;
import com.joinlabs.entity.zjj.InformItem;
import com.joinlabs.entity.zjj.LyInfo;
import com.joinlabs.entity.zjj.dmCollectItem;
@Mapper
public interface UserMapper {
	
	int addUser(User user);
	
	User checkUser(User user);
	
	int updatePwd(@Param("account") String account, @Param("password") String pwd);
	
	User findUserByAccount(String account);
	
	String findUserEmailByAccount(String account);
	//按用户昵称模糊查询
	List<String> findUserLikeName(String name);
	
	
	
	
	//zjj
	User selectUserByUid(int uid);
	List<User> selectMyAttentionByUid(int uid);
	int  adduploadVido(Video video);//将上传的视频存到数据库，在界面上显示我的作品
	void upDateUse(User user);
	void updateUserPower(int uid);
	/**
	 * 
	 
		//zjj
		History  selectHistoryVideoById(int u_id);//通过用户ID搜索到用户所有观看历史记录*****
		
		dmCollectItem selectCollectVideoById(int u_id);//通过用户ID搜索到用户收藏的全部视频
		
		
		
		List<Video> selectMyworksById(int u_id);//通过用户ID将我的作品全部显示出来
		
//		InformItem selectMyInfoById(int u_id);//通过用户ID将我的留言全部显示出来
		
		User selectUserById(int u_id);//通过用户ID将我的信息显示出来
		

		
		int addAttention(GzUseritem gzUseritem);//通过捕获session中的id值和点击关注拿到被关注用户id值
		
		GzUser selectAllGzById(int u_aid);//通过用户的id将其关注的用户信息全部显示出来
		
		int addliuyan(LyInfo lyInfo);//留言
		
		List<InformItem> selectMyInformById(int u_id);//通过用户id可以查询出全部得留言	
		

		
		InformItem selectMyInformByPrimaryId(int id);
	 */
	
}

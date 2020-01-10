package com.joinlabs.dao.gx;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.joinlabs.entity.Attention;
import com.joinlabs.entity.Collect;
import com.joinlabs.entity.User;

@Mapper
public interface dmattentionMapper {
	/*
	 * 关注表修改  UseID(用户ID)   anutID(作者ID)
	 */
	
	//判断是否关注
	List<Attention> FindDmattention(int UseID, int anutID);
  //取消关注
  int DeleDmattention(int UseID, int anutID);
  //关注
  int AddDmattention(int UseID, int anutID);
  //关注总数
  List<Attention> FindAllDmattention(int anutID);
  
  
  //zjj
  
}

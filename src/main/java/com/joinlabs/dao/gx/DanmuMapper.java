package com.joinlabs.dao.gx;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface DanmuMapper {
    List<String> getDanmu(int vid);          //根据id获得弹幕集合
    void setDanmu(int vid,String danmu);    //插入弹幕数据库  视频编号 弹幕内容
    int getNumber(int vid);                //获得当前视频弹幕总数
    void deledanmu(int vid);                    //删除视频时删除该视频弹幕
}

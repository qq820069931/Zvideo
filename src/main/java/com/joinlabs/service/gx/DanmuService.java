package com.joinlabs.service.gx;

import java.util.List;

public interface DanmuService {
    List<String> getDanmu(int vid);          //根据id获得弹幕集合
    void setDanmu(int vid,String danmu);    //插入弹幕数据库  视频编号 弹幕内容
    int getNumber(int vid);                //获得当前视频弹幕总数
    void deledanmu(int vid);                    //删除视频时删除该视频弹幕

}

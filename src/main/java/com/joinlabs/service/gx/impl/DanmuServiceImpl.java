package com.joinlabs.service.gx.impl;

import com.joinlabs.dao.gx.DanmuMapper;
import com.joinlabs.service.gx.DanmuService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class DanmuServiceImpl implements DanmuService {
    @Resource
    private DanmuMapper danmus;


    @Override
    public List<String> getDanmu(int vid) {
        return danmus.getDanmu(vid);
    }

    @Override
    public void setDanmu(int vid, String danmu) {
        danmus.setDanmu(vid,danmu);
    }

    @Override
    public int getNumber(int vid) {
        return danmus.getNumber(vid);
    }

    @Override
    public void deledanmu(int vid) {
        danmus.deledanmu(vid);
    }
}

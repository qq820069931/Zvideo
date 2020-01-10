package com.joinlabs.entity;

public class danmu {

private int Did;
private int Vid;
private String danmu;

    public int getDid() {
        return Did;
    }

    public danmu(int did, int vud, String danmu) {
        Did = did;
        Vid = vud;
        this.danmu = danmu;
    }

    public danmu() {
    }

    public void setDid(int did) {
        Did = did;
    }

    public int getVud() {
        return Vid;
    }

    public void setVud(int vud) {
        Vid = vud;
    }

    public String getDanmu() {
        return danmu;
    }

    public void setDanmu(String danmu) {
        this.danmu = danmu;
    }
}

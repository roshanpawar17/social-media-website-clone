
package com.social;

import java.util.Date;

public class Reply {
    
    private String username;
    private String profile;

    
    private int rid;
    private int cid;
    private String reply;
    private Date date;

    public Reply() {
    }

    public Reply(int rid, int cid, String reply) {
        this.rid = rid;
        this.cid = cid;
        this.reply = reply;
    }

    public Reply(int cid, String reply, Date date,String username,String profile) {
        this.cid = cid;
        this.reply = reply;
        this.date = date;
        this.username = username;
        this.profile = profile;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }
    
    
    
}

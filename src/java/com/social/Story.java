
package com.social;


public class Story {
    private int sid;
    private int uid;
    private String username;
    private String profile;
    private String story;
    private String date;
    private String expiredate;

    public Story() {
    }

    public Story(int sid, int uid, String username, String profile, String story, String date,String expiredate) {
        this.sid = sid;
        this.uid = uid;
        this.username = username;
        this.profile = profile;
        this.story = story;
        this.date = date;
        this.expiredate = expiredate;
    }

    public Story(String story, String date, String expiredate) {
        this.story = story;
        this.date = date;
        this.expiredate = expiredate;
    }
    
    

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
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
    

    public String getStory() {
        return story;
    }

    public void setStory(String story) {
        this.story = story;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getExpiredate() {
        return expiredate;
    }

    public void setExpiredate(String expiredate) {
        this.expiredate = expiredate;
    }
    
    
    
}

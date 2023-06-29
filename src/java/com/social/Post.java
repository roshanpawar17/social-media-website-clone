
package com.social;

import java.util.Date;

public class Post {
    //users table
    private String username;
    private String fullname;
    private String datetime;
    private String file;
    private String coverfile;
    
        
    //posts table
    private int pid;
    private String location;
    private String post;
    private String caption;
    private int idpost;
    
    //description table
    private String bio;

    public Post(String username, String fullname, String datetime, String file, String coverfile) {
        this.username = username;
        this.fullname = fullname;
        this.datetime = datetime;
        this.file = file;
        this.coverfile = coverfile;
    }
    
    public Post(int pid, String location, String post, String caption, int idpost) {
        this.pid = pid;
        this.location = location;
        this.post = post;
        this.caption = caption;
        this.idpost = idpost;
    }

    //all posts display on home page
    public Post(String username,String file,int pid ,String location, String datetime,String post, String caption, int idpost) {
        this.username = username;
        this.file = file;
        this.pid=pid;
        this.location = location;
        this.datetime = datetime;
        this.post = post;
        this.caption = caption;
        this.idpost = idpost;
    }

    //others user post profile
    public Post(String username, String fullname, String file, String location, String datetime,String post, String caption, int idpost) {
        //users table
        this.username = username;
        this.fullname = fullname;
        this.file = file;
        
        //posts table     
        this.location = location;
        this.post = post;
        this.caption = caption;
        this.idpost = idpost;
        this.datetime = datetime;
    }
    
    public Post(int pid, String post, int idpost) {
        this.pid=pid;
        this.post = post;
        this.idpost = idpost;
    }
    
    
    //users table
    public String getUsername() {
        return username;
    }
     
    public void setUsername(String username) {
        this.username = username;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }    
    
    public String getFileName() {
        return file;
    }
    
    public void setFileName(String file){
        this.file=file;
    }
   
    //posts table
    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }
    
    
    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
    }

    public String getCaption() {
        return caption;
    }

    public void setCaption(String caption) {
        this.caption = caption;
    }

    public int getIdpost() {
        return idpost;
    }

    public void setIdpost(int idpost) {
        this.idpost = idpost;
    }
    
    public String getBio() {
        return bio;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    public String getFile() {
        return file;
    }

    public void setFile(String file) {
        this.file = file;
    }

    public String getCoverfile() {
        return coverfile;
    }

    public void setCoverfile(String coverfile) {
        this.coverfile = coverfile;
    }
    
    
}

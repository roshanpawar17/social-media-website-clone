
package com.social;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class comments {
    private int cid;
    private int cpid;
    private int upid;
    private String ucomments;
    private Date date;

    private int id;
    private String username;
    private String profile;

    public comments(int id,int cid ,int upid ,String username, String profile, String ucomments,Date date) {
        this.id = id;
        this.cid = cid;
        this.upid = upid;
        this.username = username;
        this.profile = profile;
        this.ucomments = ucomments;
        this.date = date;
    }
    
    public comments() {
    }

    public comments(int cpid, int upid, String ucomments) {
        this.cpid = cpid;
        this.upid = upid;
        this.ucomments = ucomments;
    }

    public comments(int cid) {
        this.cid = cid;
    }
    
    

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getCpid() {
        return cpid;
    }

    public void setCpid(int cpid) {
        this.cpid = cpid;
    }

    public int getUpid() {
        return upid;
    }

    public void setUpid(int upid) {
        this.upid = upid;
    }

    public String getUcomments() {
        return ucomments;
    }

    public void setUcomments(String ucomments) {
        this.ucomments = ucomments;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
    
    
    public void insertComments(int cpid, int cuid, String comment){
        try{
            Connection con=ConnectionProvider.getConnection();
            String q="insert into comments(cpid,cuid,ucomments ) values(?,?,?)";
            PreparedStatement ps=con.prepareStatement(q);
            ps.setInt(1, cpid);
            ps.setInt(2, cuid);
            ps.setString(3, comment);
            ps.executeUpdate();
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
    }
    
    public int countComments(int pid){
        int count=0;
        try{
            Connection con=ConnectionProvider.getConnection();
            String q="select count(*) from comments where cpid=?";
            PreparedStatement ps=con.prepareStatement(q);
            ps.setInt(1, pid);
            ResultSet set=ps.executeQuery();
            if(set.next()){
                count=set.getInt("count(*)");
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return count;
    }
    
    
     public List<comments> commentsByUserName(int pid){
        List<comments> comm=new ArrayList<>();
        
        try{
            Connection con=ConnectionProvider.getConnection();
            String query="select * from comments join users on comments.cuid=users.id where cpid=?";
            PreparedStatement s=con.prepareStatement(query);
            s.setInt(1,pid);
            ResultSet set=s.executeQuery();
            
            while(set.next()){
                Integer id=set.getInt("id");
                Integer cid=set.getInt("cid");
                Integer cuid=set.getInt("cuid");
                String username=set.getString("username");         
                String profile=set.getString("defaultprofile");         
                String comment=set.getString("ucomments");         
                Date date=set.getDate("cdatetime");         
                                
                comments c=new comments(id,cid,cuid,username,profile,comment,date);
                
                comm.add(c);
            }
        
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        return comm;
    }
     
     
     public comments getReplyInfo(int cid,int uid){
        comments rpl=null;
        
        try{
            Connection con=ConnectionProvider.getConnection();
            String query="select * from comments join users on comments.cuid=users.id where cid=? and cuid=?";
            PreparedStatement s=con.prepareStatement(query);
            s.setInt(1,cid);
            s.setInt(2,uid);
            ResultSet set=s.executeQuery();
            
            if(set.next()){
                Integer id=set.getInt("cid");        
                                
                rpl=new comments(id);
                

            }
        
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        return rpl;
    }
    
}

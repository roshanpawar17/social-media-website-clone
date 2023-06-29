
package com.social;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Likes {
    
    private int lpid;
    private int luid;
    private String color;
    
    private int count;
    private int id;
    private String username;
    private String profile;
    
    

    public Likes() {
    }
    
    public Likes(int id, String username, String profile){
        this.id=id;
        this.username=username;
        this.profile=profile;
    }
    
    public Likes(int count) {
        this.count=count;
    }
    
    public Likes(int lpid, int luid, String color) {
        this.lpid=lpid;
        this.luid=luid;
        this.color=color;
    }

     public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
    
    public int getLpid() {
        return lpid;
    }

    public void setLpid(int lpid) {
        this.lpid = lpid;
    }

    public int getLuid() {
        return luid;
    }

    public void setLuid(int luid) {
        this.luid = luid;
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

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }
    
    
    
    public boolean insertLikes(int pid, int uid){
        boolean like=false;
        
        try{
            Connection con=ConnectionProvider.getConnection();
            String q="insert into liked(lpid,luid) values(?,?)";
            PreparedStatement ps=con.prepareStatement(q);
            ps.setInt(1, pid);
            ps.setInt(2, uid);
            ps.executeUpdate();
            like=true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return like;
    }
    
    public int countLikes(int lp){
        int count=0;
        try{
            Connection con=ConnectionProvider.getConnection();
            String q="select count(*) from liked where lpid=?";
            PreparedStatement ps=con.prepareStatement(q);
            ps.setInt(1, lp);
            ResultSet set=ps.executeQuery();
            if(set.next()){
                count=set.getInt("count(*)");
                
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        return count;
    }
    
    public boolean isLiked(int lpid, int luid){
        boolean liked=false;
        try{
            Connection con=ConnectionProvider.getConnection();
            String q="select * from liked where lpid=? and luid=?";
            PreparedStatement ps=con.prepareStatement(q);
            ps.setInt(1, lpid);
            ps.setInt(2, luid);
            ResultSet set=ps.executeQuery();
            if(set.next()){
                liked=true;
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        return liked;
    }
    
    public boolean disLiked(int lpid, int luid){
        boolean like=false;
        try{
            Connection con=ConnectionProvider.getConnection();
            String q="delete from liked where lpid=? and luid=?";
            PreparedStatement ps=con.prepareStatement(q);
            ps.setInt(1, lpid);
            ps.setInt(2, luid);
            ps.executeUpdate();
            like=true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        return like;
    }
    
    public List<Likes> likeByUserName(int pid){
        List<Likes> likes=new ArrayList<>();
        
        try{
            Connection con=ConnectionProvider.getConnection();
            String query="select * from liked join users on liked.luid=users.id where lpid=?";
            PreparedStatement s=con.prepareStatement(query);
            s.setInt(1,pid);
            ResultSet set=s.executeQuery();
            
            while(set.next()){
                Integer id=set.getInt("id");
                String username=set.getString("username");         
                String profile=set.getString("defaultprofile");         
                                
                Likes l=new Likes(id,username,profile);
                
                likes.add(l);
            }
        
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        return likes;
    }
    
    
    public Likes selectLiked(int pid, int uid){
        Likes lk=null;
    
        try{
            Connection con=ConnectionProvider.getConnection();
            String likeExist="select * from liked where lpid=? and luid=?";
            PreparedStatement p=con.prepareStatement(likeExist);
           
            p.setInt(1, pid);
            p.setInt(2, uid);
           
           ResultSet set=p.executeQuery();
           
           if(set.next()){
               int lpid=set.getInt("lpid");
               int luid=set.getInt("luid");
               String color=set.getString("color");
               
               lk=new Likes(lpid,luid,color);
           }
        }catch(Exception e){
            e.printStackTrace();
        }
            
        return lk;
        
    }

}



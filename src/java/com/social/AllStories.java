
package com.social;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class AllStories {
    Connection con=ConnectionProvider.getConnection();
    public void insertStory(int uid,String story, Date date, Date expiredate){
      
        try{
            
            String q="insert into stories(uid,story,cdate,expiredate) values(?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(q);
            ps.setInt(1, uid);
            ps.setString(2, story);
            ps.setString(3,date.toString());
            ps.setString(4,expiredate.toString());
            ps.executeUpdate();
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
    }
    
    public Story getStories(int sid,int uid){
        Story sr=null;
        try{
            String query="select * from stories where sid=? and uid= ?";
            PreparedStatement s=con.prepareStatement(query);
            s.setInt(1,sid);
            s.setInt(2,uid);
            ResultSet set=s.executeQuery(); 
            if(set.next()){
                String story=set.getString("story");
                String date=set.getString("cdate");
                String expiredate=set.getString("expiredate");
                sr=new Story(story,date,expiredate);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return sr;
    }
    
    
    public List<Story> AllStory(){
        List<Story> slist=new ArrayList<>();
        try{
            String query="select * from stories join users on stories.uid=users.id order by cdate desc";
            Statement s=con.createStatement();
            ResultSet set=s.executeQuery(query); 
            while(set.next()){
                Integer stid=set.getInt("sid");
                Integer uid=set.getInt("uid");
                String username=set.getString("username");
                String profile=set.getString("defaultprofile");
                String story=set.getString("story");
                String date=set.getString("cdate");
                String expiredate=set.getString("expiredate");
                Story sr=new Story(stid,uid,username,profile,story,date,expiredate);
                slist.add(sr);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return slist;
    }
    
    public void removeStory(int uid){
        try {
            Connection con=ConnectionProvider.getConnection();

            String query="delete from stories where uid= ?";
            PreparedStatement s=con.prepareStatement(query);
            s.setInt(1,uid);
            s.executeUpdate(); 

        }
        catch(Exception e){
            e.printStackTrace();
 
        }
       
    }
    
}

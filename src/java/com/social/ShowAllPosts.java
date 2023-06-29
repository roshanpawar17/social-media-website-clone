
package com.social;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ShowAllPosts {
    public List<Post> getAllPost(){
        List<Post> list=new ArrayList<>();
        
        try{
            Connection con=ConnectionProvider.getConnection();
            String query="select * from posts join users on posts.idpost=users.id order by pdatetime desc";
            Statement s=con.createStatement();
            ResultSet set=s.executeQuery(query);
            
            while(set.next()){
                Integer id=set.getInt("pid");
                String usern=set.getString("username");         
                String defaultprofile=set.getString("defaultprofile");         
                String location=set.getString("location"); 
                Date datetime=set.getDate("pdatetime"); 
                String post=set.getString("post");         
                String caption=set.getString("caption");
                Integer idpost=set.getInt("idpost");
                
                Post p=new Post(usern,defaultprofile,id,location,datetime.toString(),post,caption,idpost);
                
                list.add(p);
            }
        
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return list;
    
    }
    
    public Post getPost(int pid,int postid){
        Post p=null;      
        try{
            Connection con=ConnectionProvider.getConnection();
            String query="select * from posts join users on posts.idpost=users.id where pid=? and idpost=?";
            PreparedStatement s=con.prepareStatement(query);
            s.setInt(1,pid);
            s.setInt(2,postid);
            ResultSet set=s.executeQuery();
            
            if(set.next()){
                String username=set.getString("username");         
                String fullname=set.getString("fullname");         
                String defaultprofile=set.getString("defaultprofile");         
                String location=set.getString("location");
                Date datetime=set.getDate("pdatetime"); 
                String post=set.getString("post");         
                String caption=set.getString("caption");
                Integer idpost=set.getInt("idpost");
                
                p=new Post(username,fullname, defaultprofile, location, datetime.toString() ,post, caption, idpost);
                
              
            }
        
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return p;
    
    }
    
    public Post getProfile(int id){
        Post u=null;
        try{
            Connection con=ConnectionProvider.getConnection();
            String query="select * from posts join users on posts.idpost=users.id where idpost=?";
            PreparedStatement s=con.prepareStatement(query);
            s.setInt(1,id);
            ResultSet set=s.executeQuery();
            
            if(set.next()){
                String username=set.getString("username");         
                String fullname=set.getString("fullname");                                         
                Date datetime=set.getDate("ldatetime");   
                String defaultprofile=set.getString("defaultprofile");
                String defaultcover=set.getString("defaultcover");
                
                u=new Post(username,fullname,datetime.toString(), defaultprofile,defaultcover);
                
              
            }
        
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        return u;
        
    }
    
    public List<Post> getAllUserPosts(int id){
        List<Post> list=new ArrayList<>();
        try{
            Connection con=ConnectionProvider.getConnection();
            String query="select * from users join posts on users.id=posts.idpost where id=? order by pdatetime desc";
            PreparedStatement s=con.prepareStatement(query);
            s.setInt(1,id);
            ResultSet set=s.executeQuery();
            
            while(set.next()){
                Integer pid=set.getInt("pid");
                String posts=set.getString("post");   
                Integer idpost=set.getInt("idpost");
                Post post=new Post(pid,posts,idpost);                
                list.add(post);
            }
        
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return list;
    }
    
    
}

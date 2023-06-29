
package com.social;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AllReply {
    
    public void insertReply(int cid, String reply,int uid){
        try{
            Connection con=ConnectionProvider.getConnection();
            String q="insert into reply(cid,reply,uid) values(?,?,?)";
            PreparedStatement ps=con.prepareStatement(q);
            ps.setInt(1, cid);
            ps.setString(2, reply);
            ps.setInt(3, uid);
            ps.executeUpdate();
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
    }
    
    public List<Reply> selectReply(){
        List<Reply> l=new ArrayList<>();
        try{
            Connection con=ConnectionProvider.getConnection();
            String query="select * from reply join users on reply.uid=users.id";
            Statement s=con.createStatement();
            ResultSet set=s.executeQuery(query);
            
            while(set.next()){
                String username=set.getString("username");         
                String profile=set.getString("defaultprofile");
                Integer id=set.getInt("cid");
                String reply=set.getString("reply");         
                Date date=set.getDate("rdatetime");                 

                Reply r=new Reply(id,reply,date,username,profile);
                l.add(r);
            }
        
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return l;    
    }
}

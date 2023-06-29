
package com.social;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class FetchUsers {
    Connection con=ConnectionProvider.getConnection();
    public List<Search> selectAllUsers(String user){
        List<Search> list=new ArrayList<>();
        
        try{
            String q="select * from users where username like '%"+user+"%'";
            Statement sc=con.createStatement();
            ResultSet set=sc.executeQuery(q);
            
            while(set.next()){
                int id=set.getInt("id");
                String username=set.getString("username");
                
                Search s=new Search(id,username);
                list.add(s);
            }
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return list;
    
    }
    
    public Search selectUsers(String username){
        Search s=null;
        try{
            String q="select * from users where username=?";
            PreparedStatement sc=con.prepareStatement(q);
            sc.setString(1, username);
            ResultSet set=sc.executeQuery();
            
            if(set.next()){
                int id=set.getInt("id");
                String usern=set.getString("username");   
                
                s=new Search(id,usern);
            }
   
        }catch(Exception e){
            e.printStackTrace();
        }
    
        return s;
    }
}

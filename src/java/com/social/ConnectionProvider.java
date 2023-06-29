
package com.social;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
    private static Connection con;
    public static Connection getConnection(){
        try{
//            if(con==null){
                //load class driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
                //create connection
                con=DriverManager.getConnection("jdbc:mysql://localhost:3309/accounts","root","mysql");           
//            }        
        }
        catch(Exception e){
            e.printStackTrace();        
        }   
        
        return con;
    }   
}

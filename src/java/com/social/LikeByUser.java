
package com.social;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LikeByUser extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            int pid=Integer.parseInt(request.getParameter("pid"));
            int uid=Integer.parseInt(request.getParameter("uid"));
            String operation=request.getParameter("operation");

            Likes like=new Likes();
            
            Connection con=ConnectionProvider.getConnection();
            String likeExist="select * from liked where lpid=? and luid=?";
            PreparedStatement p=con.prepareStatement(likeExist);
           
            p.setInt(1, pid);
            p.setInt(2, uid);
           
           ResultSet set=p.executeQuery();
           
           if(set.next()){
               int lpid=set.getInt("lpid");
               int luid=set.getInt("luid");
               
               if((pid==lpid) && (uid==luid)){
                   like.disLiked(pid, uid);
               }
           }else if(operation.equals("like")){
                boolean b=like.insertLikes(pid, uid);
                out.println(b);
                
            }

            
        }catch(Exception e){
            e.printStackTrace();
        }
   
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}


package com.social;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class AddPost extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Connection con=ConnectionProvider.getConnection();
            
            Integer id=Integer.parseInt(request.getParameter("id"));
            String location=request.getParameter("location");
            Part part=request.getPart("post");
            String file=part.getSubmittedFileName();
            String caption=request.getParameter("caption");
            
            out.print(id);
            out.print(location);
            out.print(file);
            out.print(caption);
            
            String q="insert into posts(location,post,caption,idpost) values(?,?,?,?)";
            
            PreparedStatement psi=con.prepareStatement(q);
            
            psi.setString(1,location);
            psi.setString(2,file);
            psi.setString(3,caption);
            psi.setInt(4,id);
            
            psi.executeUpdate();
            
            String path=request.getRealPath("/")+"posts"+File.separator+file;
            
            UpdateDeleteProfilePic.updatePic(part.getInputStream(), path);
            
            
            
            //select data
//            String iquery="select * from posts join users on posts.idpost=users.id where idpost=? && post=?";
//            PreparedStatement s=con.prepareStatement(iquery);
//            s.setInt(1, id);
//            s.setString(2, file);
//            ResultSet set=s.executeQuery();
//            
//            if(set.next()){                    
//                String usern=set.getString("username");         
//                String location2=set.getString("location");         
//                String post=set.getString("post");         
//                String caption2=set.getString("caption");         
//
//                    HttpSession session=request.getSession();
//                    session.setAttribute("usern", usern);         
//                    session.setAttribute("location2", location2);         
//                    session.setAttribute("post", post);         
//                    session.setAttribute("caption", caption2);                         
//                
                    response.sendRedirect("home");
//            }
//            
        }
        catch(Exception e){
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

}

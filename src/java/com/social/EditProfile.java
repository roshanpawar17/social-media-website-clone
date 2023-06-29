
package com.social;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

import javax.servlet.http.HttpSession;

public class EditProfile extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            Connection con=ConnectionProvider.getConnection();
            
            Integer id=Integer.parseInt(request.getParameter("id"));
            String username=request.getParameter("username");
            String name=request.getParameter("name");
            String email=request.getParameter("email");
            String password=request.getParameter("password");
            
            //update data
            String uquery="update users set username=?, fullname=?, email=?, password=? where id=?";
            
            PreparedStatement spu=con.prepareStatement(uquery);
            spu.setString(1, username.toLowerCase());
            spu.setString(2, name.toUpperCase());
            spu.setString(3, email);
            spu.setString(4, password);
            spu.setInt(5, id);
            
            spu.executeUpdate();
            
                             
            //select data
            String squery2="select * from users where id = ?";
            PreparedStatement sps=con.prepareStatement(squery2);
            sps.setInt(1, id);
            ResultSet set=sps.executeQuery();
            
            if(set.next()){ 
                Integer idS=set.getInt("id");
                String usernameS=set.getString("username");
                String fullnameS=set.getString("fullname");         
                String emailS=set.getString("email");         
                String passS=set.getString("password");         
//                String defaultprofile=set.getString("defaultprofile");

                    HttpSession session=request.getSession();
                    session.setAttribute("id", idS);
                    session.setAttribute("username", usernameS);
                    session.setAttribute("fullname", fullnameS);         
                    session.setAttribute("email", emailS);         
                    session.setAttribute("password", passS);         
//                    session.setAttribute("defaultprofile", defaultprofile); 
//                
                    response.sendRedirect("profile");
            }
            
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

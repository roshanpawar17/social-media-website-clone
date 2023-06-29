package com.social;


import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
//import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpSession;

public class login extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
          
            String username=request.getParameter("username");
            String password=request.getParameter("password");
            
            
            Connection con=ConnectionProvider.getConnection();
                     
          String query="select * from users where username = ?";
//            String query="select id,username,fullname,email,password,datetime,defaultprofile,bio from users join description on users.id=description.idabout where username = ?";
            
            PreparedStatement p=con.prepareStatement(query);
            
            p.setString(1, username);
            
            ResultSet set=p.executeQuery();
             
            if(set.next()){            
                Integer id=set.getInt("id");
                String user=set.getString("username");
                String fullname=set.getString("fullname");         
                String email=set.getString("email");         
                String pass=set.getString("password");                 
                Date datetime=set.getDate("ldatetime"); 
//                SimpleDateFormat formatter=new SimpleDateFormat("dd-MM-yyyy");  
//                Date date=formatter.parse(datetime);
                
                String defaultprofile=set.getString("defaultprofile");         
                String defaultcover=set.getString("defaultcover");         
//                String fbio=set.getString("bio");
                
                if(user.equals(username) && pass.equals(password)){
                    HttpSession session=request.getSession();
                    session.setAttribute("id", id);
                    session.setAttribute("username", user);
                    session.setAttribute("fullname", fullname);         
                    session.setAttribute("email", email);         
                    session.setAttribute("password", pass);         
                    session.setAttribute("datetime", datetime.toString());         
                    session.setAttribute("defaultprofile", defaultprofile);  
                    session.setAttribute("defaultcover", defaultcover);  
//                    session.setAttribute("fbio", fbio);                  
            
                    response.sendRedirect("home");
       
                }
                else{
                      String passIncorrect= "Incorrect Password";
                      HttpSession s=request.getSession();
                      s.setAttribute("passIncorrect", passIncorrect);

                      response.sendRedirect("loginaccount");
                }
                
            }
            else {
                    String usernameNotExist= "Username are not match";
                    HttpSession s1=request.getSession();
                    s1.setAttribute("usernameNotExist", usernameNotExist);

                    response.sendRedirect("loginaccount");
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
}

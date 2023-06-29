package com.social;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.sql.*;
import javax.servlet.annotation.MultipartConfig;

@MultipartConfig
public class Signup extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           String username=request.getParameter("username");
           String firstname=request.getParameter("firstname");
           String lastname=request.getParameter("lastname");
           
           String fullname=firstname + " " + lastname;
           
           String email=request.getParameter("email");
           String password=request.getParameter("password");
           String cpassword=request.getParameter("cpassword");
           
//           Date date=new Date();
          
           RequestDispatcher rd=request.getRequestDispatcher("signup");
           
           Connection con=ConnectionProvider.getConnection();
        
           //fetch username from database
           String userExist = "select * from users where username= ? or email= ?";
                     
           PreparedStatement p=con.prepareStatement(userExist);
           
           p.setString(1, username);
           p.setString(2, email);
           
           ResultSet set=p.executeQuery();
         
           if(set.next()){           
               String fetchUserName=set.getString("username");
               String fetchUserEmail=set.getString("email");
              
               if(fetchUserName.equals(username)){
                    out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<title>Signup</title>");            
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js'></script>");
                    out.println("<script>"
                            + "swal({"
                            + "title: 'Username already exist',"
                            + "button: 'OK', "
                            + "})"
                            + "</script>");
                    out.println("</body>");
                    out.println("</html>");
                    
                    rd.include(request,response); 
   
               }
               else if(fetchUserEmail.equals(email)){
                    out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<title>Signup</title>");            
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js'></script>");
                    out.println("<script>"
                            + "swal({"
                            + "title: '<h1>This email is taken. Try another</h1>',"
                            + "button: 'OK', "
                            + "})"
                            + "</script>");
                    out.println("</body>");
                    out.println("</html>");
                    rd.include(request,response);
               }  
               else{
                   out.println("<!DOCTYPE html>");
                   out.println("<html>");
                   out.println("<head>");
                   out.println("<title>Signup</title>");            
                   out.println("</head>");
                   out.println("<body>");
                   out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js'></script>");
                   out.println("<script>"
                            + "swal({"
                            + "title: 'Something went wrong. Try again',"
                            + "button: 'OK', "
                            + "})"
                            + "</script>");
                   
                   rd.include(request,response);
               }
           }
           else{           
               if(password.equals(cpassword)){                
                        String q="insert into users(username,firstname,lastname,fullname,email,password) values(?,?,?,?,?,?)";
                    
                        out.println("<!DOCTYPE html>");
                        out.println("<html>");
                        out.println("<head>");
                        out.println("<title>Signup</title>");            
                        out.println("</head>");
                        out.println("<body>");
                        out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js'></script>");
                        out.println("<script>"
                                + "swal({"
                                + "title: 'Registered Successfully..!',"
                                + "icon: 'success',"
                                + "button: 'OK', "
                                + "}).then(()=> {"
                                + "window.location.href='loginaccount';"
                                + "});"
                                + "</script>");
                        out.println("</body>");
                        out.println("</html>");

                        PreparedStatement ps=con.prepareStatement(q);
                   
                        ps.setString(1, username.toLowerCase());
                        ps.setString(2, firstname.toUpperCase());
                        ps.setString(3, lastname.toUpperCase());
                        ps.setString(4, fullname.toUpperCase());
                        ps.setString(5, email.toLowerCase());
                        ps.setString(6, password);
//                        ps.setString(7, date.toString());  

                        ps.executeUpdate();                                                          
                             
                }
               else{
                   
                   out.println("<!DOCTYPE html>");
                   out.println("<html>");
                   out.println("<head>");
                   out.println("<title>Signup</title>");            
                   out.println("</head>");
                   out.println("<body>");
                   out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js'></script>");
                   out.println("<script>"
                            + "swal({"
                            + "title: 'Wrong confirm password',"
                            + "button: 'OK', "
                            + "})"
                            + "</script>");
                    out.println("</body>");
                    out.println("</html>");
                    
                   rd.include(request,response);
               }
                     
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

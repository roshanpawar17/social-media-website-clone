
package com.social;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class UpdateCoverPic extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            Connection con=ConnectionProvider.getConnection();
            
            Integer id=Integer.parseInt(request.getParameter("id"));
            Part part=request.getPart("coverpic");
            String file=part.getSubmittedFileName();

            String path=request.getRealPath("/")+"covers"+File.separator+file;
            UpdateDeleteProfilePic.updatePic(part.getInputStream(), path);
            
            String query="update users set defaultcover=? where id=?";
            PreparedStatement ps=con.prepareStatement(query);
            
            ps.setString(1, file);
            ps.setInt(2, id);
            ps.executeUpdate();
            
            //select data
            String squery2="select * from users where id = ?";
            PreparedStatement sps=con.prepareStatement(squery2);
            sps.setInt(1, id);
            ResultSet set=sps.executeQuery();
            
            if(set.next()){ 
        
                String defaultcover=set.getString("defaultcover");
         
                HttpSession session=request.getSession();
                session.setAttribute("defaultcover", defaultcover); 
                
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

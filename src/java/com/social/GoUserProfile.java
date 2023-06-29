
package com.social;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class GoUserProfile extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String username=request.getParameter("un");
            
            HttpSession session=request.getSession();
            Integer id=(Integer)session.getAttribute("id");
            
            FetchUsers u=new FetchUsers();
            Search s=u.selectUsers(username);
            
            if(username.equals(s.getUsername())){
                if(s.getId() == id){
                    response.sendRedirect("profile.jsp?userprofile="+s.getId());
                }else{
                    response.sendRedirect("usersprofile.jsp?userprofile="+s.getId());
                }
                
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


package com.social;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class AddStory extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int uid=Integer.parseInt(request.getParameter("id"));
            Part part=request.getPart("story");
            String file=part.getSubmittedFileName();
                   
            String path=request.getRealPath("/")+"story"+File.separator+file;
            
            UpdateDeleteProfilePic.updatePic(part.getInputStream(), path);
            
            AllStories as=new AllStories();
            int min=1440;
            Date beforeTime=new Date();

            Date aftime=addMinutesToDate(min, beforeTime);
            
            as.insertStory(uid, file, beforeTime, aftime);           
            
            response.sendRedirect("profile.jsp");
        }
    }

    final long ONE_MINUTE_IN_MILLIS = 60000;

    public Date addMinutesToDate(int minutes, Date beforeTime) {

        long curTimeInMs = beforeTime.getTime();
        Date afterAddingMins = new Date(curTimeInMs + (minutes * ONE_MINUTE_IN_MILLIS));
        return afterAddingMins;
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

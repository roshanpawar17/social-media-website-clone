
<%@page import="com.social.Story"%>
<%@page import="com.social.AllStories"%>
<%
        Integer id=(Integer)session.getAttribute("id");
        String username=(String)session.getAttribute("username");
        if(username == null){
            response.sendRedirect("loginaccount");
            return;
        }  

        int sid=Integer.parseInt(request.getParameter("sid"));
        int uid=Integer.parseInt(request.getParameter("uid"));
    
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= username %></title>
        <link rel="icon" href="./img/project icon.jpg">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
        <style>
            body{
                background-color: rgba(0, 0, 0, 0.267);
            }
            #mystory{
                position: absolute;
                left: 30em;
                top: 3em;
                border: 1px solid;
                box-shadow: 0 5px 30px rgba(0,0,0,.30);
                
            }

            .fa-xmark{
                position: absolute;
                right: 50px;
                top: 20px;
                font-size: 25px;
                cursor: pointer;
                /*display: none;*/
            }
        </style>
    </head>
    <body>
        
        <span class="fa-sharp fa-solid fa-xmark"></span>
        <div id="mystory">
            
            <%
                AllStories all=new AllStories();
                Story s=all.getStories(sid, uid);
                if(uid==id){
            %>
            
            <img src="story/<%= s.getStory() %>" height='490px' width='450px'><br>
            <h3><%= s.getDate() %></h3>
            <form action="RemoveStory" method="post">
                <input type="number" name="uid" value="<%= uid %>" hidden>
                <button type="submit" style="float: right; background-color: red; color: white; cursor: pointer; font-size: 18px;">Remove</button>
            </form>
            <%
                }
                else{
            %>
            <img src="story/<%= s.getStory() %>" height='490px' width='450px'>
            <h3><%= s.getDate() %></h3>
            <%
                }
                
            %>
        </div> 
                
        <script>
          

            let faXmark=document.querySelector('.fa-xmark');

            faXmark.addEventListener('click',()=>{
                window.location.href="home.jsp";
            });
    
        </script>
        <script src="js/removestory.js"></script>
    </body>
</html>


<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.social.Story"%>
<%@page import="com.social.AllStories"%>
<%@page import="com.social.comments"%>
<%@page import="com.social.Likes"%>
<%@page import="java.util.List"%>
<%@page import="com.social.Post"%>
<%@page import="com.social.ShowAllPosts"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page errorPage="servererror"%>--%>


<% 
            Integer id=(Integer)session.getAttribute("id");
            String usern=(String)session.getAttribute("usern");
            String location=(String)session.getAttribute("location2");
            String post=(String)session.getAttribute("post");
            String caption=(String)session.getAttribute("caption");
            String defaultprofile=(String)session.getAttribute("defaultprofile");
               
            String username=(String)session.getAttribute("username");
            if(username == null){
                response.sendRedirect("loginaccount");
                return;
            }
            
 
%>
        
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= username %></title>
    <link rel="stylesheet" href="css/home.css">
    <link rel="icon" href="./img/project icon.jpg">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <style>
        .side-navbar{   
            max-width: 23rem;       
            background: rgba(0, 0, 26, 0.89);
            height: 100vh;
            position: fixed;
        }
        li a{
            font-size: 18px;
            padding: 0px 20px;
        }
        /* stories */
    .stories{
        display: flex;
        justify-content: center;
        position: absolute;
        left: 25em;
        top: 6em;
        
    }

    .stoty-bar{
        display: flex;
        /*border: 2px solid red;*/ 
        width: 54em;  
        height: 9em;  
        overflow-x: auto;
        padding: 5px;
        overflow-y: hidden;
        
    }

    .stoty-bar::-webkit-scrollbar{
        width: 1px;
    }

    .my-story{
        margin: 0px 15px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .my-story h4{
        margin-top: 5px;
    }

    .user-story{
        display: flex;
        align-items: center;
        margin: 0px 15px;
    }

    .story{
        margin: 0px 10px;
        display: flex;
    }

    .stoty-bar img{
        border-radius: 50px;
        cursor: pointer;
        outline: 2px solid brown;
        border-radius: 50px;
        outline-offset: 2px;
    }
    
    
    
    
    .posts{
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        margin-top: 17em;
        /* border: 2px solid; */
        margin-left: 33.5em;
    }
    
    

    </style>
</head>
<body>
    <div class="container" id="blur">
         <!-- nav bar -->
        <nav class="side-navbar">
            <ul>
                <li class="app-name">                   
                    <a href="home.jsp" id="home">SocialSphere</a>
                </li>
                <hr>
                <li>
                    <i class="fa-sharp fa-solid fa-house"></i>
                    <a href="home.jsp" id="home">Home</a>
                </li>
                <li>
                    <i class="fa-sharp fa-solid fa-user"></i>
                    <a href="profile.jsp" id="profile">Profile</a>
                </li>
            </ul>
        </nav>
         
        

        <div class="sub-container">
            <form action="GoUserProfile" method="post">
                <div class="search-box-nd-md">
                    <!-- search box -->
                    <div class="serach-box">
                        <div class="s-ul">
                            <input type="search" id="search" style="height: 2.2em;" name="un" placeholder="Search here...">
                            <div id="usersList" style=" background: #a8e3cd; padding: 10px; font-size: 18px; border-radius: 0px; list-style-type: none; display: none; width: 21em; cursor: default;"></div>                        

                        </div>
                    </div>                 
                </div>
                <button type="submit" class="fa-sharp fa-solid fa-magnifying-glass" id="goUserp" style="float: right; width: 50px; position: fixed; right: 22em; top: 1.2em;"></button>
            </form>
            
            <div class="stories">
                <div class="stoty-bar">
                    <!--<div class="user-story">-->                       
                        <div class="story">
                            <%
                                AllStories all=new AllStories();
                                List<Story> ys=all.AllStory();
                                Date cdate=new Date();
                                DateFormat dateFormat = new SimpleDateFormat("E MMM dd HH:mm:ss z yyyy");
                                
                                for(Story s:ys){
                                    Date edate = dateFormat.parse(s.getExpiredate());
                                    if(cdate.compareTo(edate) >= 0){
                                        all.removeStory(s.getUid());
                                    }else{
                            %>
                                        <a href="showstory.jsp?sid=<%= s.getSid() %>&uid=<%= s.getUid()%>"><img src="profiles/<%= s.getProfile() %>" height="100px" width="100px" id="story" ></a>
                                        <h4><%= s.getUsername() %></h4>
                            <%
                                    }
                               }
                            %>
                        </div>
                    <!--</div>-->
                </div>
            </div>
                
             
            
                <div class="posts">
                <% 
            
                    ShowAllPosts p=new ShowAllPosts();
                    List<Post> l=p.getAllPost();
                    for(Post ps:l){
            
                %>
                <div class="post">
                    <div class="post-heading">
                        <img src="./profiles/<%= ps.getFileName() %>" alt="" height="60px" width="60px" style="border-radius: 30px;">
                        <h3 id="username"><%= ps.getUsername() %></h3><span>&bull; <%= ps.getDatetime() %></span>
                    </div>
                    <div class="post-body">
                        <img src="./posts/<%= ps.getPost() %>" alt="">
                    </div>  
                    <div class="post-footer">
                        <a href="userpost.jsp?pid=<%=ps.getPid()%>&idpost=<%= ps.getIdpost()%>"><button class="read-more" style="color:white; cursor: pointer">Read More</button></a>
                        <% 
                            Likes li=new Likes();
                        %>
                        
                        <button id="like" style="cursor: default;"><i class="fa-sharp fa-solid fa-thumbs-up"></i><span class="like-counter"><%= li.countLikes(ps.getPid()) %></span></button>
                        <% 
                            comments com=new comments();
                        %>
                        <button id="comment"><i class="fa-sharp fa-solid fa-comment"></i><%= com.countComments(ps.getPid()) %></button>
                    </div>             
                </div>
                
                <%
            
                    }

                %>
            </div>

        </div>
    </div>
            
    

    <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
    <script src="js/showstory.js"></script>
    <script>
        $(document).ready(function(){
//            $('#userList').fadeOut();
            $('#search').keyup(function(){
                let val=$(this).val();
//                console.log(val);
                if(val != ''){
                    
                    $.ajax({
                        url: "SearchUsers",
                        method: 'post',
                        data: {user: val},
                        success: function(data){
                            $('#usersList').fadeIn("fast").html(data);                               
                        }
                    });
                    
                }else{
                    $('#usersList').fadeOut();
                }
                
            });
            
            $('#usersList').on('click',function(){
                var ul=$(this).text();
                $('#search').val(ul);
                $('#usersList').fadeOut();
            })
            
//            $('#goUserp').on('click',function(e){
////                console.log("hi");
//                e.preventDefault();
//                let usern=$('#search').val();
//                if(usern == ""){
//                    $('#usersList').fadeIn("fast").text("Please Enter the city name");
//                }
//                else{
//                    $.ajax({
//                        url: "GoUserProfile",
//                        method: "post",
//                        data: {un: usern},
//                        success: function(data){
//                            console.log(data)                               
//                        }
//                    })
//                }
//                
//            });
        });
        
    </script>
    <script src="js/likes.js"></script>
    <script>
        
//        let like=document.querySelector('#like');
//        let faThumbsUp=document.querySelector('.fa-thumbs-up');
//        like.addEventListener('click',(e)=>{
//            e.preventDefault();
//            faThumbsUp.style.color="red";      
//        });
    </script>
    
</body>
</html>
<%@page import="java.util.List"%>
<%@page import="com.social.Post"%>
<%@page import="com.social.ShowAllPosts"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
            String username=(String)session.getAttribute("username");
            if(username == null){
                response.sendRedirect("loginaccount");
                return;
            }
           
            int userprofile=Integer.parseInt(request.getParameter("userprofile"));
    
            ShowAllPosts sp=new ShowAllPosts();
            Post user=sp.getProfile(userprofile);
            
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= username %></title>
    <link rel="icon" href="./img/project icon.jpg">
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="css/usersprofile.css">
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
    
    </style>
</head>
<body>
    <div class="container">
        <div class="sub-container-1">
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
    
            <div class="profileContainer">
                <div class="profile">
                    <!-- profile header -->
                    <div class="profile-header">
                        <div class="bgImg">
                            <img src="covers/<%= user.getCoverfile() %>" alt="">
                        </div>
                        <div class="profileImg">
                            <img src="./profiles/<%= user.getFile() %>" alt="">
                        </div>
                    </div>
                    <!-- profile body -->
                    <div class="profile-body">
                        <div class="n-fbtn">
                            <h2><%=  user.getFullname() %></h2>
                            <!--<button id="fbtn">Follow</button>-->
                        </div>
                        
                        <h4>@<%=  user.getUsername() %></h4>
                        <p>&bull; Joined <%= user.getDatetime() %></p>
    
                        <!-- <div class="followers-following">
                            <h3 id="following-count">110</h3>&nbsp;<h4 class="f-f following">Following</h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <h3 id="followers-count">120</h3>&nbsp;<h4 class="f-f followers">Followers</h4>-->
                        <!--</div>-->
                    </div>
                </div>
            </div>
    
            <div class="display-followers-following">
                <!-- following container -->
                <div class="p-f-f" id="following">
                    <h3>Following</h3>
                    <div class="f-body">
                        <div class="p-f-f-users">
                            <img src="trees.png" alt=""  height="40px" width="40px" style="border-radius: 30px;  margin-right: 10px;">
                            <h4>roshanpawar</h4>
                        </div>
                        <div class="p-f-f-users">
                            <img src="trees.png" alt=""  height="40px" width="40px" style="border-radius: 30px;  margin-right: 10px;">
                            <h4>raj</h4>
                        </div>
                    </div>
                </div>
    
                <!-- followers container -->
                <div class="p-f-f" id="followers">
                    <h3>Followers</h3>
                    <div class="f-body">
                        <div class="p-f-f-users">
                            <img src="trees.png" alt=""  height="40px" width="40px" style="border-radius: 30px;  margin-right: 10px;">
                            <h4>harsh</h4>
                        </div>
                        <div class="p-f-f-users">
                            <img src="trees.png" alt=""  height="40px" width="40px" style="border-radius: 30px;  margin-right: 10px;">
                            <h4>roshanpawar12</h4>
                        </div>
                        <div class="p-f-f-users">
                            <img src="trees.png" alt=""  height="40px" width="40px" style="border-radius: 30px;  margin-right: 10px;">
                            <h4>roshanpawar12</h4>
                        </div>
                        <div class="p-f-f-users">
                            <img src="trees.png" alt=""  height="40px" width="40px" style="border-radius: 30px;  margin-right: 10px;">
                            <h4>roshanpawar12</h4>
                        </div>
                        <div class="p-f-f-users">
                            <img src="trees.png" alt=""  height="40px" width="40px" style="border-radius: 30px;  margin-right: 10px;">
                            <h4>roshanpawar12</h4>
                        </div>
                        <div class="p-f-f-users">
                            <img src="trees.png" alt=""  height="40px" width="40px" style="border-radius: 30px;  margin-right: 10px;">
                            <h4>roshanpawar12</h4>
                        </div>
                        <div class="p-f-f-users">
                            <img src="trees.png" alt=""  height="40px" width="40px" style="border-radius: 30px;  margin-right: 10px;">
                            <h4>roshanpawar12</h4>
                        </div>
                        <div class="p-f-f-users">
                            <img src="trees.png" alt=""  height="40px" width="40px" style="border-radius: 30px;  margin-right: 10px;">
                            <h4>roshanpawar12</h4>
                        </div>
                        <div class="p-f-f-users">
                            <img src="trees.png" alt=""  height="40px" width="40px" style="border-radius: 30px;  margin-right: 10px;">
                            <h4>roshanpawar12</h4>
                        </div>
                        <div class="p-f-f-users">
                            <img src="trees.png" alt=""  height="40px" width="40px" style="border-radius: 30px;  margin-right: 10px;">
                            <h4>roshanpawar12</h4>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>

        <div class="sub-container-2">
            <h2 id="u-posts">Posts</h2>
            <div class="users-posts">
                <% 
            
                    ShowAllPosts p=new ShowAllPosts();
                    List<Post> l=p.getAllUserPosts(userprofile);
                    for(Post ps:l){
            
                %>
                
                <a href="userpost.jsp?pid=<%=ps.getPid()%>&idpost=<%= ps.getIdpost()%>"><img src="posts/<%= ps.getPost() %>" alt=""></a>
                
                <%
            
                    }

                %>
            </div>
        </div>

    </div>



  <script>
    let following=document.querySelector('.following');
    let following1=document.querySelector('#following');

    let followers=document.querySelector('.followers');
    let followers1=document.querySelector('#followers');

    following.addEventListener('click',()=>{
        following1.style.display="block";
        followers1.style.display="none";
    });

    followers.addEventListener('click',()=>{
        followers1.style.display="block";
        following1.style.display="none";
    });
  </script>

</body>
</html>


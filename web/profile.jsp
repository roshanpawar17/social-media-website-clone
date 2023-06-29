
<%@page import="java.util.List"%>
<%@page import="com.social.Post"%>
<%@page import="com.social.ShowAllPosts"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
            
            Integer id=(Integer)session.getAttribute("id");
            String username=(String)session.getAttribute("username");
            String fullname=(String)session.getAttribute("fullname");
            String email=(String)session.getAttribute("email");
            String password=(String)session.getAttribute("password");
            String datetime=(String)session.getAttribute("datetime");
            String defaultprofile=(String)session.getAttribute("defaultprofile");
            String defaultcover=(String)session.getAttribute("defaultcover");            
            
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
    <link rel="icon" href="./img/project icon.jpg">
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="css/usersprofile.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <style>
        .side-navbar{   
            max-width: 20rem;       
            background: rgba(0, 0, 26, 0.89);
            height: 100vh;
            position: fixed;
        }
        li a{
            font-size: 18px;
            padding: 0px 20px;
        }
        
        .p-btm{
            position: absolute;
            bottom: 2px;
        }
        .active{
           filter: blur(10px); 
           pointer-events: none;
           user-select: none;
        }

        .popupBox{
            position: fixed;
            top: 30%;  
            left: 45em; 
            background: rgb(255, 255, 255);
            transform: translate(-20%,-50%);
            height: 7em;
            width: 10em;
            padding: 50px;
            box-shadow: 0 5px 30px rgba(0,0,0,.30);
            visibility: hidden;
            opacity: 0;
            transition: 0.5%;
        }
        
        .addPosts{
            position: fixed;
            top: 40%;  
            left: 40em; 
            background: rgb(255, 255, 255);
            transform: translate(-20%,-50%);
            height: 15em;
            width: 17em;
            padding: 50px;
            box-shadow: 0 5px 30px rgba(0,0,0,.30);
            visibility: hidden;
            opacity: 0;
            transition: 0.5%;
        }
        
        .popupBox .fa-solid{
            padding: 4px;
        }
        .popupBox span:hover{
            color: #6600ff;
            cursor: pointer;
        }

        .popup{
            position: fixed;
            top: 20%;  
            left: 41.5em; 
            background: rgb(255, 255, 255);
            height: 8em;
            width: 15em;
            padding: 15px;
            text-align: center;
            box-shadow: 0 5px 30px rgba(0,0,0,.30);
            
        }
        .profile-picture,.cover-picture{
            visibility: hidden;
            opacity: 0;
        }
        .popup h3{
            margin-bottom: 15px;
        }
        #backBtn{
            cursor: pointer;
            padding: 8px;
            margin-top: 30px;
            margin-left: 60px;
            background: #6600ff;
            color: white;
            border-radius: 5px;
            border: none; 
        }
        #backBtn2,#backBtn3,#backBtn4,#backBtnbk{
            cursor: pointer;
            padding: 8px;
            margin-top: 30px;
            margin-right: 1em;
            background: #6600ff;
            color: white;
            border-radius: 5px;
            border: none; 
        }

       .dis{
        display: flex;
        margin-left: 5em;
        /* flex-direction: row; */
       }
        #upBtn1,#upBtn2,#upBtn3,#upBtnup{
            cursor: pointer;
            padding: 8px;
            /* margin-left: 60px; */
            margin-top: 2.3em;
            background: #6600ff;
            color: white;
            border-radius: 5px;
            border: none;  
        }

        #backBtn:hover,#backBtn2:hover,#backBtn3:hover,#backBtn4:hover,#backBtnbk:hover{
            background: #3d0099;
        }

        .update-profile{
            position: fixed;
            top: 16%;  
            left: 35em; 
            background: rgb(255, 255, 255);
            height: 23em;
            width: 25em;
            padding: 15px;
            text-align: center;
            box-shadow: 0 5px 30px rgba(0,0,0,.30);
            visibility: hidden;
            opacity: 0;
        }
        
        .add-story{
            visibility: hidden;
            opacity: 0;
        }

        .form{
            display: flex;
            flex-direction: column;
            margin-top: 10px;
            padding: 15px;
        }
        .form .grp{
            display: flex;
            align-items: center;
        }
        .form input{
            width: 15em;
            height: 15px;
            /* margin-left: 20px; */
            margin: 15px 20px;
        }
        .form input:focus{
            border: 2px solid burlywood;
        }
        .form .ml{
            margin-left: 45px;
        }

        .form .btn-f{
            cursor: pointer;
            padding: 8px;
            background: #6600ff;
            color: white;
            border-radius: 5px;
            border: none; 
        }

        .form .btn-f:hover{
            background: #3d0099;
            cursor: pointer;
            padding: 8px;
            background: #6600ff;
            color: white;
            border-radius: 5px;
            border: none; 
        }

        .update-profile #bk{
            margin-bottom: 10px;
            cursor: pointer;
            padding: 8px;
            background: #6600ff;
            color: white;
            border-radius: 5px;
            border: none;
        }
        .pin{
            width: 10em;
            height: 20px;
            font-size: 15px;
        }
        
    </style>
</head>
<body>
    <div class="container" id="blur">
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
                        <i class="fa-sharp fa-solid fa-circle-plus"></i>
                        <a id="addPost" style="cursor: pointer;">Add Post</a>
                    </li>
                    <li>
                        <i class="fa-sharp fa-solid fa-square-plus"></i>
                        <a id="addStory" style="cursor: pointer;">Add Story</a>
                    </li>
                    <div class="p-btm">
                        <li>
                            <i class="fa-sharp fa-solid fa-gear"></i>
                            <a id="setting" style="cursor: pointer;">Setting</a>
                        </li>
                        <li>
                            <i class="fa-sharp fa-solid fa-right-from-bracket"></i>
                            <a href="logout" id="logout">Logout</a>
                        </li>
                    </div>
                </ul>
            </nav>
    
            <div class="profileContainer">
                <div class="profile">
                    <!-- profile header -->
                    <div class="profile-header">
                        <div class="bgImg">
                            <img src="covers/<%= defaultcover %>" alt="">
                        </div>
                        <div class="profileImg">
                            <img src="profiles/<%= defaultprofile %>" alt="">                            
                        </div>
                    </div>
                    <!-- profile body -->
                    <div class="profile-body">
                        <div class="n-fbtn">                            
                            <h2><%= fullname %></h2>
                        </div>
                        
                        <h4>@<%= username %></h4>
                        <p>&bull; Joined <%= datetime %></p>
                        
                        <div class="followers-following">
                            <h3 id="following-count"></h3>&nbsp;<h4 class="f-f following"></h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <h3 id="followers-count"></h3>&nbsp;<h4 class="f-f followers"></h4>
                        </div>
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
                    List<Post> l=p.getAllUserPosts(id);
                    for(Post ps:l){

                %>
                
                <a href="userpost.jsp?pid=<%=ps.getPid()%>&idpost=<%= ps.getIdpost()%>"><img src="posts/<%= ps.getPost() %>" alt=""></a>
                
                <%
                    }
                %>
                
            </div>
        </div>

    </div>
                
    <div class="popup add-story">
        <h3>Select Story</h3>                 
            <form action="AddStory" method="post" enctype="multipart/form-data">
                <input type="number" name="id" value=<%= id %> hidden>
                <input type="file" name="story" required>
                <div class="dis">
                    <button id="backBtnbk">Back</button>
                    <button id="upBtnup" type="submit">Upload</button>
                </div>
            </form>
    </div>           

  <div class="popupBox">
        <div>
            <i class="fa-sharp fa-solid fa-id-badge"></i>
            <span id="profile-picture">Select Profile Picture</span>
    
            <i class="fa-sharp fa-solid fa-image"></i>
            <span id="cover-picture">Select Cover Picture</span>
    
            <i class="fa-sharp fa-solid fa-pen-to-square"></i>
            <span id="update-profile">Update Profile</span>

        </div>

        <button id="backBtn">Back</button>
    </div>
                
    <div class="addPosts">
        <h3>Select Picture</h3><br><br>
        <form action="AddPost" method="post" enctype="multipart/form-data">
            <input type="number" name="id" value=<%= id %> hidden>
            <input type="file" name="post" required><br><br>
            <input type="text" name="location" class="pin" placeholder="Location"><br><br>
            <input type="text" name="caption" class="pin" placeholder="Write caption here...">
            <div class="dis">
                <button id="backBtn4">Back</button>
                <button id="upBtn3" type="submit">Upload</button>
            </div>
        </form>
    </div>

    <div class="popup profile-picture">
        <h3>Select Profile Picture</h3>
        <form action="UpdateProfilePic" method="post" enctype="multipart/form-data">
            <input type="number" name="id" value=<%= id %> hidden>
            <input type="file" name="profilepic" required>
            <div class="dis">
                <button id="backBtn2">Back</button>
                <button id="upBtn1" type="submit">Upload</button>
            </div>
        </form>
    </div>

    <div class="popup cover-picture">
        <h3>Select Cover Picture</h3>
        <form action="UpdateCoverPic" method="post" enctype="multipart/form-data">
            <input type="number" name="id" value=<%= id %> hidden>
            <input type="file" name="coverpic" required>
            <div class="dis">
                <button id="backBtn3">Back</button>
                <button id="upBtn2" type="submit">Upload</button>
            </div>
        </form>
    </div>

    <div class="update-profile">
        <h2>Update Profile</h2>
        <form action="EditProfile" class="form" method="post">
            <input type="number" name="id" value=<%= id %> hidden>
            <div class="grp">
                <span>Username: </span>
                <input type="text" name="username" value="<%= username %>">
            </div>
            <div class="grp">
                <span>Name: </span>
                <input type="text" name="name" value="<%= fullname %>" class=" ml">
            </div>
            <div class="grp">
                <span>Email: </span>
                <input type="text" name="email" value="<%= email %>" class=" ml">
            </div>
            <div class="grp">
                <span>Password: </span>
                <input type="password" name="password" value="<%= password %>">
            </div>
            
            <button class="btn-f" type="submit">Submit</button>
        </form>
        <button class="btn-f" id="bk">Back</button>
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

    let setting=document.querySelector('#setting');
    let blur=document.querySelector('#blur');
    let popupBox=document.querySelector('.popupBox');
    let backBtn=document.querySelector('#backBtn');
    
    setting.addEventListener('click',()=>{
        blur.classList.add("active");
        popupBox.style.visibility="visible";
        popupBox.style.opacity="1";
    })

    backBtn.addEventListener('click',()=>{
        blur.classList.remove("active");
        popupBox.style.visibility="none";
        popupBox.style.opacity="0";
    })
    
    let story=document.querySelector('.add-story');
    let addStory=document.querySelector('#addStory');
    let backBtnbk=document.querySelector('#backBtnbk');
    

    addStory.addEventListener('click',()=>{
        story.style.visibility="visible"
        story.style.opacity="1";
        blur.classList.add("active");
    })

    backBtnbk.addEventListener('click',()=>{
        story.style.visibility="hidden"
        story.style.opacity="0";
        blur.classList.remove("active");
    })

//    story
    let profile=document.querySelector('#profile-picture');
    let profilePicture=document.querySelector('.profile-picture');
    let backBtn2=document.querySelector('#backBtn2');
    profile.addEventListener('click',()=>{
        profilePicture.style.visibility="visible"
        profilePicture.style.opacity="1";
    })
    
    backBtn2.addEventListener('click',()=>{
        profilePicture.style.visibility="hidden"
        profilePicture.style.opacity="0";
    })

    let cover=document.querySelector('#cover-picture');
    let coverPicture=document.querySelector('.cover-picture');
    cover.addEventListener('click',()=>{
        coverPicture.style.visibility="visible"
        coverPicture.style.opacity="1";
    })

    backBtn3.addEventListener('click',()=>{
        coverPicture.style.visibility="hidden"
        coverPicture.style.opacity="0";
    })
    
    let addPost=document.querySelector('#addPost');
    let addPosts=document.querySelector('.addPosts');
    let backBtn4=document.querySelector('#backBtn4');
    addPost.addEventListener('click',()=>{
        blur.classList.add("active");
        addPosts.style.visibility="visible";
        addPosts.style.opacity="1";
    })
    
    backBtn4.addEventListener('click',()=>{
        blur.classList.remove("active");
        addPosts.style.visibility="hidden"
        addPosts.style.opacity="0";
    })

    let update=document.querySelector('#update-profile');
    let updatePofile=document.querySelector('.update-profile');
    update.addEventListener('click',()=>{
        updatePofile.style.visibility="visible"
        updatePofile.style.opacity="1";
    })

    bk.addEventListener('click',()=>{
        updatePofile.style.visibility="hidden"
        updatePofile.style.opacity="0";
    })
    
    
  </script>
</body>
</html>
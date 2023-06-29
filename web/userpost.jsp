<%@page import="com.social.Reply"%>
<%@page import="com.social.AllReply"%>
<%@page import="com.social.comments"%>
<%@page import="java.util.List"%>
<%@page import="com.social.Likes"%>
<%@page import="com.social.Post"%>
<%@page import="com.social.ShowAllPosts"%>
<%--<%@page errorPage="servererror"%>--%>
<%
    Integer id=(Integer)session.getAttribute("id");
    String defaultprofile=(String)session.getAttribute("defaultprofile");
    String username=(String)session.getAttribute("username");
        if(username == null){
            response.sendRedirect("loginaccount");
            return;
        }
     
    int pid=Integer.parseInt(request.getParameter("pid"));
    int postid=Integer.parseInt(request.getParameter("idpost"));
    
    ShowAllPosts sp=new ShowAllPosts();
    Post post=sp.getPost(pid,postid);
    
    Likes like=new Likes();
    comments comm=new comments();
    
//    boolean l=like.isLiked(pid, id);
//    if(l == true ){
//        out.println("liked "+ l);
//    }else{
//        out.println("liked "+ l);
//    }
    
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%=  username %></title>
    <link rel="icon" href="./img/project icon.jpg">
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <link rel="stylesheet" href="@import url('https://fonts.googleapis.com/css2?family=Jost:wght@300&family=Shadows+Into+Light&family=Ubuntu&display=swap');">
    <style>
        .container{
            display: flex;
            flex-direction: row;
            
        }

        /* ********** comment section  *********** */
        .comments{
            /* border: 1px solid; */
            width: 27rem; 
            margin-top: 2em; 
            margin-left: 2em; 
            display: flex;         
            flex-direction: column;
        }
        .comments h1{
            text-align: center;
            font-family: 'Jost', sans-serif;
        }
        .comments-block{
            overflow-y: auto;
            height: 84vh;
        }
        .comments-head{
            display: flex;
            align-items: center;
            margin-top: 20px;
            margin-left: 15px;
        }
        .comments-head h4{
            margin-right: 10px;
            font-family: 'Ubuntu', sans-serif;
        }
        .comment-body{
            display: flex;
            flex-direction: column;
            margin-left: 5em;
        }
        .comment-body p{
            box-sizing: border-box;
            width: 260px;
            font-family: 'Jost', sans-serif;
            /*border: 2px solid;*/ 
            word-break: break-all;
        }
        
        #caption{
            box-sizing: border-box;
            width: 260px;
            font-family: sans-serif;
            /*border: 2px solid;*/ 
            word-break: break-all;
            margin-left: 4em;
            overflow-y: auto;
            height: 20px;
        }
        
         /* reply block */
        .reply-container{
            margin-left: 4em;
        }

        .reply-head{
            display: flex;
            align-items: center;
            margin-top: 20px;
            margin-left: 15px;
        }

        .reply-body{
            display: flex;
            flex-direction: column;
            margin-left: 5em;
        }

        .reply-body p{
            box-sizing: border-box;
            width: 260px;
            font-family: 'Jost', sans-serif;
            /* border: 2px solid; */
        }

        /* ******** post-container-body ******** */
        .p-p{
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 1em;
            margin-left: 31em;
            position: fixed;
             /*height: 200vh;*/ 
        }

        .post-heading #username a{
            text-decoration-line: none;
            color: black;
        }
        .post-heading #username a:hover{
            color: #4040bf;
            text-decoration-line: underline;
        }

        /* *********add post********* */
        .cmt-btn{
            padding: 10px;
            margin-left: 10px;
            background: #6600ff;
            border-radius: 3px;
            border: none;
            color: white;
            cursor: pointer;
            font-family: 'Orbitron', sans-serif;
        }

        /* *********likes container********* */
        .likes{
            /* border: 2px solid; */
            width: 15em;
            margin-top: 2em; 
            margin-left: 39em; 
            padding: 10px;
            display: flex;         
            flex-direction: column;
        }

        .likes h1{
            font-family: 'Jost', sans-serif;
            text-align: center;
        }
        .like-block{
            overflow-y: auto;
            height: 84vh;
        }
        .likes-body{
            /* margin-left: 4em; */
            margin-top: 2em;
            display: flex;
            flex-direction: row;
            align-items: center;
        }
        .likes-body h4{
            margin-right: 10px;
            font-family: 'Ubuntu', sans-serif;
        }
        
        .popup{
            position: fixed;
            bottom: 2em;  
            left: 28em; 
            background: rgb(255, 255, 255);
            height: 3em;
            width: 35em;
            padding: 15px;
            text-align: center;
            box-shadow: 0 5px 30px rgba(0,0,0,.45);           
        }
        
        .reply-to{
            visibility: hidden;
            opacity: 0;
        }
        
        #backBtnbk{
            cursor: pointer;
            padding: 8px;
            background: #6600ff;
            color: white;
            border-radius: 5px;
            border: none; 
        }
        
        #upBtnup{
            cursor: pointer;
            padding: 8px;
            background: #6600ff;
            color: white;
            border-radius: 5px;
            border: none;  
        }
        
        #backBtnbk:hover,#upBtnup:hover{
            background: #3d0099;
        }
        
         .active{
           filter: blur(5px); 
           pointer-events: none;
           user-select: none;
        }
        
        #reply{
            cursor: pointer;
            padding: 8px;
            background: #6600ff;
            color: white;
            border-radius: 5px;
            border: none;
        }
        
        
    </style>
</head>
<body>
    <div class="container" id="blur">
        <!-- **********comment section********** -->
        <div class="comments">
            <h1>&#8226; Comments &#8226;</h1>
            <div class="comments-block">
                <%
                    List<comments> lst=comm.commentsByUserName(pid);
                    for(comments c:lst){
                %>
                <div class="comment-container">
                    <div class="comments-head">
                        <img src="profiles/<%= c.getProfile() %>" alt=""  height="40px" width="40px" style="border-radius: 30px;  margin-right: 10px;">
                        <h4 ><%= c.getUsername() %></h4><span>&bull; <%= c.getDate() %></span>&nbsp;&nbsp;
                        <%
                            if(postid == id){
                        %>
                            <button onclick="replyInfo(<%= c.getCid() %>,<%= c.getUpid() %>)" id="reply" type="submit">Reply</button>                      
                        <%
                            }
                        %>                            
                    </div>
                    <div class="comment-body">
                        <p><%= c.getUcomments() %></p>
                    </div>
                </div>
                
                    
                <div class="reply-container">
                    <%
                        AllReply al=new AllReply();
                        List<Reply> r=al.selectReply();
                        for(Reply rl:r){
                           if(rl.getCid() == c.getCid()){
                    %>
                    <div class="reply-head">
                        <img src="profiles/<%= rl.getProfile()  %>" alt=""  height="40px" width="40px" style="border-radius: 30px;  margin-right: 10px;">
                        <h4><%= rl.getUsername() %></h4><span> &bull; <%= rl.getDate() %> </span>
                    </div>
                    <div class="reply-body">
                        <p><%= rl.getReply() %></p>
                    </div>
                    <%
                        }
                       }
                    %>
                </div>
   
                <%
                            }
                %>
                
            </div>
        </div> 

        <!-- *************post-container-body************ -->
        
        <div class="p-p">
            <div class="post">
                <div class="post-heading">
                    <img src="./profiles/<%= post.getFileName() %>" alt="" height="60px" width="60px" style="border-radius: 30px;">
                    <%
                        if(post.getIdpost() == id){
                    %>
                    <h3 id="username"><a href="profile.jsp?userprofile=<%= post.getIdpost() %>"><%=  post.getUsername() %></a></h3><span>&bull; <%= post.getDatetime() %>&nbsp;</span>
                    
                    <%
                        }
                        else{
                    %>
                    <h3 id="username"><a href="usersprofile.jsp?userprofile=<%= post.getIdpost() %>"><%=  post.getUsername() %></a></h3><span>&bull; <%= post.getDatetime() %></span><br>
                    
                    <%
                        }
                        
                    %>
                    <h5>&bull; <%=  post.getLocation() %></h5>
                </div>
                <div class="post-body">
                    <img src="./posts/<%= post.getPost() %>" alt="">
                </div>  
                <div class="post-footer">
                    <button class="read-more"><a href="home.jsp">&lt; Back</a></button>

                    <button id="like" onclick="dolike(<%= pid %>,<%= id %>)"><i class="fa-sharp fa-solid fa-thumbs-up"></i><span class="like-counter"><%= like.countLikes(pid) %></span></button>
                    
                    <button id="comment"><i class="fa-sharp fa-solid fa-comment"></i><%= comm.countComments(pid) %></button>
                    
                </div> 
                <div>
                    <p id="caption"><%= post.getCaption() %></p>   
                </div>
            </div>

            <!-- ********** add post ********** -->
            <div class="add-comment">
                <form action="CommentByUser" method="post">
                    <input type="number" name="pid" value="<%= pid %>" hidden>
                    <input type="number" name="id" value="<%= id %>" hidden>
                    <input type="number" name="idpost" value="<%= post.getIdpost()%>" hidden>
                    <input type="text" name="comment" placeholder="Add a comment..." required>
                    <button class="cmt-btn" type="submit">SEND</button>
                </form>
            </div> 
        </div>

        <!-- *******like section******* -->
        <div class="likes">
            <h1>&#8226; Likes &#8226;</h1>
            
            <div class="like-block">
                <%
                List<Likes> listlikes=like.likeByUserName(pid);
                for(Likes l:listlikes){
                %>
                
                <div class="likes-body">
                    <img src="profiles/<%= l.getProfile() %>" alt=""  height="40px" width="40px" style="border-radius: 30px;  margin-right: 10px;">
                    <h4><%= l.getUsername() %></h4>
                </div>
                <%
                            }
                %>
               
            </div>

        </div>

    </div>
                
    <div class="popup reply-to">   
          
            <form action="ReplyToUser" method="post" >
                <button id="backBtnbk">Back</button>
                <input type="number" name="pid" value="<%= pid %>" hidden>
                <input type="number" name="id" value="<%= id %>" hidden>
                <input type="number" name="idpost" value="<%= post.getIdpost()%>" hidden>
                <input type="number" name="cid" id="cid" value="" hidden>
                <input type="text" name="reply" id="replytxt" placeholder="Replying to ..." required>
                <button id="upBtnup" type="submit">Send</button>
            </form>
    </div> 
                    
    <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
    <script src="js/likes.js"></script>
    <script src="js/comments.js"></script>
    <script>
        let reply=document.querySelectorAll('#reply');
        let replyTo=document.querySelector('.reply-to');
        let blur=document.querySelector('#blur');
        let backBtnbk=document.querySelector('#backBtnbk');
        Array.from(reply,(e)=>{
            e.addEventListener('click',()=>{
                replyTo.style.visibility="visible";
                replyTo.style.opacity="1";
                blur.classList.add("active");
            });
        })
        
        backBtnbk.addEventListener('click',()=>{
            replyTo.style.visibility="hidden";
            replyTo.style.opacity="0";
            blur.classList.remove("active");
        });
        
        let like=document.querySelector('#like');
        like.addEventListener('click',()=>{
                location.reload();
            });
    </script>
</body>
</html>

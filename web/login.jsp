<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="servererror"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Account</title>
    <link rel="icon" href="./img/project icon.jpg">
    <link rel="stylesheet" href="./css/signuplogin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    
    <style>
        form{
            height: 30em;
            margin-top: 4em;
            position: relative;
            position: fixed;
         
        }

        input{
            margin-bottom: 8px;
            padding: 12px;
        }
        
        .alert{
            width: 18em;
            height: 25px;
            padding: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 19px;
            border-radius: 10px;
          
        }
        
        .alert-danger{
            background-color: rgb(252, 208, 204);
            color: rgb(130, 48, 40);
        }
        
        .alert-success{
            background-color: rgb(252, 208, 204);
            color: rgb(130, 48, 40);
        }
               
        .alert .fa-xmark{
            padding-left: 5em;
        }
        .vp{
            position: relative;
        }
        
       
    </style>
</head>
<body class="bgImg" style="background-image: url(./img/social.png);">
    <%@include file="navbar.jsp" %>
        
    <form action="login" method="POST" class="form">
        
      

        <%
            
            String passIncorrect=(String)session.getAttribute("passIncorrect");
            if(passIncorrect!=null){
        %>
        
            <div class="alert alert-danger">
                <strong style="margin-right: 13px"><%= passIncorrect %></strong>
                <i class="fa-sharp fa-solid fa-xmark" style="cursor:pointer;"></i>
            </div>
        
        <%
            session.removeAttribute("passIncorrect");
            }
            else{
                String usernameNotExist=(String)session.getAttribute("usernameNotExist");
                if(usernameNotExist!=null){
        %>
            <div class="alert alert-danger">
                <strong><%= usernameNotExist %></strong>
                <i class="fa-sharp fa-solid fa-xmark" style="cursor:pointer; "></i>
            </div>
        <%
            session.removeAttribute("usernameNotExist");
                }
            }
            session.invalidate();
        %>
        
        
        
        
        
        
       
        <h1>Login</h1>
        <input type="text" name="username" id="username" placeholder="Username" required style="margin-left: 25px;">
        <div class="vp">
            <span id="passVisible" class="fa-sharp fa-solid fa-eye" style="font-size: 15px; position: relative; left: 25em;"></span>
            <input type="password" name="password" id="password" placeholder="Password" required>
        </div>
        
    
        <!--<a href="#" style="font-size: 15px; position: absolute; right: 6em; top: 14.3em;">Forgot Password</a>-->
        <button type="submit" name="login" id="login">LOGIN</button>
        <div style="padding-top: 10px;">
            <span>Don't have an account ?</span>
            <a href="signupaccount">Sign up</a>
        </div>
    </form>
    
    <script>
        //password visible invisible
        let passVisible=document.querySelector('#passVisible');
        passVisible.addEventListener('click',()=>{
            let password=document.querySelector('#password');
            
            if(password.getAttribute('type')==='password'){
                //visible
                password.setAttribute('type','text');
                passVisible.classList.add('fa-eye-slash');
                passVisible.classList.remove('fa-eye');
            }
            else{
              //invisible
                password.setAttribute('type','password');
                passVisible.classList.add('fa-eye');
                passVisible.classList.remove('fa-eye-slash');  
            }      
            
        });
        
        //dismiss the alert
        let cut=document.querySelector('.fa-xmark');        
        cut.addEventListener('click',()=>{
            let alertDanger=document.querySelector('.alert-danger');
            alertDanger.style.display="none";
        });
         

    </script>
</body>
</html>

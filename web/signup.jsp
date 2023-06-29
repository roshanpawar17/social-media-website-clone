<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="servererror"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign up</title>
    <link rel="icon" href="./img/project icon.jpg">
    <link rel="stylesheet" href="./css/signuplogin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <style>
        #username:invalid{
            border: 2px solid red;
        }
    </style>
</head>
<body class="bgImg" style="background-image: url(./img/social.png);">
    <%@include file="navbar.jsp" %>
    <form action="Signup" method="POST" id="form">
        <h1>Signup</h1>
        <input type="text" name="username" id="username" placeholder="Username" pattern="[a-z0-9_.]*" >
        <div class="together">
            <input type="text" name="firstname" id="firstname" placeholder="First Name" required>
            <input type="text" name="lastname" id="lastname" placeholder="Last Name" required>
        </div>
        <input type="email" name="email" id="email" placeholder="Email" required>  
        <div class="together">
            <span id="passVisible" class="fa-sharp fa-solid fa-eye" style="font-size: 15px; position: absolute; left: 14em; top: 23em;"></span>
            <input type="password" name="password" id="password" placeholder="Password" required>  
            <input type="password" name="cpassword" id="cpassword" placeholder="Confirm Password" required>
        </div>
       
        <button type="submit" name="submit" id="submit">SIGN UP</button>
        <div class="alredyAcc" style="padding-top: 20px;">
            <span>Already have an account ?</span>
            <a href="loginaccount">Login</a>
        </div>
    </form>
    
    <script>
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
                password.setAttribute('type','password')
                passVisible.classList.add('fa-eye');
                passVisible.classList.remove('fa-eye-slash');  
            }      
            
        });
        
    </script>
    
</body>
</html>
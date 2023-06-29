<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error - Something went wrong </title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Pacifico&family=Ubuntu&display=swap');
            .error{
                margin: auto;
                width: 35vw;
                margin-top: 20vh;
            }
            img{
                height: 50vh;
                width: 30vw;
            }
            h1{
                text-align: center;
                 font-family: 'Ubuntu', sans-serif;
            }
        </style>
    </head>
    <body>
        <div class="error">
            <img src="./img/servererror.png"></img>
            <h1>Error - Something went wrong </h1>
        </div>
    </body>
</html>

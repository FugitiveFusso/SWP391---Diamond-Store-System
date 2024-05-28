<%-- 
    Document   : register
    Created on : May 28, 2024, 6:32:43 PM
    Author     : phucu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./css/signup.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
        <script defer src="./js/signup.js"></script>
    </head>
    <body>


        <div class="container">


            <form name="registerForm" id="form" action="register" method="POST" onsubmit="return validateForm();">
                <h1>Register</h1>
                <% String error1 = (String) request.getAttribute("error1"); %>
                <% if (error1 != null) {%>
                <h4 style="color: red; text-align: center"> <%= error1%> </h4>
                <% }%>

                <div class="input-control"><label for="username"></label>Username<input type="text" id="username1" name="username" placeholder="cuong"> <div class="error"></div></div>
                <div class="input-control"><label for="password"></label>Password<input type="password" id="password1" name="password" placeholder="abcxyz"> <div class="error"></div></div>
                <div class="input-control"><label for="repass"></label>Re-password<input type="password" id="repass1" name="repass" placeholder="Pass again"> <div class="error"></div></div>
                <div class="input-control"><label for="firstname"></label>First Name<input type="text" id="firstname1" name="firstname" placeholder="Cuong"> <div class="error"></div></div>
                <div class="input-control"><label for="lastname"></label>Last Name<input type="text" id="lastname1" name="lastname"placeholder="Nguyen"> <div class="error"></div></div>
                <div class="input-control"><label for="phonenumber"></label>Phone Contact<input type="text" id="phonenumber1" name="phonenumber" placeholder="10 numbers (0898xxxxxx)"> <div class="error"></div></div>
                <div class="input-control"><label for="email"></label>Email<input type="text" id="email1" name="email" placeholder="abc123@gmail.com"> <div class="error"></div></div>
                <div class="input-control"><label for="address"></label>Address<input type="text" id="address1" name="address" placeholder="Your address"> <div class="error"></div></div>

                <a href="userlogin.jsp">Login User Page</a><br>
                <button type="submit">Sign Up</button>
            </form>
        </div>

    </body>
</html>

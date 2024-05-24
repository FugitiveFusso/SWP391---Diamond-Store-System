

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FUJ - FPT Jewelry</title>
    </head>
    <body>
        <h1>User Login</h1>
        <% String error = (String) request.getAttribute("error"); %>
        <% if (error != null) {%>
        <h3 style="color: red"> <%= error%> </h3>
        <% }%>
        <form action="./userlogin" name="" method="POST">
            <input name="user" type="text" placeholder="Your Username">
            <input name="password" type="password" placeholder="Your Password">
            <input value="Login" type="submit">
            <a href="https://accounts.google.com/o/oauth2/auth?scope=profile&redirect_uri=http://localhost:8080/FUJ/UserGoogleLoginController&response_type=code
		   &client_id=792757160936-kke52p9ud3fl6h3qe93tl4i6lug4sotd.apps.googleusercontent.com&approval_prompt=force">Login with Google</a>
        </form>
        <a href="managerlogin.jsp">Sign in for Manager</a><br>
        <a href="adminlogin.jsp">Sign in for Admin</a><br>
        <a href="saleslogin.jsp">Sign in for Sales Staff</a><br>
        <a href="deliverystafflogin.jsp">Sign in for Delivery Staff</a><br>
    </body>
</html>

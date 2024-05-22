

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FUJ - FPT Jewelry</title>
    </head>
    <body>
        <h1>Delivery Staff Login</h1>
        <% String error =  (String) request.getAttribute("error"); %>
        <% if (error != null) { %>
        <h3 style="color: red"> <%= error %> </h3>
        <% } %>
        <form action="./deliverystafflogin" name="" method="POST">
            <input name="user" type="text" placeholder="Your Username">
            <input name="password" type="password" placeholder="Your Password">
            <input value="Login" type="submit">
        </form>
        <a href="userlogin.jsp">Back to customer sign in site</a><br>
        <a href="adminlogin.jsp">Sign in for Admin</a><br>
        <a href="managerlogin.jsp">Sign in for Manager</a><br>
        <a href="saleslogin.jsp">Sign in for Sales Staff</a><br>
    </body>
</html>

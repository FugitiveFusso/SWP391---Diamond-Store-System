<%-- 
    Document   : admindetails
    Created on : May 25, 2024, 10:32:20 AM
    Author     : phucu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrator Management Page</title>
        <link rel="stylesheet" href="css/navbar.css">
        <link rel="stylesheet" href="css/staff_detail.css">

    </head>
    <body>

        <div class="menu">
            <!--you will code the horizontal menu here-->
            <ul class="navbar">
                <li class="navbar__link"><a href="#">Order</a></li>
                <li class="navbar__link"><a href="#">Products</a></li>
                <li class="navbar__link"><a href="#">Voucher</a></li>
                <img src="./images/Screenshot (656).png">
                <li class="navbar__link"><a href="#">Delivery Tracking</a></li>
                <li class="navbar__link"><a href="#">Dashboard</a></li>
                <li class="navbar__link"><a href="#">Account</a></li>
            </ul>

        </div>

        <jsp:include page="/managermenu.jsp" flush="true" />

        <div class="container">
            <h1>Administrator Details Page</h1>         
            <p> Login username: ${sessionScope.managersession.username}</p>

            <table>

                <tr><td>User Name</td><td>${requestScope.admin.username}</td></tr>
                <tr><td>Password</td><td>${requestScope.admin.password}</td></tr>
                <tr><td>First Name</td><td>${requestScope.admin.firstname}</td></tr>
                <tr><td>Last Name</td><td>${requestScope.admin.lastname}</td></tr>
                <tr><td>Phone Number</td><td>${requestScope.admin.phonenumber}</td></tr>
                <tr><td>Email</td><td>${requestScope.admin.email}</td></tr>
                <tr><td>Address</td><td>${requestScope.admin.address}</td></tr>
                <tr><td>Point</td><td>${requestScope.admin.point}</td></tr>
            </table>

            <form action="AdminController" style="padding-top: 10px">

                <input type=hidden name="action" value="list">
                <input type=submit value="Return" ></form>

            <form action="AdminController" style="padding-top: 10px">
                <input type=hidden name="id" value="${requestScope.admin.userid}">
                <input type=hidden name="action" value="edit">
                <input type=submit value="Edit" ></form>

        </div>
    </body>
</html>

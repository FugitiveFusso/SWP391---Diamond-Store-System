<%-- 
    Document   : deliverystaffdetails
    Created on : May 25, 2024, 11:46:45 AM
    Author     : phucu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delivery Staff Management Page</title>
    </head>
    <body>
        <jsp:include page="/managermenu.jsp" flush="true" />

        <h1>Delivery Staff Details Page</h1>         
        <p> Login username: ${sessionScope.managersession.username}</p>

        <style>
            #searchbox{
                margin-top: 5px;
            }
            body{
                font-size: 16px;
                font-family: Arial, Helvetica, sans-serif;
            }
            table{
                margin-top: 10px
            }
            table, tr, td{
                border-collapse: collapse;
                width: 400px;
                border: 2px solid black;
                text-align: center;
            }
            tr,td{
                padding: 6px 10px;
            }
        </style>
        <table>

            <tr><td>User Name</td><td>${requestScope.deliverystaff.username}</td></tr>
            <tr><td>Password</td><td>${requestScope.deliverystaff.password}</td></tr>
            <tr><td>First Name</td><td>${requestScope.deliverystaff.firstname}</td></tr>
            <tr><td>Last Name</td><td>${requestScope.deliverystaff.lastname}</td></tr>
            <tr><td>Phone Number</td><td>${requestScope.deliverystaff.phonenumber}</td></tr>
            <tr><td>Email</td><td>${requestScope.deliverystaff.email}</td></tr>
            <tr><td>Address</td><td>${requestScope.deliverystaff.address}</td></tr>
            <tr><td>Point</td><td>${requestScope.deliverystaff.point}</td></tr>
        </table>

        <form action="DeliveryStaffController" style="padding-top: 10px">
            <input type=hidden name="id" value="${requestScope.deliverystaff.userid}">
            <input type=hidden name="action" value="edit">
            <input type=submit value="Edit" ></form>
    </body>
</html>

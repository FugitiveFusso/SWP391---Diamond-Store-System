<%-- 
    Document   : customerdetails
    Created on : May 24, 2024, 5:36:52 PM
    Author     : phucu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Details Page</title>
    </head>
    <body>
        <jsp:include page="/menu.jsp" flush="true" />

        <h1>Customers Details </h1>         
        <p> Login username: ${sessionScope.adminsession.username}</p>

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

            <tr><td>User Name</td><td>${requestScope.customer.username}</td></tr>
            <tr><td>First Name</td><td>${requestScope.customer.firstname}</td></tr>
            <tr><td>Last Name</td><td>${requestScope.customer.lastname}</td></tr>
            <tr><td>Phone Number</td><td>${requestScope.customer.phonenumber}</td></tr>
            <tr><td>Email</td><td>${requestScope.customer.email}</td></tr>
            <tr><td>Address</td><td>${requestScope.customer.address}</td></tr>
            <tr><td>Point</td><td>${requestScope.customer.point}</td></tr>
            

        </table>

    </body>
</html>

<%-- 
    Document   : managerdetails
    Created on : May 25, 2024, 11:16:13 AM
    Author     : phucu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Management Page</title>
    </head>
    <body>
        <jsp:include page="/menu.jsp" flush="true" />

        <h1>Manager Details </h1>         
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

            <tr><td>User Name</td><td>${requestScope.manager.username}</td></tr>
            <tr><td>Password</td><td>${requestScope.manager.password}</td></tr>
            <tr><td>First Name</td><td>${requestScope.manager.firstname}</td></tr>
            <tr><td>Last Name</td><td>${requestScope.manager.lastname}</td></tr>
            <tr><td>Phone Number</td><td>${requestScope.manager.phonenumber}</td></tr>
            <tr><td>Email</td><td>${requestScope.manager.email}</td></tr>
            <tr><td>Address</td><td>${requestScope.manager.address}</td></tr>
            <tr><td>Point</td><td>${requestScope.manager.point}</td></tr>
        </table>

        <form action="ManagerController" style="padding-top: 10px">
            <input type=hidden name="id" value="${requestScope.manager.userid}">
            <input type=hidden name="action" value="edit">
            <input type=submit value="Edit" ></form>
    </body>
</html>

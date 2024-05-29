<%-- 
    Document   : categorydetails
    Created on : May 29, 2024, 10:49:42 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category Details Page</title>
    </head>
    <body>
         <jsp:include page="/menu.jsp" flush="true" />

        <h1>Category Details </h1>         
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

            <tr><td>Category ID</td><td>${requestScope.category.categoryID}</td></tr>
            <tr><td>Category Name</td><td>${requestScope.category.categoryName}</td></tr>
        </table>
            
            <form action="CategoryController" style="padding-top: 10px">
            <input type=hidden name="action" value="list">
            <input type=submit value="Return" ></form>

        <form action="CategoryController" style="padding-top: 10px">
            <input type=hidden name="id" value="${requestScope.category.categoryid}">
            <input type=hidden name="action" value="edit">
            <input type=submit value="Edit" ></form>
    </body>
</html>

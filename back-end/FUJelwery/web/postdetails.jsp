<%-- 
    Document   : postdetails
    Created on : May 26, 2024, 12:26:47 PM
    Author     : phucu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="/menu.jsp" flush="true" />

        <h1>Post Details </h1>         
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

            <tr><td>Post ID</td><td>${requestScope.post.id}</td></tr>
            <tr><td>Post Name</td><td>${requestScope.post.name}</td></tr>
            <tr><td>Post Image</td><td><img src=${requestScope.post.image} width="300px"></td></tr>
            <tr><td>Description</td><td>${requestScope.post.description}</td></tr>

        </table>
            
            <form action="PostController" style="padding-top: 10px">
            <input type=hidden name="action" value="list">
            <input type=submit value="Return" ></form>

        <form action="PostController" style="padding-top: 10px">
            <input type=hidden name="id" value="${requestScope.post.id}">
            <input type=hidden name="action" value="edit">
            <input type=submit value="Edit" ></form>
    </body>
</html>

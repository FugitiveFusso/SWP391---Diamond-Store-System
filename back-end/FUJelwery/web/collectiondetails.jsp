<%-- 
    Document   : collectiondetails
    Created on : May 29, 2024, 10:47:12 AM
    Author     : Dell
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

        <h1>Collection Details </h1>         
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

            <tr><td>Diamond ID</td><td>${requestScope.collection.collectionID}</td></tr>
            <tr><td>Diamond Name</td><td>${requestScope.collection.collectionName}</td></tr>
            <tr><td>Diamond Image</td><td><img src=${requestScope.collection.collectionImage} width="300px" height="300px"></td></tr>
            <tr><td>Origin</td><td>${requestScope.collection.collectionDescription}</td></tr>

        </table>
            
            <form action="CollectionController" style="padding-top: 10px">
            <input type=hidden name="action" value="list">
            <input type=submit value="Return" ></form>

        <form action="CollectionController" style="padding-top: 10px">
            <input type=hidden name="id" value="${requestScope.collection.collectionID}">
            <input type=hidden name="action" value="edit">
            <input type=submit value="Edit" ></form>
    </body>
</html>

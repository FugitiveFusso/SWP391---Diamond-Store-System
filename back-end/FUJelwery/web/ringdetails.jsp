<%-- 
    Document   : ringdetails
    Created on : May 27, 2024, 8:24:31 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ring Management Page</title>
    </head>
     <body>
        <h1>Ring Details </h1>         
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

            <tr><td>Ring Name</td><td>${requestScope.ring.ringName}</td></tr>
            <tr><td>Ring Image</td><td>${requestScope.ring.ringImage}</td></tr>
            <tr><td>Diamond ID</td><td>${requestScope.ring.diamondID}</td></tr>
            <tr><td>Gender</td><td>${requestScope.ring.gender}</td></tr>
            <tr><td>Price</td><td>${requestScope.ring.price}</td></tr>
            <tr><td>Quantity</td><td>${requestScope.ring.quantity}</td></tr>
            <tr><td>Category</td><td>${requestScope.ring.categoryID}</td></tr>
            <tr><td>Collection</td><td>${requestScope.ring.collectionID}</td></tr>
            
            <form action="RingController" style="padding-top: 10px">
            <input type=hidden name="id" value="${requestScope.ring.diamondID}">
            <input type=hidden name="action" value="edit">
            <input type=submit value="Edit" ></form>
        </table>
    </body>
</html>

<%-- 
    Document   : diamonddetails
    Created on : May 27, 2024, 10:27:36 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Diamond Detail Page</title>
    </head>
    <body>
         <jsp:include page="/menu.jsp" flush="true" />

        <h1>Diamond Details </h1>         
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

            <tr><td>Diamond ID</td><td>${requestScope.diamond.diamondID}</td></tr>
            <tr><td>Diamond Name</td><td>${requestScope.diamond.diamondName}</td></tr>
            <tr><td>Diamond Image</td><td><img src=${requestScope.diamond.diamondImage} width="300px" height="300px"></td></tr>
            <tr><td>Origin</td><td>${requestScope.diamond.origin}</td></tr>
            <tr><td>Carat Weight</td><td>${requestScope.diamond.caratWeight}</td></tr>
            <tr><td>Origin</td><td>${requestScope.diamond.origin}</td></tr>
            <tr><td>Cut</td><td>${requestScope.diamond.cut}</td></tr>
            <tr><td>Color</td><td>${requestScope.diamond.color}</td></tr>
            <tr><td>Clarity</td><td>${requestScope.diamond.clarity}</td></tr>

        </table>
            
            <form action="DiamondController" style="padding-top: 10px">
            <input type=hidden name="action" value="list">
            <input type=submit value="Return" ></form>

        <form action="DiamondController" style="padding-top: 10px">
            <input type=hidden name="id" value="${requestScope.diamond.diamondid}">
            <input type=hidden name="action" value="edit">
            <input type=submit value="Edit" ></form>
    </body>
</html>

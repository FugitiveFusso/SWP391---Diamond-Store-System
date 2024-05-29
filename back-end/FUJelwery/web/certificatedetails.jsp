<%-- 
    Document   : certificatedetails
    Created on : May 29, 2024, 5:45:23 PM
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

        <h1>Certificate Details </h1>         
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

            <tr><td>Certificate ID</td><td>${requestScope.certificate.certificateID}</td></tr>
            <tr><td>Certificate Image</td><td><img src=${certificate.certificateImage} width="300px" height="300px"></td></tr>
            <tr><td>Description</td><td>${requestScope.certificate.certificateDescription}</td></tr>
        </table>
            
            <form action="CertificateController" style="padding-top: 10px">
            <input type=hidden name="action" value="list">
            <input type=submit value="Return" ></form>

        <form action="CertificateController" style="padding-top: 10px">
            <input type=hidden name="id" value="${requestScope.certificate.certificateID}">
            <input type=hidden name="action" value="edit">
            <input type=submit value="Edit" ></form>
    </body>
</html>

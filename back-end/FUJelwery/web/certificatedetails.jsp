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
        <link rel="stylesheet" href="css/post_detail.css"/>
    </head>
    <body>
         <jsp:include page="/menu.jsp" flush="true" />
         
         <div class="post-title">
            <h1>Certificate Details </h1>         
            <p> Login username: ${sessionScope.adminsession.username}</p>
        </div>
        
        <div class="content">
            <div class="content1">
                <div class="small-content">
                    <div class="content-left">
                        <div class="content-img">
                            <img src=${certificate.certificateImage} width="300px" height="300px">
                        </div>
                    </div>
                    <div class="content-right">
                        <div class="content-intro">
                            <div class="intro-details">
                                <p class="title">ID: ${requestScope.certificate.certificateID}</p>
                            </div>                       
                        </div>
                        <div class="description">
                            <p class="description-title">Description</p>
                            <p class="title">${requestScope.certificate.certificateDescription}</p>
                        </div>    
                    </div>
                </div>
                <div class="buttons">
                    <form action="CertificateController" style="padding-top: 10px">
                        <input type=hidden name="action" value="list">
                        <input type=submit value="Return" ></form>

                    <form action="CertificateController" style="padding-top: 10px">
                        <input type=hidden name="id" value="${requestScope.certificate.certificateID}">
                        <input type=hidden name="action" value="edit">
                        <input type=submit value="Edit" ></form>     
                </div>
            </div>                   
        </div>
        
<!--        <table>
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
            <input type=submit value="Edit" ></form>-->
    </body>
</html>

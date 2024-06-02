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
        <title>Collection Management Detail</title>
        <link rel="stylesheet" href="css/post_detail.css"/>
    </head>
    <body>
        <jsp:include page="/menu.jsp" flush="true" />

        <div class="post-title">
            <h1>Collection Details </h1>         
            <p> Login username: ${sessionScope.adminsession.username}</p>
        </div>

        <div class="content">
            <div class="content1">
                <div class="small-content">
                    <div class="content-left">
                        <div class="content-img">
                            <img src=${requestScope.collection.collectionImage} width="300px" height="300px">
                        </div>
                    </div>
                    <div class="content-right">
                        <div class="content-intro">
                            <div class="intro-details">
                                <p class="title">Collection ID: ${requestScope.collection.collectionID}</p>
                                <p class="name">${requestScope.collection.collectionName}</p>
                            </div>                       
                        </div>
                        <div class="description">
                            <p class="description-title">Description</p>
                            <p class="title">${requestScope.collection.collectionDescription}</p>
                        </div>    
                    </div>
                </div>
                <div class="buttons">
                    <form action="CollectionController" style="padding-top: 10px">
                        <input type=hidden name="action" value="list">
                        <input type=submit value="Return" ></form>

                    <form action="CollectionController" style="padding-top: 10px">
                        <input type=hidden name="id" value="${requestScope.certificate.certificateID}">
                        <input type=hidden name="action" value="edit">
                        <input type=submit value="Edit" ></form>     
                </div>
            </div>                   
        </div>

        <!--        <table>
        
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
                    <input type=submit value="Edit" ></form>-->
    </body>
</html>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Post Management Detail</title>
        <link rel="stylesheet" href="css/post_detail.css"/>
    </head>
    <body>
        <jsp:include page="/menu.jsp" flush="true" />

        <div class="post-title">
            <h1>Post Details </h1>         
            <p> Login username: ${sessionScope.adminsession.username}</p>
        </div>

        <div class="content">
            <div class="content1">
                <div class="small-content">
                    <div class="content-left">
                        <div class="content-img">
                            <img src=${requestScope.post.image} width="300px" height="300px">
                        </div>
                    </div>
                    <div class="content-right">
                        <div class="content-intro">
                            <div class="intro-details">
                                <p class="title">Post ID: ${requestScope.post.id}</p>
                                <p class="name">${requestScope.post.name}</p>
                            </div>                       
                        </div>
                        <div class="description">
                            <p class="description-title">Description</p>
                            <p class="title">${requestScope.post.description}</p>
                        </div>    
                    </div>
                </div>
                <div class="buttons">
                    <form action="PostController" style="padding-top: 10px">
                        <input type=hidden name="action" value="list">
                        <input type=submit value="Return" ></form>

                    <form action="PostController" style="padding-top: 10px">
                        <input type=hidden name="id" value="${requestScope.post.id}">
                        <input type=hidden name="action" value="edit">
                        <input type=submit value="Edit" ></form>     
                </div>
            </div>                   
        </div>
    </body>
</html>

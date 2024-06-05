
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Post Management Detail</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        
        <script>
            window.onload = function () {
                if (!sessionStorage.getItem('hasReloaded')) {
                    sessionStorage.setItem('hasReloaded', 'true');
                    location.reload();
                } else {
                    sessionStorage.removeItem('hasReloaded');
                }
            };
        </script>
        
        <style>
            .post-title{
                align-items: center;
                text-align: center;
                margin-top: 30px;
            }

            .post-title h1{
                font-size: 50px;               
                font-weight: 700;
            }

            .card {
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
                transition: transform 0.2s;
            }
            .card:hover {
                transform: scale(1.02);
            }
            .card-img-top {
                border-radius: 0.25rem 0.25rem 0 0;
            }
            .btn-group .btn {
                width: 100px;
            }           

            .btn-group{
                display: flex;
                justify-content: center;
            }

            .btn-group form button{
                font-size: 20px;
                padding: 8px 6px;
                background: #15156b;
                color: #fff;
                border-radius: 10px;
                cursor: pointer;
            }


        </style>
        
    </head>
    <body>
        <jsp:include page="/menu.jsp" flush="true" />

        <div class="post-title">
            <h1>Post Details </h1>         
            <p> Login username: ${sessionScope.adminsession.username}</p>
        </div>
        
        <div class="container mt-4">
            <div class="row">
                
                <div class="col-md-6">
                    <div class="card">
                        <img src="${requestScope.post.image}" class="card-img-top" alt="Voucher Image" style="height: 250px; object-fit: cover">
                    </div>
                </div>
                
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h6 class="card-subtitle mb-2 text-muted" >Post ID: ${requestScope.post.id}</h6>
                            <h4 class="card-title" style="font-weight: 700">${requestScope.post.name}</h4>                                                       
                            <p class="card-text"><strong>Description: </strong> ${requestScope.post.description}</p>                           
                            <div class="btn-group" role="group" aria-label="Voucher Actions">
                                <form action="PostController" method="post" class="mr-2">
                                    <input type="hidden" name="action" value="list">
                                    <button type="submit" class="btn btn-primary">Return</button>
                                </form>
                                <form action="PostController" method="post">
                                    <input type="hidden" name="id" value="${requestScope.warranty.id}">
                                    <input type="hidden" name="action" value="edit">
                                    <button type="submit" class="btn btn-secondary">Edit</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

<!--        <div class="content">
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
        </div>-->
    </body>
</html>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category Management Detail</title>
        <link rel="stylesheet" href="css/category_detail.css"/>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>
        <jsp:include page="/menu.jsp" flush="true" />

        <div class="post-title">
            <h1>Category Details </h1>         
            <p> Login username: ${sessionScope.adminsession.username}</p>
        </div>

        <div class="content">
            <div class="content1">
                <div class="small-content">
                    <div class="content-right">
                        <div class="content-intro">
                            <div class="intro-details">
                                <p class="title">Category ID: ${requestScope.category.categoryID}</p>                             
                            </div>                       
                        </div>                           
                    </div>
                    <div class="content-left">
                        <div class="content-intro">
                            <div class="intro-details">                               
                                <p class="name">${requestScope.category.categoryName}</p>
                            </div>                       
                        </div>                           
                    </div>
                </div>
                <div class="buttons">
                    <form action="CategoryController" style="padding-top: 10px">
                        <input type="hidden" name="action" value="list">
                        <input type="submit" class="btn btn-primary" value="Return">
                    </form>

                    <form action="CategoryController" style="padding-top: 10px">
                        <input type="hidden" name="id" value="${requestScope.category.categoryID}">
                        <input type="hidden" name="action" value="edit">
                        <input type="submit" class="btn btn-secondary" value="Edit">
                    </form>
                </div>
            </div>                   
        </div>

        <!--        <table>
        
                    <tr><td>Category ID</td><td>${requestScope.category.categoryID}</td></tr>
                    <tr><td>Category Name</td><td>${requestScope.category.categoryName}</td></tr>
                </table>
        
                <form action="CategoryController" style="padding-top: 10px">
                    <input type=hidden name="action" value="list">
                    <input type=submit value="Return" ></form>
        
                <form action="CategoryController" style="padding-top: 10px">
                    <input type=hidden name="id" value="${requestScope.category.categoryID}">
                    <input type=hidden name="action" value="edit">
                    <input type=submit value="Edit" ></form>-->
    </body>
</html>

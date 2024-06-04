
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Post Detail</title>
        <link rel="stylesheet" href="css/post_detail.css"/>
        <link rel="stylesheet" href="css/navbar.css">
        <link rel="stylesheet" href="css/customer_list.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>
        <div class="menu">
            <ul class="navbar">
                <li class="navbar__link">
                    <a href="#">Jewelry</a>
                    <div class="sub-menu-1">
                        <ul>
                            <li><a href='./ProductController'>Diamond</a></li>
                            <li><a href='./ProductController'>Ring</a></li>
                            <li><a href='CollectionController'>Collection</a></li>
                        </ul>
                    </div>                  
                </li>
                <li class="navbar__link"><a href='./UserVoucherController'>Voucher</a></li>
                <li class="navbar__link"><a href="./UserPostController">Blog</a></li>
                <a href="user_homepage.jsp"><img src="./images/Screenshot (656).png"></a>
                <li class="navbar__link"><a href="user_aboutus.jsp">About Us</a></li>
                <li class="navbar__link"><a href="#">Order</a></li>

                <li class="navbar__link">
                    <a href="#">Account</a>
                    <div class="sub-menu-1">
                        <ul>
                            <li><a href='userlogin?action=logout'>Logout</a></li>          
                        </ul>
                    </div>
                </li>

            </ul>
        </div> 
        <div class="post-title">
            <h1>Post Details </h1>         
            <p> Login username: ${sessionScope.usersession.username}</p>
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
                    <form action="UserPostController" style="padding-top: 10px">
                        <input type=hidden name="action" value="list">
                        <input type=submit value="Return" ></form>
  
                </div>
            </div>                   
        </div>
    </body>
</html>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Post Detail</title>
        <link rel="stylesheet" href="css/post_detail.css"/>
        <link rel="stylesheet" href="css/navbaruser.css">
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
                            <li><a href='./ProductController'>Ring</a></li>
                            <li><a href='./UserCollectionController'>Collection</a></li>
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


        <div class="content">
            <div class="content1">
                <div class="small-content">                   
                    <div class="content-right">
                        <div class="content-intro">
                            <div class="intro-details" >                              
                                <p class="name" style="margin-bottom: 0">${requestScope.post.name}</p>
                                
                            </div>   

                            <div class="date-author">
                                <div class="author"><p>Author: ${post.author}</p></div>
                                <div class="date"><p>Created date: ${post.date}</p></div>
                            </div>
                        </div>
                        <div class="description">
                            <p class="title">${requestScope.post.description}</p>
                        </div>   
                        <div class="content-img" style="margin: 30px 0;">
                            <img src="${requestScope.post.image}" style="width: auto; height: 550px">
                        </div>
                        <div class="text">
                            <p class="text-tile"></p>
                            <p class="title">${requestScope.post.text}</p>
                        </div>    
                        <span class="return" style="display: flex; justify-content: flex-end;"><a href="./UserPostController">Return</a></span>
                    </div>
                </div>

            </div>  


            


        </div>          

        <div class="footer">
            <div class="footer-content">
                <div class="info">
                    <div class="info-img">
                        <img src="images/Screenshot (659).png" />
                    </div>

                    <div class="info-text">
                        <p>
                            Address: FPT University, District 9, Ho Chi Minh City
                        </p>
                        <p>
                            Email: fuj.khac.diamondshopsystem@gmail.com
                        </p>
                        <p>
                            Phone: (+ 84) 898876512
                        </p>
                        <p>
                            © Copyright 2024
                        </p>
                    </div>
                </div>

                <div class="customer-service">
                    <div class="customer-service-title">
                        Customer service
                    </div>

                    <div class="customer-service-text">
                        <p><a href="#">Instructions for measuring rings</a></p>
                        <p><a href="#">Product consultation by month of birth</a></p>
                        <p><a href="#">Frequently asked questions</a></p>
                    </div>
                </div>

                <div class="policy">
                    <div class="policy-title">
                        Policy
                    </div>

                    <div class="policy-text">
                        <p><a href="#">Warranty Policy</a></p>
                        <p><a href="#">Delivery Policy</a></p>
                        <p><a href="#">Return Policy</a></p>
                        <p><a href="#">Privacy policy</a></p>
                    </div>
                </div>
            </div>

    </body>
</html>

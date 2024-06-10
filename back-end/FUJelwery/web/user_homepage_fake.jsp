<%-- 
    Document   : user_homepage_fake
    Created on : Jun 8, 2024, 11:42:06 AM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/navbaruser.css">
        <link rel="stylesheet" href="css/user_mainpage.css">
        <link rel="stylesheet" href="css/loginpopup.css">

    </head>
    <body>
        <div id="loginPopup" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <p class="modal-header">Please register </p>
                <p class="modal-header">or login to continue.</p>
                <br>
                <p>Don't worry , it's painless.</p>  
                <p>A click of mouse, a few key taps, and you'll enjoy free,</p> 
                <p>unlimited access to our website, plus other exclusive benefits</p>
                <p>by joining our community.</p>
                <br>
                <div class="link-list">
                    <div class="register">
                        To continue, <br>
                        <a href='register.jsp'>CREATE A FREE ACCOUNT</a>
                    </div>
                    <div class="login">
                        Already registered? <br>
                        <a href='userlogin.jsp'>LOG IN</a>
                    </div>
                </div>



            </div>
        </div>

        <div class="menu">
            <ul class="navbar">
                <li class="navbar__link">
                    <a href="#">Jewelry</a>
                    <div class="sub-menu-1">
                        <ul>
                            <li><a href='#'>Ring</a></li>
                            <li><a href='#'>Collection</a></li>
                        </ul>
                    </div>                  
                </li>
                <li class="navbar__link"><a href='#'>Voucher</a></li>
                <li class="navbar__link"><a href="#">Blog</a></li>
                <a href="user_homepage.jsp"><img src="./images/Screenshot (656).png"></a>
                <li class="navbar__link"><a href="#">About Us</a></li>
                <li class="navbar__link"><a href="#">Order</a></li>

                <li class="navbar__link">
                    <a href="#">Account</a>
                    <div class="sub-menu-1">
                        <ul>
                            <li><a href='#'>Logout</a></li>          
                        </ul>
                    </div>
                </li>

            </ul>
        </div> 

        <div class="main-container">
            <div class="Main-hero">
                <div class="hero-details">
                    <h2 style="font-family: Inter; font-weight: bold;">UP TO 50% OFF</h2>
                    <h1 style="font-family: Inika;">To Mom, With Love</h1>
                    <h3>A mother’s love is deep and everlasting. <br>Celebrate it with something that will always shin like she does (and save up to 50%)</h3>
                    <div class="button">
                        <button id="button1" > <a href="#">Shop Sale Jewelry</a></button>
                        <button><a href="#">Shop Engagement Rings</a></button>
                    </div>
                </div>
                <img src="images/hero1.jpg" alt="" srcset="">
            </div>

            <div class="trending">
                <div class="title">
                    <h1>MOSTLY SEARCH</h1>
                </div>
                <div class="list">
                    <div class="swiper">
                        <a href="">
                            <img src="images/img1.jpeg" alt="">
                        </a>
                        <h2>Diamond</h2>
                    </div>
                    <div class="swiper">
                        <a href="">
                            <img src="images/img1.jpeg" alt="">
                        </a>
                        <h2>Diamond</h2>
                    </div>
                    <div class="swiper">
                        <a href="">
                            <img src="images/img1.jpeg" alt="">
                        </a>
                        <h2>Diamond</h2>
                    </div>
                    <div class="swiper">
                        <a href="">
                            <img src="images/img1.jpeg" alt="">
                        </a>
                        <h2>Diamond</h2>
                    </div>
                </div>

            </div>
        </div>

        <div class="guarantee-container">
            <div class="guarantee-details">
                <h1>BEST QUALITY GUARANTEE</h1>
                <p>Our products come dipped 5 times in 14K or 18K gold or rhodium plating to prevent tarnishing, while our .925 sterling silver necklaces and pendants provide style and quality you can trust.</p>
                <p>With pendants and chains using hand-set CZ stones that come placed along a micro pave setting, and earrings using real diamonds, our products include the highest quality of materials.</p>
            </div>
            <img src="images/image_5.png" alt="" width="auto">

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

            <script src="js/loginpopup.js"></script>
        </div>
    </body>
</html>

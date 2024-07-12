
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" href="css/navigation_bar.css">
        <link rel="stylesheet" href="css/user_mainpage.css">
        <link rel="stylesheet" href="css/popupfake.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" integrity="sha512-Avb2QiuDEEvB4bZJYdft2mNjVShBftLdPG8FJ0V7irTLQ8Uo0qcPxh4Plq7G5tGm0rU+1SPhVotteLpBERwTkw=="/>
        <link rel="icon" type="image/x-icon" href="images/Screenshot__656_-removebg-preview.png">
    </head>
    <body>
        <div class="header">
            <div class="header-top">
                <div class="top-info-left">
                    <ul>
                        <li>Timeless elegance and craftsmanship</li>
                        <li style="margin-left: 30px">at FUJ Jewelry Online Shop.</li>                         
                    </ul>
                </div>
                <a href="guest_homepage.jsp"><img src="./images/Screenshot (656).png"></a>
                <div class="top-info-right">
                    <ul>
                        <li>FUJ Jewelry Shop - <strong>(+ 84) 898876512</strong></li>
                    </ul>
                </div>
            </div>
            <hr>
            <div class="header-bottom">
                <ul class="navbar">
                    <li class="navbar-link">
                        <a href="#" class="line">Jewelry</a>
                        <div class="sub-menu-1">
                            <ul>
                                <li><a href='./GuestProductController'>Ring</a></li>
                                <li><a href='./GuestCategoryController'>Category</a></li>  
                                <li><a href='./GuestCollectionController'>Collection</a></li>  


                            </ul>
                        </div>   
                    </li>
                    <li class="navbar-link"><a href='./GuestDiamondPriceController' class="line">Diamond Price</a></li>
                    <li class="navbar-link"><a href='./GuestVoucherController' class="line">Voucher</a></li>
                    <li class="navbar-link"><a href="#" class="line trigger-popup">Order Monitor</a>                       
                        <div class="sub-menu-1">
                            <ul>
                                <li><a href='#' class="trigger-popup">Cart</a></li>
                                <li><a href='#' class="trigger-popup">Tracking Orders</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="navbar-link">
                        <a href="guest_static_webpages/certificate_edu.jsp" class="line">Education</a>
                        <div class="sub-menu-1">
                            <ul>
                                <li><a href='./GuestPostController'>Blog</a></li>
                                <li><a href='guest_static_webpages/ringmeasuring.jsp'>Ring Measuring Guide</a></li>          
                                <li><a href='guest_static_webpages/faqs.jsp'>Frequently Asking Questions</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="navbar-link"><a href="guest_aboutus.jsp" class="line">About Us</a></li>                    
                    <li class="navbar-link">
                        <a href="#" class="line">Account</a>
                        <div class="sub-menu-1">
                            <ul>                               
                                <li><a href='userlogin.jsp'>Sign in</a></li>
                                <li><a href='register.jsp'>Sign up </a></li> 
                            </ul>
                        </div>
                    </li>
                </ul>

            </div>
        </div>

        <div id="popup" class="popup">
            <div class="popup-content">
                <h2>Please register or sign in to continue.</h2>
                <p>Don't worry, it's painless. A click of the mouse, a few key taps, and you'll enjoy free, unlimited access to our website, plus other exclusive benefits.</p>
                <div class="popup-buttons">
                    <a href="register.jsp" class="popup-button">To continue,<br>CREATE A FREE ACCOUNT →</a>
                    <a href="userlogin.jsp" class="popup-button">Already registered?<br>LOG IN →</a>
                </div>
            </div>
        </div>

        <div class="main-container">
            <div class="Main-hero">
                <div class="hero-details">
                    <h2 style="font-family: Inter; font-weight: bold;">UP TO 50% OFF</h2>
                    <h1 style="font-family: Inika;">To Mom, With Love</h1>
                    <h3>A mother’s love is deep and everlasting. <br>Celebrate it with something that will always shin like she does (and save up to 50%)</h3>
                    <div class="button">
                        <button id="button1" > <a href="./GuestProductController">Shop Luxurious Ring</a></button>
                        <button><a href="./GuestCollectionController">Select a Wonderful Collection</a></button>
                    </div>
                </div>
                <img src="images/hero1.jpg" height="1px" alt="" srcset="">
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


        <section class="why-to-choose-us">
            <div class="title">
                <h1>Why to choose us</h1>
            </div>
            <div class="why-choose-us">
                <div class="feature-box">
                    <div class="icon"><img class="svg" src="images/dollar-sign-solid.svg" alt="Best Price"></i></div>
                    <h3>Best Price Diamond</h3>
                    <p>We offer the best prices on high-quality diamonds to fit your budget.</p>
                </div>
                <div class="feature-box">
                    <div class="icon"><img class="svg" src="images/check-solid.svg" alt="Best Quality"></div>
                    <h3>Best Quality</h3>
                    <p>Our products are crafted with the finest materials and unparalleled craftsmanship.</p>
                </div>
                <div class="feature-box">
                    <div class="icon"><img class="svg" src="images/star-solid.svg" alt="Best Service"></div>
                    <h3>Best Service</h3>
                    <p>Experience exceptional customer service from our dedicated team.</p>
                </div>
                <div class="feature-box">
                    <div class="icon"><img class="svg" src="images/handshake-regular.svg" alt="Attractive Warranty Icon"></div>
                    <h3>Attractive Warranty</h3>
                    <p>Enjoy peace of mind with our comprehensive and attractive warranty packages.</p>
                </div>
            </div>
        </section>

        <section class="about us">
            <div class="bannerContainer">
                <div class="bannerContent">
                    <div class="bannerText">
                        <p class="intro">To get to know more about us</p>
                        <h1>About Us</h1>
                        <div class="description_hero">
                            <span>At FUJ, we are committed to providing the finest quality jewelry at unbeatable prices. Our journey began with a passion for excellence and a dedication to creating pieces that are not only beautiful but also accessible to everyone. With years of experience and a team of skilled artisans, we take pride in our craftsmanship and the exceptional service we offer to each of our customers.</span>
                        </div>
                        <a style="margin-top: 15px" class="slpBtn" title="Shop Diamond" href="guest_aboutus.jsp">About FUJ</a>
                    </div>
                    <div class="bannerImage">
                        <img src="images/AboutUs.jpg" id="diamondHero" style="width: 76%; height: 50%">
                    </div>
                </div>
            </div>
        </section>

        <section class="become-an-expert">
            <div class="bannerContainer">
                <div class="bannerContent">
                    <div class="bannerImage" style="float: left; width: 30%; margin-right: 20px;">
                        <img src="images/Become an expert.webp" id="diamondHero" style="width: 100%; height: auto;">
                    </div>
                    <div class="bannerText" style="float: right; width: 65%;">
                        <h1 style="text-align: center">Become An Expert</h1>
                        <h1 style="text-align: center; font-size: 16px;">FUJ provides some information to help you on your experience</h1>
                        <div style="margin-top: 15px; display: flex; flex-direction: column;">
                            <a class="link" title="Shop Diamond" href="guest_static_webpages/certificate_edu.jsp">Education</a>
                            <a class="link" title="FAQs" href="guest_static_webpages/faqs.jsp" style="margin-top: 10px;">Frequently Asked Question</a>
                            <a class="link" title="Find your size" href="guest_static_webpages/ringmeasuring.jsp" style="margin-top: 10px;">Find your size</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

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
                        <p><a href="guest_static_webpages/ringmeasuring.jsp">Instructions for measuring rings</a></p>
                        <p><a href="guest_static_webpages/consulation.jsp">Product consultation by month of birth</a></p>
                        <p><a href="guest_static_webpages/faqs.jsp">Frequently asked questions</a></p>
                    </div>
                </div>

                <div class="policy">
                    <div class="policy-title">
                        Policy
                    </div>

                    <div class="policy-text">
                        <p><a href="guest_static_webpages/warrantyPolicy.jsp">Warranty Policy</a></p>
                        <p><a href="guest_static_webpages/deliveryPolicy.jsp">Delivery Policy</a></p>
                        <p><a href="guest_static_webpages/returnPolicy.jsp">Return Policy</a></p>
                        <p><a href="guest_static_webpages/privatePolicy.jsp">Privacy policy</a></p>
                    </div>
                </div>
            </div>  
        </div> 

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var popup = document.getElementById('popup');
                var triggers = document.querySelectorAll('.trigger-popup');

                triggers.forEach(function (trigger) {
                    trigger.addEventListener('click', function (event) {
                        event.preventDefault();  // Prevent the default link behavior
                        popup.style.display = 'flex';
                        document.body.classList.add('no-scroll');
                    });
                });

                // Close the pop-up when clicking outside of it
                window.addEventListener('click', function (event) {
                    if (event.target == popup) {
                        popup.style.display = 'none';
                        document.body.classList.remove('no-scroll');
                    }
                });
            });
        </script>
    </body>
</html>

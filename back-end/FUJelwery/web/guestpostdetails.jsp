
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Post Detail</title>
        <link rel="icon" type="image/x-icon" href="images/Screenshot__656_-removebg-preview.png">
        <link rel="stylesheet" href="css/post_detail.css"/>
        <link rel="stylesheet" href="css/navigation_bar.css">
        <link rel="stylesheet" href="css/popup_fake.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
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
                    <li class="navbar-link"><a href="#" class="line">Order Monitor</a>                       
                        <div class="sub-menu-1">
                            <ul>
                                <li><a href='#' class="trigger-popup">Cart</a></li>
                                <li><a href='#' class="trigger-popup">Tracking Orders</a></li>
                                <li><a href='#' class="trigger-popup">Transactions</a></li>
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
                            <img src="${requestScope.post.image}" style="width: 850px; height: 550px">
                        </div>
                        <div class="text">
                            <p class="text-tile"></p>
                            <p class="title">${requestScope.post.text}</p>
                        </div>    
                        <span class="return" style="display: flex; justify-content: flex-end;"><a href="./GuestPostController">Return...</a></span>
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

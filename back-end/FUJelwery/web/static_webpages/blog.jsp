<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blog</title>
        <link rel="stylesheet" href="../css/blog.css">
        <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet'>
        <link rel="stylesheet" href="../css/navbaruser.css">

    </head>
    <body>
        <div class="menu">
            <ul class="navbar">
                <li class="navbar__link">
                    <a href="#">Jewelry</a>
                    <div class="sub-menu-1">
                        <ul>
                            <li><a href='../ProductController'>Ring</a></li>
                            <li><a href='../UserCollectionController'>Collection</a></li>
                        </ul>
                    </div>                  
                </li>
                <li class="navbar__link"><a href='../UserVoucherController'>Voucher</a></li>
                <li class="navbar__link">
                    <a href="certificate_edu.jsp">Education</a>
                    <div class="sub-menu-1">
                        <ul>
                            <li><a href='../UserPostController'>Blog</a></li>
                            <li><a href='ringmeasuring.jsp'>Ring Measuring Guide</a></li>          
                            <li><a href='faqs.jsp'>Frequently Asking Questions</a></li>
                        </ul>
                    </div>
                </li>
                <a href="user_homepage.jsp"><img src="../images/Screenshot (656).png"></a>
                <li class="navbar__link"><a href="../user_aboutus.jsp">About Us</a></li>
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

        <div class="main">

            <div class="content">
                <div class="blog-intro">
                    BLOG
                </div>

                <table>
                    <tr>
                        <td>
                            <img src="https://bluenile-blog.r2net.com/wp-content/uploads/Wedding-Ring-Guide-Hero.jpg">
                        </td>
                        <td>
                            <div class="blog-content">
                                <div class="blog-title">
                                    Your Guide To Popular Wedding Ring Styles
                                </div>
                                <p>Get tips for choosing between today’s most popular designs and wedding ring styles
                                    to find the band that matches your tastes and budget.</p>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <img src="https://bluenile-blog.r2net.com/wp-content/uploads/Diamond-Blog.jpg">
                        </td>
                        <td>
                            <div class="blog-title">
                                How To Tell If A Diamond Is Real
                            </div>
                            <p>There are several techniques for checking diamonds at home including tests 
                                that work with loose diamonds or diamonds set in jewelry.</p>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <img src="https://bluenile-blog.r2net.com/wp-content/uploads/Ring-Resize-Hero-.jpg">
                        </td>
                        <td>
                            <div class="blog-title">
                                Are There Rings That Can’t Be Resized?
                            </div>
                            <p>Find out which rings can’t be resized and what to do if you need a different size in these styles.</p>
                        </td>
                    </tr>
                </table>
            </div>



            <div class="footer">
                <div class="footer-content">
                    <div class="footer-content-info">
                        <div class="info-img">
                            <img src="../images/Screenshot (659).png" />
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

                        <div class="customer-service">
                            <div class="customer-service-title">
                                Customer service
                            </div>

                            <div class="customer-service-text">
                                <p><a href="ringmeasuring.jsp">Instructions for measuring rings</a></p>
                                <p><a href="consulation.jsp">Product consultation by month of birth</a></p>
                                <p><a href="faqs.jsp">Frequently asked questions</a></p>
                            </div>
                        </div>

                        <div class="policy">
                            <div class="policy-title">
                                Policy
                            </div>

                            <div class="policy-text">
                                <p><a href="warrantyPolicy.jsp">Warranty Policy</a></p>
                                <p><a href="deliveryPolicy.jsp">Delivery Policy</a></p>
                                <p><a href="returnPolicy.jsp">Return Policy</a></p>
                                <p><a href="privatePolicy.jsp">Privacy policy</a></p>
                            </div>
                        </div>
                    </div>


                </div>

            </div>
    </body>
</html>

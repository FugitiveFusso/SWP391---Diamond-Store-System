
<%@page import="com.khac.swp.fuj.posts.PostDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Post List</title>
        <link rel="stylesheet" href="css/navbaruser.css">
        <link rel="stylesheet" href="css/blog.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script src="js/pagination.js"></script>
        <link rel="stylesheet" href="css/pagination.css">

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

        <div class="main">           
            <div class="content">
                <div class="blog-intro">
                    BLOG
                </div>

                <table>
                    <%
                        List<PostDTO> list = (List<PostDTO>) request.getAttribute("userpostlist");
                        for (PostDTO post : list) {
                            pageContext.setAttribute("post", post);
                    %>
                    <tr>
                        <td>
                            <img src="${post.image}">
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

                </table>
            </div>



            <div class="footer">
                <div class="footer-content">
                    <div class="footer-content-info">
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
                            <p><a href="static_webpages/ringmeasuring.jsp">Instructions for measuring rings</a></p>
                            <p><a href="static_webpages/consulation.jsp">Product consultation by month of birth</a></p>
                            <p><a href="static_webpages/faqs.jsp">Frequently asked questions</a></p>
                        </div>
                    </div>

                    <div class="policy">
                        <div class="policy-title">
                            Policy
                        </div>

                        <div class="policy-text">
                            <p><a href="static_webpages/warrantyPolicy.jsp">Warranty Policy</a></p>
                            <p><a href="static_webpages/deliveryPolicy.jsp">Delivery Policy</a></p>
                            <p><a href="static_webpages/returnPolicy.jsp">Return Policy</a></p>
                            <p><a href="static_webpages/privatePolicy.jsp">Privacy policy</a></p>
                        </div>
                    </div>
                </div>


            </div>

        </div>


        <!--        <div class="list-container">
                    <div class="smaller-container">
                        <div class="list1">
                            <div class="list-intro-left">
                                <div class="left-icon">
                                    <i class="fa-regular fa-newspaper"></i>
                                </div>
                                <div class="left-info">
                                    <div class="list-title">Post List</div>
                                    <div class="">List of Post</div>
                                </div>
                            </div>
        
                        </div>
                        <div class="list">
                            <form action='' method=GET id="searchbox"> 
                                <input name=keyword type=text class="search-input" value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>">
                                <button type="submit" class="search-button"><i class="fas fa-search"></i></button>
                            </form>
        
                            <table id="pagination">
                                <thead>
                                    <tr>
                                        <th>Post ID</th>
                                        <th><a href=?colSort=postName>Post Name</a></th>
                                        <th>Post Image</th>
                                        <th>Description</th>
                                    </tr>
                                </thead>
                                <tbody>
        <%
            List<PostDTO> list = (List<PostDTO>) request.getAttribute("userpostlist");
            for (PostDTO post : list) {
                pageContext.setAttribute("post", post);
        %>
        <tr>
            <td><a href="UserPostController?action=details&id=${post.id}">${post.id}</td>
            <td>${post.name}</td>
            <td><img src="${post.image}" width="300px" height="300px" style="border-radius: 10px;"></td>
            <td style="width: 50%; font-size: 18px">${post.description}</td>
        </tr>
        <%
            }
        %>    
    </tbody>
</table>
<div id="paginationControls" class="pagination-controls">
    <button id="prevButton" class="pagination-button"><i class="fas fa-chevron-left"></i></button>
    <div id="pageNumbers"></div>
    <button id="nextButton" class="pagination-button"><i class="fas fa-chevron-right"></i></button>
</div>
</div>
</div>
</div>-->
        <script src="js/pagination.js"></script>

    </body>
</html>

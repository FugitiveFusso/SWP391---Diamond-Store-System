<%@page import="com.khac.swp.fuj.ring.RingDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/navbaruser.css">
        <link rel="stylesheet" href="css/user_productlist.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="css/pagination.css">

    </head>
    <body>
        <%--<%@ include file="/productmenu.jsp" %>--%>

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
                <li class="navbar__link">
                    <a href="static_webpages/certificate_edu.jsp">Education</a>
                    <div class="sub-menu-1">
                        <ul>
                            <li><a href='UserPostController'>Blog</a></li>
                            <li><a href='static_webpages/ringmeasuring.jsp'>Ring Measuring Guide</a></li>          
                            <li><a href='static_webpages/faqs.jsp'>Frequently Asking Questions</a></li>
                        </ul>
                    </div>
                </li>
                <a href="user_homepage.jsp"><img src="images/Screenshot (656).png"></a>
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


        <div class="bannerContainer">
            <div class="bannerContent">
                <div class="bannerText">
                    <p class="intro">Today we have</p>
                    <h1>Elegant Rings for Every Occasion</h1>
                    <div class="description_hero">
                        <span>Explore our exquisite collection of rings, designed to capture the essence of elegance and style. From sparkling diamonds to vibrant gemstones, our rings are crafted with precision and passion. Whether you're searching for a timeless engagement ring, a chic statement piece, or a meaningful gift, our diverse selection offers something for everyone. Let our rings adorn your moments with beauty and grace.</span>
                    </div>
                    <a style="margin-top: 15px" class="slpBtn" title="Shop Diamond" href="productlist.jsp">Shop Diamond</a>
                </div>
                <div class="bannerImage">
                    <img src="images/Blue_Nile_Studio.webp" id="diamondHero" style="width: 432px; height: 432px">
                </div>
            </div>
        </div>

        <div class="list-container">
            <div class="smaller-container">
                <form action='' method=GET id="searchbox" class="center-searchbox"> 
                    <input name=keyword type=text class="search-input" value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>">
                    <button type="submit" class="search-button"><i class="fas fa-search"></i></button>
                </form>
                <div class="list-title">Ring List</div>
                <div class="list">
                    <div class="card-container">
                        <%
                            List<RingDTO> list = (List<RingDTO>) request.getAttribute("productlist");
                            for (RingDTO product : list) {
                                pageContext.setAttribute("product", product);
                        %>
                        <div class="product-card">
                            <a href="ProductController?action=details&id=${product.ringID}">
                                <img src="${product.ringImage}" alt="${product.ringName}">
                                <h3>${product.ringName}</h3>
                                <!--<p>Diamond: ${product.diamondName}</p>-->
                                <p>Price: ${product.totalPrice} VND</p>
                                <!--<p>Category: ${product.categoryID}</p>-->
                                <!--<p>Collection: ${product.collectionID}</p>-->
                            </a>
                        </div>
                        <%
                            }
                        %>
                    </div>
                    <div id="paginationControls" class="pagination-controls">
                        <button id="prevButton" class="pagination-button"><i class="fas fa-chevron-left"></i></button>
                        <div id="pageNumbers"></div>
                        <button id="nextButton" class="pagination-button"><i class="fas fa-chevron-right"></i></button>
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
                            Address: FPT University, District 9, HCMC
                        </p>
                        <p>
                            Email: CuongNPSE183844@fpt.edu.vn
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


        <script src="js/productlist_pagination.js"></script>

    </body>
</html>

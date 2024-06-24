
<%@page import="java.util.List"%>
<%@page import="com.khac.swp.fuj.category.CategoryDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category List</title>
        <link rel="stylesheet" href="css/navigation_bar.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="css/pagination.css">
        <link rel="stylesheet" href="css/user_collectionlist.css">
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
                <a href="user_homepage.jsp"><img src="./images/Screenshot (656).png"></a>
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
                                <li><a href='./ProductController'>Ring</a></li>
                                <li><a href='./UserCategoryController'>Category</a></li>  
                                <li><a href='./UserCollectionController'>Collection</a></li>  
                                <li><a href='OrderController?action=list&id=${sessionScope.usersession.userid}'>Cart</a></li>
                                <li><a href='BillController?action=list&id=${sessionScope.usersession.userid}'>Bill</a></li>
                            </ul>
                        </div>   
                    </li>
                    <li class="navbar-link"><a href='./UserDiamondPriceController' class="line">Diamond Price</a></li>
                    <li class="navbar-link"><a href='./UserVoucherController' class="line">Voucher</a></li>
                    <li class="navbar-link"><a href="#" class="line">Order</a></li>
                    <li class="navbar-link">
                        <a href="static_webpages/certificate_edu.jsp" class="line">Education</a>
                        <div class="sub-menu-1">
                            <ul>
                                <li><a href='./UserPostController'>Blog</a></li>
                                <li><a href='static_webpages/ringmeasuring.jsp'>Ring Measuring Guide</a></li>          
                                <li><a href='static_webpages/faqs.jsp'>Frequently Asking Questions</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="navbar-link"><a href="user_aboutus.jsp" class="line">About Us</a></li>                    
                    <li class="navbar-link">
                        <a href="user_accountdetails.jsp" class="line">Account</a>
                        <div class="sub-menu-1">
                            <ul>
                                <li><a href='./userlogin?action=logout'>Logout</a></li> 
                            </ul>
                        </div>
                    </li>
                </ul>

            </div>
        </div>

        <div class="bannerContainer">
            <div class="bannerContent">
                <div class="bannerText">
                    <p class="intro">BECAUSE YOUR OCCASION IS BRILLIANT</p>
                    <h1>Elegant Ring Category</h1>
                    <div class="description_hero">
                        <span>Our curated selection features timeless pieces that cater to every style and occasion. From dazzling diamonds and precious gemstones to sophisticated gold and silver creations, each item is designed to enhance your natural beauty and add a touch of luxury to your everyday life. Whether you are looking for a statement necklace, a pair of elegant earrings, a delicate bracelet, or a stunning ring, our jewelry category offers something for everyone. Discover the perfect piece that speaks to your unique taste and celebrates life's special moments. Indulge in the artistry and elegance of our jewelry collection and let each piece tell your story.
                        </span>                    
                    </div>                   
                </div>
                <div class="bannerImage">
                    <img src="images/MiaDonna_Conflict-Free-Engagement-Rings_Best-Engagement-Rings_Vogue_Lab-Diamonds_mobile_1600x.jpg" id="diamondHero" style="width: 432px; height: 432px">
                </div>
            </div>
        </div>


        <div class="list-container">
            <div class="smaller-container">
                <form action='' method=GET id="searchbox" class="center-searchbox"> 
                    <input name=keyword type=text class="search-input" value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>">
                    <button type="submit" class="search-button"><i class="fas fa-search"></i></button>
                </form>
                <div class="list-title">Category List</div>

                <div class="gallery">
                    <%
                        List<CategoryDTO> list = (List<CategoryDTO>) request.getAttribute("categorylist");
                        for (CategoryDTO category : list) {
                            pageContext.setAttribute("category", category);
                    %>
                    <div class="container">
                        <a href="UserCategoryController?action=details&id=${category.categoryID}">
                            <img src="${category.image} " alt="Category Image" class="image">
                            <div class="title">${category.categoryName} </div>
                        </a>
                    </div>
                    <% }%>
                </div>

                <div id="paginationControls" class="pagination-controls">
                    <button id="prevButton" class="pagination-button"><i class="fas fa-chevron-left"></i></button>
                    <div id="pageNumbers"></div>
                    <button id="nextButton" class="pagination-button"><i class="fas fa-chevron-right"></i></button>
                </div>
            </div>
        </div>

        <div class="footer">
            <div class="footer-content">
                <div class="footer-content-info">
                    <div class="info-img">
                        <img src="images/Screenshot (659).png" />
                    </div>

                    <div class="info-text">
                        <p>Address: FPT University, District 9, Ho Chi Minh City</p>
                        <p>Email: fuj.khac.diamondshopsystem@gmail.com</p>
                        <p>Phone: (+ 84) 898876512</p>
                        <p>© Copyright 2024</p>
                    </div>
                </div>

                <div class="customer-service">
                    <div class="customer-service-title">Customer service</div>
                    <div class="customer-service-text">
                        <p><a href="static_webpages/ringmeasuring.jsp">Instructions for measuring rings</a></p>
                        <p><a href="static_webpages/consulation.jsp">Product consultation by month of birth</a></p>
                        <p><a href="static_webpages/faqs.jsp">Frequently asked questions</a></p>
                    </div>
                </div>

                <div class="policy">
                    <div class="policy-title">Policy</div>
                    <div class="policy-text">
                        <p><a href="static_webpages/warrantyPolicy.jsp">Warranty Policy</a></p>
                        <p><a href="static_webpages/deliveryPolicy.jsp">Delivery Policy</a></p>
                        <p><a href="static_webpages/returnPolicy.jsp">Return Policy</a></p>
                        <p><a href="static_webpages/privatePolicy.jsp">Privacy policy</a></p>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/usercollectionlist_pagination.js"></script>
    </body>
</html>

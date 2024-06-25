<%@page import="com.khac.swp.fuj.collection.CollectionDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Collection List</title>
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
                    <p class="intro">Today we have</p>
                    <h1>Exquisite Ring Collection</h1>
                    <div class="description_hero">
                        <span>Discover our stunning range of rings, meticulously crafted to perfection. From timeless classics to contemporary designs, our collection offers a variety of styles to suit every taste. Each piece is designed with the utmost attention to detail, ensuring that it not only dazzles but also stands the test of time. Whether you're looking for an engagement ring, a gift for a loved one, or a special treat for yourself, our collection promises to deliver elegance and sophistication for every occasion.</span>
                    </div>                   
                </div>
                <div class="bannerImage">
                    <img src="images/Women's_Diamond_Wedding_Rings.webp" id="diamondHero" style="width: 432px; height: 432px">
                </div>
            </div>
        </div>


        <div class="list-container">
            <div class="smaller-container">
                <form action='' method=GET id="searchbox" class="center-searchbox"> 
                    <input name=keyword type=text class="search-input" value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>">
                    <button type="submit" class="search-button"><i class="fas fa-search"></i></button>
                </form>
                <div class="list-title">Collection List</div>

                <div class="gallery">
                    <%
                        List<CollectionDTO> list = (List<CollectionDTO>) request.getAttribute("collectionlist");
                        for (CollectionDTO collection : list) {
                            pageContext.setAttribute("collection", collection);
                    %>
                    <div class="container">
                        <a href="UserCollectionController?action=details&id=${collection.collectionID}">
                            <img src="${collection.collectionImage} " alt="Collection Image" class="image">
                            <div class="title">${collection.collectionName} </div>
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

        <div class="Main-hero">
            <div class="hero-details">
                <h2 style="font-family: Inter; font-weight: bold;">UP TO 50% OFF</h2>
                <h1 style="font-family: Inika;">To Mom, With Love</h1>
                <h3>A mother’s love is deep and everlasting. <br>Celebrate it with something that will always shin like she does (and save up to 50%)</h3>                   
            </div>
            <img src="images/hero1.jpg" height="1px" alt="" srcset="">
        </div>

        <div class="faq">
            <div class="faq-left">
                <div class="faq-title">
                    <h1>FAQs about FUJ Ring Category</h1>
                </div>
            </div>
            <div class="faq-right">
                <div class="more-details">
                    <div class="more-details-title-wrapper" onclick="toggleDropdown(this)">
                        What materials are commonly used to make rings?
                        <button class="plus-button">+</button>
                    </div>
                    <div class="more-details-content">
                        <p>Rings can be made from a variety of materials, including gold, silver, platinum, titanium, </p> 
                        <p>tungsten, stainless steel, and more. Some rings also incorporate  gemstones such as </p> 
                        <p>diamonds, sapphires, emeralds, and rubies.</p> 
                    </div>
                </div>
                <div class="more-details">
                    <div class="more-details-title-wrapper" onclick="toggleDropdown(this)">
                        How do I determine my ring size?
                        <button class="plus-button">+</button>
                    </div>
                    <div class="more-details-content">
                        <p>You can determine your ring size by using a ring sizer tool which measures the</p> 
                        <p>circumference of your finger. Alternatively, you can visit a jeweler who can professionally</p> 
                        <p>measure your ring size. It's important to measure your finger at different times of the day,</p> 
                        <p>as finger size can vary with temperature and activity.</p>
                    </div>
                </div>
                <div class="more-details">
                    <div class="more-details-title-wrapper" onclick="toggleDropdown(this)">
                        What is the significance of different types of rings (e.g., engagement rings)?
                        <button class="plus-button">+</button>
                    </div>
                    <div class="more-details-content">
                        <p>Different types of rings have different significances. Engagement rings are typically</p> 
                        <p>given during a proposal and often feature a prominent gemstone. Wedding rings are</p> 
                        <p>exchanged during the wedding and symbolize the commitment of marriage. Other</p> 
                        <p>rings, such as promise rings, fashion rings and anniversary rings, can also carry</p>
                        <p>personal or cultural significance.</p>
                    </div>
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

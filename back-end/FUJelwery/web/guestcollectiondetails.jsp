
<%@page import="com.khac.swp.fuj.ring.RingDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Colletion Details</title>
        <link rel="stylesheet" href="css/navigation_bar.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script src="js/pagination.js"></script>
        <link rel="stylesheet" href="css/pagination.css">
        <link rel="stylesheet" href="css/user_collectiondetails.css">

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
                                <li><a href='#'>Cart</a></li>
                                <li><a href='#'>Tracking Orders</a></li>
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

        <div class="bannerContainer">
            <div class="bannerContent">
                <div class="bannerText">
                    <p class="intro">Our Collection</p>
                    <h1>${requestScope.collection.collectionName}</h1>
                    <div class="description_hero">
                        <span>${requestScope.collection.collectionDescription}</span>
                        <br>
                        <br>
                        <span>Discover our exquisite range of rings, meticulously crafted to capture elegance and sophistication. Whether for a special occasion or everyday glamour, find the perfect ring to complement your unique charm.</span>
                    </div>
                </div>
                <div class="bannerImage">
                    <img src="images/Blue_Nile_Studio.webp" id="diamondHero" style="width: 432px; height: 432px">
                </div>
            </div>
        </div>

        <div class="list-container">
            <div class="smaller-container">
                <div class="list-title">Ring List</div>
                <div class="list">
                    <div class="card-container">
                        <%
                            List<RingDTO> list = (List<RingDTO>) request.getAttribute("ringclist");
                            for (RingDTO ring : list) {
                                pageContext.setAttribute("ring", ring);
                        %>
                        <div class="product-card">
                            <a href="GuestProductController?action=details&id=${ring.ringID}">
                                <img src="${ring.ringImage}" alt="${ring.ringName}">
                                <h3 class="product-name">${ring.ringName}</h3>
                                <!--<p>Diamond: ${product.diamondName}</p>-->
                                <p class="product-price">Price: ${ring.totalPrice} VND</p>
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

        <div class="bannerContainer">
            <div class="bannerContent">
                <div class="bannerText">    
                    <h1>HAVING TROUBLE WHEN CHOOSING YOUR BEST RING SIZE?</h1>
                    <div class="description_hero">
                        <span>Find the perfect fit! Visit our Ring Measuring Guide for easy-to-follow instructions on measuring your ring size at home. Ensure a comfortable and accurate fit with our helpful tips and downloadable sizing tools.</span>
                    </div>
                    <a style="margin-top: 15px" class="slpBtn" title="Shop Diamond" href="guest_static_webpages/ringmeasuring.jsp">Check our guidance</a>
                </div>
                <div class="bannerImage">
                    <img src="images/Ready-to-Ship_Rings.jpeg" id="diamondHero" style="width: 700px; height: 432px">
                </div>
            </div>
        </div>

        <div class="faq">
            <div class="faq-left">
                <div class="faq-title">
                    <h1>FAQs about ${requestScope.collection.collectionName} Collection</h1>
                </div>
            </div>
            <div class="faq-right">
                <div class="more-details">
                    <div class="more-details-title-wrapper" onclick="toggleDropdown(this)">
                        How can I find out about the latest additions to my diverse ring collection?
                        <button class="plus-button">+</button>
                    </div>
                    <div class="more-details-content">
                        <p>Subscribe to our newsletter or follow us on social media to stay updated on our latest</p> 
                        <p>ring designs, promotions, and special offers.</p> 
                    </div>
                </div>
                <div class="more-details">
                    <div class="more-details-title-wrapper" onclick="toggleDropdown(this)">
                        What materials are your rings made from?
                        <button class="plus-button">+</button>
                    </div>
                    <div class="more-details-content">
                        <p>Our rings are crafted from high-quality materials such as silver, 14k and 18k gold,</p> 
                        <p>platinum, and occasionally feature gemstones like diamonds and emeralds.</p>                         
                    </div>
                </div>
                <div class="more-details">
                    <div class="more-details-title-wrapper" onclick="toggleDropdown(this)">
                        Do you offer a warranty or guarantee on your rings?
                        <button class="plus-button">+</button>
                    </div>
                    <div class="more-details-content">
                        <p>Yes, we stand behind the quality of our rings. Each purchase is covered by a warranty</p> 
                        <p>against manufacturing defects. Please refer to our warranty policy for more details.</p>                        
                    </div>
                </div>
            </div>
        </div>

        <div class="footer">
            <div class="footer-content">
                <div class="footer-content-info">
                    <div class="info-img">
                        <img src="images/Screenshot (659).png" style="width: 80px; height: 80px;"/>
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

        <script src="js/productlist_pagination.js"></script>
        <script>
                        function toggleDropdown(header) {
                            var content = header.nextElementSibling;
                            if (content.style.display === "block") {
                                content.style.display = "none";
                                header.querySelector(".plus-button").innerText = "+";
                                header.parentElement.style.height = header.offsetHeight + "px";
                            } else {
                                content.style.display = "block";
                                header.querySelector(".plus-button").innerText = "-";
                                header.parentElement.style.height = (header.offsetHeight + content.offsetHeight) + "px";
                            }
                        }
        </script>

    </body>
</html>

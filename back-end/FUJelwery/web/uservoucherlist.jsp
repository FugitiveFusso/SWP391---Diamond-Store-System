<%@page import="com.khac.swp.fuj.voucher.VoucherDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Voucher Page</title>
        <link rel="stylesheet" href="css/navigation_bar.css">
        <link rel="stylesheet" href="css/user_voucherlist.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="css/pagination.css">

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


                            </ul>
                        </div>   
                    </li>
                    <li class="navbar-link"><a href='./UserDiamondPriceController' class="line">Diamond Price</a></li>
                    <li class="navbar-link"><a href='./UserVoucherController' class="line">Voucher</a></li>
                    <li class="navbar-link"><a href="#" class="line">Order Monitor</a>                       
                        <div class="sub-menu-1">
                            <ul>
                                <li><a href='OrderController?action=list&id=${sessionScope.usersession.userid}'>Cart</a></li>
                                <li><a href='BillController?action=list&id=${sessionScope.usersession.userid}'>Bill</a></li>
                            </ul>
                        </div>
                    </li>
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
                                <li><a href='HistoryController?action=list&id=${sessionScope.usersession.userid}'>History</a></li>
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
                    <h1>Perfect Voucher For Your Jewelry</h1>
                    <div class="description_hero">
                        <span>Discover the perfect gift with our exclusive jewelry vouchers. 
                            Whether it's a birthday, anniversary, or a special occasion, our vouchers 
                            offer a versatile and elegant solution for your loved ones. Allow them to 
                            choose from a stunning collection of handcrafted pieces, ensuring they find 
                            something that resonates with their unique style and taste. Give the gift of 
                            choice and elegance with our jewelry vouchers, the perfect way to show you care.</span>
                    </div>

                </div>
                <div class="bannerImage">
                    <img src="images/Women's_Wedding_Ring.jpeg" id="diamondHero" style="width: 432px; height: 432px">
                </div>
            </div>
        </div>


        <div class="list-container">
            <div class="smaller-container">
                <div class="list">
                    <form action='' method=GET id="searchbox">
                        <input name="keyword" type="text" class="search-input" value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>">
                        <button type="submit" class="search-button"><i class="fas fa-search"></i></button>
                    </form>

                    <div class="voucher-content">
                        <div class="voucher-container">
                            <div class="voucher-left">
                                <table id="pagination">
                                    <tbody>
                                        <%
                                            List<VoucherDTO> list = (List<VoucherDTO>) request.getAttribute("uservoucherlist");
                                            for (VoucherDTO voucher : list) {
                                                pageContext.setAttribute("voucher", voucher);
                                        %>
                                        <tr class="voucher-item" style="border-radius: 20px">
                                            <td class="voucher-image">
                                                <img src="${voucher.image}" style="width: 600px; height: 280px">
                                            </td>
                                            <td class="voucher-details" style="font-family: 'Inter', sans-serif; ">
                                                <h2>${voucher.name}</h2>
                                                <div class="one">
                                                    <div class="detail-row">
                                                        <strong>Created date:</strong>${voucher.createddate}
                                                    </div>
                                                    <div class="detail-row">
                                                        <strong>Added by:</strong>${voucher.createdby}
                                                    </div>
                                                </div>
                                                <div class="detail-row">
                                                    <p>${voucher.description}</p>
                                                </div>
                                                <div class="detail-row">
                                                    <strong>Code: ${voucher.coupon}</strong>
                                                </div>

                                                <div class="detail-row">
                                                    <strong>Discount percentage:</strong>${voucher.percentage}%
                                                </div>
                                            </td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
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
                <div class="bannerImage">
                    <img src="images/Women's_Platinum_Wedding_Rings.webp" id="diamondHero" alt="">
                </div>
                <div class="bannerText">
                    <h1>HOW CAN I REDEEM MY RING VOUCHER?</h1>
                    <div class="description_hero">
                        <span>Redeeming your ring voucher is easy! Simply enter the unique code provided at checkout to apply the voucher towards your purchase. Enjoy selecting from our exquisite collection of rings and use your voucher to add a touch of elegance to your jewelry collection.</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="faq">
            <div class="faq-left">
                <div class="faq-title">
                    <h1>FAQs about FUJ Ring Voucher</h1>
                </div>
            </div>
            <div class="faq-right">
                <div class="more-details">
                    <div class="more-details-title-wrapper" onclick="toggleDropdown(this)">
                        How do I receive a ring voucher?
                        <button class="plus-button">+</button>
                    </div>
                    <div class="more-details-content">
                        <p>Ring vouchers are typically issued through promotions, special offers, or as gifts. You may </p> 
                        <p>receive them via email, physical mail, or by phone that can be redeemed on our website.</p> 
                    </div>
                </div>
                <div class="more-details">
                    <div class="more-details-title-wrapper" onclick="toggleDropdown(this)">
                        Can I use a ring voucher to purchase any item on your website?
                        <button class="plus-button">+</button>
                    </div>
                    <div class="more-details-content">
                        <p>Ring vouchers can typically be used to purchase any ring or jewelry item available on our </p> 
                        <p>website, unless otherwise specified in the voucher terms.</p>                        
                    </div>
                </div>
                <div class="more-details">
                    <div class="more-details-title-wrapper" onclick="toggleDropdown(this)">
                        Can I use a voucher for online purchases only, or can I use it in-store as well?
                        <button class="plus-button">+</button>
                    </div>
                    <div class="more-details-content">
                        <p>Ring vouchers issued by our store are valid for online purchases through our website only.</p> 
                        <p>Unfortunately, at this time, we are unable to accept vouchers for in-store purchases.</p> 
                        <p>Please refer to the voucher terms for any specific restrictions or conditions.</p>                        
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

        <!--        <script src="js/pagination_voucher.js"></script>-->
        <script src="js/pagination.js"></script>
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

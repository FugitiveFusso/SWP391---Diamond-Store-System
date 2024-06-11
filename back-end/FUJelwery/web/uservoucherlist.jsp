<%@page import="com.khac.swp.fuj.voucher.VoucherDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Voucher Page</title>
        <link rel="stylesheet" href="css/navbaruser.css">
        <link rel="stylesheet" href="css/user_voucherlist.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="css/pagination.css">

    </head>
    <body>
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
                    <p class="intro">To day we have</p>
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
                        <input name=keyword type=text class="search-input" value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>">
                        <button type="submit" class="search-button"><i class="fas fa-search"></i></button>
                    </form>

                    <div class="voucher-content">
                        <%
                            List<VoucherDTO> list = (List<VoucherDTO>) request.getAttribute("uservoucherlist");
                            for (VoucherDTO voucher : list) {
                                pageContext.setAttribute("voucher", voucher);
                        %>
                        <div class="voucher-left">
                            <h1>${voucher.name}</h1>
                            <div class="detail-row">
                                <strong>Created date:</strong> <p>${voucher.createddate}</p>
                            </div>
                            <div class="detail-row">
                                <strong>Added by:</strong> <p>${voucher.createdby}</p>
                            </div>
                            <div class="detail-row">
                                <strong>Code:</strong> <p>${voucher.coupon}</p>
                            </div>
                            <div class="detail-row">
                                <p>${voucher.description}</p>
                            </div>
                            <div class="detail-row">
                                <strong>Discount percentage:</strong> <p>${voucher.percentage}%</p>
                            </div>
                            <div class="button-container">
                                <a href="UserVoucherController?action=details&id=${voucher.id}" class="detail-button">View Details</a>
                            </div>
                        </div>
                        <div class="voucher-right">
                            <div class="voucher-img">
                                <img src=${voucher.image} style="width: 500px; height: 300px;">
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>    

                    <!--                    <table id="pagination">
                                            <thead>
                                                <tr>
                                                    <th>Voucher ID</th>
                                                    <th><a href=?colSort=postName>Voucher Name</a></th>
                                                    <th>Image</th>
                                                    <th>Created Date</th>
                                                    <th>Created By</th>
                                                    <th>Coupon</th>
                                                    <th>Description</th>
                                                    <th>Percentage</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                
                                                <tr>
                                                    <td><a href="UserVoucherController?action=details&id=${voucher.id}">${voucher.id}</a></td>
                                                    <td>${voucher.name}</td>
                                                    <td><img src=${voucher.image} width="300px" height="300px"></td>
                                                    <td>${voucher.createddate}</td>
                                                    <td>${voucher.createdby}</td>
                                                    <td>${voucher.coupon}</td>
                                                    <td>${voucher.description}</td>
                                                    <td>${voucher.percentage}</td>
                                                </tr>
                                                
                                            </tbody>
                                        </table>-->
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

        <script src="js/pagination.js"></script>

    </body>
</html>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bill Details</title>
        <link rel="stylesheet" href="css/billdetalis.css">
        <link rel="stylesheet" href="css/navigation_bar.css">
        <link rel="icon" type="image/x-icon" href="images/Screenshot__656_-removebg-preview.png">
        <style>
            a {
                color: black;
                text-decoration: none;
            }

            a:hover {
                color: black;
                text-decoration: none;
            }
        </style>
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
                                <li><a href='BillController?action=list&id=${sessionScope.usersession.userid}'>Tracking Orders</a></li>
                                <li><a href='TransactionTracking?action=list&id=${sessionScope.usersession.userid}'>Transactions</a></li>
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
                                <li><a href='HistoryController?action=list&id=${sessionScope.usersession.userid}'>History</a></li>
                                <li><a href='./userlogin?action=logout'>Logout</a></li> 
                            </ul>
                        </div>
                    </li>
                </ul>

            </div>
        </div>


        <div class="container">
            <div class="bill-details-container">
                <div class="image-column">
                    <img src="${requestScope.bill.ringImage}" alt="Product Image" class="product-image">
                </div>
                <div class="details-column">
                    <h3>Bill Details</h3>
                    <div class="product-details">
                        <p><strong>Customer:</strong> ${requestScope.bill.fullName}</p>
                        <p><strong>Product Name:</strong><a href="ProductController?action=details&id=${requestScope.bill.ringID}"> ${requestScope.bill.ringName}</a> </p>
                        <p><strong>Ring Size:</strong> ${requestScope.bill.ringSize}</p>
                        <p><strong>Date of Purchase:</strong> ${requestScope.bill.orderDate}</p>
                        <p><strong>Voucher:</strong> ${requestScope.bill.voucherName}</p>
                        <p><strong>Destination:</strong> ${requestScope.bill.address}</p>
                        <p class="price"><strong>Total Price:</strong> ${requestScope.bill.totalPrice}</p>
                    </div>
                    <div class="action-buttons">
                        <button id="toggle-warranty-btn" class="toggle-btn" onclick="toggleSection('warranty', 'toggle-warranty-btn')">+ Warranty</button>
                        <button id="toggle-certificate-btn" class="toggle-btn" onclick="toggleSection('certificate', 'toggle-certificate-btn')">+ Certificate</button>
                    </div>
                    <div id="warranty" class="warranty hidden">
                        <img src="${requestScope.bill.warrantyImage}" alt="Warranty Image" class="warranty-image" style="width: 60%;">
                        <h4>Warranty Details</h4>
                        <p><strong>Warranty Name:</strong> ${requestScope.bill.warrantyName}</p>
                        <p><strong>Months in effect:</strong> ${requestScope.bill.warrantyMonth}</p>
                        <p><strong>Description:</strong> ${requestScope.bill.warrantyDescription}</p>
                        <p><strong>Warranty Type:</strong> ${requestScope.bill.warrantyType}</p>
                        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

                        <p class="card-text"><strong>Start Date: </strong> 
                            <c:choose>
                                <c:when test="${requestScope.bill.warrantyStartDate == null}">
                                    N/A
                                </c:when>
                                <c:otherwise>
                                    ${requestScope.bill.warrantyStartDate}
                                </c:otherwise>
                            </c:choose>
                        </p>

                        <p class="card-text"><strong>End Date: </strong> 
                            <c:choose>
                                <c:when test="${requestScope.bill.warrantyEndDate == null}">
                                    N/A
                                </c:when>
                                <c:otherwise>
                                    ${requestScope.bill.warrantyEndDate}
                                </c:otherwise>
                            </c:choose>
                        </p>
                        <p><strong>Terms and Conditions:</strong> ${requestScope.bill.warrantyTerms}</p>

                    </div>
                    <div id="certificate" class="certificate hidden">
                        <img src="${requestScope.bill.certificateImage}" alt="Certificate Image" class="certificate-image" style="width: 60%;">
                        <p class="image-caption">This is your diamond's certificate from you purchased ring image</p>
                        <h4>Certificate Details</h4>
                        <p><strong>Description: </strong> ${requestScope.bill.certificateName}</p> 

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

        <script src="js/billdetails.js"></script>
    </body>
</html>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bill Details</title>
        <link rel="stylesheet" href="css/billdetalis.css">
        <link rel="stylesheet" href="css/navigation_bar.css">

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

        <!--        <div class="order-details">
                    <div class="order-header">
                        <h2>Bill Details</h2>
                    </div>
                    <div class="order-content">
                        <div class="product-section">
                            <div class="order-item">
                                <img src="${requestScope.bill.ringImage}" alt="Product Image" class="product-image">
                                <div class="item-details">
                                    <h4 class="card-title">${requestScope.bill.ringName}</h4>
                                    <p class="card-text"><strong>Date of purchase:</strong> ${requestScope.bill.orderDate}</p>
                                    <p class="card-text"><strong>Voucher:</strong> ${requestScope.bill.voucherName}</p>
                                    <p class="card-text"><strong>Total Price:</strong> ${requestScope.bill.totalPrice}</p>
                                </div>
                            </div>
                        </div>
                        <div class="details-section">
                            <div class="order-item">
                                <div class="toggle-details">
                                    <button class="toggle-button" onclick="toggleDetails(this, 'warranty')">+ Warranty</button>
                                </div>
                                <div class="item-details hidden warranty">
                                    <img src="${requestScope.bill.warrantyImage}" alt="Warranty Image" class="warranty-image">
                                    <p class="image-caption">Warranty Image</p>
                                    <p class="card-text"><strong>Warranty Name:</strong> ${requestScope.bill.warrantyName}</p>
                                    <p class="card-text"><strong>Month in effect:</strong> ${requestScope.bill.warrantyMonth}</p>
                                    <p class="card-text"><strong>Description:</strong> ${requestScope.bill.warrantyDescription}</p>
                                    <p class="card-text"><strong>Warranty Type:</strong> ${requestScope.bill.warrantyType}</p>
                                    <p class="card-text"><strong>Start Date:</strong> ${requestScope.bill.warrantyStartDate}</p>
                                    <p class="card-text"><strong>End Date:</strong> ${requestScope.bill.warrantyEndDate}</p>
                                    <p class="card-text"><strong>Terms and Conditions:</strong> ${requestScope.bill.warrantyTerms}</p>
                                </div>
                            </div>
                            <div class="order-item">
                                <div class="toggle-details">
                                    <button class="toggle-button" onclick="toggleDetails(this, 'certificate')">+ Certificate</button>
                                </div>
                                <div class="item-details hidden certificate">
                                    <img src="${requestScope.bill.certificateImage}" alt="Certificate Image" class="certificate-image">
                                    <p class="image-caption">Certificate Image</p>
                                    <p class="card-text"><strong>Name: </strong> ${requestScope.bill.certificateName}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>-->

        <div class="container">
            <div class="bill-details-container">
                <div class="image-column">
                    <img src="${requestScope.bill.ringImage}" alt="Product Image" class="product-image">
                </div>
                <div class="details-column">
                    <h3>Bill Details</h3>
                    <div class="product-details">
                        <p><strong>Product Name:</strong> ${requestScope.bill.ringName}</p>
                        <p><strong>Date of Purchase:</strong> ${requestScope.bill.orderDate}</p>
                        <p><strong>Voucher:</strong> ${requestScope.bill.voucherName}</p>
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
                        <p><strong>Month in effect:</strong> ${requestScope.bill.warrantyMonth}</p>
                        <p><strong>Description:</strong> ${requestScope.bill.warrantyDescription}</p>
                        <p><strong>Warranty Type:</strong> ${requestScope.bill.warrantyType}</p>
                        <p><strong>Start Date:</strong> ${requestScope.bill.warrantyStartDate}</p>
                        <p><strong>End Date:</strong> ${requestScope.bill.warrantyEndDate}</p>
                        <p><strong>Terms and Conditions:</strong> ${requestScope.bill.warrantyTerms}</p>
                        <!--                        <p><strong>Status:</strong> Active</p>
                                                <p><strong>Expiry Date:</strong> 30/06/2025</p>
                                                <p><strong>Coverage:</strong> Manufacturing defects, accidental damage</p>-->
                    </div>
                    <div id="certificate" class="certificate hidden">
                        <img src="${requestScope.bill.certificateImage}" alt="Certificate Image" class="certificate-image" style="width: 60%;">
                        <h4>Certificate Details</h4>
                        <p class="image-caption">Certificate Image</p>
                        <p><strong>Name: </strong> ${requestScope.bill.certificateName}</p> 
                        <!--                        <p><strong>Certificate Name:</strong> 0.70 Carat Round Cut Diamond Certificate</p>
                                                <p><strong>GIA Report Number:</strong> 2194313787</p>
                                                <p><strong>Measurements:</strong> 5.57 - 5.59 x 3.53 mm</p>
                                                <p><strong>Grading Results:</strong></p>
                                                <ul>
                                                    <li>Carat Weight: 0.70 carat</li>
                                                    <li>Color Grade: G</li>
                                                    <li>Clarity Grade: SI1</li>
                                                    <li>Cut Grade: Very Good</li>
                                                </ul>
                                                <p><strong>Additional Grading Information:</strong></p>
                                                <ul>
                                                    <li>Polish: Excellent</li>
                                                    <li>Symmetry: Very Good</li>
                                                    <li>Fluorescence: None</li>
                                                    <li>Clarity Characteristics: Feather</li>
                                                </ul>-->
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

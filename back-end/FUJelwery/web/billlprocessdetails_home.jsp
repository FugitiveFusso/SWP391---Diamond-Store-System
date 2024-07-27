
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delivery Order Details</title>      
        <link rel="stylesheet" href="css/navigation_bar.css">
        <link rel="stylesheet" href="css/order_detail.css">
        <link rel="stylesheet" href="css/progressbar.css">   
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="icon" type="image/x-icon" href="images/Screenshot__656_-removebg-preview.png">
    </head>

    <body>
        <div class="header">
            <div class="header-top">
                <div class="top-info-left">
                    <ul>
                        <li>Timeless elegance and craftsmanship</li>
                        <li style="margin-left: 5px">at KHAC Diamond Ring Online Shop.</li>                         
                    </ul>
                </div>
                <a href="user_homepage.jsp"><img src="./images/Screenshot (656).png"></a>
                <div class="top-info-right">
                    <ul>
                        <li>KHAC Diamond Ring Shop - <strong>(+ 84) 898876512</strong></li>
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
                                <li><a href='./userlogin?action=logout'>Logout</a></li> 
                                <li><a href='HistoryController?action=list&id=${sessionScope.usersession.userid}'>History</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </div>

        <div class="progress-container" style="margin-top: 30px;">
            <div class="progress-bar" style="background-color: #e0e0e0;"></div>
            <div class="step" data-step="Purchased">
                <div class="step-counter">Purchased</div>
            </div>
            <div class="step" data-step="Verified">
                <div class="step-counter">Verified</div>
            </div>
            <div class="step" data-step="Shipping">
                <div class="step-counter">Shipping</div>
            </div>
            <div class="step" data-step="Delivered">
                <div class="step-counter">Delivered</div>
            </div>
        </div>    
        <div id="status" style="display: none">${requestScope.bill.status}</div>

        <div class="container my-5" style="margin-top: 0px !important;">
            <div class="order-card card">               
                <div class="card-header bg-white">
                    <div class="row justify-content-between">
                        <div class="col">                            
                            <p class="text-muted">Placed On: <span class="font-weight-bold text-dark">${requestScope.bill.orderDate}</span> </p>
                            <p class="text-muted">Order Code: <span class="font-weight-bold text-dark">${bill.orderCode}</span> </p>
                        </div>
                        <div class="flex-col my-auto">
                            <h6 class="ml-auto mr-3">
                                <a href="ProductController?action=details&id=${bill.ringID}" style="color: #151542">View Product Details</a>
                            </h6>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="media flex-column flex-sm-row">
                        <div class="media-body">
                            <h5 class="font-weight-bold">${requestScope.bill.ringName}</h5>
                            <p class="text-muted"> Quantity: 1 Ring</p>
                            <h4 class="mt-3 mb-4 font-weight-bold"> ${requestScope.bill.totalPrice} <span class="small text-muted"> VND </span></h4>
                            <p class="text-muted">Tracking Status: <span class="Today"><strong>${requestScope.bill.status}</strong></span></p>  
                            <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

                            <c:choose>
                                <c:when test="${requestScope.bill.status == 'purchased'}">
                                    <p class="text-muted">Tracking Status: <span class="Today"><strong>Purchased</strong></span></p>  
                                </c:when>
                                <c:when test="${requestScope.bill.status == 'shipping'}">
                                    <p class="text-muted">Tracking Status: <span class="Today"><strong>Shipping</strong></span></p>  
                                </c:when>  
                                <c:when test="${requestScope.bill.status == 'delivered'}">
                                    <p class="text-muted">Tracking Status: <span class="Today"><strong>Delivered</strong></span></p>  
                                </c:when> 
                                <c:when test="${requestScope.bill.status == 'verified'}">
                                    <p class="text-muted">Tracking Status: <span class="Today"><strong>Verified</strong></span></p>  
                                </c:when> 
                            </c:choose>
                            <div class="row justify-content-center">
                                <div class="col-auto btn-container">
                                    <button type="button" class="btn btn-outline-primary">
                                        <a href="./user_aboutus.jsp">Reach KHAC Diamond Ring Shop</a>
                                    </button>
                                    <button type="button" class="btn btn-outline-primary">
                                        <a href="BillController?action=list&id=${sessionScope.usersession.userid}">Return to Recent Activity</a>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <img class="align-self-center img-fluid bordered-img" src="${requestScope.bill.ringImage}">
                    </div>
                </div>
                <div class="row px-3">

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
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="js/progressbar.js"></script>

    </body>
</html>

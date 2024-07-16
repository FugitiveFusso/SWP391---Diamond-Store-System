
<%@page import="com.khac.swp.fuj.order.OrderDTO"%>
<%@page import="com.khac.swp.fuj.ring.RingDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Gateway</title>
        <link rel="icon" type="image/x-icon" href="images/Screenshot__656_-removebg-preview.png">
        <link rel="stylesheet" href="css/navigation_bar.css">
        <link rel="stylesheet" href="css/user_mainpage.css">
        <link rel="stylesheet" href="css/paymentgateway.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" integrity="sha512-Avb2QiuDEEvB4bZJYdft2mNjVShBftLdPG8FJ0V7irTLQ8Uo0qcPxh4Plq7G5tGm0rU+1SPhVotteLpBERwTkw=="/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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


        <!--
                <div class="col-md-9">
                    <div class="card-block">
                        <h2 class="m-b-20 p-b-5 b-b-default f-w-600">Personal Information</h2>
                        <div class="row">
                            <div class="col-sm-6">
                                <p class="m-b-10 f-w-600">First Name</p>
                                <h6 class="text-muted f-w-400">${requestScope.customer.firstname}</h6>
                            </div>
                            <div class="col-sm-6">
                                <p class="m-b-10 f-w-600">Last Name</p>
                                <h6 class="text-muted f-w-400">${requestScope.customer.lastname}</h6>
                            </div>
                            <div class="col-sm-6">
                                <p class="m-b-10 f-w-600">Email</p>
                                <h6 class="text-muted f-w-400">${requestScope.customer.email}</h6>
                            </div>
                            <div class="col-sm-6">
                                <p class="m-b-10 f-w-600">Phone Number</p>
                                <h6 class="text-muted f-w-400">${requestScope.customer.phonenumber}</h6>
                            </div>
                            <div class="col-sm-6">
                                <p class="m-b-10 f-w-600">Address</p>
                                <h6 class="text-muted f-w-400">${requestScope.customer.address}</h6>
                            </div>
                            <div><h2 class="font-bold" style="color: red">
        ${totalPrice} VND
    </h2>
</div>

</div>
<div class="row" style="margin-top: 20px; justify-content: center">
<div class="col-sm-4">
    <form action="OrderController" method="POST" style="padding-top: 10px">
        <input type="hidden" name="action" value="pay">
        <input type="hidden" name="id" value="${sessionScope.usersession.userid}">

        Credit card number: <input name="creditCardNumber" type="text" class="search-input" value="" minlength="16" maxlength="19" required pattern="\d{16,19}">
        VVS: <input name="VVS" type="text" class="search-input" value="" minlength="3" maxlength="3" required pattern="\d{3,3}">

        <button type="submit" id="purchaseButton1" class="btn btn-primary btn-large">
            <i class="fa fa-shopping-cart"></i> Purchase
        </button>
    </form>

    <form action="OrderController" method="POST" class="mt-3">
        <input type="hidden" name="action" value="list">
        <input type="hidden" name="id" value="${sessionScope.usersession.userid}">

        <button type="submit" id="purchaseButton2" class="btn btn-primary btn-large">
            <i class="fa fa-shopping-cart"></i> Cancel
        </button>
    </form>
</div>

</div>
</div>
</div>-->

        <div class="payment">
            <div class="row">
                <div class="col-75">
                    <div class="container">
                        <div class="row">
                            <div class="col-50">
                                <h2>Billing Address</h2>
                                <label for="fname"><i class="fa fa-user"></i> Full Name</label>
                                <!--<h4 class="text-muted f-w-400"></h4>-->
                                <input type="text" id="fname" name="firstname" placeholder="${requestScope.customer.firstname} ${requestScope.customer.lastname}" readonly>
                                <label for="email"><i class="fa fa-envelope"></i> Email</label>
                                <!--<h4 class="text-muted f-w-400"></h4>-->
                                <input type="text" id="email" name="email" placeholder="${requestScope.customer.email}" readonly>
                                <label for="adr"><i class="fa fa-address-card-o"></i> Address</label>
                                <!--<h4 class="text-muted f-w-400"></h4>-->
                                <input type="text" id="adr" name="address" placeholder="${requestScope.customer.address}" readonly >
                                <label for="city"><i class="fa fa-phone"></i> Phone number</label>
                                <!--<h4 class="text-muted f-w-400"></h4>-->
                                <input type="text" id="phone" name="phonenumber" placeholder="${requestScope.customer.phonenumber}" readonly>

                                <div class="row">
                                    <!--                                        <div class="col-50">
                                                                                <label for="state">State</label>
                                                                                <input type="text" id="state" name="state" placeholder="NY">
                                                                            </div>
                                                                            <div class="col-50">
                                                                                <label for="zip">Zip</label>
                                                                                <input type="text" id="zip" name="zip" placeholder="10001">
                                                                            </div>-->
                                    <div class="col-50">
                                        <i class="fa fa-money" aria-hidden="true"></i>
                                        Total price:
                                        <h2 class="font-bold" style="color: red">
                                            ${totalPrice} VND
                                        </h2>
                                    </div>
                                </div>
                            </div>

                            <div class="col-50">
                                <h2>Payment</h2>
                                <label for="fname"> <i class="fa fa-credit-card-alt" aria-hidden="true"></i> Accepted Cards</label>
                                <div class="icon-container">
                                    <i class="fa fa-cc-visa" style="color:navy;"></i>
                                    <i class="fa fa-cc-amex" style="color:blue;"></i>
                                    <i class="fa fa-cc-mastercard" style="color:red;"></i>
                                    <i class="fa fa-cc-discover" style="color:orange;"></i>
                                </div>
                                <label for="cname">Name on Card</label>
                                <input type="text" id="cname" name="cardname" placeholder="Please enter your name on your card">
                                <label for="ccnum">Credit card number</label>
                                <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444">
                                <label for="expmonth">Exp Month</label>
                                <input type="text" id="expmonth" name="expmonth" placeholder="Please enter your exp month">
                                <div class="row">
                                    <div class="col-50">
                                        <label for="expyear">Exp Year</label>
                                        <input type="text" id="expyear" name="expyear" placeholder="Please enter your exp year">
                                    </div>
                                    <div class="col-50">
                                        <label for="cvv">CVV</label>
                                        <input type="text" id="cvv" name="cvv" placeholder="Please enter your CVV">
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- <label>
                          <input type="checkbox" checked="checked" name="sameadr"> Shipping address same as billing
                        </label> -->
                        <!--                        <input type="submit" value="Continue to checkout" class="btn">-->
                        <form action="OrderController" method="POST">
                            <button type="submit" id="purchaseButton1" class="btn btn-primary btn-large">
                                <i class="fa fa-shopping-cart"></i> Purchase
                            </button>
                        </form>
                    </div>
                </div>
                <!-- <div class="col-25">
                  <div class="container">
                    <h4>Cart <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i> <b>4</b></span></h4>
                    <p><a href="#">Product 1</a> <span class="price">$15</span></p>
                    <p><a href="#">Product 2</a> <span class="price">$5</span></p>
                    <p><a href="#">Product 3</a> <span class="price">$8</span></p>
                    <p><a href="#">Product 4</a> <span class="price">$2</span></p>
                    <hr>
                    <p>Total <span class="price" style="color:black"><b>$30</b></span></p>
                  </div>
                </div> -->
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
    </body>
</html>

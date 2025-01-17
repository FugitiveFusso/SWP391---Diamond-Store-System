
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Warranty Policy</title>
        <link rel="stylesheet" href="../css/warrantyPolicy.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Gantari:ital,wght@0,100..900;1,100..900&family=Inika:wght@400;700&family=Inria+Serif:ital,wght@0,300;0,400;0,700;1,300;1,400;1,700&family=Inter:wght@100..900&family=Raleway:ital,wght@0,100..900;1,100..900&family=Syne:wght@400..800&display=swap"
            rel="stylesheet">

        <link rel="stylesheet" href="../css/navigation_bar.css">
        <link rel="icon" type="image/x-icon" href="../images/Screenshot__656_-removebg-preview.png">

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
                <a href="./../user_homepage.jsp"><img src="../images/Screenshot (656).png"></a>
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
                                <li><a href='../ProductController'>Ring</a></li>
                                <li><a href='../UserCategoryController'>Category</a></li>    
                                <li><a href='../UserCollectionController'>Collection</a></li>                                 
                            </ul>
                        </div>   
                    </li>
                    <li class="navbar-link"><a href='../UserDiamondPriceController' class="line">Diamond Price</a></li>
                    <li class="navbar-link"><a href='../UserVoucherController' class="line">Voucher</a></li>
                    <li class="navbar-link"><a href="#" class="line">Order Monitor</a>                       
                        <div class="sub-menu-1">
                            <ul>
                                <li><a href='../OrderController?action=list&id=${sessionScope.usersession.userid}'>Cart</a></li>
                                <li><a href='../BillController?action=list&id=${sessionScope.usersession.userid}'>Tracking Orders</a></li>
                                <li><a href='../TransactionTracking?action=list&id=${sessionScope.usersession.userid}'>Transactions</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="navbar-link">
                        <a href="certificate_edu.jsp" class="line">Education</a>
                        <div class="sub-menu-1">
                            <ul>
                                <li><a href='../UserPostController'>Blog</a></li>
                                <li><a href='ringmeasuring.jsp'>Ring Measuring Guide</a></li>          
                                <li><a href='faqs.jsp'>Frequently Asking Questions</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="navbar-link"><a href="../user_aboutus.jsp" class="line">About Us</a></li>                    
                    <li class="navbar-link">
                        <a href="../user_accountdetails.jsp" class="line">Account</a>
                        <div class="sub-menu-1">
                            <ul>
                                <li><a href='../HistoryController?action=list&id=${sessionScope.usersession.userid}'>History</a></li>
                                <li><a href='../userlogin?action=logout'>Logout</a></li> 
                            </ul>
                        </div>
                    </li>
                </ul>

            </div>
        </div>

        <div class="main">


            <div class="content">
                <div class="warranty-policy">
                    WARRANTY POLICY
                </div>
                <div class="warranty-policy-intro">
                    <p>
                        KHAC Diamond Ring Shop distinguishes between fine jewelry and other fashion accessories, recognizing that each selected piece of
                        jewelry carries a unique narrative or sentimental value. As a steadfast and dedicated purveyor of love, KHAC Diamond Ring Shop
                        offers the comprehensive Warranty policy.
                    </p>
                </div>

                <div>
                    <h3>
                        1. CASES WHERE WARRANTY APPLIES
                    </h3>
                    <p class="text">
                        The product is defective by the manufacturer within 7 days from the date the Customer receives the product.
                        Please notify the staff immediately for warranty support.
                    </p>
                    <p class="text">
                        1 for 1 exchange if the product turns black or discolored within the first week from when the Customer
                        receives the product
                    </p>
                </div>

                <div>
                    <h3>
                        2. CASES WHERE WARRANTY DOES NOT APPLY
                    </h3>
                    <p class="text">
                        The product is defective or damaged due to improper use by the Customer
                    </p>
                    <p class="text">
                        The product has been edited and changed from KHAC Diamond Ring Shop's original shape
                    </p>
                    <p class="text">
                        Not a KHAC Diamond Ring Shop product
                    </p>
                </div>

                <div>
                    <h3>
                        3. CASE OF WARRANTY WITH A FEES
                    </h3>
                    <p class="text">
                        The product is damaged, dropped, severely scratched, or not used properly
                    </p>
                    <p class="text">
                        The product is renewed and re-plated to look like the original according to customer needs
                    </p>
                </div>

                <div>
                    <h3>
                        4. WARRANTY SERVICE PERIOD
                    </h3>
                    <p class="text">
                        The time to receive a product back lasts from 10 to 15 days
                    </p>
                    <p class="text">
                        Time for repair or stone installation (charged) will be informed to the Customer by KHAC Diamond Ring Shop's customer service
                        staff during the process of receiving the product.
                    </p>
                </div>

                <div class="dial-info">
                    <p class="text">
                        Customer service staff: (+84) 898876512 - (+84) 859849026
                    <p class="text">
                        Address: FPT University, District 9, Ho Chi Minh City
                    </p>
                </div>
            </div>

            <div class="footer">
                <div class="footer-content">
                    <div class="info">
                        <div class="info-img">
                            <img src="../images/Screenshot (659).png" />
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
                            <p><a href="ringmeasuring.jsp">Instructions for measuring rings</a></p>
                            <p><a href="consulation.jsp">Product consultation by month of birth</a></p>
                            <p><a href="faqs.jsp">Frequently asked questions</a></p>
                        </div>
                    </div>

                    <div class="policy">
                        <div class="policy-title">
                            Policy
                        </div>

                        <div class="policy-text">
                            <p><a href="warrantyPolicy.jsp">Warranty Policy</a></p>
                            <p><a href="deliveryPolicy.jsp">Delivery Policy</a></p>
                            <p><a href="returnPolicy.jsp">Return Policy</a></p>
                            <p><a href="privatePolicy.jsp">Privacy policy</a></p>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
</body>

</html>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Return Policy</title>
        <link rel="stylesheet" href="../css/returnPolicy.css">
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
                <div class="title-image">
                    <img src="../images/1_FTht0n-r_BVtqSvmL-52tw.jpg">
                </div>

                <div class="return-policy">
                    RETURN POLICY
                </div>
                <div class="return-policy-intro">
                    <p>
                        Thank you for selecting jewelry from KHAC Diamond Ring Shop - Please carefully review the following information to ensure the best possible support from KHAC Diamond Ring Shop.
                    </p>
                    <p>
                        KHAC Diamond Ring Shop offers product exchanges for customers, which fall into two categories:
                    </p>         
                </div>

                <div class="one">
                    <div class="title">
                        <h3>
                            1. KHAC Diamond Ring Shop COVERS SHIPPING EXPENSES:
                        </h3> 
                    </div>                  
                    <ul class="a">
                        <li>Exchange for a new product within 7 days (from the date of receipt) in cases where the product exhibits defects from the manufacturer, such as dropped beads, discoloration from lack of use, worn rings, broken buckles, etc.</li>
                        <li>The product turns black, rusty, or oxidized, causing skin irritation (applies only to titanium products).</li>
                        <li>The product received does not match the size or color specified by the customer.</li>          
                        <li>Missing order or incorrect product received.</li>
                    </ul>
                    <p class="text">(All of the above cases must be addressed within 7 days of receiving the goods; after this period, KHAC Diamond Ring Shop will not facilitate the exchange).</p>
                </div>

                <div>
                    <div class="title">
                        <h3>
                            2. CUSTOMER IS RESPONSIBLE FOR SHIPPING COSTS:
                        </h3>  
                    </div>

                    <p class="text">
                        If the customer is dissatisfied with the color or size of the product.
                    </p>                   
                    <p class="text">
                        (All products in the above cases can only be resolved within 48 hours from the time you receive the goods)
                    </p>                    
                </div>

                <div class="three">
                    <div class="cautious">
                        <h3>
                            Caution:
                        </h3>
                    </div>                               
                    <ul class="b">
                        <li>KHAC Diamond Ring Shop does not handle any refund cases for customers.</li>
                        <li>Please return products of the same model (size, color...) unless the product is exchanged by the Customer. KHAC Diamond Ring Shop is out of stock and will require you to switch to another color or size.</li>
                        <li>If you wish to exchange for a higher-value product due to the shop's defective item, please cover the price difference. However, if the exchanged product is of lower value, KHAC Diamond Ring Shop will not issue a refund but require payment of the price discrepancy.</li>          
                        <li>This policy is not applicable to promotions or gifts.</li>
                        <li>Product exchanges in the Earrings category are not applicable for health reasons, to avoid infectious diseases, KHAC Diamond Ring Shop protects all Customers.</li>
                        <li>Please thoroughly review the information provided and reach out to KHAC Diamond Ring Shop staff in advance for guidance and instructions on the return process.</li>
                    </ul>            
                </div>

                <div class="info">                     
                    <p class="text">
                        Customer service staff: (+84) 898876512 - (+84) 859849026
                    <p class="text">
                        Address: FPT University, District 9, Ho Chi Minh City
                    </p>           
                </div>

            </div>

            <div class="footer">
                <div class="footer-content">
                    <div class="footer-content-info">
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
    </body>
</html>

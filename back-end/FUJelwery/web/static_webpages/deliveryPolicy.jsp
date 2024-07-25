<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Delivery Policy</title>
        <link rel="stylesheet" href="../css/deliverypolicy.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Gantari:ital,wght@0,100..900;1,100..900&family=Inika:wght@400;700&family=Inria+Serif:ital,wght@0,300;0,400;0,700;1,300;1,400;1,700&family=Inter:wght@100..900&family=Raleway:ital,wght@0,100..900;1,100..900&family=Syne:wght@400..800&display=swap"
            rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
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
                <div class="delivery-policy">
                    DELIVERY POLICY
                </div>


                <div>
                    <div class="title">
                        <h3>
                            1. DELIVERY DIRECTLY AT THE STORE:
                        </h3> 
                    </div>                              
                    <p class="text">
                        Customers who purchase goods at stores and dealer showrooms will receive delivery at the time of completing order payment. Products are always inspected and verified before receiving and leaving the store.
                    </p>
                </div>

                <div class="two">
                    <div class="title">
                        <h3>
                            2. HOME DELIVERY:
                        </h3>  
                    </div>

                    <p class="text">
                        Products that support home delivery:
                    </p>               
                    <ul class="a">
                        <li>Jewelry products</li>
                        <li>Diamond products</li>                
                    </ul> 
                    <div class="cautious">
                        <h3>
                            Note
                        </h3>
                    </div>

                    <p class="text">
                        The store delivers nationwide for all orders above, delivery time and shipping costs depend on the shipping unit.
                    </p>                    
                </div>

                <div class="three">
                    <div class="title">
                        <h3>
                            3. GOODS INSURANCE SERVICES:
                        </h3>              
                    </div>

                    <h4>
                        100% guaranteed delivery and cargo insurance service
                    </h4>

                    <ul class="b">
                        <li>To protect the interests of customers when purchasing high-value jewelry, all KHAC Diamond Ring Shop products through shipping partners are insured by the store.</li>
                        <li>Always commit to compensating 100% of the value of the goods in case of loss.</li>               
                    </ul>  

                    <h4>
                        Packaging specifications for goods at the store
                    </h4>

                    <ul class="b">
                        <li>All store products have been checked for quality before being packaged and sealed in 2 layers.</li>
                        <li>Layer 1: Your product is placed in the store jewelry box and sealed layer 1 with the Store Seal.</li>               
                        <li>Layer 2: The shipping box will be tightly wrapped, sealed with 02 Store Stamps* in the middle of each box lid and carefully taped.</li>
                    </ul>
                    <div class="cautious">
                        <h3>
                            Note:
                        </h3>
                    </div>

                    <ul class="b">
                        <li>When checking the goods, you should record the video so that any problems that arise can be easily handled.</li>
                        <li>Broken stamp: A special type of stamp used to stick on products to ensure that the goods have not been sealed. Its characteristics are quite brittle. When the stamp is applied to the product, it cannot be peeled off. If you intentionally peel it off, the stamp will crumble.</li>               
                    </ul>  

                </div>

                <div class="four">
                    <div class="title">
                        <h3>
                            4. DELIVERY TIME:
                        </h3>  
                    </div>
                    <ul class="b">
                        <li>Ho Chi Minh City and Hanoi areas: 1-4 days.</li>
                        <li>Other provinces and cities: 2-6 days.</li>
                        <li>Delivery time starts from the time the store consultant contacts to confirm the successful order</li>
                        <li>The above delivery time is for reference only, the actual delivery time may fluctuate sooner or later depending on product inventory status, delivery address and some objective conditions that KHAC Diamond Ring Shop cannot control ( For example: natural disasters, floods, vehicle breakdowns...).</li>               
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
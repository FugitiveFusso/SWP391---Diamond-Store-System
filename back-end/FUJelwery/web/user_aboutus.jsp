
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Us</title>
        <link rel="icon" type="image/x-icon" href="images/Screenshot__656_-removebg-preview.png">
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/navigation_bar.css">
        <link rel="stylesheet" href="css/aboutus.css">

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
                                <li><a href='HistoryController?action=list&id=${sessionScope.usersession.userid}'>History</a></li>
                                <li><a href='./userlogin?action=logout'>Logout</a></li> 
                            </ul>
                        </div>
                    </li>
                </ul>

            </div>
        </div>

        <div class="main"> 
            <div class="content">
                <div class="about-us-title">
                    THE STORY OF KHAC DIAMOND RING SHOP
                </div>


                <div class="story">
                    <div class="story-left">
                        <p class="text">
                            KHAC Diamond Ring Shop was founded in 2024 with the idea that the diamond and engagement ring business was ready 
                            for innovation. We revolutionized the industry with a disruptive online business model, making 
                            it possible to shop for extraordinary, high-quality diamonds at a great value. And we didn't stop there.
                        </p>
                        <p class="text">
                            We also firmly believed that our customers deserved more choices, straightforward information 
                            and legendary service. We felt strongly about building a team of passionate, non-commissioned 
                            diamond and jewelry experts who put the customer first. (We're thrilled to share that a few of 
                            our customers have even invited our experts to their weddings!)
                        </p>
                        <p class="text">
                            As the leader in handcrafted engagement rings and beautiful fine jewelry, we're constantly innovating 
                            and looking for new ways to help you discover and design the perfect pieces for every occasion. We strive 
                            to be your jeweler for life
                        </p>
                    </div> 

                    <div class="story-right">
                        <img src="images/businessman-thumbnail.png">
                    </div>
                </div>

                <br>
                <br>
                <div class="about-us-title">
                    OUR VISION AND MISSION
                </div>

                <div class="vision-mission">       
                    <div class="vision">
                        <hr>
                        <h1>Vision</h1>
                        <p>"To be the cherished beacon of elegance, where every piece of jewelry illuminates moments 
                            of timeless beauty and personal expression."</p>
                    </div>

                    <div class="mission">
                        <hr>
                        <h1>Mission</h1>
                        <p>"We strive to offer an unparalleled shopping experience, where every interaction reflects 
                            our commitment to integrity, passion, and personalized service."</p>
                    </div>
                </div>

                <br>
                <br>
                <div class="about-us-title">
                    CORE VALUE
                </div>

                <div class="core-value">
                    <div class="core-value-top">
                        <div class="honorable">
                            <img src="images/honorable.png">
                            <h3>Honorable</h3>
                            <p>Integrity, Honesty in conduct and in all transactions.</p>
                        </div>

                        <div class="respect">
                            <img src="images/respect.png">
                            <h3>Respect</h3>
                            <p>Respect for Yourself, Respect for Colleagues, Respect for Company, Respect for Partners, Cooperation in Respect.</p>
                        </div>

                        <div class="just">
                            <img src="images/just.png">
                            <h3>Just</h3>
                            <p>Be fair to employees, customers, suppliers, and other stakeholders.</p>
                        </div>
                    </div>

                    <div class="core-value-bottom">
                        <div class="morality">
                            <img src="images/morality.png">
                            <h3>Morality</h3>
                            <p>Respect established standards and act ethically.</p>
                        </div>

                        <div class="compliance">
                            <img src="images/compliance.png">
                            <h3>Compliance</h3>
                            <p>Comply with the law and regulations, policies and regulations of the Company.</p>
                        </div>          
                    </div>
                </div>

                <br>
                <br>
                <div class="about-us-title">
                    KHAC DIAMOND RING SHOP INFORMATION
                </div>

                <div class="general-info">
                    <div class="general-left">
                        <p class="general">General information</p>
                        <ul class="a">
                            <li>Head office address: Slot E2a-7, D1, Đ. D1 Road, Long Thanh My Ward,  Thu Duc City, HCMC</li>
                            <li>Phone: (+84) 898876512</li>
                            <li>Email: fuj.khac.diamondshopsystem@gmail.com</li>
                            <li>Stock code: KHAC</li>
                            <li>Officers and employees: 4 people</li>
                        </ul>
                    </div>

                    <div class="general-right">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d626.6270277940732!2d106.80983795949948!3d10.84121025259094!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752731176b07b1%3A0xb752b24b379bae5e!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBGUFQgVFAuIEhDTQ!5e1!3m2!1svi!2s!4v1716609138794!5m2!1svi!2s"
                                width="400" height="350" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>
                </div>
            </div>

            <div class="footer">
                <div class="footer-content">
                    <div class="footer-content-info">
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
        </div>


    </body>
</html>

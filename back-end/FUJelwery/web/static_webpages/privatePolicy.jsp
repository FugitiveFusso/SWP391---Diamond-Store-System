
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Privacy Policy</title>
        <link rel="stylesheet" href="../css/privatePolicy.css">
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="../css/navigation_bar.css">

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
                <a href="./../user_homepage.jsp"><img src="../images/Screenshot (656).png"></a>
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
                    <img src="../images/Privacy-Policy-Dark-400x267.jpg">
                </div>

                <div class="return-policy">
                    PRIVACY POLICY
                </div>
                <div class="return-policy-intro">
                    <p style="font-family: 'Inter', sans-serif; font-weight: 400;">
                        Thank you for visiting the website operated by FUJ. Protecting customer information is always a top
                        issue for FUJ. Therefore, we respect and commit to keeping private information confidential and only
                        collect necessary information related to purchase transactions. To ensure the security of customer
                        information, FUJ implements the following principles: 
                    </p>
                </div>

                <div class="one">
                    <div class="title">
                        <h3>
                            1. PURPOSE OF USE OF CUSTOMER PERSONAL INFORMATION:
                        </h3>
                    </div>
                    <p class="text">We provide services and manage the use of customers' personal information to manage the customer database and promptly handle arising problems (if any).</p>
                    <p class="text">Collecting information is aimed at building a system that brings the most benefits to customers. Therefore, the information will be used for the following activities:</p>
                    <p class="text1">(All of the above cases must be addressed within 7 days of receiving the goods; after
                        this period, FUJ will not facilitate the exchange).
                    </p>
                    <ul class="a">
                        <li>Providing services and notifying information exchange activities between customers and FUJ.</li>
                        <li>Prevent acts of sabotage, account appropriation or fraud.</li>
                        <li>Contact to resolve customer complaints.</li>          
                        <li>Verify and exchange information about customer transactions at FUJ.</li>
                        <li>Meet the requirements of competent state management agencies when necessary.</li>
                    </ul>
                </div>

                <div>
                    <div class="title">
                        <h3>
                            2. COMMITTED TO SECURITY OF CUSTOMER INFORMATION:
                        </h3>
                    </div>

                    <p class="text">
                        Customers' personal information on the website is committed to absolute confidentiality by the management board according to the published information security policy. Collection and use of personal information only takes place with the customer's consent, unless otherwise prescribed by law.
                    <p class="text">
                        Customers' personal information will not be used, transferred, provided or disclosed to third parties without the customer's consent, except in cases prescribed by law.
                    </p>
                    <p class="text">
                        Customers' personal information will not be used, transferred, provided or disclosed to third parties without the customer's consent, except in cases prescribed by law.
                    </p>
                    <p class="text">
                        All customer online transaction information, including accounting invoice information and digital documents, are absolutely confidential in FUJ's high-level secure central data area.
                    </p>
                </div>

                <div>
                    <div class="title">
                        <h3>
                            3. ADDRESS OF THE INFORMATION COLLECTION AND MANAGEMENT UNIT:
                        </h3>
                        <h3>
                            FUJ Jewelry Store
                        </h3>
                    </div>


                    <p class="text">
                        Address: FPT University, District 9, Ho Chi Minh City
                    <p class="text">
                        Customer service staff: (+84) 898876512
                    </p>
                    <p class="text">
                        Email: fuj.khac.diamondshopsystem@gmail.com
                    </p>               
                </div>

                <div>
                    <div class="title">
                        <h3>
                            4. MEANS AND TOOLS FOR USERS TO ACCESS AND EDIT THEIR PERSONAL INFORMATION:
                        </h3>                  
                    </div>

                    <p class="text">
                        At any time, you can access and edit your personal information using the links provided on the websites we provide; Alternatively, you can contact us to stay informed of any changes.                
                    </p>               
                </div>

                <div>
                    <div class="title">
                        <h3>
                            5. MECHANISM FOR RECEIVING AND RESOLVING COMPLAINTS RELATED TO CUSTOMER INFORMATION:
                        </h3>
                    </div>

                    <p class="text">
                        Customers can submit feedback and provide relevant evidence to the administration if they discover that their personal information has been used for the wrong purpose or scope. Management undertakes to provide a response immediately or within 24 working hours of receiving the complaint.
                    </p>
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

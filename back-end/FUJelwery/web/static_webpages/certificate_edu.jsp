
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Diamond Certificate</title>
        <link rel="stylesheet" href="../css/certificate.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Gantari:ital,wght@0,100..900;1,100..900&family=Inika:wght@400;700&family=Inria+Serif:ital,wght@0,300;0,400;0,700;1,300;1,400;1,700&family=Inter:wght@100..900&family=Raleway:ital,wght@0,100..900;1,100..900&family=Syne:wght@400..800&display=swap"
            rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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

        <div class="main-container">
            <div class="Main-hero">
                <div class="hero-details">
                    <h1 style="font-family: Inika;">DIAMOND CERTIFICATE</h1>
                    <h4>Every loose diamond that we sell is graded by the Gemological Institute of America (GIA), regarded as
                        the world's foremost authority on diamonds.</h4>
                    <div class="button">
                        <button id="button1"> <a href="certificate_edu.jsp" id="learn-more">Learn More</a></button>
                    </div>
                </div>
                <img src="../images/diamond_certificate_1.jpg" alt="" srcset="">
            </div>
        </div>


        <div class="container">

            <div class="side_nav">
                <h3 class="dropdown-btn">Diamond Education <i class="fa-solid fa-angle-down"></i></h3>
                <div class="dropdown-content">
                    <div class="list">
                        <a href="certificate_cut.jsp">Cut</a>
                        <a href="certificate_color.jsp">Color</a>
                        <a href="certificate_clarity.jsp">Clarity</a>
                        <a href="certificate_carat.jsp">Carat</a>
                    </div>

                </div>
                <h3 id="Cert_link"><a href="certificate_certification.jsp">Certification</a></h3>
            </div>


            <div class="certi-detail">
                <div class="heading1">
                    <h1>GIA Grading Report</h1>
                    <hr class="heading_hr">
                </div>

                <div class="content">
                    <p class="">A Diamond Grading Report documents the specific characteristics of a diamond. These reports are
                        issued by the Gemological Institute of America (GIA), which is among the most respected organizations in the
                        diamond industry. </p>
                    <div class="content-title">GIA Diamond Grading Report</div>
                    <p>The GIA set the standard for diamond grading and gemological identification, and their diamond grading system
                        serves as the international gem and jewelry industry's benchmark credentials.</p>
                    <div class="content-title">Diamond Characteristics Documented In The GIA Diamond Grading Report </div>
                    <div class="small-detail"> <b>Shape and Cutting Style: </b> The diamond shape and cutting style.</div>
                    <div class="small-detail"><b>Measurement: </b> Lists the diamond's dimensions in millimeters. </div>
                    <div class="small-detail"><b>Color Grade: </b> The weight of a diamond listed to the nearest hundredth of a
                        carat. </div>
                    <div class="small-detail"><b>Clarity Grade: </b> Clarity grade determined under 10x magnification. </div>
                    <div class="small-detail"><b>Cut Grade: </b> A grade of cut as determined by a diamond's face-up appearance,
                        design and craftsmanship. A cut grade is available on round diamonds graded after Jan. 1, 2006. </div>
                    <div class="small-detail"><b>Finish: </b> Grades that represent a diamond's surface and facet placement. </div>
                    <div class="small-detail"><b>Polish: </b> Rating the overall smoothness of the diamond's surface. </div>
                    <div class="small-detail"><b>Symmetry: </b> Measuring the shape, alignment and placement of the diamond's facets
                        in relation to one another as well as the evenness of the outline. </div>
                    <div class="small-detail"><b>Fluorescence: </b> Color, and strength of color when diamond is viewed under UV
                        light. </div>
                    <div class="small-detail"><b>Clarity Plot : </b> A map of the approximate size, type, and position of inclusions
                        as viewed under a microscope. </div>
                    <div class="small-detail"><b>Proportion Diagram </b> A map of the diamond's actual proportions. </div>
                    <div class="content-title">Reading A Proportion Diagram</div>
                    <p>Proportion diagrams will typically include the following information: </p>
                    <div class="small-detail"> <b>Depth: </b> The height of a gemstone measured from the culet to the table. </div>
                    <div class="small-detail"><b>Table: </b> Located at the top of the diamond, the table is the largest facet of a
                        diamond. </div>
                    <div class="small-detail"><b>Girdle: </b> Located at the top of the diamond, the table is the largest facet of a
                        diamond. </div>
                    <div class="small-detail"><b>Culet: </b> Appearance, or lack thereof, of the culet facet. </div>

                    <div class="content-title">Reading A Proportion Diagram</div>
                    <p>Learn about our appraisals and other grading reports that accompany diamonds and fine jewelry from us. </p>
                    <div class="list-learnMore">
                        <a href="http://">
                            <li>GIA Grading Diamond Report</li>
                        </a>
                        <a href="http://">
                            <li>GIA Diamond Dossier®</li>
                        </a>
                    </div>

                </div>
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

        <script src="../js/certificate.js"></script>
    </body>
</html>

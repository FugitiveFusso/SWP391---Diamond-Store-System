

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Diamond Carat</title>
        <link rel="stylesheet" href="../css/certificate.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Gantari:ital,wght@0,100..900;1,100..900&family=Inika:wght@400;700&family=Inria+Serif:ital,wght@0,300;0,400;0,700;1,300;1,400;1,700&family=Inter:wght@100..900&family=Raleway:ital,wght@0,100..900;1,100..900&family=Syne:wght@400..800&display=swap"
            rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
              integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
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
                    <h4>Every loose diamond that we sell is graded by the Gemological Institute of America (GIA),
                        regarded as the world's foremost authority on diamonds.</h4>
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
                    <h1>Diamond Carat</h1>
                    <hr class="heading_hr">
                </div>

                <div class="content">
                    <div class="content-title">What Is A Diamond Carat?</div>
                    <p>The term carat is often misunderstood. It refers to a diamond's weight, not its size.
                        Another misperception is that a larger carat weight is always better than a smaller carat weight.
                        While it’s true that a big rock can be a status symbol (here’s looking at you, Hollywood),
                        carat weight is not related to sparkle. Beautiful sparkle is the result of a well-crafted cut.
                        In fact, a high carat weight diamond with a poor cut may look smaller than a diamond with a
                        smaller carat weight and a very good cut. </p>


                    <div class="content-title">Diamond Carat Price</div>
                    <p>Diamonds with higher carat weights are cut from larger rough crystals that are harder to
                        source than small crystals. So, the relationship between carat weight and price depends on
                        the rarity or availability of a rough crystal. Carat price is also a function of finding rough
                        crystals with desirable color, and internal and external characteristics that will positively
                        influence clarity when the diamond is cut. To learn more about all of the factors to consider
                        when choosing the best diamond carat weight for you, read these tips from our diamond experts. </p>


                    <div class="content-title">The Brief History Of Diamond Carat</div>
                    <p>The term carat comes from the ancient method of weighing precious metal and stones against
                        the seeds of the carob tree—which were considered to be even in weight. It wasn’t until 1907,
                        at the Fourth General Conference on Weights and Measures, when it was agreed upon that one
                        diamond carat would be equal to 200 mg, or .2 grams, of a diamond. Carats can also be measured
                        in points; 100 points equals a full carat.</p>

                    <div class="content-title">4 Things To Know About Carat</div>

                    <div class="small-detail">1. <b>“Buy shy” to save money. </b> Select a carat weight
                        slightly below the whole and half-carat marks. For example, instead of a 2.00 carat
                        diamond, consider buying a 1.90 carat weight. This will save a considerable amount
                        of money, and the slight difference will never be noticed. </div>

                    <div class="small-detail">2. <b>Splurge on cut. </b> This is the most important factor
                        because it maximizes sparkle. Even a high-carat diamond with excellent color and clarity
                        can appear lifeless and dull if the cut is poor.</div>

                    <div class="small-detail">3. <b>Fancy shapes cost less per carat. </b> The most important
                        thing to realize about fancy-shaped diamonds is that they are generally less expensive
                        than an equivalent round diamond. Additionally, fancy shapes can appear larger than
                        their actual diamond carat weight size, especially when placed in a halo setting. </div>

                    <div class="small-detail">4. <b>Keep ring size in mind.</b> The smaller the finger,
                        the larger the diamond will appear. A 1.50 carat diamond solitaire looks larger
                        on a size 6 finger than a size 8.</div>


                    <div class="content-title">Carat Has The Biggest Effect On Price</div>
                    <div class="small-detail">1. <b>Certain settings can make a diamond appear larger</b> A
                        very popular setting to achieve this effect is the halo. This setting has a ring of
                        small diamonds around the center stone. The ratio of the small to large diamonds skews
                        the perspective in your favor, making the center diamond seem larger. </div>

                    <div class="small-detail">2. <b>Band size affects the look of a diamond’s carat.</b>
                        Selecting a thin band creates a perspective that makes the center stone appear larger.
                        A popular band to achieve this is the pavé, which features small diamonds embedded in the band.
                    </div>

                    <div class="small-detail">3. <b>Carat Total Weight (CTTW).</b> Total carat weight is the
                        measurement of all the diamonds in any given piece combined. So, be sure to inquire
                        about the weights of the individual diamonds in any piece that you are buying. </div>

                    <div class="content-title">HAVE A QUESTION?</div>
                    <p>Contact us by phone at <strong>(+ 84) 898876512</strong> or email at <strong>fuj.khac.diamondshopsystem@gmail.com</strong> </p>
                    <p>In addition, Live Chat is available during most business hours. </p>
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

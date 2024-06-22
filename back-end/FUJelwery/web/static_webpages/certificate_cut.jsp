
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Diamond Cut</title>
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

    </head>

    <body>
      <div class="header">
            <div class="header-top">
                <div class="top-info-left">
                    <ul>
                        <li>Timeless elegance and craftsmanship</li>
                        <li>at FUJ Jewelry Online Shop.</li>                         
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
                                <li><a href='../UserCollectionController'>Collection</a></li>                                
                            </ul>
                        </div>   
                    </li>
                    <li class="navbar-link"><a href='../UserDiamondPriceController' class="line">Diamond Price</a></li>
                    <li class="navbar-link"><a href='../UserVoucherController' class="line">Voucher</a></li>
                    <li class="navbar-link"><a href="#" class="line">Order</a></li>
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
                        <a href="#" class="line">Account</a>
                        <div class="sub-menu-1">
                            <ul>
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
                    <h3>Every loose diamond that we sell is graded by the Gemological Institute of <br>America (GIA),
                        regarded as the world's foremost authority on diamonds.</h3>
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
                    <h1>Diamond Cut </h1>
                    <hr>
                </div>

                <div class="content">
                    <div class="content-title">What Is The Cut Of A Diamond? </div>
                    <p>Have you ever noticed how many surfaces a diamond has? A diamond’s cut refers to how
                        well-proportioned the dimensions of a diamond are, and how these surfaces, or facets, are positioned
                        to create sparkle and brilliance. For example, what is the ratio of the diamond’s diameter in
                        comparison to its depth? These small, yet essential, factors determine the diamond’s beauty and
                        price. </p>
                    <div class="content-title">Are You Wondering Which Diamond Cut Is Best? It All Starts With Your Budget
                    </div>
                    <p>No single diamond is perfect for everyone—but all of our customers, whether they’re eyeing a
                        .50-carat or a 16-carat diamond, want as much sparkle as their budget allows. Of the the 4Cs (cut,
                        color, clarity, carat), cut has the greatest influence on a diamond’s beauty and sparkle. Even a
                        diamond with a flawless clarity grade (no blemishes or inclusions) can look glassy or dull if the
                        cut is too shallow or deep. So, when determining what diamond to buy, go with the best cut grade
                        that you can afford. </p>
                    <img src="../images/DiamondCuts_IdealCut.webp" alt="">
                    <div class="content-title">We Offer Four Different Cut Grades</div>
                    <div class="small-detail"> <b>Ideal: </b> This rare cut represents roughly the top 3% of diamond cut
                        quality. It reflects most of the light that enters the diamond. </div>
                    <div class="small-detail"><b>Very Good: </b> This cut represents roughly the top 15% of diamond cut
                        quality. It reflects nearly as much light as the ideal cut, but for a lower price.</div>
                    <div class="small-detail"><b>Good: </b> This cut represents roughly the top 25% of diamond cut quality.
                        It reflects most of the light that enters, but not as much as a Very Good cut grade. </div>
                    <div class="content-title">The "Ideal" Cut Grade At FUJ Is The Same As The "Excellent" Cut Grade
                        Rating By The GIA</div>
                    <p>"We" uses the term Ideal while the GIA uses the term Excellent for the highest cut grade in round
                        brilliant diamonds. These two words are interchangeable to represent the cutting style, proportions,
                        and finish necessary to bring out a diamond’s sparkle, brilliance, and beauty.

                        While the diamond industry has long-standing proportion combinations that optimize light
                        performance, only round brilliant cut diamonds have cut parameters established by the GIA.
                        <br><br>'We' estimates and assigns cut grade standards for non-round (fancy shaped) diamonds based
                        on their table and depth percentages.
                    </p>
                    <div class="content-title">The Characteristics Of A Well-Cut Diamond Are Superior Brilliance, Fire, And
                        Scintillation</div>
                    <div class="small-detail"> <b>Brilliance : </b> relates to the reflection of white light </div>
                    <div class="small-detail"><b>Fire : </b> is the dispersion of light into the colors of the rainbow
                    </div>
                    <div class="small-detail"><b>Scintillation : </b> is the play of contrast between dark and light
                        areas—it’s the sparkle </div>

                    <div class="content-title">The Anatomy Of A Diamond:</div>
                    <div class="small-detail"> <b>Table : </b> The largest facet of a gemstone </div>
                    <div class="small-detail"><b>Crown : </b> The top portion of a diamond extending from the girdle to the
                        table </div>
                    <div class="small-detail"><b>Girdle : </b> The intersection of the crown and pavilion which defines the
                        circumference of a diamond </div>
                    <div class="small-detail"> <b>Diameter : </b> The measurement from one girdle edge of a diamond straight
                        across to the opposing side </div>
                    <div class="small-detail"><b>Pavilion : </b> The bottom portion of a diamond, extending from the girdle
                        to the culet </div>
                    <div class="small-detail"><b>Culet : </b> The facet at the tip of a gemstone. The preferred culet is not
                        visible with the unaided eye (graded "none" or "small") </div>
                    <div class="small-detail"><b>Depth : </b> The height of a gemstone measured from the culet to the table
                    </div>
                    <img src="../images/The_Anatomy_Of_A_Diamond.webp" alt="" srcset="">

                    <div class="content-title">The "Ideal" Cut Grade At FUJ Is The Same As The "Excellent" Cut Grade
                        Rating By The GIA</div>
                    <p>Although these terms are sometimes used interchangeably, diamond cut, and diamond shape mean
                        different things. </p>
                    <p><b>Diamond cut</b> assesses light performance of a diamond and is based on a combination of factors:
                        proportions, symmetry, and polish (the overall surface condition of a diamond’s facets). </p>
                    <p><b>Diamond shape</b> is related to the outline of a diamond. While the round brilliant diamond is our
                        most popular shape, we also offer nine non-round fancy-shaped diamonds that can save you up to 25.
                    </p>
                    <div class="content-title">HAVE A QUESTION?</div>
                    <p>Contact us by phone at (+ 84) 898876512 or email at CuongNPSE183844@fpt.edu.vn </p>
                    <p>In addition, Live Chat is available during most business hours. </p>
                    <div class="Next"><a href="../static_webpages/certificate_color.jsp">NEXT: Diamond Color ></a></div>
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
                        </p> F

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
    >
</html>

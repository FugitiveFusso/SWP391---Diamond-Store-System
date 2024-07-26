
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Diamond Clarity</title>
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
        <link rel="stylesheet" href="../css/popup_fake.css">
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
                <a href="./../guest_homepage.jsp"><img src="../images/Screenshot (656).png"></a>
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
                                <li><a href='../GuestProductController'>Ring</a></li>
                                <li><a href='../GuestCategoryController'>Category</a></li>    
                                <li><a href='../GuestCollectionController'>Collection</a></li>                                 
                            </ul>
                        </div>   
                    </li>
                    <li class="navbar-link"><a href='../GuestDiamondPriceController' class="line">Diamond Price</a></li>
                    <li class="navbar-link"><a href='../GuestVoucherController' class="line">Voucher</a></li>
                    <li class="navbar-link"><a href="#" class="line">Order Monitor</a>                       
                        <div class="sub-menu-1">
                            <ul>
                                <li><a href='#' class="trigger-popup">Cart</a></li>
                                <li><a href='#' class="trigger-popup">Tracking Orders</a></li>
                                <li><a href='#' class="trigger-popup">Transactions</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="navbar-link">
                        <a href="certificate_edu.jsp" class="line">Education</a>
                        <div class="sub-menu-1">
                            <ul>
                                <li><a href='../GuestPostController'>Blog</a></li>
                                <li><a href='ringmeasuring.jsp'>Ring Measuring Guide</a></li>          
                                <li><a href='faqs.jsp'>Frequently Asking Questions</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="navbar-link"><a href="../guest_aboutus.jsp" class="line">About Us</a></li>                    
                    <li class="navbar-link">
                        <a href="#" class="line">Account</a>
                        <div class="sub-menu-1">
                            <ul>
                                <li><a href='../userlogin.jsp'>Sign in</a></li>
                                <li><a href='../register.jsp'>Sign up</a></li> 
                            </ul>
                        </div>
                    </li>
                </ul>

            </div>
        </div>
        
        <div id="popup" class="popup">
            <div class="popup-content">
                <h2>Please register or sign in to continue.</h2>
                <p>Don't worry, it's painless. A click of the mouse, a few key taps, and you'll enjoy free, unlimited access to our website, plus other exclusive benefits.</p>
                <div class="popup-buttons">
                    <a href="register.jsp" class="popup-button">To continue,<br>CREATE A FREE ACCOUNT →</a>
                    <a href="userlogin.jsp" class="popup-button">Already registered?<br>LOG IN →</a>
                </div>
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
                    <h1>Diamond Clarity Chart</h1>
                    <hr class="heading_hr">
                </div>

                <div class="content">
                    <div class="content-title">What Is Diamond Clarity?</div>
                    <p>Diamond clarity is the assessment of small imperfections on the surface and within the stone. Surface
                        flaws
                        are called blemishes, while internal defects are known as inclusions. In most cases, a diamond’s
                        beauty is
                        not affected by these in any way since most inclusions can’t be seen with the naked eye. When
                        referring to
                        inclusions, gemologists often use the term “internal characteristics” instead of flaws. Internal
                        characteristics are what give a natural diamond its character. It’s also important to note that
                        diamonds
                        with the fewest and smallest inclusions receive the highest clarity grades—and higher price tags to
                        reflect that.</p>
                    <p>Remember, all diamonds are unique, not perfect. They are made underground through enormous pressure
                        and heat.
                        Natural inclusions and blemishes are inevitable. </p>

                    <div class="content-title">Quick Clarity Tips</div>
                    <p>There are many misconceptions around the clarity of diamonds, including the belief that you need to
                        buy a
                        high clarity grade to avoid seeing imperfections. Another common falsehood is that a higher clarity
                        grade
                        results in more sparkle. Neither of these is true! Here are some tips to get you started on your
                        diamond search: </p>
                    <div class="info-list">
                        <li>The term “eye clean” means that the diamond’s inclusions are too small to see without
                            magnification. </li>
                        <li>A good place to start your search and maximize your budget is with Slightly Included (SI) and
                            Very Slightly Included (VS) grades because inclusions will not be readily noticeable
                            without magnification. </li>
                        <li>Diamond shape and size affect clarity. While clarity is less important than a diamond’s cut or
                            color,
                            if you are buying a diamond over one carat or considering certain fancy-shaped diamonds
                            (like an emerald or Asscher cut where flaws are more visible), you may want to spend more for
                            a higher clarity grade.</li>
                        <li> Diamond clarity is an important characteristic that affects a diamond’s beauty. Like all of the
                            4Cs,
                            diamond clarity is an important consideration when buying a diamond. While clarity affects
                            price,
                            there are a number of factors that can help you decide which clarity grade is right for you.
                        </li>
                    </div>

                    <div class="content-title">Diamond Clarity Spans 6 Categories With A Total Of 11 Clarity Grades</div>
                    <p>In 1953, Richard T. Liddicoat and colleagues established the Gemological Institute of America (GIA)
                        diamond grading
                        system and clarity scale. The GIA diamond grading scale is divided into 6 categories and 11 diamond
                        clarity grades. </p>

                    <div class="small-detail"> <b>I1, I2, I3 Included Diamonds </b>
                        <br>
                        <li>I clarity diamonds have obvious inclusions that are likely to be visible and impact beauty </li>
                        <li>KHAC Diamond Ring Shop does not sell I clarity grade loose diamonds for engagement ring designs </li>
                        <li>KHAC Diamond Ring Shop does offer a limited selection of jewelry preset with I1 diamonds </li>
                    </div>

                    <div class="small-detail"> <b>SI1, SI2 Slightly Included (SI) Diamonds </b>
                        <br>
                        <li> Inclusions are noticeable at 10x magnification </li>
                        <li>If eye clean, SI diamonds are often the best value </li>
                        <li> SI2 inclusions may be detectable to a keen unaided eye, especially when viewed from the side
                        </li>
                    </div>

                    <div class="small-detail"> <b>VS1, VS2 Very Slightly Included (VS) Diamonds </b>
                        <br>
                        <li>Minor inclusions ranging from difficult (VS1) to somewhat easy (VS2) to see at 10x magnification
                        </li>
                        <li>Great value; KHAC’s most popular diamond clarity </li>
                    </div>

                    <div class="small-detail"> <b>VVS1, VVS2 Very, Very Slightly Included (VVS) Diamonds </b>
                        <br>
                        <li>VVS diamonds have minuscule inclusions that are difficult even for trained eyes to see under 10x
                            magnification </li>
                        <li>VVS clarity is rare and results in an eye clean appearance</li>
                        <li>Characteristics are minuscule and difficult to see under 10x magnification, even to a trained
                            eye</li>
                    </div>

                    <div class="small-detail"> <b>Internally Flawless (IF) Diamonds </b>
                        <br>
                        <li>Some small surface blemishes may be visible under a microscope on IF diamonds </li>
                        <li>IF diamonds have no inclusions within the stone, only surface characteristics set the grade
                        </li>
                        <li>Visually eye clean </li>
                    </div>

                    <div class="small-detail"> <b>Flawless (FL) Diamonds </b>
                        <br>
                        <li>No internal or external characteristics </li>
                        <li>Less than 1% of all diamonds are FL clarity </li>
                        <li>A flawless diamond is incredibly rare because it’s nearly impossible to find a diamond 100% free
                            of inclusions </li>
                    </div>



                    <div class="content-title">The Five Diamond Clarity Factors</div>
                    <div class="small-detail"><b>Size: </b> The larger or more noticeable a characteristic,
                        the lower the likely clarity grade. </div>
                    <div class="small-detail"><b>Number: </b> This is the number of easily seen characteristics.
                        Having fewer characteristics means a higher clarity grade. </div>
                    <div class="small-detail"><b>Position: </b> What is the position of any given characteristic?
                        The location of a characteristic within the diamond anatomy will impact the rating.
                        Is it under the table (most visible) and close to a pavilion? This position turns
                        inclusions into reflectors, which have a bigger impact on the clarity grade.</div>
                    <div class="small-detail"><b>Nature: </b> The nature of a diamond characteristic relates to
                        the type of inclusion and its impact on durability. </div>
                    <div class="small-detail"><b>Color and relief: </b> Color and relief are essentially a measure
                        of how easily a characteristic is seen, or how much contrast there is between the characteristic
                        and surrounding diamond. </div>


                    <div class="content-title">Why SI Diamonds And VS Diamonds Are The Best Value</div>
                    <p>While the extremely rare Flawless (FL) or Internally Flawless (IF) diamonds are the highest
                        quality diamond clarity, you may want to consider a diamond that won’t break the bank.
                        For the best value, select a diamond with inclusions that can’t be seen through the crown
                        without magnification (also known as eye clean diamonds), like a diamond with an SI or VS
                        clarity grade. These diamonds are much less expensive and look the same as the higher grades,
                        visually.</p>

                    <div class="content-title">The Diamond Clarity Plot</div>
                    <p>Diamonds over one carat in size receive a diamond clarity plot alongside their GIA grading report.
                        The diamond clarity plot is a map of a stone’s inclusions, blemishes and characteristics.
                        It will include the factors that impacted the stone’s grading and may show other characteristics
                        as well. The diamond clarity plot accompanies the GIA certification.</p>

                    <div class="content-title">Popular Diamond Clarity Grades</div>
                    <p>With price points and sparkling stones all along the diamond grading scale,
                        there are many types of diamond grades to choose from. Different shapes and cuts
                        will hide many characteristics. Choosing diamond clarity of SI1 or SI2 is a great
                        starting point for finding beautiful diamonds with minimal inclusions.
                        Our VS (Very Slightly Included) and SI (Slightly Included) diamonds are our most popular choices.
                        These diamond clarity grades can have some inclusions, but many of the inclusions are not easily
                        seen with the unaided eye. Many diamond characteristics can also be hidden by the diamond cut or
                        shape. </p>

                    <div class="content-title">Shop KHAC's Diamonds By Clarity Grade</div>
                    <p>At KHAC, we offer the highest quality diamonds and deliver the best value for your budget.
                        If you're shopping for a diamond ring or other diamond jewelry, we offer the following
                        diamond clarity grades: </p>
                    <div class="small-detail"> <b>Flawless Diamonds </b>
                        <br>
                        <li>FL & IF Diamonds (Rare Finds) </li>
                    </div>
                    <div class="small-detail"> <b>Slightly Included Diamonds</b>
                        <br>
                        <li>VVS Diamonds (Excellent Quality) </li>
                        <li>VS & SI Diamonds (Best Value & Most Popular)</li>
                    </div>


                    <div class="content-title">HAVE A QUESTION?</div>
                    <p>Contact us by phone at <strong>(+ 84) 898876512</strong> or email at <strong>fuj.khac.diamondshopsystem@gmail.com</strong> </p>
                    <p>In addition, Live Chat is available during most business hours. </p>
                    <div class="Next"><a href="certificate_carat.jsp">NEXT: Carat ></a></div>
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
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var popup = document.getElementById('popup');
                var triggers = document.querySelectorAll('.trigger-popup');

                triggers.forEach(function (trigger) {
                    trigger.addEventListener('click', function (event) {
                        event.preventDefault();  // Prevent the default link behavior
                        popup.style.display = 'flex';
                        document.body.classList.add('no-scroll');
                    });
                });

                // Close the pop-up when clicking outside of it
                window.addEventListener('click', function (event) {
                    if (event.target == popup) {
                        popup.style.display = 'none';
                        document.body.classList.remove('no-scroll');
                    }
                });
            });
        </script>
    </body>
</html>

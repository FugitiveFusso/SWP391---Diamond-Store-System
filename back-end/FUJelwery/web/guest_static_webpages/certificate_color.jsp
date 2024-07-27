
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Diamond Color</title>
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
                    <h1>Diamond Color</h1>
                    <hr class="heading_hr">
                </div>

                <div class="content">
                    <div class="content-title">What Is Diamond Color?</div>
                    <p>One of the 4Cs, diamond color is a measurable grade given to an individual diamond to quantify how
                        colorless
                        it is along a standardized diamond color chart. The higher-rated diamonds will be as close to
                        colorless as
                        possible, while lower-rated diamonds will often have an increasingly noticeable coloration tint as
                        the ratings
                        move along the color diamond scale chart. A colorless diamond is a clear gemstone while diamonds
                        further down
                        the diamond rating chart can have a warm hue to them. </p>
                    <p>It is very rare to find a diamond that doesn't give any color at all, many gem-size diamonds will
                        have slight hues
                        or coloration due to natural processes during the gemstone’s formation. In fact, diamonds are found
                        in almost any
                        naturally occurring color, including gray, white, yellow, green, brown and pink. As more diamond
                        deposits have been
                        discovered, certain colorful stones have gained popularity. These fancy colored diamonds, such as
                        canary diamonds,
                        are prized for their unique colors. </p>

                    <div class="content-title">Additional Info About Diamond Color</div>
                    <div class="info-list">
                        <li>Part of diamond valuation is determined by the absence of color, with more colorless
                            diamonds receiving higher grades along the diamond color and clarity scale.</li>
                        <li>Only certified grading professionals should determine a diamond’s color grade. </li>
                        <li>The tone of a ring’s setting can affect the appearance of diamond color.</li>
                    </div>

                    <div class="content-title">Diamond Color Is An Important Characteristic That Affects A Diamond’s Beauty
                    </div>
                    <p>Like all of the 4Cs, diamond color is an important consideration when buying a diamond. While color
                        affects price, there are a number of factors that can help you decide which color grade is right for
                        you.</p>

                    <div class="content-title">The GIA White Diamonds Color-Grade Scale Is The Industry Standard</div>
                    <p>The Gemological Institute of America (GIA) color scale is the industry standard for diamond grading.
                        The GIA diamond color grades range from D (colorless) to Z (light yellow or brown). Many people ask
                        why the GIA diamond grading scale starts at D. Arcane systems used grades of A-C, 1-3, and I-III,
                        etc.
                        The GIA set out to standardize these diverse systems and started their diamond color scale fresh
                        with
                        a grade of D. This is the most used, standardized measurement for diamond color.</p>

                    <div class="color-image">
                        <img src="../images/D_Color_Diamonds_.jpeg">
                    </div>

                    <div class="content-title">KHAC Diamond Ring Shop Does Not Sell L-Z Color Grade Diamonds</div>
                    <p>Diamonds in the L-Z range have a noticeably warm yellow hue which do not meet the quality and value
                        standards at KHAC Diamond Ring Shop. We do, however, sell fancy colored diamonds that are graded on a different
                        scale and are highly prized.</p>

                    <div class="content-title">Which Diamond Color Is Best?</div>
                    <p>The best diamond color is the one that fits your budget. The absence of color in a diamond is the
                        rarest
                        and therefore, the most expensive. While the majority of our customers choose a D or E color grade,
                        many
                        go with a beautiful near colorless grade to make the most of their budget and allocate more on the
                        best
                        cut that they can afford (which gives them more sparkle).</p>

                    <div class="content-title">Color Is More Visible In Large Diamonds </div>
                    <p>If you’re buying a diamond under 1 carat, you might consider choosing an I, J, or K color diamond.
                        Going over 1 carat? We recommend H color-grade diamonds or higher. This is because the larger a
                        diamond is, the more likely it is to show any color.</p>

                    <div class="content-title">Setting Also Impacts Color Appearance In A Diamond</div>
                    <p>It’s also smart to consider the color of precious metal for your setting that best complements the
                        color grade of your diamond. For example, yellow gold casts a warm glow and looks best with diamonds
                        with faint color. Platinum or white gold will make a near-colorless diamond look icier.It’s also
                        smart
                        to consider the color of precious metal for your setting that best complements the color grade of
                        your
                        diamond. For example, yellow gold casts a warm glow and looks best with diamonds with faint color.
                        Platinum or white gold will make a near-colorless diamond look icier.</p>

                    <div class="content-title">Shape Can Influence Diamond Color</div>
                    <p>Certain fancy-shaped diamonds hide color better than others—and can cost up to 25% less than a
                        round-cut diamond. Cushion, princess and radiant cut diamonds are known for masking color well
                        with their multifaceted sparkle. </p>

                    <div class="content-title">The Difference Between White Diamonds And Fancy Colored Diamonds</div>
                    <p>When is color a good thing? As mentioned before, diamonds occur in the natural rainbow spectrum of
                        colors—red, orange, yellow, green, blue, pink, purple, and more. These are known as colored
                        diamonds.
                        Only 1 in every 10,000 diamonds possess natural color, and the more intense the color, the rarer and
                        more valuable the diamond. Fancy-colored diamonds are graded on a separate color scale and can be
                        even
                        more valuable than white diamonds. </p>

                    <div class="small-detail"> <b>Diamond Color Scale FAQs</b></div>
                    <div class="small-detail"> <b>What is the diamond color scale?</b>
                        <br>The diamond color scale is a quality chart used to quantify how colorless a diamond is.
                        The GIA diamond color scale is the industry standard. You can learn more about color differences
                        along the scale in our diamond quality chart.
                    </div>

                    <div class="small-detail"> <b>What is the best color letter for a diamond?</b>
                        <br>The most valuable and rarest color grade is a D color diamond, which is fully colorless.
                        Diamonds graded D-F are the most colorless options available. That being said, the best color
                        is one that matches your budget. More tinted diamonds, such as an I color diamond, can still bring
                        incredible sparkle and the right setting will complement the diamond’s hues.
                    </div>

                    <div class="small-detail"> <b>What causes color in diamonds?</b>
                        <br>During the diamond formation process, trace elements of other chemicals such as nitrogen or
                        boron
                        can cause coloration to occur.
                    </div>

                    <div class="small-detail"> <b>Is a G or an I color diamond better?</b>
                        <br>In terms of positioning along the diamond color scale, G color diamonds are more valuable than I
                        color diamonds. But both are highly prized diamonds that make great center stones for engagement
                        rings
                        and other jewelry.
                    </div>

                    <div class="small-detail"> <b>Is an H color diamond good?</b>
                        <br>The most valuable and rarest color grade is a D color diamond, which is fully colorless.
                        Diamonds graded D-F are the most colorless options available. That being said, the best color
                        is one that matches your budget. More tinted diamonds, such as an I color diamond, can still bring
                        incredible sparkle and the right setting will complement the diamond’s hues.
                    </div>

                    <div class="small-detail"> <b>Will the setting impact a diamond's color appearance?</b>
                        <br>The metal you choose for a diamond setting can complement or downplay its colors. For example,
                        warmer diamonds in the I-K range look best in yellow gold engagement ring settings. More colorless
                        diamonds are best enhanced by platinum or white gold engagement ring settings.
                    </div>

                    <div class="small-detail"> <b>Do the other Cs impact color?</b>
                        <br>While color is an important factor in selecting a stone, diamond cut is the most important
                        element
                        to consider. A well-cut diamond can maximize sparkle while downplaying any coloration.
                    </div>


                    <div class="content-title">HAVE A QUESTION?</div>
                    <p>Contact us by phone at <strong>(+ 84) 898876512</strong> or email at <strong>fuj.khac.diamondshopsystem@gmail.com</strong> </p>
                    <p>In addition, Live Chat is available during most business hours. </p>
                    <div class="Next"><a href="certificate_clarity.jsp">NEXT: Diamond Clarity ></a></div>
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

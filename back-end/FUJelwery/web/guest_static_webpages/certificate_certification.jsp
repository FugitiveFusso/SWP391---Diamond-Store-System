
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Diamond Certification</title>
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
                        <li style="margin-left: 30px">at FUJ Jewelry Online Shop.</li>                             
                    </ul>
                </div>
                <a href="./../guest_homepage.jsp"><img src="../images/Screenshot (656).png"></a>
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
                    <h1>What is Diamond Certification?</h1>
                    <hr>
                </div>

                <div class="content">
                    <p>Diamond certification is a process in which trusted experts use a standardized grading system to
                        quantify key qualities of a diamond. This helps diamond shoppers understand how a specific diamond
                        will look, making it easier to purchase the right gemstone without worry.

                        <br><br> Independent certification is how you can be sure that you're getting a quality diamond
                        that’s
                        accurately graded without bias. All FUJ loose diamonds are analyzed and graded for quality by
                        the Gemological Institute of America (GIA), one of the most respected and accurate labs in the
                        diamond industry. Additionally, all Astor by FUJ™ diamonds are certified for light performance
                        by GemEx, the leader in light measurement.
                    </p>
                    <div class="content-title">Understanding Diamond Grading Reports
                    </div>
                    <p>Diamond grading, also known as diamond certification, helps demystify a diamond’s most important
                        qualities to help buyers make informed decisions. The two main reports issued by the GIA are the
                        Diamond Grading Report and the Diamond Dossier®. And, while similar, there are important
                        distinctions.</p>

                    <div class="list-learnMore">
                        <li><b>Diamond Grading Report: </b>Many consider this to be the blueprint of a diamond. Starting
                            with the 4Cs of diamonds – cut, clarity, color, and carat – the report includes precise
                            measurements and shape, as well as a plot or map of the individual diamond inclusions, also
                            known as characteristics. The diamond grading report will also note if the diamond has a girdle
                            inscription, and will describe important characteristics beyond the clarity grade. </li>

                        <li><b>Diamond Dossier®: </b>This dossier offers the same grading information as the Diamond Grading
                            Report, minus the plotted diagram. To prove authenticity, the dossier also includes the laser
                            inscription number on the diamond’s girdle.</li>
                    </div>
                    <div class="content-title">Review A Sample GIA Report </div>
                    <p>Diamond grading, also known as diamond certification, helps demystify a diamond’s most important
                        qualities to help buyers make informed decisions. The two main reports issued by the GIA are the
                        Diamond Grading Report and the Diamond Dossier®. And, while similar, there are important
                        distinctions.</p>
                    <img src="../images/GIA.jpeg" alt="" srcset="" style="width: 300px;">

                    <div class="content-title">Is It Important To Get A Diamond Grading Report When You Buy A Diamond?</div>
                    <p>Your diamond certification is so important, it’s sometimes referred to as the 5th C. Diamonds with a
                        GIA grading report will help you down the road to:
                    </p>
                    <div class="list-learnMorwe">
                        <li>Confirm the quality of your diamond </li>
                        <li>Help to verify ownership for repair or insurance </li>
                        <li>Prove useful if you want to resell a diamond </li>
                    </div>
                    <br>
                    <p style="font-size: 20px;"><b>All FUJewelry Diamonds Include A GIA Diamond Grading Report</b></p>
                    <p><b>Keep in Mind: </b>GIA diamond certification helps buyers understand the quality of the diamond
                        they’re purchasing. This kind of third-party diamond certification ensures that you’re getting a
                        quality stone with transparency for the purchase process. For worry-free diamond selection, choose
                        one that comes with a GIA diamond certificate.</p>
                </div>

                <div class="side_nav">
                    <h3 class="dropdown-btn">Diamond Certificate FAQs<i class="fa-solid fa-angle-down"></i></h3>
                    <div class="dropdown-content">
                        <div class="answer-list">
                            <h4 class="dropdown-btn">How does GIA certification work?<i class="fa-solid fa-angle-down"></i>
                            </h4>
                            <div class="dropdown-content">
                                <div class="answer">
                                    <p>To receive a report from the Gemological Institute of America, a GIA diamond will be
                                        inspected by their experts. They analyze many qualities of a diamond, including its
                                        cut, color, clarity, carat, and any inclusions. They will also assess the diamond’s
                                        shape and other qualities of importance. Then, the diamond is given a report that
                                        quantifies its qualities. The GIA is an independent organization regarded as an
                                        authority on gemstone grading. To receive a report from the Gemological Institute of
                                        America, a GIA diamond will be inspected by their experts. They analyze many
                                        qualities of a diamond, including its cut, color, clarity, carat, and any
                                        inclusions. They will also assess the diamond’s shape and other qualities of
                                        importance. Then, the diamond is given a report that quantifies its qualities. The
                                        GIA is an independent organization regarded as an authority on gemstone grading.</p>
                                </div>
                            </div>
                            <hr>
                            <h4 class="dropdown-btn">Are GIA diamonds worth more?<i class="fa-solid fa-angle-down"></i></h4>
                            <div class="dropdown-content">
                                <div class="answer">
                                    <p>A GIA diamond certification can enhance a gem’s value by adding trustworthy ratings
                                        of its most important qualities. A GIA diamond certificate is regarded as the gold
                                        standard in diamond grading and reporting. GIA diamonds are often regarded as having
                                        higher values than non-GIA gemstones because of the transparency in their grading. A
                                        GIA diamond certification can enhance a gem’s value by adding trustworthy ratings of
                                        its most important qualities. A GIA diamond certificate is regarded as the gold
                                        standard in diamond grading and reporting. GIA diamonds are often regarded as having
                                        higher values than non-GIA gemstones because of the transparency in their grading.
                                    </p>
                                </div>
                            </div>
                            <hr>
                            <h4 class="dropdown-btn">What does it mean if a diamond is GIA certified?<i
                                    class="fa-solid fa-angle-down"></i></h4>
                            <div class="dropdown-content">
                                <div class="answer">
                                    <p>A GIA certified diamond is one that has been graded by the Gemological Institute of
                                        America. These GIA-graded diamonds have a unique GIA Diamond grading Report that
                                        identifies the gemstone’s specific qualities. GIA Diamond Grading Reports assess a
                                        diamond's 4Cs along with any characteristics. A GIA certified diamond is one that
                                        has been graded by the Gemological Institute of America. These GIA-graded diamonds
                                        have a unique GIA Diamond grading Report that identifies the gemstone’s specific
                                        qualities. GIA Diamond Grading Reports assess a diamond's 4Cs along with any
                                        characteristics.</p>
                                </div>
                            </div>
                            <hr>
                        </div>

                    </div>
                </div>
                <div class="content-title">HAVE A QUESTION?</div>
                <p>Contact us by phone at <strong>(+ 84) 898876512</strong> or email at <strong>fuj.khac.diamondshopsystem@gmail.com</strong> </p>
                <p>In addition, Live Chat is available during most business hours. </p>
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


        <script src="../js/certificate.js"></script>

    </body>
</html>

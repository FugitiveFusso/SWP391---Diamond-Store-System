
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Frequently Asked Questions</title>
        <link rel="stylesheet" href="../css/faqs.css">
         <link
            href="https://fonts.googleapis.com/css2?family=Gantari:ital,wght@0,100..900;1,100..900&family=Inika:wght@400;700&family=Inria+Serif:ital,wght@0,300;0,400;0,700;1,300;1,400;1,700&family=Inter:wght@100..900&family=Raleway:ital,wght@0,100..900;1,100..900&family=Syne:wght@400..800&display=swap"
            rel="stylesheet">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="../css/navigation_bar.css">

        <style>
            .details{
                font-family: 'Inter', sans-serif;
            }
        </style>

    </head>

    <body>

        <div class="header">
            <div class="header-top">
                <div class="top-info-left">
                    <ul>
                        <li>"Timeless elegance and craftsmanship</li>
                        <li>at FUJ Jewelry Online Shop."</li>                         
                    </ul>
                </div>
                <a href="./../user_homepage.jsp"><img src="../images/Screenshot (656).png"></a>
                <div class="top-info-right">
                    <ul>
                        <li>FUJ Jewelry Shop - (+ 84) 898876512</li>
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
                    <li class="navbar-link"><a href='../UserVoucherController' class="line">Voucher</a></li>
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
                    <li class="navbar-link"><a href="#" class="line">Order</a></li>
                    <li class="navbar-link">
                        <a href="#" class="line">Account</a>
                        <div class="sub-menu-1">
                            <ul>
                                <li><a href='userlogin?action=logout'>Logout</a></li>          
                            </ul>
                        </div>
                    </li>
                </ul>

            </div>
        </div>    

        <div class="main">

            <div class="content">
                <div class="faqs">
                    <img src="../images/Q&A.png" alt="">
                </div>

                <div class="title">
                    FREQUENTLY ASKED QUESTIONS
                </div>

                <div class="one">
                    <!-- I. -->
                    <p class="method_title">
                        I. Products and services
                    </p>
                    <p class="method">
                        1. I want to buy a ring but don't know how to choose the size?
                    </p>
                    <p class="details">You can know the right ring size for each finger just by applying the following size
                        measurement guide:
                    </p>
                    <ul class="a">
                        <li><b>Step 1:</b> Prepare a piece of paper about 10cm long and 1cm wide. </li>
                        <li><b>Step 2:</b> Use a piece of paper to wrap tightly around the ring finger.
                        </li>
                        <li><b>Step 3:</b> Mark the intersection point (note to mark the area bordering the line).
                        </li>
                        <li><b>Step 4:</b> Remove and use a ruler to measure the length of the piece of paper according to the mark.
                        </li>
                        <li><b>Step 5:</b> Take the measurement result and divide it by 3.14. Then compare with the Ring Size Table
                        </li>
                    </ul>
                    <!-- 2. -->
                    <p class="method">
                        2. Instructions for keeping and preserving beautiful and durable jewelry over time?
                    </p>
                    <!-- Store properly -->
                    <p class="small-method">Store properly:</p>
                    <ul class="a">
                        <li>Store jewelry in a separate box or soft cloth bag to avoid shocks and scratches.
                        </li>
                        <li>Separate jewelry pieces separately to avoid collisions and surface damage.
                        </li>
                        <li>Place the jewelry in a cool, dry location and avoid direct sunlight.
                        </li>
                    </ul>
                    <!-- Avoid contact with harmful materials: -->
                    <p class="small-method">Avoid contact with harmful materials:
                    </p>
                    <ul class="a">
                        <li>Avoid exposing jewelry to chemicals such as soap, seawater, detergents and other chemicals that can affect
                            their durability.
                        </li>
                        <li>Limit exposure to cosmetics, perfumes, and lotions, as these ingredients can tarnish or affect diamonds
                            and other gemstones.
                        </li>
                    </ul>
                    <!-- Cleaning recurrent:  -->
                    <p class="small-method">Cleaning recurrent:</p>
                    <ul class="a">
                        <li>Clean your jewelry by gently wiping the surface with warm water and a little mild soap. Use a soft brush
                            or soft cloth to clean narrow crevices or small stains.
                        </li>
                        <li>Avoid using strong detergents or hard brushes, as they can cause scratches or take away the shine and
                            shine of the jewelry.
                        </li>
                    </ul>
                    <!-- Checking daily -->
                    <p class="details">Inspect your jewelry periodically to detect any damage early, such as melted stones, missing
                        diamond buttons, or loose clasps. If a problem is detected, quickly take the jewelry to the nearest PNJ store
                        for repair.
                    </p>

                    <!-- 3. Do all... -->
                    <p class="method">
                        3. Do all diamond and diamond jewelry products at PNJ have inspection certificates?
                    </p>
                    <p class="details">According to international regulations, diamonds of 4.0 mm or more will have a GIA inspection
                        certificate. However, there will be pellets that only have PNJ's inspection certificate. Depending on each
                        batch of PNJ imported goods, there will be different inspections. PNJ guarantees that the exchange value of
                        PNJ or GIA certified tablets is the same.</p>

                    <!-- II. -->
                    <p class="method_title">
                        II. Order and pay
                    </p>
                    <!-- 1. -->
                    <p class="method">
                        1. I have placed an order successfully, when will the order be confirmed?
                    </p>
                    <p class="details">Customers will receive notification of successful orders immediately upon placing the order.
                        The Online Consultant will contact you to confirm the order and notify you of the delivery time. Or you will
                        receive a message confirming the successful order/electronic invoice/expected delivery time information.
                    </p>

                    <!-- 2. -->
                    <p class="method">
                        2. How long does delivery take?
                    </p>
                    <p class="details">FUJ offers free delivery from 1-7 days nationwide and delivery within 3 hours in some central
                        areas for labeled products.
                    </p>

                    <!-- III. -->
                    <p class="method_title">
                        III. Exchange and warranty policy
                    </p>
                    <!-- 1. -->
                    <p class="method">
                        1. I bought an item online but it doesn't fit me. Can I go to the store to change the size?
                    </p>
                    <p class="details">The exchange policy when you buy products at the website and at the store is the same.
                    </p>
                    <ul class="a">
                        <li> Silver products: change size within 72 hours for products with the same size, exchange to another model
                            is not supported and refund
                        </li>
                        <li> Gold product: exchange 100% of product value within 48H (with the condition of exchanging for another
                            product of higher or equal value to the old product, after 48 hours FUJ will exchange the product according
                            to normal exchange mode )
                        </li>
                    </ul>
                    <p class="details">Note: time is calculated from the time the customer receives the product
                    </p>


                    <!-- IV. -->
                    <p class="method_title">
                        IV. Other questions
                    </p>
                    <!-- 1. -->
                    <p class="method">
                        1. Can purchases at FUJ stores & online sites be engraved for free?
                    </p>
                    <p class="details">Please share your need to engrave your name on the product when purchasing, the consultant
                        will receive your request and assist in engraving your name on the product. However, it depends on the
                        properties of the material to decide whether it can be engraved on the product or not.
                    </p>
                    <p class="details">You can go to the nearest FUJ Store for support.
                    </p>

                    <!-- 2. -->
                    <p class="method">
                        2. Where do FUJ diamonds come from?
                    </p>
                    <p class="details">Diamonds are currently being mined the most in South Africa and on the current market there
                        are many importing countries. However, Belgium is the place with the best cutting and grinding standards in
                        the world and was chosen by FUJ to import directly, so FUJ's financial invoice represents the true value of
                        the product.
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

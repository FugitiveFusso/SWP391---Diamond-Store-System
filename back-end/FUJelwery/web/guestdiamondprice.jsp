
<%@page import="com.khac.swp.fuj.diamondprice.DiamondPriceDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Diamond Price Page</title>
        <link rel="icon" type="image/x-icon" href="images/Screenshot__656_-removebg-preview.png">
        <link rel="stylesheet" href="css/user_diamondprice.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link
            href="https://fonts.googleapis.com/css2?family=Gantari:ital,wght@0,100..900;1,100..900&family=Inika:wght@400;700&family=Inria+Serif:ital,wght@0,300;0,400;0,700;1,300;1,400;1,700&family=Inter:wght@100..900&family=Raleway:ital,wght@0,100..900;1,100..900&family=Syne:wght@400..800&display=swap"
            rel="stylesheet">
        <script src="js/pagination.js"></script>
        <link rel="stylesheet" href="css/pagination.css">
        <link rel="stylesheet" href="./css/navigation_bar.css">
        <link rel="stylesheet" href="css/popup_fake.css">
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
                <a href="guest_homepage.jsp"><img src="./images/Screenshot (656).png"></a>
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
                                <li><a href='./GuestProductController'>Ring</a></li>
                                <li><a href='./GuestCategoryController'>Category</a></li>  
                                <li><a href='./GuestCollectionController'>Collection</a></li>  


                            </ul>
                        </div>   
                    </li>
                    <li class="navbar-link"><a href='./GuestDiamondPriceController' class="line">Diamond Price</a></li>
                    <li class="navbar-link"><a href='./GuestVoucherController' class="line">Voucher</a></li>
                    <li class="navbar-link"><a href="#" class="line">Order Monitor</a>                       
                        <div class="sub-menu-1">
                            <ul>
                                <li><a href='#' class="trigger-popup">Cart</a></li>
                                <li><a href='#' class="trigger-popup">Tracking Orders</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="navbar-link">
                        <a href="guest_static_webpages/certificate_edu.jsp" class="line">Education</a>
                        <div class="sub-menu-1">
                            <ul>
                                <li><a href='./GuestPostController'>Blog</a></li>
                                <li><a href='guest_static_webpages/ringmeasuring.jsp'>Ring Measuring Guide</a></li>          
                                <li><a href='guest_static_webpages/faqs.jsp'>Frequently Asking Questions</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="navbar-link"><a href="guest_aboutus.jsp" class="line">About Us</a></li>                    
                    <li class="navbar-link">
                        <a href="#" class="line">Account</a>
                        <div class="sub-menu-1">
                            <ul>                               
                                <li><a href='userlogin.jsp'>Sign in</a></li>
                                <li><a href='register.jsp'>Sign up </a></li> 
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

        <div class="bannerContainer">
            <div class="bannerContent">
                <div class="bannerText">
                    <h1>Discover the Value of Timeless Elegance</h1>
                    <div class="description_hero">
                        <span>Explore our expertly curated diamond selection, where 
                            competitive prices meet unparalleled quality. Whether you're 
                            seeking the perfect engagement ring or a dazzling piece to add 
                            to your collection, find the best value for your investment with 
                            our transparent pricing and exquisite gems.</span>
                    </div>                   
                </div>
                <div class="bannerImage">
                    <img src="images/Men's_Wedding_Bands.jpeg" id="diamondHero" style="width: 432px; height: 432px">
                </div>
            </div>
        </div>

        <div class="introContainer">
            <div class="introContent">
                <h1>Latest Natural Diamond Price List</h1>
                <h2>Round Brilliant Cut – 03 Excellent – Fluorescence</h2>
                <p>Our diamond price list is meticulously calculated based on carat weight, 
                    color grade, and clarity. If you're looking to purchase diamond jewelry 
                    such as rings, necklaces, or earrings, stay informed with our latest 
                    price updates. Refer to the current price quotes below to make an informed 
                    decision on your investment.</p>
                <p>{Unit of Currency: VND}</p> 
            </div>
        </div>



        <div class="list-container">
            <div class="smaller-container">
                <div class="list">
                    <div class="introContainer" style="">
                        <div class="introContent1">
                            <h1>0.36 Carat Diamond</h1>                               
                        </div>
                    </div>
                    <table class="diamond-table">
                        <thead>
                            <tr>                               
                                <th>Diamond Size</th>                               
                                <th>Color</th>
                                <th>Clarity</th>                               
                                <th>Price</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                List<DiamondPriceDTO> list = (List<DiamondPriceDTO>) request.getAttribute("dplist");
                                for (DiamondPriceDTO dp : list) {
                                    pageContext.setAttribute("dp", dp);
                            %>
                            <tr> 
                                <td>${dp.size}</td>                                   
                                <td>${dp.color}</td>  
                                <td>${dp.clarity}</td>   
                                <td>${dp.price}</td>  
                            </tr>
                            <%
                                }
                            %>    


                    </table>
                </div>
            </div>
        </div>  
        <div class="list-container">
            <div class="smaller-container">
                <div class="list">  
                    <div class="introContainer" style="">
                        <div class="introContent1">
                            <h1>0.7 Carat Diamond</h1>                               
                        </div>
                    </div>
                    <table class="diamond-table">
                        <thead>
                            <tr>
                                <th>Diamond Size</th>                                
                                <th>Color</th>
                                <th>Clarity</th>
                                <th>Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<DiamondPriceDTO> list1 = (List<DiamondPriceDTO>) request.getAttribute("dplist1");
                                for (DiamondPriceDTO dp : list1) {
                                    pageContext.setAttribute("dp", dp);
                            %>
                            <tr>
                                <td>${dp.size}</td>                                   
                                <td>${dp.color}</td>  
                                <td>${dp.clarity}</td>  
                                <td>${dp.price}</td>  
                            </tr>
                            <%
                                }
                            %>    
                        </tbody>
                    </table>
                    <p>Note: The diamond price chart may fluctuate over time. 
                        For the most accurate diamond price quote, 
                        please contact FUJ Jewelry directly.</p>
                </div>
            </div>
        </div> 

        <div class="outtro">
            <div class="outtro-info">
                <p>Loose diamonds or natural diamonds with international 
                    inspection certificates today range in price , with particularly 
                    large diamonds costing up to billions of copper. 
                    According to market research experts, prices depend 
                    primarily on the 4C standards (cut, color, clarity, 
                    and carat weight), as well as other factors including 
                    symmetry, fluorescence, luminescence, cleanliness, certificates and many more factors.</p>
                <br>
                <p>At FUJ Jewelry, every single diamond that we offer comes with certification documents 
                    from the most renowned institutions, not to mention the Gemological Institute of America (GIA). 
                    These certificates provide exquisite and detailed information on the diamond's origin, cut, 
                    clarity, color, and carat weight. </p>
                <div>
                    <img src="images/ATTIC_GIA_Report.webp">
                </div>
                <p>To explore these bespoke options further or to receive expert 
                    guidance on selecting the perfect diamond, we invite you to contact 
                    FUJ Jewelry via our hotline at <strong>(+84) 898876512</strong>. Our team of experts 
                    is ready to provide detail and personalized advice and assist you in making a confident 
                    and informed choices.</p>
            </div>
        </div>                

        <div class="footer">
            <div class="footer-content">
                <div class="info">
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
                        <p><a href="guest_static_webpages/ringmeasuring.jsp">Instructions for measuring rings</a></p>
                        <p><a href="guest_static_webpages/consulation.jsp">Product consultation by month of birth</a></p>
                        <p><a href="guest_static_webpages/faqs.jsp">Frequently asked questions</a></p>
                    </div>
                </div>

                <div class="policy">
                    <div class="policy-title">
                        Policy
                    </div>

                    <div class="policy-text">
                        <p><a href="guest_static_webpages/warrantyPolicy.jsp">Warranty Policy</a></p>
                        <p><a href="guest_static_webpages/deliveryPolicy.jsp">Delivery Policy</a></p>
                        <p><a href="guest_static_webpages/returnPolicy.jsp">Return Policy</a></p>
                        <p><a href="guest_static_webpages/privatePolicy.jsp">Privacy policy</a></p>
                    </div>
                </div>
            </div>  
        </div> 

        <script src="js/pagination.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.js"
                integrity="sha512-8Z5++K1rB3U+USaLKG6oO8uWWBhdYsM3hmdirnOEWp8h2B1aOikj5zBzlXs8QOrvY9OxEnD2QDkbSKKpfqcIWw=="
        crossorigin="anonymous"></script>
        <script src="js/sidenav.js"></script>
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

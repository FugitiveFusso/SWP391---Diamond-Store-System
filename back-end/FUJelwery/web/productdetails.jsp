

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>KHAC Diamond Rings Shop's Rings</title>
        <link rel="icon" type="image/x-icon" href="images/Screenshot__656_-removebg-preview.png">
        <link rel="stylesheet" type="text/css" href="css/user_prodcutdetails.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <link rel="stylesheet" type="text/css" href="css/navigation_bar.css">
        <style>
            a {
                color: black;
                text-decoration: none;
            }

            a:hover {
                color: black;
                text-decoration: none;
            }

        </style>
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

        <% String success = (String) request.getAttribute("success");%>
        <div class="container">
            <% if (success != null) {%>
            <div class="popup open-popup" id="popup">
                <img src="images/404-tick.png">
                <h2>Thank you!</h2>
                <p><%= success%></p>
                <p>If you want to see your cart, <a href="OrderController?action=list&id=${sessionScope.usersession.userid}">Click here!!!</a></p>
                <button type="button" onclick="closePopup()">OK</button>
            </div>
            <% }%> 
        </div>
        
        <% String failed = (String) request.getAttribute("failed");%>
        <div class="container">
            <% if (failed != null) {%>
            <div class="popup open-popup" id="popup">
                <img src="images/X icon.png">
                <h2>Oops!</h2>
                <p><%= failed%></p>
                <p>It seems like you already bought this product, you can reference other if you want to.</p>
                <button type="button" onclick="closePopup()">OK</button>
            </div>
            <% }%> 
        </div>


        <div class="product-details">
            <div class="left-column">
                <div class="image-section">
                    <img src="${requestScope.product.ringImage}" alt="Ring Image">
                </div>
                <div class="additional-details">
                    <h2>Product Details</h2>
                    <div class="detail-row">
                        <strong>Category:</strong> <span><a href="UserCategoryController?action=details&id=${requestScope.product.categoryID}">${requestScope.product.categoryName}</a></span>
                    </div>
                    <div class="detail-row">
                        <strong>Collection:</strong> <span><a href="UserCollectionController?action=details&id=${requestScope.product.collectionID}" >${requestScope.product.collectionName}</a></span>
                    </div>
                    <div class="detail-row">
                        <strong>Ring Placement Name:</strong> <span>${requestScope.product.ringPlacementName}</span>
                    </div>
                    <div class="detail-row">
                        <strong>Material:</strong> <span>${requestScope.product.material}</span>
                    </div>
                    <div class="detail-row">
                        <strong>Ring Placement Color:</strong> <span>${requestScope.product.ringColor}</span>
                    </div>

                    <div class="detail-row">
                        <strong>Diamond Name:</strong> <span>${requestScope.product.diamondName}</span>
                    </div>
                    <div class="detail-row">
                        <strong>Diamond Size:</strong> <span>${requestScope.product.diamondSize}</span>
                    </div>
                    <div class="detail-row">
                        <strong>Carat Weight:</strong> <span>${requestScope.product.caratWeight}</span>
                    </div>
                    <div class="detail-row">
                        <strong>Color:</strong> <span>${requestScope.product.color}</span>
                    </div>
                    <div class="detail-row">
                        <strong>Clarity:</strong> <span>${requestScope.product.clarity}</span>
                    </div>
                    <div class="detail-row">
                        <strong>Cut:</strong> <span>${requestScope.product.cut}</span>
                    </div>

                    <h2>Adds on</h2>
                    <div class="detail-row">
                        <strong>Diamond Price:</strong> <span>${requestScope.product.diamondPrice} VND</span>
                    </div>
                    <div class="detail-row">
                        <strong>Ring Placement Price:</strong> <span>${requestScope.product.rpPrice} VND</span>
                    </div>
                    <div class="detail-row">
                        <strong>Adds-on Fee:</strong> <span>${requestScope.product.price} VND</span>
                    </div>

                    <h2>Product's Warranty</h2>
                    <div class="detail-row">
                        <strong>Warranty Name:</strong> <span>${requestScope.product.warrantyName}</span>
                    </div>
                    <div class="detail-row">
                        <strong>Period:</strong> <span>${requestScope.product.warrantyMonth} months</span>
                    </div>
                    <div class="detail-row">
                        <strong>Type:</strong> <span>${requestScope.product.warrantyType}</span>
                    </div>
                    <div class="detail-row">
                        <strong>Description:</strong> <span>${requestScope.product.warrantyDescription}</span>
                    </div>

                </div>
            </div>
            <div class="right-column">
                <div class="title-wishlist">
                    <h1>${requestScope.product.ringName}</h1>
                </div>
                <hr style="margin-bottom: 10px;">
                <p class="price" style="margin-top: 20px;"><strong style="color: #151542">Total Price:</strong> ${requestScope.product.totalPrice} VND</p>
                <p id="status">Status: ${requestScope.product.status}</p>
                <form id="addToCartForm" action="AddToCart" method="post" class="buttons-form">
                    <input type="hidden" name="userID" value=${sessionScope.usersession.userid}>
                    <input type="hidden" name="ringID" value=${requestScope.product.ringID}>
                    <select name="ringSize" class="productquantities" required>
                        <option value="" disabled selected>Select ring size</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                    </select>
                    <button type="submit" class="btn btn-primary" onclick="openPopup()">Add to Cart</button>
                </form>
                <div class="More-Info">
                    <h2>More products related:</h2>
                    <div class="form-container">
                        <form action="ProductController" method="post" class="buttons-form1">
                            <input type="hidden" name="action" value="list">
                            <input type="submit" value="Product" class="btn1">
                        </form>
                        <form action="UserCollectionController" method="POST" class="buttons-form1">
                            <input name="action" value="details" type="hidden">
                            <input name="id" value="${product.collectionID}" type="hidden">
                            <button type="submit" class="btn1 btn-primary">Collection</button>
                        </form>
                    </div>
                </div>

                <script>
                    document.addEventListener("DOMContentLoaded", function () {
                        var statusText = "${requestScope.product.status}";
                        var statusElement = document.getElementById("status");
                        var formElement = document.getElementById("addToCartForm");

                        if (statusText !== "active") {
                            statusElement.style.display = "block";
                            formElement.style.display = "none";
                        } else {
                            statusElement.style.display = "none";
                            formElement.style.display = "flex"; // Ensure the form is displayed as flex
                        }
                    });
                </script>
                <div class="Inclusion">
                    <h2>Your Order Includes:</h2>
                    <div class="Inclusion-container">
                        <div class="Inclusion-wrapper">
                            <div class="Inclusion-image">
                                <img src="images/trackFastShipping.2b103.png">
                            </div>
                            <div class="Inclustion-content">
                                <h3>Free Shipping</h3>
                                <p>We're committed to making your entire experience a pleasant one, from shopping to shipping.</p>
                            </div>
                        </div>
                    </div>
                    <div class="Inclusion-container">
                        <div class="Inclusion-wrapper">
                            <div class="Inclusion-image">
                                <img src="images/freeReturns.c7cd2.png">
                            </div>
                            <div class="Inclustion-content">
                                <h3>Free Returns</h3>
                                <p>Our commitment to you does not end at delivery. We offer free returns (U.S and Canada) to make your experience as easy as possible.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="more-details">
                    <div class="more-details-title-wrapper" onclick="toggleDropdown(this)">
                        Worried about product warranty? 
                        <button class="plus-button">+</button>
                    </div>
                    <div class="more-details-content">
                        Click this link to know about our warranty policy: <a href="static_webpages/warrantyPolicy.jsp" style="color: blue;text-decoration: underline;">Ring Size Measuring</a>
                    </div>
                </div>
                <div class="more-details">
                    <div class="more-details-title-wrapper" onclick="toggleDropdown(this)">
                        Is this product has GIA Certificate?
                        <button class="plus-button">+</button>
                    </div>
                    <div class="more-details-content">
                        Each product from KHAC Diamond Ring Shop has it own GIA Certificate <br> <br>
                        Click this link to know about GIA Certificate: <a href="static_webpages/certificate_certification.jsp" style="color: blue;text-decoration: underline;">GIA Certificate</a>
                    </div>
                </div>
                <div class="more-details">
                    <div class="more-details-title-wrapper" onclick="toggleDropdown(this)">
                        Need a consultant? 
                        <button class="plus-button">+</button>
                    </div>
                    <div class="more-details-content">
                        Feel free to contact with us through our hotline: (+ 84) 898876512 <br> <br>
                        Or you can read by yourself through: <a href="static_webpages/consulation.jsp" style="color: blue;text-decoration: underline;">Consultant</a>
                    </div>
                </div>

            </div>
        </div>

        <div class="bannerContainer">
            <div class="bannerContent">
                <div class="bannerText">
                    <p class="intro"></p>
                    <h1>How to measure your ring size</h1>
                    <div class="description_hero">
                        <span>To help you find your ring size, our diamond jewelry experts have put together this complete ring size guide including a ring size chart, printable ring sizer, and tips for measuring at home.</span>
                    </div>      
                    <button type="submit" class="btn btn-primary"><a href="static_webpages/ringmeasuring.jsp"style="text-decoration: none;color: #fff">How to measure your ring size</a></button>

                </div>
                <div class="bannerImage">
                    <img src="images/how_to_measure_your_ring_size_1.jfif" id="diamondHero" style="width: 580px; height: 100%">
                </div>
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
                            Address: FPT University, District 9, HCMC
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


        <script>

            document.getElementById('wishlist-btn').addEventListener('click', function () {
                const icon = this.querySelector('i');
                if (icon.classList.contains('fa-regular')) {
                    icon.classList.remove('fa-regular');
                    icon.classList.add('fa-solid');
                } else {
                    icon.classList.remove('fa-solid');
                    icon.classList.add('fa-regular');
                }
            });

            function toggleDropdown(header) {
                var content = header.nextElementSibling;
                if (content.style.display === "block") {
                    content.style.display = "none";
                    header.querySelector(".plus-button").innerText = "+";
                    header.parentElement.style.height = header.offsetHeight + "px";
                } else {
                    content.style.display = "block";
                    header.querySelector(".plus-button").innerText = "-";
                    header.parentElement.style.height = (header.offsetHeight + content.offsetHeight) + "px";
                }
            }
            function addToCart() {
                Swal.fire({
                    title: 'Added to Cart!',
                    text: 'The item has been added to your cart.',
                    icon: 'success',
                    confirmButtonText: 'OK'
                });
            }

        </script>  
        <script>
            let popup = document.getElementById("popup");

            function openPopup() {
                popup.classList.add("open-popup");
            }

            function closePopup() {
                var popup = document.getElementById('popup');
                popup.style.animation = 'popupCloseAnimation 0.4s ease-out';
                popup.style.transform = 'translate(-50%, -50%) scale(0.1)';
                popup.style.opacity = '0';
                popup.addEventListener('animationend', function () {
                    popup.style.visibility = 'hidden';
                }, {once: true});
            }

        </script>
    </body>
</html>

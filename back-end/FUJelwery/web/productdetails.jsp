

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Details</title>
        <link rel="stylesheet" type="text/css" href="css/user_prodcutdetails.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <link rel="stylesheet" type="text/css" href="css/navbaruser.css">

    </head>
    <body>
        <%--<jsp:include page="/productmenu.jsp" flush="true" />--%>
        <div class="menu">
            <ul class="navbar">
                <li class="navbar__link">
                    <a href="#">Jewelry</a>
                    <div class="sub-menu-1">
                        <ul>
                            <li><a href='./ProductController'>Ring</a></li>
                            <li><a href='./UserCollectionController'>Collection</a></li>
                        </ul>
                    </div>                  
                </li>
                <li class="navbar__link"><a href='./UserVoucherController'>Voucher</a></li>
                <li class="navbar__link">
                    <a href="static_webpages/certificate_edu.jsp">Education</a>
                    <div class="sub-menu-1">
                        <ul>
                            <li><a href='UserPostController'>Blog</a></li>
                            <li><a href='static_webpages/ringmeasuring.jsp'>Ring Measuring Guide</a></li>          
                            <li><a href='static_webpages/faqs.jsp'>Frequently Asking Questions</a></li>
                        </ul>
                    </div>
                </li>
                <a href="user_homepage.jsp"><img src="images/Screenshot (656).png"></a>
                <li class="navbar__link"><a href="user_aboutus.jsp">About Us</a></li>
                <li class="navbar__link"><a href="#">Order</a></li>
                <li class="navbar__link">
                    <a href="#">Account</a>
                    <div class="sub-menu-1">
                        <ul>
                            <li><a href='userlogin?action=logout'>Logout</a></li>          
                        </ul>
                    </div>
                </li>

            </ul>
        </div> 

        <div class="product-details">
            <div class="left-column">
                <div class="image-section">
                    <img src="${requestScope.product.ringImage}" alt="Ring Image">
                </div>
                <div class="additional-details">
                    <h2>Product Details</h2>
                    <div class="detail-row">
                        <strong>Category:</strong> <span>${requestScope.product.categoryID}</span>
                    </div>
                    <div class="detail-row">
                        <strong>Collection:</strong> <span>${requestScope.product.collectionID}</span>
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
                </div>
            </div>
            <div class="right-column">
                <div class="title-wishlist">
                    <h1>${requestScope.product.ringName}</h1>
                    <button id="wishlist-btn" onclick="addtoWishlist()"><i class="fa-regular fa-heart"></i></button>
                </div>
                <hr style="margin-bottom: 10px;">
                <p class="price" style="margin-top: 20px;"><strong style="color: #151542">Total Price:</strong> ${requestScope.product.totalPrice} VND</p>
                <form action="ProductController" method="post" class="buttons-form">
                    <input type="hidden" name="action" value="list">
                    <input type="submit" value="Product" class="btn">
                </form>
                <form action="UserCollectionController" method="POST" class="buttons-form">
                    <input name="action" value="details" type="hidden">
                    <input name="id" value="${product.collectionID}" type="hidden">
                    <button type="submit" class="btn btn-primary">Collection</button>
                </form>
                <form action="AddToCart" method="post" class="buttons-form">
                    <input type="hidden" name="userID" value=${sessionScope.usersession.userid}>
                    <input type="hidden" name="ringID" value=${requestScope.product.ringID}>
                    <input type="hidden" name="ringSize" value="3"> 
                    <button type="submit" class="btn btn-primary" onclick="addToCart()">Add to Cart</button>
                </form>
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
                        Don't know your ring size yet?
                        <button class="plus-button">+</button>
                    </div>
                    <div class="more-details-content">
                        Click this link to know your size: <a href="static_webpages/ringmeasuring.jsp">Ring Size Measuring</a>
                    </div>
                </div>
                <div class="more-details">
                    <div class="more-details-title-wrapper" onclick="toggleDropdown(this)">
                        Is this product has GIA Certificate?
                        <button class="plus-button">+</button>
                    </div>
                    <div class="more-details-content">
                        Each product from FUJ has it own GIA Certificate <br> <br>
                        Click this link to know about GIA Certificate: <a href="static_webpages/certificate_certification.jsp">GIA Certificate</a>
                    </div>
                </div>
                <div class="more-details">
                    <div class="more-details-title-wrapper" onclick="toggleDropdown(this)">
                        Need a consultant? 
                        <button class="plus-button">+</button>
                    </div>
                    <div class="more-details-content">
                        Feel free to contact with us through our hotline: (+ 84) 898876512 <br> <br>
                        Or you can read by yourself through: <a href="static_webpages/consulation.jsp">Consulation</a>
                    </div>
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
                            Email: CuongNPSE183844@fpt.edu.vn
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

            function addtoWishlist() {
                Swal.fire({
                    title: 'Added to your Wishlist!',
                    text: 'The item has been added to your wishlist.',
                    icon: 'success',
                    confirmButtonText: 'OK'
                });
            }

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
    </body>
</html>

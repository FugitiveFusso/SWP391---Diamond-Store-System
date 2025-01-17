
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delivery Order History Detail Page</title>    
        <link rel="icon" type="image/x-icon" href="images/Screenshot__656_-removebg-preview.png">
        <link rel="stylesheet" href="css/salesorderhistorydetails.css">
        <link rel="stylesheet" href="css/navbar_admin.css">
        <link rel="stylesheet" href="css/staff_details.css">
        <script src="https://unpkg.com/@phosphor-icons/web"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/3.6.95/css/materialdesignicons.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/3.6.95/css/materialdesignicons.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
            a {
                text-decoration: none;
                color: black;
            }
            a:hover {
                text-decoration: none;
                color: black;
            }
        </style>
    </head>
    <body>
        <div class="menu-btn">
            <div class="btn-cover">
                <i class="fas fa-bars"></i>
            </div>            
        </div>

        <div class="menu-btn">
            <div class="btn-cover">
                <i class="fas fa-bars"></i>
            </div>            
        </div>

        <div class="side-bar">
            <header>
                <div class="close-btn">
                    <i class="fa-solid fa-xmark"></i>
                </div>
                <img src="images/Screenshot (656).png">
                <h1>${sessionScope.deliverystaffsession.lastname} ${sessionScope.deliverystaffsession.firstname}</h1> 
            </header>

            <div class="menu">               
                <div class="item"><a href="DeliveryStaffOrderController"><i class="fas fa-layer-group"></i>Delivery Order</a></div>
                <div class="item"><a href="DeliveryHistory"><i class="fas fa-clock-rotate-left"></i>Delivery History</a></div>
                <div class="item"><a href="deliverystaffaccount.jsp"><i class="fas fa-user"></i>Account</a></div>
                <div class="item"><a href="deliverystafflogin?action=logout"><i class="fas fa-right-from-bracket"></i>Logout</a></div>
            </div>
        </div>

        <div class="container d-flex justify-content-center align-items-center">
            <div class="text-center">
                <h1 style="font-size: 50px; font-weight: 700">Order Details</h1>
                <p>Login username: ${sessionScope.deliverystaffsession.username} </p>
            </div>
        </div>

        <div class="container1">
            <div class="bill-details-container">
                <div class="image-column">
                    <img src="${requestScope.deliveryorder.ringImage}" alt="Product Image" class="product-image">
                </div>
                <div class="details-column">
                    <h2>Bill Details</h2>
                    <div class="product-details">
                        <p><strong>Customer:</strong><a href="Delivery_Customer_Controller?action=details&id=${requestScope.deliveryorder.userID}">  ${requestScope.deliveryorder.fullName}</a></p>
                        <p><strong>Product Name:</strong> ${requestScope.deliveryorder.ringName}</p>
                        <p><strong>Ring Size:</strong> ${requestScope.deliveryorder.ringSize}</p>
                        <p><strong>Date of Purchase:</strong> ${requestScope.deliveryorder.orderDate}</p>
                        <p><strong>Voucher:</strong> ${requestScope.deliveryorder.voucherName}</p>
                        <p><strong>Destination:</strong> ${requestScope.deliveryorder.address}</p>
                        <p class="price">Total Price: ${requestScope.deliveryorder.totalPrice} VND</p>
                    </div>
                    <div class="action-buttons">
                        <button id="toggle-warranty-btn" class="toggle-btn" onclick="toggleSection('warranty', 'toggle-warranty-btn')">+ Warranty</button>
                        <button id="toggle-certificate-btn" class="toggle-btn" onclick="toggleSection('certificate', 'toggle-certificate-btn')">+ Certificate</button>
                    </div>
                    <div id="warranty" class="warranty hidden">
                        <img src="${requestScope.deliveryorder.warrantyImage}" alt="Warranty Image" class="warranty-image" style="width: 60%;">
                        <p><strong>Warranty Name:</strong> ${requestScope.deliveryorder.warrantyName}</p>
                        <p><strong>Months in effect:</strong> ${requestScope.deliveryorder.warrantyMonth}</p>
                        <p><strong>Description:</strong> ${requestScope.deliveryorder.warrantyDescription}</p>
                        <p><strong>Warranty Type:</strong> ${requestScope.deliveryorder.warrantyType}</p>
                        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

                        <p class="card-text"><strong>Start Date: </strong> 
                            <c:choose>
                                <c:when test="${requestScope.deliveryorder.warrantyStartDate == null}">
                                    N/A
                                </c:when>
                                <c:otherwise>
                                    ${requestScope.deliveryorder.warrantyStartDate}
                                </c:otherwise>
                            </c:choose>
                        </p>

                        <p class="card-text"><strong>End Date: </strong> 
                            <c:choose>
                                <c:when test="${requestScope.deliveryorder.warrantyEndDate == null}">
                                    N/A
                                </c:when>
                                <c:otherwise>
                                    ${requestScope.deliveryorder.warrantyEndDate}
                                </c:otherwise>
                            </c:choose>
                        </p>      
                        <p><strong>Terms and Conditions:</strong> ${requestScope.deliveryorder.warrantyTerms}</p>

                    </div>
                    <div id="certificate" class="certificate hidden">
                        <img src="${requestScope.deliveryorder.certificateImage}" alt="Certificate Image" class="certificate-image" style="width: 60%;">
                        <p><strong>Description: </strong> ${requestScope.deliveryorder.certificateName}</p> 

                    </div>
                </div>
            </div>
        </div>

        <script src="js/billdetails.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.js"
                integrity="sha512-8Z5++K1rB3U+USaLKG6oO8uWWBhdYsM3hmdirnOEWp8h2B1aOikj5zBzlXs8QOrvY9OxEnD2QDkbSKKpfqcIWw=="
        crossorigin="anonymous"></script>
        <script src="js/sidenav.js"></script>
    </body>
</html>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History Order Details</title>
        <link rel="icon" type="image/x-icon" href="images/Screenshot__656_-removebg-preview.png">
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
        <link rel="stylesheet" href="css/salesorderhistorydetails.css">
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

        <div class="side-bar">
            <header>
                <div class="close-btn">
                    <i class="fa-solid fa-xmark"></i>
                </div>
                <img src="images/Screenshot (656).png">
                <h1>${sessionScope.salessession.lastname} ${sessionScope.salessession.firstname}</h1>
            </header>

            <div class="menu">               
                <div class="item"><a class="sub-btn"><i class="fas fa-ring"></i>View Product
                        <i class="fas fa-angle-right dropdown"></i>
                        <div class="sub-menu">
                            <a href="DiamondController" class="sub-item">Diamond List</a>
                            <a href="RingController" class="sub-item">Ring List</a>
                            <a href="CollectionController" class="sub-item">Collection List</a>

                        </div>
                    </a>
                    <a href="warrantydetails.jsp"></a>
                </div>
                <div class="item"><a class="sub-btn"><i class="fas fa-tags"></i>View Product Price
                        <i class="fas fa-angle-right dropdown"></i>
                        <div class="sub-menu">
                            <a href="DiamondPriceController" class="sub-item">Diamond Price List</a>
                            <a href="RingPlacementPriceController" class="sub-item">Ring Price List</a>                                                    
                        </div>
                    </a>
                </div>
                <div class="item"><a class="sub-btn"><i class="fas fa-folder"></i>View Document
                        <i class="fas fa-angle-right dropdown"></i>
                        <div class="sub-menu">
                            <a href="VoucherController" class="sub-item">Voucher List</a>
                            <a href="WarrantyController" class="sub-item">Warranty List</a> 
                            <a href="CertificateController" class="sub-item">Certificate List</a>  
                        </div>
                    </a>
                </div>

                <div class="item"><a href="CategoryController"><i class="fas fa-layer-group"></i>View Category</a></div>
                <div class="item"><a href="SalesStaffOrderController"><i class="fas fa-receipt"></i>Track All Orders</a></div>
                <div class="item"><a href="SalesHistory"><i class="fas fa-clock-rotate-left"></i>View Processed Orders</a></div>
                <div class="item"><a href="TransactionHistory"><i class="fas fa-money-bill"></i>View Transactions</a></div>

                <div class="item"><a href="salesstaffaccount.jsp"><i class="fas fa-user"></i>Account</a></div>
                <div class="item"><a href="saleslogin?action=logout"><i class="fas fa-right-from-bracket"></i>Logout</a></div>

            </div>
        </div>
        <div class="container d-flex justify-content-center align-items-center">
            <div class="text-center">
                <h1 style="font-size: 50px; font-weight: 700">Order Details</h1>
                <p>Login username: ${sessionScope.salessession.username} </p>
            </div>
        </div>

        <div class="container1">
            <div class="bill-details-container">
                <div class="image-column">
                    <img src="${requestScope.salesorder.ringImage}" alt="Product Image" class="product-image">
                </div>
                <div class="details-column">
                    <h2>Bill Details</h2>
                    <div class="product-details">
                        <p><a href="Staff_Customer_Controller?action=details&id=${requestScope.salesorder.userID}"><strong>Customer:</strong> ${requestScope.salesorder.fullName}</a></p>
                        <p><a href="RingController?action=details&id=${requestScope.salesorder.ringID}"><strong>Product Name:</strong> ${requestScope.salesorder.ringName}</a></p>
                        <p><strong>Ring Size:</strong> ${requestScope.salesorder.ringSize}</p>
                        <p><strong>Date of Purchase:</strong> ${requestScope.salesorder.orderDate}</p>
                        <p><strong>Voucher:</strong> ${requestScope.salesorder.voucherName}</p>
                        <p><strong>Destination:</strong> ${requestScope.salesorder.address}</p>

                        <p class="price">Total Price: ${requestScope.salesorder.totalPrice} VND</p>
                    </div>
                    <div class="action-buttons">
                        <button id="toggle-warranty-btn" class="toggle-btn" onclick="toggleSection('warranty', 'toggle-warranty-btn')">+ Warranty</button>
                        <button id="toggle-certificate-btn" class="toggle-btn" onclick="toggleSection('certificate', 'toggle-certificate-btn')">+ Certificate</button>
                    </div>
                    <div id="warranty" class="warranty hidden">
                        <img src="${requestScope.salesorder.warrantyImage}" alt="Warranty Image" class="warranty-image" style="width: 60%;">
                        <p><strong>Warranty Name:</strong> ${requestScope.salesorder.warrantyName}</p>
                        <p><strong>Months in effect:</strong> ${requestScope.salesorder.warrantyMonth}</p>
                        <p><strong>Description:</strong> ${requestScope.salesorder.warrantyDescription}</p>
                        <p><strong>Warranty Type:</strong> ${requestScope.salesorder.warrantyType}</p>
                        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

                        <p class="card-text"><strong>Start Date: </strong> 
                            <c:choose>
                                <c:when test="${requestScope.salesorder.warrantyStartDate == null}">
                                    N/A
                                </c:when>
                                <c:otherwise>
                                    ${requestScope.salesorder.warrantyStartDate}
                                </c:otherwise>
                            </c:choose>
                        </p>

                        <p class="card-text"><strong>End Date: </strong> 
                            <c:choose>
                                <c:when test="${requestScope.salesorder.warrantyEndDate == null}">
                                    N/A
                                </c:when>
                                <c:otherwise>
                                    ${requestScope.salesorder.warrantyEndDate}
                                </c:otherwise>
                            </c:choose>
                        </p>
                        <p><strong>Terms and Conditions:</strong> ${requestScope.salesorder.warrantyTerms}</p>

                    </div>
                    <div id="certificate" class="certificate hidden">
                        <img src="${requestScope.salesorder.certificateImage}" alt="Certificate Image" class="certificate-image" style="width: 60%;">
                        <p><strong>Description: </strong> ${requestScope.salesorder.certificateName}</p> 
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

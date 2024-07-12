
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Details</title>
        <link rel="icon" type="image/x-icon" href="images/Screenshot__656_-removebg-preview.png">
        <link rel="stylesheet" href="css/navbar.css">
        <script src="https://unpkg.com/@phosphor-icons/web"></script>
        <link rel="stylesheet" href="css/staff_details.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/3.6.95/css/materialdesignicons.css" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/3.6.95/css/materialdesignicons.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="css/salesorderhistorydetails.css">

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
                <h1>${sessionScope.managersession.lastname} ${sessionScope.managersession.firstname}</h1>
            </header>

            <div class="menu">
                <div class="item"><a href="./DashboardController"><i class="fas fa-chart-line"></i>Dashboard</a></div>
                <div class="item"><a href="manageraccount.jsp"><i class="fas fa-user"></i>Account</a></div>
                <div class="item"><a href="managerlogin?action=logout"><i class="fas fa-right-from-bracket"></i>Logout</a></div>

            </div>
        </div>

        <div class="container d-flex justify-content-center align-items-center">
            <div class="text-center">
                <h1 style="font-size: 50px; font-weight: 700">Order Details</h1>
                <p>Login username: ${sessionScope.managersession.username} </p>
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
                        <p><strong>UserID:</strong> ${requestScope.salesorder.userID}</p>
                        <p><strong>Product Name:</strong> ${requestScope.salesorder.ringName}</p>
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
                        <p><strong>Month in effect:</strong> ${requestScope.salesorder.warrantyMonth}</p>
                        <p><strong>Description:</strong> ${requestScope.salesorder.warrantyDescription}</p>
                        <p><strong>Warranty Type:</strong> ${requestScope.salesorder.warrantyType}</p>
                        <p><strong>Start Date:</strong> ${requestScope.salesorder.warrantyStartDate}</p>
                        <p><strong>End Date:</strong> ${requestScope.salesorder.warrantyEndDate}</p>
                        <p><strong>Terms and Conditions:</strong> ${requestScope.salesorder.warrantyTerms}</p>
                        <!--                                <p><strong>Status:</strong> Active</p>
                                                        <p><strong>Expiry Date:</strong> 30/06/2025</p>
                                                        <p><strong>Coverage:</strong> Manufacturing defects, accidental damage</p>-->
                    </div>
                    <div id="certificate" class="certificate hidden">
                        <img src="${requestScope.salesorder.certificateImage}" alt="Certificate Image" class="certificate-image" style="width: 60%;">
                        <p><strong>Name: </strong> ${requestScope.salesorder.certificateName}</p> 
                        <!--                                <p><strong>Certificate Name:</strong> 0.70 Carat Round Cut Diamond Certificate</p>
                                                        <p><strong>GIA Report Number:</strong> 2194313787</p>
                                                        <p><strong>Measurements:</strong> 5.57 - 5.59 x 3.53 mm</p>
                                                        <p><strong>Grading Results:</strong></p>
                                                        <ul>
                                                            <li>Carat Weight: 0.70 carat</li>
                                                            <li>Color Grade: G</li>
                                                            <li>Clarity Grade: SI1</li>
                                                            <li>Cut Grade: Very Good</li>
                                                        </ul>
                                                        <p><strong>Additional Grading Information:</strong></p>
                                                        <ul>
                                                            <li>Polish: Excellent</li>
                                                            <li>Symmetry: Very Good</li>
                                                            <li>Fluorescence: None</li>
                                                            <li>Clarity Characteristics: Feather</li>
                                                        </ul>-->
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

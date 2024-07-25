<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="icon" type="image/x-icon" href="images/Screenshot__656_-removebg-preview.png">
        <link rel="stylesheet" href="css/navbar.css">
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
                <div class="item"><a href="DeliveryStaffOrderController"><i class="fas fa-layer-group"></i>Delivery Order</a></div>
                <div class="item"><a href="deliverystaffaccount.jsp"><i class="fas fa-user"></i>Account</a></div>
                <div class="item"><a href="deliverystafflogin?action=logout"><i class="fas fa-right-from-bracket"></i>Logout</a></div>
            </div>
        </div>

    <div class="list-container">
        <div class="smaller-container">
<!--            <div class="list1">
                <div class="list-intro-left">
                    <div class="left-icon">
                        <i class='bx bx-diamond'></i>
                    </div>
                    <div class="left-info">
                        <div class="list-title">Diamond Price List</div>
                        <div class="">List of Diamond Price</div>
                    </div>
                </div>
                <div class="list-intro-right">
                    <form action="DiamondPriceController" method="POST" class="input1">
                        <input name="action" value="create" type="hidden">
                        <button type="submit" class="styled-button">
                            <span>Add a Price</span>
                        </button>
                    </form>
                </div>
            </div>-->
            <div class="container d-flex justify-content-center align-items-center">
                <div class="text-center">
                    <h1 style="font-size: 50px; font-weight: 700">Customer Details</h1>
                    <p>Login username: ${sessionScope.deliverystaffsession.firstname}</p>
                </div>
            </div>

            <div class="container">
                <div class="padding">
                    <div class="row d-flex justify-content-center">
                        <div class="col-xl-12 col-md-12">
                            <div class="card user-card-full">
                                <div class="row no-gutters">
                                    <div class="col-md-3 bg-c-lite-green user-profile">
                                        <div class="card-block text-center text-white">
                                            <div class="m-b-25">
                                                <img src="https://img.icons8.com/bubbles/100/000000/user.png" class="img-radius" alt="User-Profile-Image">
                                            </div>
                                            <h6 class="f-w-600"style="font-size: 18px; margin: 10px 0;">${requestScope.customer.lastname} ${requestScope.customer.firstname}</h6>
                                            <p style="color: #fff; font-family: 'Inter'; font-size: 12x;">Customer of KHAC Diamond Ring Shop</p>
                                            <p style="color: #fff; font-family: 'Inter'; font-size: 11px;">${requestScope.customer.username}</p>
                                            <input name="roleID" value=5 required="Please enter"   type="hidden">

                                        </div>
                                    </div>
                                    <div class="col-md-9">
                                        <div class="card-block">
                                            <h2 class="m-b-20 p-b-5 b-b-default f-w-600">Personal Information</h2>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <p class="m-b-10 f-w-600">First Name</p>
                                                    <h6 class="text-muted f-w-400">${requestScope.customer.firstname}</h6>
                                                </div>
                                                <div class="col-sm-6">
                                                    <p class="m-b-10 f-w-600">Last Name</p>
                                                    <h6 class="text-muted f-w-400">${requestScope.customer.lastname}</h6>
                                                </div>
                                                <div class="col-sm-6">
                                                    <p class="m-b-10 f-w-600">Email</p>
                                                    <h6 class="text-muted f-w-400">${requestScope.customer.email}</h6>
                                                </div>
                                                <div class="col-sm-6">
                                                    <p class="m-b-10 f-w-600">Phone Number</p>
                                                    <h6 class="text-muted f-w-400">${requestScope.customer.phonenumber}</h6>
                                                </div>
                                                <div class="col-sm-6">
                                                    <p class="m-b-10 f-w-600">Address</p>
                                                    <h6 class="text-muted f-w-400">${requestScope.customer.address}</h6>
                                                </div>
                                                <div class="col-sm-6">
                                                    <p class="m-b-10 f-w-600">Point</p>
                                                    <h6 class="text-muted f-w-400">${requestScope.customer.point}</h6>
                                                </div>

                                            </div>
                                            <div class="row" style="margin-top: 20px; justify-content: center">
                                                <div class="col-sm-4">
                                                    <form action="DeliveryStaffOrderController" style="padding-top: 10px">
                                                        <input type=hidden name="action" value="list">
                                                        <button type="submit" class="btn btn-custom">Return</button></form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script src="js/pagination.js"></script><script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.js"
                                                        integrity="sha512-8Z5++K1rB3U+USaLKG6oO8uWWBhdYsM3hmdirnOEWp8h2B1aOikj5zBzlXs8QOrvY9OxEnD2QDkbSKKpfqcIWw=="
        crossorigin="anonymous"></script>
        <script src="js/sidenav.js"></script>
            </body>
            </html>

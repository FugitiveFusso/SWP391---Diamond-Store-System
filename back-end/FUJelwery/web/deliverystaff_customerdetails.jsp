<%-- 
    Document   : salesstaff_customerdetails
    Created on : Jun 21, 2024, 10:04:16 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                <h1>${sessionScope.deliverystaffsession.lastname} ${sessionScope.deliverystaffsession.firstname}</h1>
            </header>

            <div class="menu">                             
                <div class="item"><a href="deliverystaffaccount.jsp"><i class="fas fa-user"></i>Account</a></div>
                <div class="item"><a href="deliverystafflogin?action=logout"><i class="fas fa-right-from-bracket"></i>Logout</a></div>

            </div>
        </div>

    <div class="list-container">
        <div class="smaller-container">
            <div class="list1">
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
            </div>

            <!--<jsp:include page="/menu.jsp" flush="true" />-->
            <div class="container d-flex justify-content-center align-items-center">
                <div class="text-center">
                    <h1 style="font-size: 50px; font-weight: 700">Customer Details</h1>
                    <p>Login username: ${sessionScope.adminsession.username}</p>
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
                                            <p style="color: #fff; font-family: 'Inter'; font-size: 13px;">Customer of FUJ</p>
                                            <p style="color: #fff; font-family: 'Inter'; font-size: 13px;">${requestScope.customer.username}</p>
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
                                                    <form action="CustomerController" style="padding-top: 10px">
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

            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.js"
                    integrity="sha512-8Z5++K1rB3U+USaLKG6oO8uWWBhdYsM3hmdirnOEWp8h2B1aOikj5zBzlXs8QOrvY9OxEnD2QDkbSKKpfqcIWw=="
            crossorigin="anonymous"></script>
            <script src="js/sidenav.js"></script>
            </body>
            </html>

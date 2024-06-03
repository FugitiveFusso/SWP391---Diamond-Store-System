
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrator Management Page</title>
        <link rel="stylesheet" href="css/staff_details.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/3.6.95/css/materialdesignicons.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/3.6.95/css/materialdesignicons.css" />
        <link rel="stylesheet" href="css/navbar.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="./css/signup.css">
        <script defer src="./js/inputFormat.js"></script>


    </head>
    <body>
        <jsp:include page="/managermenu.jsp" flush="true" />

        <h1>Administrator Edit </h1>
        <p> Login user: ${sessionScope.managersession.username}</p>
        <!--        <div class="menu">
                    you will code the horizontal menu here
                    <ul class="navbar">
        
                        <li class="navbar__link">
                            <a href="#">Products</a>
                            <div class="sub-menu-1">
                                <ul>
                                    <li><a href='DiamondController'>Diamond</a></li>
                                    <li><a href='RingController'>Ring</a></li>
                                    <li><a href='CollectionController'>Collection</a></li>
                                </ul>
                            </div>                  
                        </li>
                        <li class="navbar__link"><a href='VoucherController'>Voucher</a></li>
                        <img src="./images/Screenshot (656).png">
                        <li class="navbar__link">
                            <a href="#">Dashboard</a>
                            <div class="sub-menu-1">
                                <ul>
                                    <li><a href='AdminController'>View Admins</a></li>   
                                    <li><a href='DeliveryStaffController'>View Delivery Staffs</a></li>
                                    <li><a href='SalesController'>View Sale Staffs</a></li>
                                    <li><a href='CertificateController'>View Certificate</a></li>
        
                                </ul>
                            </div>
                        </li>
                        <li class="navbar__link">
                            <a href="#">Account</a>
                            <div class="sub-menu-1">
                                <ul>
                                    <li><a href='adminlogin?action=logout'>Logout</a></li>          
                                </ul>
                            </div>
                        </li>               
                    </ul>
                </div>-->
        <% String error1 = (String) request.getAttribute("error"); %>
        <% if (error1 != null) {%>
        <h4 style="color: red; text-align: center"> <%= error1%> </h4>
        <% }%>

        <% String success = (String) request.getAttribute("success"); %>
        <% if (success != null) {%>
        <h4 style="color: green; text-align: center"> <%= success%> </h4>
        <% }%>

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
                                        <h6 class="f-w-600" style="font-size: 18px; margin: 10px 0;">${requestScope.admin.lastname} ${requestScope.admin.firstname}</h6>
                                        <p style="color: #fff; font-family: 'Inter'; font-size: 13px; ">Admin of FUJ</p>
                                        <p  style="color: #fff; font-family: 'Inter'; font-size: 13px;">${requestScope.admin.username}</p>
                                    </div>
                                </div>
                                <div class="col-md-9">
                                    <div class="card-block">
                                        <h2 class="m-b-20 p-b-5 b-b-default f-w-600">Personal Information</h2>
                                        <form action="./AdminController" method="POST" id="form" onsubmit="return validateForm()">
                                            <div class="row">
                                                <input name="id" value="${requestScope.admin.userid}" required="Please enter" type="hidden">
                                                <div class="col-sm-6 input-box">
                                                    <p class="m-b-10 f-w-600">Username</p>
                                                    <input id="username1" type="text" name="userName" value="${requestScope.admin.username}" required="Please enter">
                                                    <div class="error"></div>

                                                </div>
                                                <div class="col-sm-6 input-box password-input-container">
                                                    <p class="m-b-10 f-w-600">Password</p>
                                                    <input id="myInput" type="password" name="password" value="${requestScope.admin.password}" required="Please enter" >
                                                    <span class="eye" onclick="myFunction()">
                                                        <i id="hide1" class="fa-solid fa-eye"></i>
                                                        <i id="hide2" class="fa-solid fa-eye-slash" id="eyeicon"></i>
                                                    </span> 
                                                    <div class="error"></div>

                                                </div>
                                                <div class="col-sm-6 input-box">
                                                    <p class="m-b-10 f-w-600">First Name</p>
                                                    <input type="text" id="firstname1" name="firstName" value="${requestScope.admin.firstname}" required="Please enter">
                                                    <div class="error"></div>

                                                </div>
                                                <div class="col-sm-6 input-box">
                                                    <p class="m-b-10 f-w-600">Last Name</p>
                                                    <input name="lastName" id="lastname1" value="${requestScope.admin.lastname}" required="Please enter">
                                                    <div class="error"></div>

                                                </div>
                                                <div class="col-sm-6 input-box">
                                                    <p class="m-b-10 f-w-600">Email</p>
                                                    <input name="email" type="text" id="email1"  value="${requestScope.admin.email}" required="Please enter">
                                                    <div class="error"></div>

                                                </div>
                                                <div class="col-sm-6 input-box">
                                                    <p class="m-b-10 f-w-600">Phone Number</p>
                                                    <input name="phoneNumber" type="text" id="phonenumber1" value="${requestScope.admin.phonenumber}" required="Please enter">
                                                    <div class="error"></div>

                                                </div>
                                                <div class="col-sm-6 input-box">
                                                    <p class="m-b-10 f-w-600">Address</p>
                                                    <input name="address" type="text" id="address1" value="${requestScope.admin.address}" required="Please enter">
                                                    <div class="error"></div>

                                                </div>
                                                <div class="col-sm-6">
                                                    <p class="m-b-10 f-w-600">Points</p>
                                                    <input name="point" value="${requestScope.admin.point}" required="Please enter">                                           
                                                </div>
                                            </div>

                                            <input name="roleID" value=1 required="Please enter"   type="hidden">
                                            <div class="row" style="margin-top: 20px; justify-content: center">
                                                <div class="col-sm-4">
                                                    <input name="action" value="${requestScope.nextaction}" type="hidden">
                                                    <button type="submit" class="btn btn-custom">Save</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script src="js/showPasswordFunc.js"></script>

    </body>
</html>

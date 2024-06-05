

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delivery Staff Management Page</title>
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
        <link rel="stylesheet" href="./css/editstaff_password.css">
        <script defer src="./js/inputFormat.js"></script>

    </head>
    <body>
        <jsp:include page="/menu.jsp" flush="true" />

        <h1>Delivery Staff Edit </h1>
        <p> Login user: ${sessionScope.adminsession.username}</p>
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
                                        <h6 class="f-w-600" style="font-size: 18px; margin: 10px 0;">${requestScope.deliverystaff.lastname} ${requestScope.deliverystaff.firstname}</h6>
                                        <p style="color: #fff; font-family: 'Inter'; font-size: 13px; ">Delivery Staff of FUJ</p>
                                        <p  style="color: #fff; font-family: 'Inter'; font-size: 13px;">${requestScope.deliverystaff.username}</p>
                                    </div>
                                </div>
                                <div class="col-md-9">
                                    <div class="card-block">
                                        <h2 class="m-b-20 p-b-5 b-b-default f-w-600">Personal Information</h2>
                                        <form action="./DeliveryStaffController" method="POST" id="form" onsubmit="return validateForm()">                                           
                                            <div class="row">
                                                <input name="id" value="${requestScope.deliverystaff.userid}" required="Please enter" type="hidden">
                                                <div class="col-sm-6 input-box">
                                                    <p class="m-b-10 f-w-600">Username</p>
                                                    <input id="username1" name="userName" value="${requestScope.deliverystaff.username}" required="Please enter">
                                                    <div class="error"></div>
                                                </div>
                                                <div class="col-sm-6 input-box password-input-container">
                                                    <p class="m-b-10 f-w-600">Password</p>
                                                    <input id="myInput" name="password" value="${requestScope.deliverystaff.password}" required="Please enter" >
                                                    <span class="eye_edit" onclick="myFunction()">
                                                        <i id="hide1" class="fa-solid fa-eye"></i>
                                                        <i id="hide2" class="fa-solid fa-eye-slash" id="eyeicon"></i>
                                                    </span> 

                                                    <div class="error"></div>
                                                </div>
                                                <div class="col-sm-6 input-box">
                                                    <p class="m-b-10 f-w-600">First Name</p>
                                                    <input name="firstName" id="firstname1" value="${requestScope.deliverystaff.firstname}" required="Please enter">
                                                    <div class="error"></div>
                                                </div>
                                                <div class="col-sm-6 input-box">
                                                    <p class="m-b-10 f-w-600">Last Name</p>
                                                    <input name="lastName" id="lastname1" value="${requestScope.deliverystaff.lastname}" required="Please enter">
                                                    <div class="error"></div>
                                                </div>
                                                <div class="col-sm-6 input-box">
                                                    <p class="m-b-10 f-w-600">Email</p>
                                                    <input name="email" id="email1" value="${requestScope.deliverystaff.email}" required="Please enter">
                                                    <div class="error"></div>
                                                </div>
                                                <div class="col-sm-6 input-box">
                                                    <p class="m-b-10 f-w-600">Phone Number</p>
                                                    <input name="phoneNumber" id="phonenumber1" value="${requestScope.deliverystaff.phonenumber}" required="Please enter">
                                                    <div class="error"></div>
                                                </div>
                                                <div class="col-sm-6 input-box">
                                                    <p class="m-b-10 f-w-600">Address</p>
                                                    <input name="address"  id="address1" value="${requestScope.deliverystaff.address}" required="Please enter">
                                                    <div class="error"></div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <p class="m-b-10 f-w-600">Points</p>
                                                    <input name="point" value="${requestScope.deliverystaff.point}" required="Please enter">                                           
                                                </div>

                                            </div>

                                            <input name="roleID" value=4 required="Please enter"   type="hidden">
                                            <div class="row" style="margin-top: 20px; justify-content: center">
                                                <div class="col-sm-4">
                                                    <input name="action" value="${requestScope.nextaction}" type="hidden">
                                                    <button type="submit" class="btn btn-custom">Save</button>
                                                </div>
                                            
                                        </form>
                                        

                                            <div class="col-sm-4">
                                                <form action="DeliveryStaffController">
                                                    <button type="submit" class="btn btn-custom">Return</button>
                                                </form>
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

        <script src="js/showPasswordFunc.js"></script>

    </body>
</html>

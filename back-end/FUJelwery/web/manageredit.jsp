
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Management Page</title>
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
        <jsp:include page="/menu.jsp" flush="true" />

        <h1>Manager Edit </h1>
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
                                        <h6 class="f-w-600" style="font-size: 18px; margin: 10px 0;">${requestScope.manager.lastname} ${requestScope.manager.firstname}</h6>
                                        <p style="color: #fff; font-family: 'Inter'; font-size: 13px; ">Manager of FUJ</p>
                                        <p style="color: #fff; font-family: 'Inter'; font-size: 13px;">${requestScope.manager.username}</p>
                                    </div>
                                </div>

                                <div class="col-md-9">
                                    <div class="card-block">
                                        <h2 class="m-b-20 p-b-5 b-b-default f-w-600">Personal Information</h2>
                                        <form  action="./ManagerController" method="POST" id="form" onsubmit="return validateForm()">                                            
                                            <div class="row">
                                                <input name="id" value="${requestScope.manager.userid}" required="Please enter" type="hidden">
                                                <div class="col-sm-6 input-box">
                                                    <p class="m-b-10 f-w-600">Username</p>
                                                    <input  id="username1" name="userName" value="${requestScope.manager.username}" required="Please enter">
                                                    <div class="error"></div>

                                                </div>

                                                <div class="col-sm-6 input-box password-input-container">
                                                    <p class="m-b-10 f-w-600">Password</p>
                                                    <input id="myInput" type="password" name="password" value="${requestScope.manager.password}" required="Please enter" >
                                                    <span class="eye" onclick="myFunction()">
                                                        <i id="hide1" class="fa-solid fa-eye"></i>
                                                        <i id="hide2" class="fa-solid fa-eye-slash" id="eyeicon"></i>
                                                    </span> 

                                                    <div class="error"></div>

                                                </div>
                                                <div class="col-sm-6 input-box">
                                                    <p class="m-b-10 f-w-600">First Name</p>
                                                    <input name="firstName" id="firstname1" value="${requestScope.manager.firstname}" required="Please enter">
                                                    <div class="error"></div>

                                                </div>
                                                <div class="col-sm-6 input-box">
                                                    <p class="m-b-10 f-w-600">Last Name</p>
                                                    <input name="lastName" id="lastname1" value="${requestScope.manager.lastname}" required="Please enter">
                                                    <div class="error"></div>

                                                </div>
                                                <div class="col-sm-6 input-box">
                                                    <p class="m-b-10 f-w-600">Email</p>
                                                    <input name="email" id="email1" value="${requestScope.manager.email}" required="Please enter">
                                                    <div class="error"></div>

                                                </div>
                                                <div class="col-sm-6 input-box">
                                                    <p class="m-b-10 f-w-600">Phone Number</p>
                                                    <input name="phoneNumber" id="phonenumber1" value="${requestScope.manager.phonenumber}" required="Please enter">
                                                    <div class="error"></div>

                                                </div>
                                                <div class="col-sm-6 input-box">
                                                    <p class="m-b-10 f-w-600">Address</p>
                                                    <input name="address" id="address1" value="${requestScope.manager.address}" required="Please enter">
                                                    <div class="error"></div>

                                                </div>
                                                <div class="col-sm-6">
                                                    <p class="m-b-10 f-w-600">Points</p>
                                                    <input name="point" value="${requestScope.manager.point}" required="Please enter">                                           
                                                </div>

                                            </div>
                                            <input name="roleID" value=2 required="Please enter"   type="hidden">
                                            <div class="row" style="margin-top: 20px; justify-content: center">
                                                <div class="col-sm-4">
                                                    <input name="action" value="${requestScope.nextaction}" type="hidden">
                                                    <button type="submit" class="btn btn-custom">Save</button>
                                                </div>
                                            </div>
                                        </form>
                                        <div class="row" style="margin-top: 20px; justify-content: center">

                                            <div class="col-sm-4">
                                                <form action="ManagerController" style="padding-top: 10px">
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

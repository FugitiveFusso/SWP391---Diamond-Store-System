<%-- 
    Document   : deliverystaffedit
    Created on : May 25, 2024, 11:47:02 AM
    Author     : phucu
--%>

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

    </head>
    <body>
        <jsp:include page="/managermenu.jsp" flush="true" />

        <h1>Delivery Staff Edit </h1>
        <p> Login user: ${sessionScope.managersession.username}</p>

        <!--        <form action="./DeliveryStaffController" method="POST">
                    <table>
        
                        <tr><td></td><td><input name="id" value="${requestScope.deliverystaff.userid}" required="Please enter" type="hidden"</td></tr>
                        <tr><td>User Name</td><td><input name="userName" value="${requestScope.deliverystaff.username}" required="Please enter" </td></tr>
                        <tr><td>Password</td><td><input name="password" value="${requestScope.deliverystaff.password}" required="Please enter" </td></tr>
                        <tr><td>First Name</td><td><input name="firstName" value="${requestScope.deliverystaff.firstname}" required="Please enter"</td></tr>
                        <tr><td>Last Name</td><td><input name="lastName" value="${requestScope.deliverystaff.lastname}" required="Please enter"</td></tr>
                        <tr><td>Phone Number</td><td><input name="phoneNumber" value="${requestScope.deliverystaff.phonenumber}" required="Please enter" </td></tr>
                        <tr><td>Email</td><td><input name="email" value="${requestScope.deliverystaff.email}" required="Please enter"</td></tr>
                        <tr><td>Address</td><td><input name="address" value="${requestScope.deliverystaff.address}" required="Please enter"</td></tr>
                        <tr><td>Point</td><td><input name="point" value="${requestScope.deliverystaff.point}" required="Please enter"</td></tr>
                        <tr><td></td><td><input name="roleID" value=4 required="Please enter"   type="hidden"</td></tr>
                        <tr><td colspan="2">
                                <input name="action" value="${requestScope.nextaction}" type="hidden">
                                <input type="submit" value="Save">
                            </td></tr>
                    </table>
        
                </form>-->
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
                                        <form action="./DeliveryStaffController" method="POST">                                           
                                            <div class="row">
                                                <input name="id" value="${requestScope.deliverystaff.userid}" required="Please enter" type="hidden">
                                                <div class="col-sm-6">
                                                    <p class="m-b-10 f-w-600">Username</p>
                                                    <input name="userName" value="${requestScope.deliverystaff.username}" required="Please enter">
                                                </div>
                                                <div class="col-sm-6">
                                                    <p class="m-b-10 f-w-600">Password</p>
                                                    <input name="password" value="${requestScope.deliverystaff.password}" required="Please enter" >
                                                </div>
                                                <div class="col-sm-6">
                                                    <p class="m-b-10 f-w-600">First Name</p>
                                                    <input name="firstName" value="${requestScope.deliverystaff.firstname}" required="Please enter">
                                                </div>
                                                <div class="col-sm-6">
                                                    <p class="m-b-10 f-w-600">Last Name</p>
                                                    <input name="lastName" value="${requestScope.deliverystaff.lastname}" required="Please enter">
                                                </div>
                                                <div class="col-sm-6">
                                                    <p class="m-b-10 f-w-600">Email</p>
                                                    <input name="email" value="${requestScope.deliverystaff.email}" required="Please enter">
                                                </div>
                                                <div class="col-sm-6">
                                                    <p class="m-b-10 f-w-600">Phone Number</p>
                                                    <input name="phoneNumber" value="${requestScope.deliverystaff.phonenumber}" required="Please enter">
                                                </div>
                                                <div class="col-sm-6">
                                                    <p class="m-b-10 f-w-600">Address</p>
                                                    <input name="address" value="${requestScope.deliverystaff.address}" required="Please enter">
                                                </div>
                                                <div class="col-sm-6">
                                                    <p class="m-b-10 f-w-600">Points</p>
                                                    <input name="point" value="${requestScope.deliverystaff.point}" required="Please enter"                                           
                                                </div>

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
    </div>

</body>
</html>

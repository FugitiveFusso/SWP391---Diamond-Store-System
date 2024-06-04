
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrator Management Page</title>
        <link rel="stylesheet" href="css/navbar.css">
        <!--<link rel="stylesheet" href="css/staff_detail.css">-->

        <link rel="stylesheet" href="css/staff_details.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/3.6.95/css/materialdesignicons.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/3.6.95/css/materialdesignicons.css" />


    </head>
    <body>


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
                            <a href="manageraccount.jsp">Account</a>
                            <div class="sub-menu-1">
                                <ul>
                                    <li><a href='adminlogin?action=logout'>Logout</a></li>          
                                </ul>
                            </div>
                        </li>               
                    </ul>
                </div>-->

        <jsp:include page="/managermenu.jsp" flush="true" />

        Login user: ${sessionScope.managersession.username}
        
        <div class="container d-flex justify-content-center align-items-center">
            <div class="text-center">
                <h1 style="font-size: 50px; font-weight: 700">Admin Details</h1>
                <p>Login username: ${sessionScope.managersession.username}</p>
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
                                        <h6 class="f-w-600"style="font-size: 18px; margin: 10px 0;">${requestScope.admin.lastname} ${requestScope.admin.firstname}</h6>
                                        <p style="color: #fff; font-family: 'Inter'; font-size: 13px;">Admin of FUJ</p>
                                        <p style="color: #fff; font-family: 'Inter'; font-size: 13px;">${requestScope.admin.username}</p>
                                        <input name="roleID" value=1 required="Please enter"   type="hidden">

                                    </div>
                                </div>
                                <div class="col-md-9">
                                    <div class="card-block">
                                        <h2 class="m-b-20 p-b-5 b-b-default f-w-600">Personal Information</h2>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <p class="m-b-10 f-w-600">First Name</p>
                                                <h6 class="text-muted f-w-400">${requestScope.admin.firstname}</h6>
                                            </div>
                                            <div class="col-sm-6">
                                                <p class="m-b-10 f-w-600">Last Name</p>
                                                <h6 class="text-muted f-w-400">${requestScope.admin.lastname}</h6>
                                            </div>
                                            <div class="col-sm-6">
                                                <p class="m-b-10 f-w-600">Email</p>
                                                <h6 class="text-muted f-w-400">${requestScope.admin.email}</h6>
                                            </div>
                                            <div class="col-sm-6">
                                                <p class="m-b-10 f-w-600">Phone Number</p>
                                                <h6 class="text-muted f-w-400">${requestScope.admin.phonenumber}</h6>
                                            </div>
                                            <div class="col-sm-6">
                                                <p class="m-b-10 f-w-600">Address</p>
                                                <h6 class="text-muted f-w-400">${requestScope.admin.address}</h6>
                                            </div>
                                            <div class="col-sm-6">
                                                <p class="m-b-10 f-w-600">Point</p>
                                                <h6 class="text-muted f-w-400">${requestScope.admin.point}</h6>
                                            </div>
                                        </div>
                                        <div class="row" style="margin-top: 20px; justify-content: center">
                                            <div class="col-sm-4">
                                                <form action="AdminController" style="padding-top: 10px">
                                                    <input type="hidden" name="id" value="${requestScope.admin.userid}">
                                                    <input type="hidden" name="action" value="edit">
                                                    <button type="submit" class="btn btn-custom">Edit</button>
                                                </form>
                                            </div>
                                            <div class="col-sm-4">
                                                <form action="AdminController" style="padding-top: 10px">
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



                </body>
                </html>
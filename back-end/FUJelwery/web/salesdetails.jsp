
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sale Staff Management Page</title>
        <link rel="stylesheet" href="css/navbar.css">
        <script src="https://unpkg.com/@phosphor-icons/web"></script>

        <link rel="stylesheet" href="css/staff_details.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/3.6.95/css/materialdesignicons.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/3.6.95/css/materialdesignicons.css" />
    </head>
    <body>

        <div class="header_menu">
            <div id="mySidenav" class="sidenav menu">
                <a href="javascript:void(0)" id="closebtn" class="closebtn" onclick="closeNav()">&times;</a>
                <ul>                   
                    <li>
                        <a href="javascript:void(0)" onclick="toggleSubMenu(this)">
                            <i class="icon ph-bold ph-user"></i>
                            <span class="text">View List</span>
                            <i class="arrow ph-bold ph-caret-down"></i>
                        </a>
                        <ul class="sub-menu">
                            <li>
                                <a href="CustomerController">
                                    <span class="text">Customer List</span>
                                </a>
                            </li>
                            <li>
                                <a href="AdminController">
                                    <span class="text">Administrator List</span>
                                </a>
                            </li>
                            <li>
                                <a href="DeliveryStaffController">
                                    <span class="text">Delivery Staff List</span>
                                </a>
                            </li>
                            <li>
                                <a href="SalesController">
                                    <span class="text">Sale Staff List</span>
                                </a>
                            </li>
                            <li>
                                <a href="ManagerController">
                                    <span class="text">Manager List</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="active">
                        <a href="PostController">
                            <i class="icon ph-bold ph-file-text"></i>
                            <span class="text">Posts</span>
                        </a>
                    </li>                   
                </ul>
                <div class="menu">

                    <ul>
                        <li>
                            <a href="adminaccount.jsp">
                                <i class="icon ph-bold ph-user"></i>
                                <span class="text">Account</span>
                            </a>
                        </li>
                        <li>
                            <a href="adminlogin?action=logout">
                                <i class="icon ph-bold ph-sign-out"></i>
                                <span class="text">Logout</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>


            <span class="cainut" style="font-size:30px;cursor:pointer;" onclick="openNav()">&#9776; Menu</span>
        </div>

        <!--<jsp:include page="/menu.jsp" flush="true" />-->

        <div class="container d-flex justify-content-center align-items-center">
            <div class="text-center">
                <h1 style="font-size: 50px; font-weight: 700">Sale Staff Details</h1>
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
                                        <h6 class="f-w-600"style="font-size: 18px; margin: 10px 0;">${requestScope.sales.lastname} ${requestScope.sales.firstname}</h6>
                                        <p style="color: #fff; font-family: 'Inter'; font-size: 13px;">Sale Staff of FUJ</p>
                                        <p style="color: #fff; font-family: 'Inter'; font-size: 13px;">${requestScope.sales.username}</p>
                                        <input name="roleID" value=3 required="Please enter"   type="hidden">

                                    </div>
                                </div>
                                <div class="col-md-9">
                                    <div class="card-block">
                                        <h2 class="m-b-20 p-b-5 b-b-default f-w-600">Personal Information</h2>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <p class="m-b-10 f-w-600">First Name</p>
                                                <h6 class="text-muted f-w-400">${requestScope.sales.firstname}</h6>
                                            </div>
                                            <div class="col-sm-6">
                                                <p class="m-b-10 f-w-600">Last Name</p>
                                                <h6 class="text-muted f-w-400">${requestScope.sales.lastname}</h6>
                                            </div>
                                            <div class="col-sm-6">
                                                <p class="m-b-10 f-w-600">Email</p>
                                                <h6 class="text-muted f-w-400">${requestScope.sales.email}</h6>
                                            </div>
                                            <div class="col-sm-6">
                                                <p class="m-b-10 f-w-600">Phone Number</p>
                                                <h6 class="text-muted f-w-400">${requestScope.sales.phonenumber}</h6>
                                            </div>
                                            <div class="col-sm-6">
                                                <p class="m-b-10 f-w-600">Address</p>
                                                <h6 class="text-muted f-w-400">${requestScope.sales.address}</h6>
                                            </div>
                                            <div class="col-sm-6">
                                                <p class="m-b-10 f-w-600">Points</p>
                                                <h6 class="text-muted f-w-400">${requestScope.sales.point}</h6>
                                            </div>

                                        </div>
                                        <div class="row" style="margin-top: 20px; justify-content: center">
                                            <div class="col-sm-4">
                                                <form action="SalesController" style="padding-top: 10px">
                                                    <input type="hidden" name="id" value="${requestScope.sales.userid}">
                                                    <input type="hidden" name="action" value="edit">
                                                    <button type="submit" class="btn btn-custom">Edit</button>
                                                </form>
                                            </div>
                                            <div class="col-sm-4">
                                                <form action="SalesController" style="padding-top: 10px">
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

        <!--        <table>

            <tr><td>User Name</td><td>${requestScope.sales.username}</td></tr>
            <tr><td>Password</td><td>${requestScope.sales.password}</td></tr>
            <tr><td>First Name</td><td>${requestScope.sales.firstname}</td></tr>
            <tr><td>Last Name</td><td>${requestScope.sales.lastname}</td></tr>
            <tr><td>Phone Number</td><td>${requestScope.sales.phonenumber}</td></tr>
            <tr><td>Email</td><td>${requestScope.sales.email}</td></tr>
            <tr><td>Address</td><td>${requestScope.sales.address}</td></tr>
            <tr><td>Point</td><td>${requestScope.sales.point}</td></tr>
        </table>

        <form action="SalesController" style="padding-top: 10px">
            <input type=hidden name="action" value="list">
            <input type=submit value="Return" ></form>

        <form action="SalesController" style="padding-top: 10px">
            <input type=hidden name="id" value="${requestScope.sales.userid}">
            <input type=hidden name="action" value="edit">
            <input type=submit value="Edit" ></form>-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.js"
                integrity="sha512-8Z5++K1rB3U+USaLKG6oO8uWWBhdYsM3hmdirnOEWp8h2B1aOikj5zBzlXs8QOrvY9OxEnD2QDkbSKKpfqcIWw=="
        crossorigin="anonymous"></script>
        <script src="js/sidenav.js"></script>
    </body>
</html>

<%-- 
    Document   : admindetails
    Created on : May 25, 2024, 10:32:20 AM
    Author     : phucu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrator Management Page</title>
        <link rel="stylesheet" href="css/navbar.css">
        <!--<link rel="stylesheet" href="css/staff_detail.css">-->

        <link rel="stylesheet" href="css/staff_details.css">

    </head>
    <body>

        <div class="menu">
            <!--you will code the horizontal menu here-->
            <ul class="navbar">
                <li class="navbar__link"><a href="#">Order</a></li>
                <li class="navbar__link"><a href="#">Products</a></li>
                <li class="navbar__link"><a href="#">Voucher</a></li>
                <img src="./images/Screenshot (656).png">
                <li class="navbar__link"><a href="#">Delivery Tracking</a></li>
                <li class="navbar__link"><a href="#">Dashboard</a></li>
                <li class="navbar__link"><a href="#">Account</a></li>
            </ul>

        </div>

        <%--<jsp:include page="/managermenu.jsp" flush="true" />--%>

        <div class="container">

            <div class="account-intro">
                ACCOUNT INFORMATION
            </div>

            <div class="account-info">
                <div class="account-info-left">
                    <img src="images/account-icon.png">

                </div>
                <div class="account-info-right">
                    <div class="account-info-text">
                        <h2>${requestScope.admin.lastname} ${requestScope.admin.firstname} </h2>
                        <h3>Admin of FUJ</h3>
                        <p>${requestScope.admin.username}</p>
                    </div>
                </div>

            </div>
            <hr>

            <div class="account-intro">               
                PERSONAL INFORMATION
            </div>


            <div class="personal-info">
                <div class="personal-info-left">
                    <div class="info-left">
                        <p>Fisrt Name</p>
                        <p>Last Name</p>
                        <p>Your Email</p>
                        <p>Phone Number</p>
                    </div>
                    <div class="info-right">
                        <p>${requestScope.admin.firstname}</p>
                        <p>${requestScope.admin.lastname}</p>
                        <p>${requestScope.admin.email}</p>
                        <p>${requestScope.admin.phonenumber}</p>
                    </div>
                </div>

                <div class="personal-info-right">
                    <div class="button">
                        <form action="AdminController" style="padding-top: 10px">
                            <input type=hidden name="id" value="${requestScope.admin.userid}">
                            <input type=hidden name="action" value="edit">
                            <input type=submit value="Edit" ></form>
                        <form action="AdminController" style="padding-top: 10px">
                            <input type=hidden name="action" value="list">
                            <input type=submit value="Return" ></form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>



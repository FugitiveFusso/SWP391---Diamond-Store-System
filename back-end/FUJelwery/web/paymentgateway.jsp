<%-- 
    Document   : paymentgateway
    Created on : Jul 13, 2024, 10:32:49 AM
    Author     : Dell
--%>

<%@page import="com.khac.swp.fuj.order.OrderDTO"%>
<%@page import="com.khac.swp.fuj.ring.RingDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Gateway</title>
    </head>
    <body>
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
                    <div><h2 class="font-bold" style="color: red">
                            ${totalPrice} VND
                        </h2>
                    </div>

                </div>
                <div class="row" style="margin-top: 20px; justify-content: center">
                    <div class="col-sm-4">
                        <form action="OrderController" method="POST" style="padding-top: 10px">
                            <input type="hidden" name="action" value="pay">
                            <input type="hidden" name="id" value="${sessionScope.usersession.userid}">

                            Credit card number: <input name="creditCardNumber" type="text" class="search-input" value="" minlength="12" maxlength="12">
                            VVS: <input name="VVS" type="text" class="search-input" value="" minlength="3" maxlength="3">

                            <button type="submit" id="purchaseButton1" class="btn btn-primary btn-large">
                                <i class="fa fa-shopping-cart"></i> Purchase
                            </button>
                        </form>

                        <form action="OrderController" method="POST" class="mt-3">
                            <input type="hidden" name="action" value="list">
                            <input type="hidden" name="id" value="${sessionScope.usersession.userid}">

                            <button type="submit" id="purchaseButton2" class="btn btn-primary btn-large">
                                <i class="fa fa-shopping-cart"></i> Cancel
                            </button>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>

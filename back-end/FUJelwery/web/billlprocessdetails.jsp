<%-- 
    Document   : billdetails
    Created on : Jun 13, 2024, 9:39:28 PM
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
        <div class="container mt-4">
            <div class="row">

                <div class="col-md-6">
                    <div class="card">
                        <img src="${requestScope.bill.ringImage}" class="card-img-top" alt="Voucher Image" style="height: 500px; object-fit: cover;">
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title" style="font-weight: 700">${requestScope.bill.ringName}</h4>
                            <p class="card-text"><strong>Status</strong> ${requestScope.bill.status}</p>
                            <p class="card-text"><strong>Date of purchase</strong> ${requestScope.bill.orderDate}</p>
                            <p class="card-text"><strong>Voucher:</strong> ${requestScope.bill.voucherName}</p>
                            <p class="card-text"><strong>Total Price:</strong> ${requestScope.bill.totalPrice}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

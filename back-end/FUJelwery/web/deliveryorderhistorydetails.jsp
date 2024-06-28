<%-- 
    Document   : deliveryorderdetails
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
                        <img src="${requestScope.deliveryorder.ringImage}" class="card-img-top" alt="Voucher Image" style="height: 500px; object-fit: cover;">
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title" style="font-weight: 700">${requestScope.deliveryorder.ringName}</h4>
                            <p class="card-text"><strong>Certificate:</strong> ${requestScope.deliveryorder.certificateName}</p>
                            <p class="card-text"><strong>Certificate Image:</strong> ${requestScope.deliveryorder.certificateImage}</p>
                            <p class="card-text"><strong>Warranty Name:</strong> ${requestScope.deliveryorder.warrantyName}</p>
                            <p class="card-text"><strong>Warranty Image:</strong> ${requestScope.deliveryorder.warrantyImage}</p>
                            <p class="card-text"><strong>Month in effect:</strong> ${requestScope.deliveryorder.warrantyMonth}</p>
                            <p class="card-text"><strong>Description:</strong> ${requestScope.deliveryorder.warrantyDescription}</p>
                            <p class="card-text"><strong>Warranty Type:</strong> ${requestScope.deliveryorder.warrantyType}</p>
                            <p class="card-text"><strong>Start Date:</strong> ${requestScope.deliveryorder.warrantyStartDate}</p>
                            <p class="card-text"><strong>End Date:</strong> ${requestScope.deliveryorder.warrantyEndDate}</p>
                            <p class="card-text"><strong>Terms and Conditions:</strong> ${requestScope.deliveryorder.warrantyTerms}</p>
                            <p class="card-text"><strong>Date of purchase</strong> ${requestScope.deliveryorder.orderDate}</p>
                            <p class="card-text"><strong>Voucher:</strong> ${requestScope.deliveryorder.voucherName}</p>
                            <p class="card-text"><strong>Total Price:</strong> ${requestScope.deliveryorder.totalPrice}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

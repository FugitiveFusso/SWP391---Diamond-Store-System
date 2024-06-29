
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
                        <img src="${requestScope.salesorder.ringImage}" class="card-img-top" alt="Voucher Image" style="height: 500px; object-fit: cover;">
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title" style="font-weight: 700">${requestScope.salesorder.ringName}</h4>
                            <p class="card-text"><strong>Certificate:</strong> ${requestScope.salesorder.certificateName}</p>
                            <p class="card-text"><strong>Certificate Image:</strong> ${requestScope.salesorder.certificateImage}</p>
                            <p class="card-text"><strong>Warranty Name:</strong> ${requestScope.salesorder.warrantyName}</p>
                            <p class="card-text"><strong>Warranty Image:</strong> ${requestScope.salesorder.warrantyImage}</p>
                            <p class="card-text"><strong>Month in effect:</strong> ${requestScope.salesorder.warrantyMonth}</p>
                            <p class="card-text"><strong>Description:</strong> ${requestScope.salesorder.warrantyDescription}</p>
                            <p class="card-text"><strong>Warranty Type:</strong> ${requestScope.salesorder.warrantyType}</p>
                            <p class="card-text"><strong>Start Date:</strong> ${requestScope.salesorder.warrantyStartDate}</p>
                            <p class="card-text"><strong>End Date:</strong> ${requestScope.salesorder.warrantyEndDate}</p>
                            <p class="card-text"><strong>Terms and Conditions:</strong> ${requestScope.salesorder.warrantyTerms}</p>
                            <p class="card-text"><strong>Date of purchase</strong> ${requestScope.salesorder.orderDate}</p>
                            <p class="card-text"><strong>Voucher:</strong> ${requestScope.salesorder.voucherName}</p>
                            <p class="card-text"><strong>Total Price:</strong> ${requestScope.salesorder.totalPrice}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

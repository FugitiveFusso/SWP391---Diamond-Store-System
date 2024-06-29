
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bill Details</title>
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
                            <p class="card-text"><strong>Certificate:</strong> ${requestScope.bill.certificateName}</p>
                            <p class="card-text"><strong>Certificate Image:</strong> ${requestScope.bill.certificateImage}</p>
                            <p class="card-text"><strong>Warranty Name:</strong> ${requestScope.bill.warrantyName}</p>
                            <p class="card-text"><strong>Warranty Image:</strong> ${requestScope.bill.warrantyImage}</p>
                            <p class="card-text"><strong>Month in effect:</strong> ${requestScope.bill.warrantyMonth}</p>
                            <p class="card-text"><strong>Description:</strong> ${requestScope.bill.warrantyDescription}</p>
                            <p class="card-text"><strong>Warranty Type:</strong> ${requestScope.bill.warrantyType}</p>
                            <p class="card-text"><strong>Start Date:</strong> ${requestScope.bill.warrantyStartDate}</p>
                            <p class="card-text"><strong>End Date:</strong> ${requestScope.bill.warrantyEndDate}</p>
                            <p class="card-text"><strong>Terms and Conditions:</strong> ${requestScope.bill.warrantyTerms}</p>
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

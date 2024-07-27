<%-- 
    Document   : transactiondetailsforuser
    Created on : Jul 15, 2024, 3:15:12 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transaction Details</title>
    </head>
    <body>
        <div class="col-md-9">
            <div class="card-block">
                <h2 class="m-b-20 p-b-5 b-b-default f-w-600">Transaction Information</h2>
                <div class="row">
                    <div class="col-sm-6">
                        <p class="m-b-10 f-w-600">ID</p>
                        <h6 class="text-muted f-w-400">${requestScope.transaction.transactionID}</h6>
                    </div>
                    <div class="col-sm-6">
                        <p class="m-b-10 f-w-600">Payment Date</p>
                        <h6 class="text-muted f-w-400">${requestScope.transaction.paymentDate}</h6>
                    </div>
                    <div class="col-sm-6">
                        <p class="m-b-10 f-w-600">Total Price</p>
                        <h6 class="text-muted f-w-400">${requestScope.transaction.totalPrice}</h6>
                    </div>
                    </div>
                </div>

            </div>
    </body>
</html>

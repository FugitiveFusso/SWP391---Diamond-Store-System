
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/voucher_details.css"/>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>
        <jsp:include page="/salesmenu.jsp" flush="true" />

        <div class="post-title">
            <h1>Voucher Details </h1>         
            <p> Login username: ${sessionScope.salessession.username}</p>
        </div>

        <div class="container mt-4">
            <div class="row">
                <!-- Left Column: Image -->
                <div class="col-md-6">
                    <div class="card">
                        <img src="${requestScope.voucher.image}" class="card-img-top" alt="Voucher Image" style="height: 300px; object-fit: cover;">
                    </div>
                </div>

                <!-- Right Column: Information -->
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Voucher ID: ${requestScope.voucher.id}</h5>
                            <h6 class="card-subtitle mb-2 text-muted">${requestScope.voucher.name}</h6>
                            <p class="card-text"><strong>Description:</strong> ${requestScope.voucher.description}</p>
                            <p class="card-text"><strong>Coupon:</strong> ${requestScope.voucher.coupon}</p>
                            <p class="card-text"><strong>Percentage:</strong> ${requestScope.voucher.percentage}</p>
                            <div class="btn-group" role="group" aria-label="Voucher Actions">
                                <form action="VoucherController" method="post" class="mr-2">
                                    <input type="hidden" name="action" value="list">
                                    <button type="submit" class="btn btn-primary">Return</button>
                                </form>
                                <form action="VoucherController" method="post">
                                    <input type="hidden" name="id" value="${requestScope.certificate.certificateID}">
                                    <input type="hidden" name="action" value="edit">
                                    <button type="submit" class="btn btn-secondary">Edit</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!--        <table>
        
                    <tr><td>Voucher ID</td><td>${requestScope.voucher.id}</td></tr>
                    <tr><td>Voucher Name</td><td>${requestScope.voucher.name}</td></tr>
                    <tr><td>Voucher Image</td><td><img src=${requestScope.voucher.image} width="300px" height="300px"></td></tr>
                    <tr><td>Description</td><td>${requestScope.voucher.description}</td></tr>
                    <tr><td>Coupon</td><td>${requestScope.voucher.coupon}</td></tr>
                    <tr><td>Percentage</td><td>${requestScope.voucher.percentage}%</td></tr>
                </table>
        
                <form action="VoucherController" style="padding-top: 10px">
                    <input type=hidden name="action" value="list">
                    <input type=submit value="Return" ></form>
        
                <form action="VoucherController" style="padding-top: 10px">
                    <input type=hidden name="id" value="${requestScope.voucher.id}">
                    <input type=hidden name="action" value="edit">
                    <input type=submit value="Edit" ></form>-->
    </body>
</html>

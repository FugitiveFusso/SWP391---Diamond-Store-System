
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Warranty Management Page</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <script>
            window.onload = function () {
                if (!sessionStorage.getItem('hasReloaded')) {
                    sessionStorage.setItem('hasReloaded', 'true');
                    location.reload();
                } else {
                    sessionStorage.removeItem('hasReloaded');
                }
            };
        </script>
        
        <style>
            .post-title{
                align-items: center;
                text-align: center;
                margin-top: 30px;
            }

            .post-title h1{
                font-size: 50px;               
                font-weight: 700;
            }

            .card {
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
                transition: transform 0.2s;
            }
            .card:hover {
                transform: scale(1.02);
            }
            .card-img-top {
                border-radius: 0.25rem 0.25rem 0 0;
            }
            .btn-group .btn {
                width: 100px;
            }           

            .btn-group{
                display: flex;
                justify-content: center;
            }

            .btn-group form button{
                font-size: 20px;
                padding: 8px 6px;
                background: #15156b;
                color: #fff;
                border-radius: 10px;
                cursor: pointer;
            }


        </style>
        
    </head>
    <body>
        <jsp:include page="/salesmenu.jsp" flush="true" />

        <div class="post-title">
            <h1>Warranty Details </h1>         
            <p> Login username: ${sessionScope.salessession.username}</p>
        </div>

        
        
        <div class="container mt-4">
            <div class="row">
                <!-- Left Column: Image -->
                <div class="col-md-6">
                    <div class="card">
                        <img src="${requestScope.warranty.image}" class="card-img-top" alt="Voucher Image" style="height: 410px; object-fit: cover;">
                    </div>
                </div>

                <!-- Right Column: Information -->
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Warranty ID: ${requestScope.warranty.id}</h5>
                            <h6 class="card-subtitle mb-2 text-muted">${requestScope.warranty.name}</h6>
                            <p class="card-text"><strong>Warranty Month: </strong> ${requestScope.warranty.month}</p>
                            <p class="card-text"><strong>Description:</strong> ${requestScope.warranty.description}</p>
                            <p class="card-text"><strong>Warranty Type: </strong> ${requestScope.warranty.type}</p>
                            <p class="card-text"><strong>Start Date: </strong> ${requestScope.warranty.startdate}</p>
                            <p class="card-text"><strong>End Date: </strong> ${requestScope.warranty.enddate}</p>
                            <p class="card-text"><strong>Terms and Conditions: </strong> ${requestScope.warranty.termsandconditions}</p>
                            <div class="btn-group" role="group" aria-label="Voucher Actions">
                                <form action="WarrantyController" method="post" class="mr-2">
                                    <input type="hidden" name="action" value="list">
                                    <button type="submit" class="btn btn-primary">Return</button>
                                </form>
                                <form action="WarrantyController" method="post">
                                    <input type="hidden" name="id" value="${requestScope.warranty.id}">
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

            <tr><td>ID</td><td>${requestScope.warranty.id}</td></tr>
            <tr><td>Name</td><td>${requestScope.warranty.name}</td></tr>
            <tr><td>Image</td><td><img src=${requestScope.warranty.image} width="300px" height="300px"></td></tr>
            <tr><td>Month</td><td>${requestScope.warranty.month}</td></tr>
            <tr><td>Description</td><td>${requestScope.warranty.description}</td></tr>
            <tr><td>Type</td><td>${requestScope.warranty.type}</td></tr>
            <tr><td>Start Date</td><td>${requestScope.warranty.startdate}</td></tr>
            <tr><td>End Date</td><td>${requestScope.warranty.enddate}</td></tr>
            <tr><td>Terms and Conditions</td><td>${requestScope.warranty.termsandconditions}</td></tr>
        </table>

        <form action="WarrantyController" style="padding-top: 10px">
            <input type=hidden name="action" value="list">
            <input type=submit value="Return" ></form>

        <form action="WarrantyController" style="padding-top: 10px">
            <input type=hidden name="id" value="${requestScope.warranty.id}">
            <input type=hidden name="action" value="edit">
            <input type=submit value="Edit" ></form>-->
    </body>
</html>

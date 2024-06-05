

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Diamond Detail Page</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        
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
        
        <script>
            window.onload = function() {
                if (!sessionStorage.getItem('hasReloaded')) {
                    sessionStorage.setItem('hasReloaded', 'true');
                    location.reload();
                } else {
                    sessionStorage.removeItem('hasReloaded');
                }
            };
        </script>
    </head>
    <body>
        <jsp:include page="/salesmenu.jsp" flush="true" />

        <div class="post-title">
            <h1>Diamond Details </h1>         
            <p> Login username: ${sessionScope.salessession.username}</p>
        </div>
        
        <div class="container mt-4">
            <div class="row">
                <!-- Left Column: Image -->
                <div class="col-md-6">
                    <div class="card">
                        <img src="${requestScope.diamond.diamondImage}" class="card-img-top" alt="Voucher Image" style="height: 462px; object-fit: cover;">
                    </div>
                </div>

                <!-- Right Column: Information -->
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Voucher ID: ${requestScope.diamond.diamondID}</h5>
                            <h6 class="card-subtitle mb-2 text-muted">${requestScope.diamond.diamondName}</h6>
                            <p class="card-text"><strong>Origin:</strong> ${requestScope.diamond.origin}</p>
                            <p class="card-text"><strong>Diamond Size:</strong> ${requestScope.diamond.diamondSize}</p>
                            <p class="card-text"><strong>Carat Weight:</strong> ${requestScope.diamond.caratWeight}</p>
                            <p class="card-text"><strong>Cut:</strong> ${requestScope.diamond.cut}</p>
                            <p class="card-text"><strong>Color:</strong> ${requestScope.diamond.color}</p>
                            <p class="card-text"><strong>Clarity:</strong> ${requestScope.diamond.clarity}</p>
                            <p class="card-text"><strong>Certificate:</strong> ${requestScope.diamond.certificateID}</p>
                            <p class="card-text"><strong>Price:</strong> ${requestScope.diamond.diamondPrice}</p>
                            <div class="btn-group" role="group" aria-label="Voucher Actions">
                                <form action="DiamondController" method="post" class="mr-2">
                                    <input type="hidden" name="action" value="list">
                                    <button type="submit" class="btn btn-primary">Return</button>
                                </form>
                                <form action="DiamondController" method="post">
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
            <tr><td>Diamond ID</td><td>${requestScope.diamond.diamondID}</td></tr>
            <tr><td>Diamond Name</td><td>${requestScope.diamond.diamondName}</td></tr>
            <tr><td>Diamond Image</td><td><img src="${requestScope.diamond.diamondImage}" width="300px" height="300px"></td></tr>
            <tr><td>Origin</td><td>${requestScope.diamond.origin}</td></tr>
            <tr><td>Diamond Size</td><td>${requestScope.diamond.diamondSize}</td></tr>
            <tr><td>Carat Weight</td><td>${requestScope.diamond.caratWeight}</td></tr>
            <tr><td>Cut</td><td>${requestScope.diamond.cut}</td></tr>
            <tr><td>Color</td><td>${requestScope.diamond.color}</td></tr>
            <tr><td>Clarity</td><td>${requestScope.diamond.clarity}</td></tr>
            <tr><td>Certificate</td><td>${requestScope.diamond.certificateID}</td></tr>
            <tr><td>Price</td><td>${requestScope.diamond.diamondPrice}</td></tr>
        </table>

        <form action="DiamondController" style="padding-top: 10px">
            <input type="hidden" name="action" value="list">
            <input type="submit" value="Return">
        </form>

        <form action="DiamondController" style="padding-top: 10px">
            <input type="hidden" name="id" value="${requestScope.diamond.diamondID}">
            <input type="hidden" name="action" value="edit">
            <input type="submit" value="Edit">
        </form>-->
    </body>
</html>

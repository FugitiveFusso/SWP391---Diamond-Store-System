

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
                            <h6 class="card-subtitle mb-2 text-muted" >Diamond ID: ${requestScope.diamond.diamondID}</h6>
                            <h4 class="card-title" style="font-weight: 700">${requestScope.diamond.diamondName}</h4>
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

    </body>
</html>

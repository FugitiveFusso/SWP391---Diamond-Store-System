
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Voucher Management Page</title>

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

    </head>
    <body>
        <jsp:include page="/salesmenu.jsp" flush="true" />

        <div class="post-title">
            <h1>Voucher Details </h1>         
            <p> Login username: ${sessionScope.salessession.username}</p>
        </div>

        <div class="container mt-4">
            <div class="row">
                
                <div class="col-md-6">
                    <div class="card">
                        <img src="${requestScope.voucher.image}" class="card-img-top" alt="Voucher Image" style="height: 300px; object-fit: cover;">
                    </div>
                </div>

                
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h6 class="card-subtitle mb-2 text-muted" >Voucher ID: ${requestScope.voucher.id}</h6>
                            <h4 class="card-title" style="font-weight: 700">${requestScope.voucher.name}</h4>                            
                            <p class="card-text"><strong>Description:</strong> ${requestScope.voucher.description}</p>
                            <p class="card-text"><strong>Coupon:</strong> ${requestScope.voucher.coupon}</p>
                            <p class="card-text"><strong>Percentage:</strong> ${requestScope.voucher.percentage}%</p>
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



    </body>
</html>

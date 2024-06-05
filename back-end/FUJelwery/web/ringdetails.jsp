
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ring Management Page</title>
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
            window.onload = function () {
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
            <h1>Ring Details </h1>         
            <p> Login username: ${sessionScope.salessession.username}</p>
        </div>

        <div class="container mt-4">
            <div class="row">

                <div class="col-md-6">
                    <div class="card">
                        <img src="${requestScope.ring.ringImage}" class="card-img-top" alt="Voucher Image" style="height: 500px; object-fit: cover;">
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">    
                            <h6 class="card-subtitle mb-2 text-muted" >Ring ID: ${requestScope.ring.ringID}</h6>
                            <h4 class="card-title" style="font-weight: 700">${requestScope.ring.ringName}</h4>
                            <p class="card-text"><strong>Price:</strong> ${requestScope.ring.price}</p>
                            <p class="card-text"><strong>Category:</strong> ${requestScope.ring.categoryID}</p>
                            <p class="card-text"><strong>Collection:</strong> ${requestScope.ring.collectionID}</p>
                            <p class="card-text"><strong>Ring Placement Name:</strong> ${requestScope.ring.ringPlacementName}</p>
                            <p class="card-text"><strong>Material:</strong> ${requestScope.ring.material}</p>
                            <p class="card-text"><strong>Ring Placement Color:</strong> ${requestScope.ring.ringColor}</p>
                            <p class="card-text"><strong>Ring Placement Price:</strong> ${requestScope.ring.rpPrice}</p>
                            <p class="card-text"><strong>Diamond Name:</strong> ${requestScope.ring.diamondName}</p>
                            <p class="card-text"><strong>Diamond Size:</strong> ${requestScope.ring.diamondSize}</p>
                            <p class="card-text"><strong>Carat Weight:</strong> ${requestScope.ring.caratWeight}</p>
                            <p class="card-text"><strong>Color:</strong> ${requestScope.ring.color}</p>
                            <p class="card-text"><strong>Clarity:</strong> ${requestScope.ring.clarity}</p>
                            <p class="card-text"><strong>Cut:</strong> ${requestScope.ring.cut}</p>
                            <p class="card-text"><strong>Diamond Price:</strong> ${requestScope.ring.diamondPrice}</p>
                            <p class="card-text"><strong>Total Price:</strong> ${requestScope.ring.totalPrice}</p>
                            <div class="btn-group" role="group" aria-label="Voucher Actions">
                                <form action="RingController" method="post" class="mr-2">
                                    <input type="hidden" name="action" value="list">
                                    <button type="submit" class="btn btn-primary">Return</button>
                                </form>
                                <form action="RingController" method="post">
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

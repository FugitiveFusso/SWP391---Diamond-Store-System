
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Diamond Price Management</title>
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
            <h1>Diamond Price Details </h1>         
            <p> Login username: ${sessionScope.salessession.username}</p>
        </div>

        <div class="container mt-4">
            <div class="row justify-content-center">
                <!-- Right Column: Information -->
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Diamond Price ID: ${requestScope.dp.id}</h5>

                            <p class="card-text"><strong>Diamond Size: </strong>${requestScope.dp.size}</p>
                            <p class="card-text"><strong>Carat Weight:</strong> ${requestScope.dp.caratWeight}</p>
                            <p class="card-text"><strong>Color: </strong> ${requestScope.dp.color}</p>
                            <p class="card-text"><strong>Clarity: </strong> ${requestScope.dp.clarity}</p>
                            <p class="card-text"><strong>Cut: </strong> ${requestScope.dp.cut}</p>
                            <p class="card-text"><strong>Price: </strong> ${requestScope.dp.price}</p>
                            <div class="btn-group" role="group" aria-label="Voucher Actions">
                                <form action="DiamondPriceController" method="post" class="mr-2">
                                    <input type="hidden" name="action" value="list">
                                    <button type="submit" class="btn btn-primary">Return</button>
                                </form>
                                <form action="DiamondPriceController" method="post">
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
        
                    <tr><td>Diamond Price ID</td><td>${requestScope.dp.id}</td></tr>
                    <tr><td>Diamond Size</td><td>${requestScope.dp.size}</td></tr>
                    <tr><td>Carat Weight</td><td>${requestScope.dp.caratWeight}</td></tr>
                    <tr><td>Color</td><td>${requestScope.dp.color}</td></tr>
                    <tr><td>Clarity</td><td>${requestScope.dp.clarity}</td></tr>
                    <tr><td>Cut</td><td>${requestScope.dp.cut}</td></tr>
                    <tr><td>Price</td><td>${requestScope.dp.price}</td></tr>
                </table>
        
                <form action="DiamondPriceController" style="padding-top: 10px">
                    <input type=hidden name="action" value="list">
                    <input type=submit value="Return" ></form>
        
                <form action="DiamondPriceController" style="padding-top: 10px">
                    <input type=hidden name="id" value="${requestScope.dp.id}">
                    <input type=hidden name="action" value="edit">
                    <input type=submit value="Edit" ></form>-->
    </body>
</html>

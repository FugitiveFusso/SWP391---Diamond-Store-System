
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Diamond Price Management</title>
        <link rel="stylesheet" href="css/navbar_admin.css">
        <script src="https://unpkg.com/@phosphor-icons/web"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
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
        <div class="menu-btn">
            <div class="btn-cover">
                <i class="fas fa-bars"></i>
            </div>            
        </div>

        <div class="side-bar">
            <header>
                <div class="close-btn">
                    <i class="fa-solid fa-xmark"></i>
                </div>
                <img src="images/Screenshot (656).png">
                <h1>${sessionScope.salessession.lastname} ${sessionScope.salessession.firstname}</h1>
            </header>

            <div class="menu">               
                <div class="item"><a class="sub-btn"><i class="fas fa-ring"></i>View Product
                        <i class="fas fa-angle-right dropdown"></i>
                        <div class="sub-menu">
                            <a href="DiamondController" class="sub-item">Diamond List</a>
                            <a href="RingController" class="sub-item">Ring List</a>
                            <a href="CollectionController" class="sub-item">Collection List</a>

                        </div>
                    </a>
                    <a href="warrantydetails.jsp"></a>
                </div>
                <div class="item"><a class="sub-btn"><i class="fas fa-tags"></i>View Product Price
                        <i class="fas fa-angle-right dropdown"></i>
                        <div class="sub-menu">
                            <a href="DiamondPriceController" class="sub-item">Diamond Price List</a>
                            <a href="RingPlacementPriceController" class="sub-item">Ring Price List</a>                                                    
                        </div>
                    </a>
                </div>
                <div class="item"><a class="sub-btn"><i class="fas fa-folder"></i>View Document
                        <i class="fas fa-angle-right dropdown"></i>
                        <div class="sub-menu">
                            <a href="VoucherController" class="sub-item">Voucher List</a>
                            <a href="WarrantyController" class="sub-item">Warranty List</a> 
                            <a href="CertificateController" class="sub-item">Certificate List</a>  
                        </div>
                    </a>
                </div>

                <div class="item"><a href="CategoryController"><i class="fas fa-layer-group"></i>View Category</a></div>
                <div class="item"><a href="SalesStaffOrderController"><i class="fas fa-receipt"></i>Track All Orders</a></div>
                <div class="item"><a href="SalesHistory"><i class="fas fa-clock-rotate-left"></i>View Processed Orders</a></div>

                <div class="item"><a href="salesstaffaccount.jsp"><i class="fas fa-user"></i>Account</a></div>
                <div class="item"><a href="saleslogin?action=logout"><i class="fas fa-right-from-bracket"></i>Logout</a></div>

            </div>
        </div>

        <div class="post-title">
            <h1>Diamond Price Details </h1>         
            <p> Login username: ${sessionScope.salessession.username}</p>
        </div>

        <div class="container mt-4">
            <div class="row justify-content-center">

                <div class="col-md-8">
                    <div class="card">
                        <div class="card-body">
                            <h6 class="card-subtitle mb-2 text-muted" >Diamond Price ID: ${requestScope.dp.id}</h6>                           

                            <p class="card-text"><strong>Diamond Size: </strong>${requestScope.dp.size}</p>
                            <p class="card-text"><strong>Carat Weight:</strong> ${requestScope.dp.caratWeight}</p>
                            <p class="card-text"><strong>Color: </strong> ${requestScope.dp.color}</p>
                            <p class="card-text"><strong>Clarity: </strong> ${requestScope.dp.clarity}</p>
                            <p class="card-text"><strong>Cut: </strong> ${requestScope.dp.cut}</p>
                            <p class="card-text"><strong>Price: </strong> ${requestScope.dp.price} VND</p>
                            <div class="btn-group" role="group" aria-label="Voucher Actions">
                                <form action="DiamondPriceController" method="post" class="mr-2">
                                    <input type="hidden" name="action" value="list">
                                    <button type="submit" class="btn btn-primary">Return</button>
                                </form>
                                <form action="DiamondPriceController" method="post">
                                    <input type="hidden" name="id" value="${requestScope.dp.id}">
                                    <input type="hidden" name="action" value="edit">
                                    <button type="submit" class="btn btn-secondary">Edit</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="js/pagination.js"></script><script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.js"
                                                        integrity="sha512-8Z5++K1rB3U+USaLKG6oO8uWWBhdYsM3hmdirnOEWp8h2B1aOikj5zBzlXs8QOrvY9OxEnD2QDkbSKKpfqcIWw=="
        crossorigin="anonymous"></script>
        <script src="js/sidenav.js"></script>
    </body>
</html>

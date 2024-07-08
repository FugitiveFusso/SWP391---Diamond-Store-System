<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ring Details</title>
        <link rel="stylesheet" href="css/navbar.css">
        <script src="https://unpkg.com/@phosphor-icons/web"></script>
        <link rel="stylesheet" href="css/staff_details.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/3.6.95/css/materialdesignicons.css" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/3.6.95/css/materialdesignicons.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
            .d-flex .btn {
                width: 120px;
            }           

            .d-flex{
                display: flex;
                justify-content: space-around;
            }

            .d-flex form button{
                font-size: 20px;
                padding: 8px 10px;
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
                <h1>${sessionScope.managersession.lastname} ${sessionScope.managersession.firstname}</h1>
            </header>

            <div class="menu">
                <div class="item"><a href="./DashboardController"><i class="fas fa-chart-line"></i>Dashboard</a></div>
                <div class="item"><a href="manageraccount.jsp"><i class="fas fa-user"></i>Account</a></div>
                <div class="item"><a href="managerlogin?action=logout"><i class="fas fa-right-from-bracket"></i>Logout</a></div>

            </div>
        </div>
        <div class="post-title">
            <h1>Ring Details </h1>         
            <p> Login username: ${sessionScope.managersession.username}</p>
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
                            <p class="card-text"><strong>Price:</strong> ${requestScope.ring.price} VND</p>
                            <p class="card-text"><strong>Category:</strong> ${requestScope.ring.categoryID}</p>
                            <p class="card-text"><strong>Collection:</strong> ${requestScope.ring.collectionID}</p>
                            <p class="card-text"><strong>Ring Placement Name:</strong> ${requestScope.ring.ringPlacementName}</p>
                            <p class="card-text"><strong>Material:</strong> ${requestScope.ring.material}</p>
                            <p class="card-text"><strong>Ring Placement Color:</strong> ${requestScope.ring.ringColor}</p>
                            <p class="card-text"><strong>Ring Placement Price:</strong> ${requestScope.ring.rpPrice} VND</p>
                            <p class="card-text"><strong>Diamond Name:</strong> ${requestScope.ring.diamondName}</p>
                            <p class="card-text"><strong>Diamond Size:</strong> ${requestScope.ring.diamondSize}</p>
                            <p class="card-text"><strong>Carat Weight:</strong> ${requestScope.ring.caratWeight}</p>
                            <p class="card-text"><strong>Color:</strong> ${requestScope.ring.color}</p>
                            <p class="card-text"><strong>Clarity:</strong> ${requestScope.ring.clarity}</p>
                            <p class="card-text"><strong>Cut:</strong> ${requestScope.ring.cut}</p>
                            <p class="card-text"><strong>Diamond Price:</strong> ${requestScope.ring.diamondPrice} VND</p>
                            <p class="card-text"><strong>Total Price:</strong> ${requestScope.ring.totalPrice} VND</p>
                            <div class="d-flex flex-column align-items-center" role="group" aria-label="Voucher Actions">
                                <div class="button-top mb-2">
                                    <form action="DashboardController" method="post" style="display:inline-block; margin-right: 10px;">
                                        <input type="hidden" name="action" value="listofrings">
                                        <button type="submit" class="btn btn-primary">Ring List</button>
                                    </form>
                                    <form action="DashboardController" method="post" style="display:inline-block;">
                                        <input type="hidden" name="id" value="${requestScope.ring.ringID}">
                                        <input type="hidden" name="action" value="list">
                                        <button type="submit" class="btn btn-secondary">Dashboard</button>
                                    </form>
                                </div>
                                <div class="button-down mt-2">
                                    <form action="DashboardController" method="POST" style="display:inline-block; margin-right: 10px;">
                                        <input name="action" value="collectiondetails" type="hidden">
                                        <input name="id" value="${ring.collectionID}" type="hidden">
                                        <button type="submit" class="btn btn-primary">Collection</button>
                                    </form>
                                    <form action="DashboardController" method="POST" style="display:inline-block;">
                                        <input name="action" value="categorydetails" type="hidden">
                                        <input name="id" value="${ring.categoryID}" type="hidden">
                                        <button type="submit" class="btn btn-primary">Category</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script src="js/pagination.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.js"
                    integrity="sha512-8Z5++K1rB3U+USaLKG6oO8uWWBhdYsM3hmdirnOEWp8h2B1aOikj5zBzlXs8QOrvY9OxEnD2QDkbSKKpfqcIWw=="
            crossorigin="anonymous"></script>
            <script src="js/sidenav.js"></script>
    </body>
</html>

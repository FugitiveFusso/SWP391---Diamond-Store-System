<%@page import="com.khac.swp.fuj.diamond.DiamondDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Diamonds Management</title>
        <link rel="icon" type="image/x-icon" href="images/Screenshot__656_-removebg-preview.png">
        <link rel="stylesheet" href="css/navbar.css">
        <script src="https://unpkg.com/@phosphor-icons/web"></script>
        <link rel="stylesheet" href="css/staff_details.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/3.6.95/css/materialdesignicons.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/3.6.95/css/materialdesignicons.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

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
                width: 180px;
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
            a {
                text-decoration: none;
                color: black;
            }
            a:hover {
                text-decoration: none;
                color: black;
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
                <h1>${sessionScope.managersession.lastname} ${sessionScope.managersession.firstname}</h1>
            </header>

            <div class="menu">
                <div class="item"><a href="./DashboardController"><i class="fas fa-chart-line"></i>Dashboard</a></div>
                <div class="item"><a href="manageraccount.jsp"><i class="fas fa-user"></i>Account</a></div>
                <div class="item"><a href="managerlogin?action=logout"><i class="fas fa-right-from-bracket"></i>Logout</a></div>

            </div>
        </div>
        <div class="post-title">
            <h1>Diamond Details </h1>         
            <p> Login username: ${sessionScope.managersession.username}</p>
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
                            <% DiamondDTO diamond = (DiamondDTO) request.getAttribute("diamond"); %>

                            <% if (diamond != null && diamond.getCertificateID() != 0) { %>
                            <p class="card-text">
                                <a href="DashboardController?action=certificatedetails&id=${diamond.getCertificateID()}">
                                    <strong>Certificate ID:</strong> ${diamond.getCertificateID()}
                                </a>
                            </p>
                            <% } else { %>
                            <p class="card-text">
                                <strong>No valid Certificate ID found.</strong>
                            </p>
                            <% }%>              

                            <% if (diamond != null && diamond.getRingID() != 0) { %>
                            <p class="card-text">
                                <a href="DashboardController?action=ringdetails&id=${diamond.getRingID()}">
                                    <strong>Ring ID:</strong> ${diamond.getRingID()}
                                </a>
                            </p>
                            <% } else { %>
                            <p class="card-text">
                                <strong>No valid Ring ID found.</strong>
                            </p>
                            <% }%>                          
                            <p class="card-text"><strong>Price:</strong> ${requestScope.diamond.diamondPrice} VND</p>
                            <p class="card-text">
                                <strong>Status:</strong> 
                                <span style="color: 
                                      ${requestScope.diamond.status == 'active' ? 'green' : 
                                        (requestScope.diamond.status == 'deleted' ? 'red' : 'red')};">
                                          ${requestScope.diamond.status}
                                      </span>
                                </p>
                                <div class="btn-group" role="group" aria-label="Voucher Actions">
                                    <form action="DashboardController" method="post" class="mr-2">
                                        <input type="hidden" name="action" value="list">
                                        <button type="submit" class="btn btn-primary">Dashboard</button>
                                    </form>
                                    <form action="DashboardController" method="post">
                                        <input type="hidden" name="action" value="listofdiamonds">
                                        <button type="submit" class="btn btn-secondary">List of Diamonds</button>
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

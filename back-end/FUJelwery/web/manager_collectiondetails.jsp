<%@page import="com.khac.swp.fuj.ring.RingDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Collection Details</title>
        <link rel="stylesheet" href="css/navbar_admin.css">
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
        <script src="js/pagination.js"></script>
        <link rel="stylesheet" href="css/pagination.css">
        <link rel="stylesheet" href="css/collection_detail.css">
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
            <h1>Collection Details </h1>         
            <p> Login username: ${sessionScope.managersession.username}</p>
        </div>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 col-sm-6 col-12"> <!-- Adjust the column size as needed -->
                    <div class="card">
                        <!-- Left Column: Image -->
                        <div class="card-image-container">
                            <img src="${requestScope.collection.collectionImage}" class="card-img-left" alt="Voucher Image" style="width: 260px; height: 350px;">
                        </div>
                        <!-- Right Column: Information -->
                        <div class="card-body">
                            <h6 class="card-subtitle mb-2 text-muted">Collection ID: ${requestScope.collection.collectionID}</h6>
                            <h4 class="card-title" style="font-weight: 700">${requestScope.collection.collectionName}</h4>
                            <p class="card-text"><strong>Description: </strong> ${requestScope.collection.collectionDescription}</p>
                            <div class="btn-group d-flex justify-content-center align-items-center" role="group" aria-label="Voucher Actions">
                                <form action="DashboardController" method="post" class="mr-2">
                                    <input type="hidden" name="action" value="list">
                                    <button type="submit" class="btn btn-primary">Return</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <table id="pagination">
                <thead>
                    <tr>
                        <th>Ring ID</th>
                        <th>Ring Name</th>
                        <th>Ring Image</th>
                        <th>Diamond Name</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <tbody>

                    <%
                        List<RingDTO> list = (List<RingDTO>) request.getAttribute("ringclist");
                        for (RingDTO ring : list) {
                            pageContext.setAttribute("ring", ring);
                    %>
                    <tr>
                        <td>
                            <a href="DashboardController?action=ringdetails&id=${ring.ringID}">   ${ring.ringID}</td>
                        <td>${ring.ringName}</td>
                        <td><img src=${ring.ringImage} width="300px" height="300px"></td>
                        <td>${ring.diamondName}</td>
                        <td>${ring.totalPrice}</td>
                    </tr>
                    <%
                        }
                    %>    
                </tbody>
            </table>
            <div id="paginationControls" class="pagination-controls">
                <button id="prevButton" class="pagination-button"><i class="fas fa-chevron-left"></i></button>
                <div id="pageNumbers"></div>
                <button id="nextButton" class="pagination-button"><i class="fas fa-chevron-right"></i></button>
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

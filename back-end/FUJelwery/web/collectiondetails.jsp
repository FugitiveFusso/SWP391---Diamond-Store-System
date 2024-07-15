
<%@page import="com.khac.swp.fuj.ring.RingDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Collection Management Page</title>
        <link rel="icon" type="image/x-icon" href="images/Screenshot__656_-removebg-preview.png">
        <link rel="stylesheet" href="css/navbar_admin.css">
        <script src="https://unpkg.com/@phosphor-icons/web"></script>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
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
        <style>
            .pagination {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-top: 20px;
            }

            .pagination a, .pagination span {
                text-decoration: none;
                color: #1A1A3D;
                background-color: #fff;
                border: 1px solid #1A1A3D;
                border-radius: 50%;
                padding: 10px;
                width: 40px;
                height: 40px;
                margin: 0 5px;
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 16px;
                transition: background-color 0.3s, color 0.3s;
            }

            .pagination a:hover {
                background-color: #1A1A3D;
                color: #fff;
            }

            .pagination a.disabled, .pagination span.disabled {
                pointer-events: none;
                opacity: 0.5;
            }

            .pagination a.active, .pagination span.active {
                background-color: #1A1A3D;
                color: #fff;
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
                <div class="item"><a href="TransactionHistory"><i class="fas fa-money-bill"></i>View Transactions</a></div>

                <div class="item"><a href="salesstaffaccount.jsp"><i class="fas fa-user"></i>Account</a></div>
                <div class="item"><a href="saleslogin?action=logout"><i class="fas fa-right-from-bracket"></i>Logout</a></div>

            </div>
        </div>

        <div class="post-title">
            <h1>Collection Details </h1>         
            <p> Login username: ${sessionScope.salessession.username}</p>
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
                                <form action="CollectionController" method="post" class="mr-2">
                                    <input type="hidden" name="action" value="list">
                                    <button type="submit" class="btn btn-primary">Return</button>
                                </form>
                                <form action="CollectionController" method="post">
                                    <input type="hidden" name="id" value="${requestScope.collection.collectionID}">
                                    <input type="hidden" name="action" value="edit">
                                    <button type="submit" class="btn btn-secondary">Edit</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <table>
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
                            <a href="RingController?action=details&id=${ring.ringID}">   ${ring.ringID}</td>
                        <td>${ring.ringName}</td>
                        <td><img src=${ring.ringImage} width="300px" height="300px"></td>
                        <td>${ring.diamondName}</td>
                        <td>${ring.totalPrice} VND</td>
                    </tr>
                    <%
                        }
                    %>    
                </tbody>
            </table>
            <!-- Pagination controls -->
            <div class="pagination">
                <% int currentPage = (Integer) request.getAttribute("currentPage");
                    int totalPages = (Integer) request.getAttribute("totalPages");
                    String sortCol = (String) request.getAttribute("sortCol");
                    String keyword = (String) request.getAttribute("keyword");
                    int maxPagesToShow = 5; // Adjust this to change how many pages to show around current page
                %>

                <% if (currentPage > 1) {%>
                <a href="?page=<%= currentPage - 1%><%= !sortCol.isEmpty() ? "&colSort=" + sortCol : ""%><%= !keyword.isEmpty() ? "&keyword=" + keyword : ""%>" class="pagination-arrow">&#8249;</a>
                <% } else { %>
                <span class="pagination-arrow disabled">&#8249;</span>
                <% } %>

                <%
                    int startPage = Math.max(1, currentPage - (maxPagesToShow / 2));
                    int endPage = Math.min(totalPages, startPage + maxPagesToShow - 1);

                    if (startPage > 1) {%>
                <a href="?page=1<%= !sortCol.isEmpty() ? "&colSort=" + sortCol : ""%><%= !keyword.isEmpty() ? "&keyword=" + keyword : ""%>" class="pagination-number">1</a>
                <% if (startPage > 2) { %>
                <span class="pagination-ellipsis">...</span>
                <% }
                    }

                    for (int i = startPage; i <= endPage; i++) {%>
                <a href="?page=<%= i%><%= !sortCol.isEmpty() ? "&colSort=" + sortCol : ""%><%= !keyword.isEmpty() ? "&keyword=" + keyword : ""%>"
                   class="pagination-number <%= (i == currentPage) ? "active" : ""%>"><%= i%></a>
                <% }

                    if (endPage < totalPages) { %>
                <% if (endPage < totalPages - 1) { %>
                <span class="pagination-ellipsis">...</span>
                <% }%>
                <a href="?page=<%= totalPages%><%= !sortCol.isEmpty() ? "&colSort=" + sortCol : ""%><%= !keyword.isEmpty() ? "&keyword=" + keyword : ""%>" class="pagination-number"><%= totalPages%></a>
                <% }
                %>

                <% if (currentPage < totalPages) {%>
                <a href="?page=<%= currentPage + 1%><%= !sortCol.isEmpty() ? "&colSort=" + sortCol : ""%><%= !keyword.isEmpty() ? "&keyword=" + keyword : ""%>" class="pagination-arrow">&#8250;</a>
                <% } else { %>
                <span class="pagination-arrow disabled">&#8250;</span>
                <% }%>
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
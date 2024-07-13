
<%@page import="com.khac.swp.fuj.certificate.CertificateDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Certificate Management</title>
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
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/customer_list.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script src="js/pagination.js"></script>
        <link rel="stylesheet" href="css/pagination.css">
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
                <h1>${sessionScope.managersession.lastname} ${sessionScope.managersession.firstname}</h1>
            </header>

            <div class="menu">
                <div class="item"><a href="./DashboardController"><i class="fas fa-chart-line"></i>Dashboard</a></div>
                <div class="item"><a href="manageraccount.jsp"><i class="fas fa-user"></i>Account</a></div>
                <div class="item"><a href="managerlogin?action=logout"><i class="fas fa-right-from-bracket"></i>Logout</a></div>

            </div>
        </div>
        <div class="list-container">
            <div class="smaller-container">
                <div class="list1">
                    <div class="list-intro-left">
                        <div class="left-icon">
                            <i class='bx bx-certification' ></i>
                        </div>
                        <div class="left-info">
                            <div class="list-title">Certificate List</div>
                            <div class="">List of Certificate</div>
                        </div>
                    </div>
                    <div class="list-intro-right">
                        <form action="DashboardController" method="POST">
                            <input name="action" value="list" type="hidden">
                            <button type="submit" class="styled-button">
                                <div style="align-items: center;">
                                    Return to Dashboard
                                </div>                                           
                            </button>
                        </form>
                    </div>
                </div>


                <div class="list">
                    <form action="DashboardController" method="GET" id="searchbox">
                        <input name="action" type="hidden" value="listofcertificates">
                        <input name="keyword" type="text" class="search-input" value="<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>">
                        <button type="submit" class="search-button"><i class="fas fa-search"></i></button>
                    </form>

                    <table id="pagination">
                        <thead>
                            <tr>
                                <th>Certificate ID</th>
                                <th>Image</th>
                                <th>Description</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                List<CertificateDTO> list = (List<CertificateDTO>) request.getAttribute("certificatelist");
                                for (CertificateDTO certificate : list) {
                                    pageContext.setAttribute("certificate", certificate);
                            %>
                            <tr>
                                <td>
                                    <a href="DashboardController?action=certificatedetails&id=${certificate.certificateID}">   ${certificate.certificateID}</td>
                                <td><img src=${certificate.certificateImage} width="300px" height="300px" style="border-radius: 20px;"></td>
                                <td>${certificate.certificateDescription}</td>

                            </tr>
                            <%
                                }
                            %>    
                        </tbody>
                    </table>
                    <div class="pagination">
                        <% int currentPage = (Integer) request.getAttribute("currentPage");
                            int totalPages = (Integer) request.getAttribute("totalPages");
                            String sortCol = (String) request.getAttribute("sortCol");
                            String keyword = (String) request.getAttribute("keyword");
                            int maxPagesToShow = 5; // Adjust this to change how many pages to show around current page
                        %>

                        <% if (currentPage > 1) {%>
                        <a href="?action=listofcertificates&page=<%= currentPage - 1%><%= !sortCol.isEmpty() ? "&colSort=" + sortCol : ""%><%= !keyword.isEmpty() ? "&keyword=" + keyword : ""%>" class="pagination-arrow">&#8249;</a>
                        <% } else { %>
                        <span class="pagination-arrow disabled">&#8249;</span>
                        <% } %>

                        <%
                            int startPage = Math.max(1, currentPage - (maxPagesToShow / 2));
                            int endPage = Math.min(totalPages, startPage + maxPagesToShow - 1);

                            if (startPage > 1) {%>
                        <a href="?action=listofcertificates&page=1<%= !sortCol.isEmpty() ? "&colSort=" + sortCol : ""%><%= !keyword.isEmpty() ? "&keyword=" + keyword : ""%>" class="pagination-number">1</a>
                        <% if (startPage > 2) { %>
                        <span class="pagination-ellipsis">...</span>
                        <% }
                            }

                            for (int i = startPage; i <= endPage; i++) {%>
                        <a href="?action=listofcertificates&page=<%= i%><%= !sortCol.isEmpty() ? "&colSort=" + sortCol : ""%><%= !keyword.isEmpty() ? "&keyword=" + keyword : ""%>"
                           class="pagination-number <%= (i == currentPage) ? "active" : ""%>"><%= i%></a>
                        <% }

                            if (endPage < totalPages) { %>
                        <% if (endPage < totalPages - 1) { %>
                        <span class="pagination-ellipsis">...</span>
                        <% }%>
                        <a href="?action=listofcertificates&page=<%= totalPages%><%= !sortCol.isEmpty() ? "&colSort=" + sortCol : ""%><%= !keyword.isEmpty() ? "&keyword=" + keyword : ""%>" class="pagination-number"><%= totalPages%></a>
                        <% }
                        %>

                        <% if (currentPage < totalPages) {%>
                        <a href="?action=listofcertificates&page=<%= currentPage + 1%><%= !sortCol.isEmpty() ? "&colSort=" + sortCol : ""%><%= !keyword.isEmpty() ? "&keyword=" + keyword : ""%>" class="pagination-arrow">&#8250;</a>
                        <% } else { %>
                        <span class="pagination-arrow disabled">&#8250;</span>
                        <% }%>
                    </div>
                </div>
            </div>
        </div>



        <script src="js/pagination.js"></script>
        <script src="js/pagination.js"></script><script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.js"
                                                        integrity="sha512-8Z5++K1rB3U+USaLKG6oO8uWWBhdYsM3hmdirnOEWp8h2B1aOikj5zBzlXs8QOrvY9OxEnD2QDkbSKKpfqcIWw=="
        crossorigin="anonymous"></script>
        <script src="js/sidenav.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.0/dist/sweetalert2.all.min.js"></script>
        <script src="js/deleteConfirmation.js"></script>
    </body>
</html>

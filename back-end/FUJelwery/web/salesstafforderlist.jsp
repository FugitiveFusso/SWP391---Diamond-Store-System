<%@page import="com.khac.swp.fuj.order.OrderDTO"%>
<%@page import="com.khac.swp.fuj.ring.RingDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Management</title>
        <link rel="icon" type="image/x-icon" href="images/Screenshot__656_-removebg-preview.png">
        <link rel="stylesheet" href="css/navbar.css">
        <script src="https://unpkg.com/@phosphor-icons/web"></script>
        <link rel="stylesheet" href="css/customer_list.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script src="js/pagination.js"></script>
        <link rel="stylesheet" href="css/pagination.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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


        <div class="list-container">
            <div class="smaller-container">
                <div class="list1">
                    <div class="list-intro-left">
                        <div class="left-icon">
                            <i class='bx bxs-briefcase'></i>
                        </div>
                        <div class="left-info">
                            <div class="list-title">Order List</div>
                            <div class="">List of Orders</div>
                        </div>
                    </div>
                </div>
                <%
                    String errorMessage = (String) session.getAttribute("errorMessage");
                    if (errorMessage
                            != null) {
                %>
                <script>
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: '<%= errorMessage%>'
                    });
                </script>
                <%
                        session.removeAttribute("errorMessage"); // Optionally remove the message after displaying it
                    }
                %>
                <div class="list">
                    <form action='' method=GET id="searchbox"> 
                        <input name=keyword_a type=text class="search-input" value="<%=request.getParameter("keyword_a") != null ? request.getParameter("keyword_a") : ""%>">
                        <button type="submit" class="search-button"><i class="fas fa-search"></i></button>
                    </form>
                    <div class="title">Delivering Order</div>
                    <table id="pagination">
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Username</th>
                                <th>Ring Name</th>
                                <th>Ring Size</th>
                                <th>Date of Purchase</th>
                                <th>Destination</th>
                                <th>Warranty Name</th>
                                <th>Price</th>
                                <th>Accept</th>                   
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<OrderDTO> list = (List<OrderDTO>) request.getAttribute("salesorderlist");
                                for (OrderDTO salesorder : list) {
                                    pageContext.setAttribute("salesorder", salesorder);
                            %>
                            <tr>
                                <td>${salesorder.orderID}</td>
                                <td><a href="Staff_Customer_Controller?action=details&id=${salesorder.userID}">${salesorder.userName}</a></td>
                                <td><a href="RingController?action=details&id=${salesorder.ringID}">${salesorder.ringName}</a></td>
                                <td>${salesorder.ringSize}</td>
                                <td>${salesorder.orderDate}</td>
                                <td>${salesorder.address}</td>
                                <td>${salesorder.warrantyName}</td>
                                <td>${salesorder.totalPrice} VND</td>
                                <td>
                                    <form class="salesStaffOrderForm" action="SalesStaffOrderController" method="POST">
                                        <input name="action" value="accept" type="hidden">
                                        <input name="orderID" value="${salesorder.orderID}" type="hidden">
                                        <button type="submit" class="accept-btn">Accept</button>
                                    </form>
                                </td>
                            </tr>
                            <%
                                }
                            %>    
                        </tbody>
                    </table>

                    <div class="pagination">
                        <%
                            Integer currentPageA = (Integer) request.getAttribute("currentPageA");
                            Integer totalPagesA = (Integer) request.getAttribute("totalPagesA");
                            String keyword_a = (String) request.getAttribute("keyword_a");
                            Integer currentPageB = (Integer) request.getAttribute("currentPageB");
                            String keyword_b = (String) request.getAttribute("keyword_b");
                            int maxPagesToShow = 5;

                            String queryParamsA = (keyword_a != null && !keyword_a.isEmpty() ? "&keyword_a=" + keyword_a : "");
                            String queryParamsB = (keyword_b != null && !keyword_b.isEmpty() ? "&keyword_b=" + keyword_b : "");
                        %>

                        <% if (currentPageA > 1) {%>
                        <a href="?pageA=<%= currentPageA - 1%>&pageB=<%= currentPageB%><%= queryParamsA%><%= queryParamsB%>" class="pagination-arrow">&#8249;</a>
                        <% } else { %>
                        <span class="pagination-arrow disabled">&#8249;</span>
                        <% } %>

                        <%
                            int startPageA = Math.max(1, currentPageA - (maxPagesToShow / 2));
                            int endPageA = Math.min(totalPagesA, startPageA + maxPagesToShow - 1);

                            if (startPageA > 1) {%>
                        <a href="?pageA=1&pageB=<%= currentPageB%><%= queryParamsA%><%= queryParamsB%>" class="pagination-number">1</a>
                        <% if (startPageA > 2) { %>
                        <span class="pagination-ellipsis">...</span>
                        <% }
                            }

                            for (int i = startPageA; i <= endPageA; i++) {%>
                        <a href="?pageA=<%= i%>&pageB=<%= currentPageB%><%= queryParamsA%><%= queryParamsB%>" class="pagination-number <%= (i == currentPageA) ? "active" : ""%>"><%= i%></a>
                        <% }

                            if (endPageA < totalPagesA) { %>
                        <% if (endPageA < totalPagesA - 1) { %>
                        <span class="pagination-ellipsis">...</span>
                        <% }%>
                        <a href="?pageA=<%= totalPagesA%>&pageB=<%= currentPageB%><%= queryParamsA%><%= queryParamsB%>" class="pagination-number"><%= totalPagesA%></a>
                        <% } %>

                        <% if (currentPageA < totalPagesA) {%>
                        <a href="?pageA=<%= currentPageA + 1%>&pageB=<%= currentPageB%><%= queryParamsA%><%= queryParamsB%>" class="pagination-arrow">&#8250;</a>
                        <% } else { %>
                        <span class="pagination-arrow disabled">&#8250;</span>
                        <% }%>
                    </div>
                </div>

                <div class="list">
                    <form action='' method=GET id="searchbox"> 
                        <input name=keyword_b type=text class="search-input" value="<%=request.getParameter("keyword_b") != null ? request.getParameter("keyword_b") : ""%>">
                        <button type="submit" class="search-button"><i class="fas fa-search"></i></button>
                    </form>
                    <div class="title">Receive At Store</div>
                    <table id="pagination1">
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Username</th>
                                <th>Ring Name</th>
                                <th>Ring Size</th>
                                <th>Date of Purchase</th>
                                <th>Destination</th>
                                <th>Warranty</th>
                                <th>Price</th>
                                <th>Received ?</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                list = (List<OrderDTO>) request.getAttribute("receiveatstore");
                                for (OrderDTO salesorder : list) {
                                    pageContext.setAttribute("salesorder", salesorder);
                            %>
                            <tr>
                                <td>${salesorder.orderID}</td>
                                <td><a href="Staff_Customer_Controller?action=details&id=${salesorder.userID}">${salesorder.userName}</td>
                                <td>${salesorder.ringName}</td>
                                <td>${salesorder.ringSize}</td>
                                <td>${salesorder.orderDate}</td>
                                <td>${salesorder.address}</td>
                                <td>${salesorder.warrantyName}</td>
                                <td>${salesorder.totalPrice} VND</td>
                                <td>
                                    <form action="SalesStaffOrderController" method="POST">
                                        <input name="action" value="received" type="hidden">
                                        <input name="orderID" value="${salesorder.orderID}" type="hidden">
                                        <input name="ringID" value="${salesorder.ringID}" type="hidden">
                                        <button type="submit" class="btn">Customer has received at store</button>
                                    </form>
                                    <form class="salesStaffOrderForm" action="SalesStaffOrderController" method="POST">
                                        <input name="action" value="received" type="hidden">
                                        <input name="orderID" value="${salesorder.orderID}" type="hidden">
                                        <button type="submit" class="accept-btn">Accept</button>
                                    </form>
                                </td>
                            </tr>
                            <%
                                }
                            %>    
                        </tbody>
                    </table>    
                    <div class="pagination">
                        <%
                            Integer totalPagesB = (Integer) request.getAttribute("totalPagesB");
                        %>

                        <% if (currentPageB > 1) {%>
                        <a href="?pageB=<%= currentPageB - 1%>&pageA=<%= currentPageA%><%= queryParamsA%><%= queryParamsB%>" class="pagination-arrow">&#8249;</a>
                        <% } else { %>
                        <span class="pagination-arrow disabled">&#8249;</span>
                        <% } %>

                        <%
                            int startPageB = Math.max(1, currentPageB - (maxPagesToShow / 2));
                            int endPageB = Math.min(totalPagesB, startPageB + maxPagesToShow - 1);

                            if (startPageB > 1) {%>
                        <a href="?pageB=1&pageA=<%= currentPageA%><%= queryParamsA%><%= queryParamsB%>" class="pagination-number">1</a>
                        <% if (startPageB > 2) { %>
                        <span class="pagination-ellipsis">...</span>
                        <% }
                            }

                            for (int i = startPageB; i <= endPageB; i++) {%>
                        <a href="?pageB=<%= i%>&pageA=<%= currentPageA%><%= queryParamsA%><%= queryParamsB%>" class="pagination-number <%= (i == currentPageB) ? "active" : ""%>"><%= i%></a>
                        <% }

                            if (endPageB < totalPagesB) { %>
                        <% if (endPageB < totalPagesB - 1) { %>
                        <span class="pagination-ellipsis">...</span>
                        <% }%>
                        <a href="?pageB=<%= totalPagesB%>&pageA=<%= currentPageA%><%= queryParamsA%><%= queryParamsB%>" class="pagination-number"><%= totalPagesB%></a>
                        <% } %>

                        <% if (currentPageB < totalPagesB) {%>
                        <a href="?pageB=<%= currentPageB + 1%>&pageA=<%= currentPageA%><%= queryParamsA%><%= queryParamsB%>" class="pagination-arrow">&#8250;</a>
                        <% } else { %>
                        <span class="pagination-arrow disabled">&#8250;</span>
                        <% }%>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.js" integrity="sha512-8Z5++K1rB3U+USaLKG6oO8uWWBhdYsM3hmdirnOEWp8h2B1aOikj5zBzlXs8QOrvY9OxEnD2QDkbSKKpfqcIWw==" crossorigin="anonymous"></script>
        <script src="js/sidenav.js"></script>
        <script src="js/order_confirmation_sales.js"></script>
    </body>
</html>
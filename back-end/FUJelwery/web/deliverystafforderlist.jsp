<%@page import="com.khac.swp.fuj.order.OrderDTO"%>
<%@page import="com.khac.swp.fuj.ring.RingDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Delivery Management</title>
        <link rel="stylesheet" href="css/navbar.css">
        <script src="https://unpkg.com/@phosphor-icons/web"></script>
        <link rel="stylesheet" href="css/customer_list.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script src="js/pagination.js"></script>
        <link rel="stylesheet" href="css/pagination.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.js"
                integrity="sha512-8Z5++K1rB3U+USaLKG6oO8uWWBhdYsM3hmdirnOEWp8h2B1aOikj5zBzlXs8QOrvY9OxEnD2QDkbSKKpfqcIWw=="
        crossorigin="anonymous"></script>
        <script src="js/sidenav.js"></script>
        <script src="js/delivery_confirmation_deliverystaff.js"></script>
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
                <div class="item"><a href="DeliveryStaffOrderController"><i class="fas fa-layer-group"></i>Delivery Order</a></div>
                <div class="item"><a href="DeliveryHistory"><i class="fas fa-clock-rotate-left"></i>Delivery History</a></div>
                <div class="item"><a href="deliverystaffaccount.jsp"><i class="fas fa-user"></i>Account</a></div>
                <div class="item"><a href="deliverystafflogin?action=logout"><i class="fas fa-right-from-bracket"></i>Logout</a></div>
            </div>
        </div>

        <div class="list-container">
            <div class="smaller-container">
                <div class="list1">
                    <div class="list-intro-left">
                        <div class="left-icon">
                            <i class='bx bxs-package'></i>
                        </div>
                        <div class="left-info">
                            <div class="list-title">Order Delivery</div>
                            <div class="">List of Orders for Delivery</div>
                        </div>
                    </div>
                </div>
                <div class="list">
                    <form action='' method=GET id="searchbox"> 
                        <input name=keyword type=text class="search-input" value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>">
                        <button type="submit" class="search-button"><i class="fas fa-search"></i></button>
                    </form>
                    <table id="pagination">
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Username</th>
                                <th>Ring Name</th>
                                <th>Ring Size</th>
                                <th>Date of Purchase</th>
                                <th>Destination</th>
                                <th>Total Price</th>
                                <th>Status</th>
                                <th>Delivery Status</th>                      
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<OrderDTO> list = (List<OrderDTO>) request.getAttribute("deliverystafforderlist");
                                for (OrderDTO deliveryorder : list) {
                                    pageContext.setAttribute("deliveryorder", deliveryorder);
                            %>
                            <tr>
                                <td>${deliveryorder.orderID}</td>
                                <td><a href="Delivery_Customer_Controller?action=details&id=${deliveryorder.userID}">${deliveryorder.userName}</a></td>
                                <td>${deliveryorder.ringName}</td>
                                <td>${deliveryorder.ringSize}</td>
                                <td>${deliveryorder.orderDate}</td>
                                <td>${deliveryorder.address}</td>
                                <td>${deliveryorder.totalPrice}</td>
                                <td class="<%= "verified".equals(deliveryorder.getStatus()) ? "status-verified" : "shipping".equals(deliveryorder.getStatus()) ? "status-shipping" : "status-default"%>">
                                    ${deliveryorder.status}
                                </td>
                                <td>
                                    <form id="form-shipping-${deliveryorder.orderID}" action="DeliveryStaffOrderController" method="POST">
                                        <input name="action" value="shipping" type="hidden">
                                        <input name="orderID" value="${deliveryorder.orderID}" type="hidden">
                                        <button type="button" class="btn" onclick="confirmAction('shipping', '${deliveryorder.orderID}', '${deliveryorder.status}')">On shipping</button>
                                    </form>
                                    <form id="form-delivered-${deliveryorder.orderID}" action="DeliveryStaffOrderController" method="POST">
                                        <input name="action" value="delivered" type="hidden">
                                        <input name="orderID" value="${deliveryorder.orderID}" type="hidden">
                                        <button type="button" class="btn" onclick="confirmAction('delivered', '${deliveryorder.orderID}', '${deliveryorder.status}')">Delivered</button>
                                    </form>
                                </td>
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


        <script src="js/pagination.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.js" integrity="sha512-8Z5++K1rB3U+USaLKG6oO8uWWBhdYsM3hmdirnOEWp8h2B1aOikj5zBzlXs8QOrvY9OxEnD2QDkbSKKpfqcIWw==" crossorigin="anonymous"></script>
        <script src="js/sidenav.js"></script>
    </body>

</html>

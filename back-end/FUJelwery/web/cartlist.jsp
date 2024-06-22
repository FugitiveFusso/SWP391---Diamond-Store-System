<%@page import="com.khac.swp.fuj.order.OrderDTO"%>
<%@page import="com.khac.swp.fuj.ring.RingDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/navbaruser.css">
        <link rel="stylesheet" href="css/user_productlist.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="css/pagination.css">


    </head>
    <body>
        <%--<%@ include file="/productmenu.jsp" %>--%>

        <div class="menu">
            <ul class="navbar">
                <li class="navbar__link">
                    <a href="#">Jewelry</a>
                    <div class="sub-menu-1">
                        <ul>
                            <li><a href='./ProductController'>Ring</a></li>
                            <li><a href='./UserCollectionController'>Collection</a></li>
                        </ul>
                    </div>                  
                </li>
                <li class="navbar__link"><a href='./UserVoucherController'>Voucher</a></li>
                <li class="navbar__link">
                    <a href="static_webpages/certificate_edu.jsp">Education</a>
                    <div class="sub-menu-1">
                        <ul>
                            <li><a href='UserPostController'>Blog</a></li>
                            <li><a href='static_webpages/ringmeasuring.jsp'>Ring Measuring Guide</a></li>          
                            <li><a href='static_webpages/faqs.jsp'>Frequently Asking Questions</a></li>
                        </ul>
                    </div>
                </li>
                <a href="user_homepage.jsp"><img src="images/Screenshot (656).png"></a>
                <li class="navbar__link"><a href="user_aboutus.jsp">About Us</a></li>
                <li class="navbar__link"><a href="#">Order</a></li>
                <li class="navbar__link">
                    <a href="#">Account</a>
                    <div class="sub-menu-1">
                        <ul>
                            <li><a href='userlogin?action=logout'>Logout</a></li>          
                        </ul>
                    </div>
                </li>
            </ul>
        </div> 

        <div class="list-container">
            <div class="smaller-container">
                <div class="list-title">Your Cart</div>
                <div class="list">
                    <form action='' method=GET id="searchbox" class="center-searchbox"> 
                        <input name=keyword type=text class="search-input" value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>">
                        <button type="submit" class="search-button"><i class="fas fa-search"></i></button>
                    </form>

                    <%
                        List<OrderDTO> list = (List<OrderDTO>) request.getAttribute("cartlist");
                        int totalNumberOfThings = 0;
                        if (list != null) {
                            for (OrderDTO order : list) {
                                totalNumberOfThings = order.getNumberOfThings();
                            }
                        }
                        request.setAttribute("totalNumberOfThings", totalNumberOfThings);
                    %>

                    <h2>Total Items in Orders: ${totalNumberOfThings}</h2>


                    <table>
                        <tr>
                            <th>Ring Image</th>
                            <th>Ring Name</th>
                            <th>Ring Size</th>
                            <th>Price</th>
                            <th>Delete</th>
                        </tr>
                        <%
                            for (OrderDTO order : list) {
                                pageContext.setAttribute("order", order);
                        %>
                        <tr>
                            <td><img src="${order.image}" width="300px" alt="${order.ringName}"></td>
                            <td><a href="ProductController?action=details&id=${order.ringID}">${order.ringName}</a></td>
                            <td>${order.ringSize}</td>
                            <td>${order.totalPrice}</td>
                            <td>
                                <form action="OrderController" method="POST">
                                    <input name="action" value="delete" type="hidden">
                                    <input name="id" value="${order.orderID}" type="hidden">
                                    <input type="submit" value="Delete">
                                </form>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </table>

                </div>
            </div>
        </div>

        <h1>Total Price: ${totalPrice} VND</h1>

        <form action="OrderController" method="POST">
            <select name="purchaseMethod" required class="form-control" class="purchase">
                <option value="">Please select your preferred payment method: </option>
                <option value="Received at store" ${requestScope.order.purchaseMethod == 'Received at store' ? 'selected' : ''}>Received at store</option>
                <option value="Door-to=door delivery service" ${requestScope.order.purchaseMethod == 'Door-to-door delivery service' ? 'selected' : ''}>Door-to-door delivery service</option>
            </select>
            <input name="action" value="purchase" type="hidden">
            <input type="hidden" name="userid" value=${sessionScope.usersession.userid}>
            <input type="submit" value="Purchase">
        </form>

        <form action="OrderController" method="POST">
            <input name="action" value="applyVoucher" type="hidden">
            <input name="coupon" type="text" placeholder="Enter coupon code">
            <input type="hidden" name="userid" value=${sessionScope.usersession.userid}>
            <input type="submit" value="Apply Voucher">
        </form>
        <form action="OrderController" method="POST">
            <input name="action" value="removeVoucher" type="hidden">
            <input type="hidden" name="userid" value=${sessionScope.usersession.userid}>
            <input type="submit" value="Remove Voucher">
        </form>


        <div class="footer">
            <div class="footer-content">
                <div class="info">
                    <div class="info-img">
                        <img src="images/Screenshot (659).png" />
                    </div>

                    <div class="info-text">
                        <p>
                            Address: FPT University, District 9, HCMC
                        </p>
                        <p>
                            Email: CuongNPSE183844@fpt.edu.vn
                        </p>
                        <p>
                            Phone: (+ 84) 898876512
                        </p>
                        <p>
                            © Copyright 2024
                        </p>
                    </div>
                </div>

                <div class="customer-service">
                    <div class="customer-service-title">
                        Customer service
                    </div>

                    <div class="customer-service-text">
                        <p><a href="static_webpages/ringmeasuring.jsp">Instructions for measuring rings</a></p>
                        <p><a href="static_webpages/consulation.jsp">Product consultation by month of birth</a></p>
                        <p><a href="static_webpages/faqs.jsp">Frequently asked questions</a></p>
                    </div>
                </div>

                <div class="policy">
                    <div class="policy-title">
                        Policy
                    </div>

                    <div class="policy-text">
                        <p><a href="static_webpages/warrantyPolicy.jsp">Warranty Policy</a></p>
                        <p><a href="static_webpages/deliveryPolicy.jsp">Delivery Policy</a></p>
                        <p><a href="static_webpages/returnPolicy.jsp">Return Policy</a></p>
                        <p><a href="static_webpages/privatePolicy.jsp">Privacy policy</a></p>
                    </div>
                </div>
            </div>
        </div>


        <script src="js/productlist_pagination.js"></script>

    </body>
</html>

<%-- 
    Document   : cart
    Created on : Jun 5, 2024, 10:08:03 PM
    Author     : Dell
--%>

<%@page import="com.khac.swp.fuj.order.OrderDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <link rel="stylesheet" href="css/navbar.css">
        <link rel="stylesheet" href="css/staff_list.css">
    </head>
    <body>
       <div class="menu">
            <!--you will code the horizontal menu here-->
            <ul class="navbar">
                <li class="navbar__link"><a href="#">Order</a></li>
                <li class="navbar__link">
                    <a href="#">Products</a>
                    <div class="sub-menu-1">
                        <ul>
                            <li><a href='DiamondController'>Diamond</a></li>
                            <li><a href='RingController'>Ring</a></li>
                            <li><a href='CollectionController'>Collection</a></li>
                        </ul>
                    </div>                  
                </li>
                <li class="navbar__link"><a href='VoucherController'>Voucher</a></li>
                <img src="./images/Screenshot (656).png">
                <li class="navbar__link"><a href="#">Delivery Tracking</a></li>
                <li class="navbar__link">
                    <a href="#">Dashboard</a>
                    <div class="sub-menu-1">
                        <ul>
                            <li><a href='CustomerController'>View Customer</a></li>
                            <li><a href='ManagerController'>View Manager</a></li>
                            <li><a href='CertificateController'>View Certificate</a></li>
                            <li><a href='CategoryController'>View Category</a></li>
                        </ul>
                    </div>
                </li>
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

                <%@ include file="/menu.jsp" %>

        <div class="list-container">
            <div class="smaller-container">
                <div class="list-title">Cart</div>
                <div class="list">
                    <form action='' method=GET id="searchbox"> 
                        <input name=keyword type=text value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>">
                        <input type=submit value=Search >
                    </form>

                    <table>
                        <tr>
                            <th>Order ID</th>
                            <th><a href=?colSort=ringName>Ring Name</th>
                            <th><a href=?colSort=ringSize>Ring Size</th>
                            <th><a href=?colSort=totalPrice>Price</th>
                            <th>Delete</th>
                        </tr>
                        <%
                            List<OrderDTO> list = (List<OrderDTO>) request.getAttribute("cartlist");
                            for (OrderDTO cart : list) {
                                pageContext.setAttribute("cartlist", cart);
                        %>
                        <tr>
                            <td>
                                <a href="OrderController?action=details&id=${order.orderID}">   ${order.orderID}</td>
                            <td>${order.ringName}</td>
                            <td>${order.ringSize}</td>
                            <td>${order.totalPrice}</td>
                            <td>
                                <form action="RingController" method="POST">
                                    <input name="action" value="delete" type="hidden">
                                    <input name="id" value="${order.orderID}" type="hidden">
                                    <input type="submit" value="Delete">
                                </form>
                            </td>

                        </tr>
                        <%
                            }
                        %>    
                        <tr><td colspan="10">
                                <form action="RingController" method="POST">
                                    <input name="action" value="create" type="hidden">
                                    <input type="submit" value="Purchase">
                                </form>
                            </td></tr>
                    </table>
                </div>
            </div>

        </div>

    </body>
</html>

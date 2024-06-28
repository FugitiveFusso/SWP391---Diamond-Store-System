<%-- 
    Document   : deliveryorderhistory
    Created on : Jun 27, 2024, 8:24:42 PM
    Author     : Dell
--%>

<%@page import="java.util.List"%>
<%@page import="com.khac.swp.fuj.order.OrderDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <table>
                        <tr>
                            <th>Order ID</th>
                            <th>Username</th>
                            <th>Ring Name</th>
                            <th>Ring Size</th>
                            <th>Date of Purchase</th>
                            <th>Destination</th>
                            <th>Total Price</th>
                        </tr>
                        <%
                            List<OrderDTO >list = (List<OrderDTO>) request.getAttribute("deliveryhistory");
                            for (OrderDTO deliveryorder : list) {
                                pageContext.setAttribute("deliveryorder", deliveryorder);
                        %>
                        <tr>
                            <td><a href="DeliveryHistory?action=historydetails&id=${deliveryorder.orderID}">${deliveryorder.orderID}</td>
                            <td><a href="Delivery_Customer_Controller?action=details&id=${deliveryorder.userID}">${deliveryorder.userName}</a></td>
                            <td>${deliveryorder.ringName}</td>
                            <td>${deliveryorder.ringSize}</td>
                            <td>${deliveryorder.orderDate}</td>
                            <td>${deliveryorder.address}</td>
                            <td>${deliveryorder.totalPrice}</td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
    </body>
</html>

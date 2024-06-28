<%-- 
    Document   : salesorderhistory
    Created on : Jun 27, 2024, 8:24:30 PM
    Author     : Dell
--%>

<%@page import="com.khac.swp.fuj.order.OrderDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
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
                            List<OrderDTO> list = (List<OrderDTO>) request.getAttribute("saleshistory");
                            for (OrderDTO salesorder : list) {
                                pageContext.setAttribute("salesorder", salesorder);
                        %>
                        <tr>
                            <td><a href="SalesHistory?action=historydetails&id=${salesorder.orderID}">${salesorder.orderID}</td>
                            <td><a href="Staff_Customer_Controller?action=details&id=${salesorder.userID}">${salesorder.userName}</a></td>
                            <td>${salesorder.ringName}</td>
                            <td>${salesorder.ringSize}</td>
                            <td>${salesorder.orderDate}</td>
                            <td>${salesorder.address}</td>
                            <td>${salesorder.totalPrice}</td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
    </body>
</html>

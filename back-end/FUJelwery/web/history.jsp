<%-- 
    Document   : history
    Created on : Jun 26, 2024, 10:52:55 AM
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
                            <th>Ring Name</th>
                            <th>Ring Size</th>
                            <th>Date Purchased</th>
                            <th>Price</th>
                        </tr>
                        <%
                            List<OrderDTO> listForPastPurchase = (List<OrderDTO>) request.getAttribute("listpastpurchase");
                            for (OrderDTO bill : listForPastPurchase) {
                                pageContext.setAttribute("bill", bill);
                        %>
                        <tr>
                            <td><a href="HistoryController?action=details&id=${bill.orderID}">${bill.orderID}</td>
                            <td><a href="ProductController?action=details&id=${bill.ringID}">${bill.ringName}</td>
                            <td>${bill.ringSize}</td>
                            <td>${bill.orderDate}</td>
                            <td>${bill.totalPrice}</td>
                        </tr>
                        <%
                            }
                        %>    
                    </table>
    </body>
</html>

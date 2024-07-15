<%-- 
    Document   : transactionshistory
    Created on : Jul 15, 2024, 1:03:31 PM
    Author     : Dell
--%>

<%@page import="com.khac.swp.fuj.order.TransactionDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table id="pagination">
                        <thead>
                            <tr>
                                <th>Transaction ID</th>
                                <th>Username</th>
                                <th>Purchase Date</th>
                                <th>Total Price</th>              
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<TransactionDTO> list = (List<TransactionDTO>) request.getAttribute("transactionlist");
                                for (TransactionDTO transaction : list) {
                                    pageContext.setAttribute("transaction", transaction);
                            %>
                            <tr>
                                <td><a href="TransactionHistory?action=details&id=${transaction.transactionID}">${transaction.transactionID}</td>
                                <td><a href="Staff_Customer_Controller?action=details&id=${transaction.userID}">${transaction.userName}</td>
                                <td>${transaction.paymentDate}</td>
                                <td>${transaction.totalPrice} VND</td>
                            </tr>
                            <%
                                }
                            %>    
                        </tbody>
                    </table>
    </body>
</html>

<%-- 
    Document   : transactionforuser
    Created on : Jul 15, 2024, 3:14:28 PM
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
                        <td><a href="TransactionTracking?action=details&id=${transaction.transactionID}">${transaction.transactionID}</td>
                        <td>${transaction.paymentDate}</td>
                        <td>${transaction.totalPrice} VND</td>
                    </tr>
                    <%
                        }
                    %>    
                </tbody>
            </table>

    </html>

</body>
</html>

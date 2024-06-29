
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Item Details</title>
    </head>
    <body>
        <jsp:include page="/menu.jsp" flush="true" />
        <h1>Ring Details </h1>         
        <p> Login username: ${sessionScope.usersession.username}</p>

        <style>
            #searchbox{
                margin-top: 5px;
            }
            body{
                font-size: 16px;
                font-family: Arial, Helvetica, sans-serif;
            }
            table{
                margin-top: 10px
            }
            table, tr, td{
                border-collapse: collapse;
                width: 400px;
                border: 2px solid black;
                text-align: center;
            }
            tr,td{
                padding: 6px 10px;
            }
        </style>
        <table>

            <tr><td>Ring Name</td><td>${requestScope.order.ringName}</td></tr>
            <tr><td>Ring Size</td><td>${requestScope.order.ringSize}</td></tr>
            <tr><td>Voucher</td><td>${requestScope.order.voucherName}</td></tr>
            <tr><td>Price</td><td>${requestScope.order.totalPrice}</td></tr>
            

        </table>    
        <form action="OrderController" style="padding-top: 10px">
            <input type=hidden name="action" value="list">
            <input type=submit value="Return" ></form>
            
            <form action="OrderController" style="padding-top: 10px">
            <input type=hidden name="id" value="${requestScope.order.orderID}">
            <input type=hidden name="action" value="edit">
            <input type=submit value="Purchase" ></form>
    </body>
</html>

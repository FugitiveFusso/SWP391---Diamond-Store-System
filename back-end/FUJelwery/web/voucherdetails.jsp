
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="/salesmenu.jsp" flush="true" />

        <h1>Voucher Details </h1>         
        <p> Login username: ${sessionScope.salessession.username}</p>

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

            <tr><td>Voucher ID</td><td>${requestScope.voucher.id}</td></tr>
            <tr><td>Voucher Name</td><td>${requestScope.voucher.name}</td></tr>
            <tr><td>Voucher Image</td><td><img src=${requestScope.voucher.image} width="300px" height="300px"></td></tr>
            <tr><td>Description</td><td>${requestScope.voucher.description}</td></tr>
            <tr><td>Coupon</td><td>${requestScope.voucher.coupon}</td></tr>
            <tr><td>Percentage</td><td>${requestScope.voucher.percentage}%</td></tr>
        </table>

        <form action="VoucherController" style="padding-top: 10px">
            <input type=hidden name="action" value="list">
            <input type=submit value="Return" ></form>

        <form action="VoucherController" style="padding-top: 10px">
            <input type=hidden name="id" value="${requestScope.voucher.id}">
            <input type=hidden name="action" value="edit">
            <input type=submit value="Edit" ></form>
    </body>
</html>

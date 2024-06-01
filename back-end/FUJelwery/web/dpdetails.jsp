
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="/salesmenu.jsp" flush="true" />

        <h1>DiamondPrice Details </h1>         
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

            <tr><td>Diamond Price ID</td><td>${requestScope.dp.id}</td></tr>
            <tr><td>Diamond Size</td><td>${requestScope.dp.size}</td></tr>
            <tr><td>Carat Weight</td><td>${requestScope.dp.caratWeight}</td></tr>
            <tr><td>Color</td><td>${requestScope.dp.color}</td></tr>
            <tr><td>Clarity</td><td>${requestScope.dp.clarity}</td></tr>
            <tr><td>Cut</td><td>${requestScope.dp.cut}</td></tr>
            <tr><td>Price</td><td>${requestScope.dp.price}</td></tr>
        </table>

        <form action="DiamondPriceController" style="padding-top: 10px">
            <input type=hidden name="action" value="list">
            <input type=submit value="Return" ></form>

        <form action="DiamondPriceController" style="padding-top: 10px">
            <input type=hidden name="id" value="${requestScope.dp.id}">
            <input type=hidden name="action" value="edit">
            <input type=submit value="Edit" ></form>
    </body>
</html>

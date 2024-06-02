
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Warranty Management Page</title>
        <script>
            window.onload = function () {
                if (!sessionStorage.getItem('hasReloaded')) {
                    sessionStorage.setItem('hasReloaded', 'true');
                    location.reload();
                } else {
                    sessionStorage.removeItem('hasReloaded');
                }
            };
        </script>
    </head>
    <body>
        <jsp:include page="/salesmenu.jsp" flush="true" />

        <h1>Warranty Details </h1>         
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

            <tr><td>ID</td><td>${requestScope.warranty.id}</td></tr>
            <tr><td>Name</td><td>${requestScope.warranty.name}</td></tr>
            <tr><td>Image</td><td><img src=${requestScope.warranty.image} width="300px" height="300px"></td></tr>
            <tr><td>Month</td><td>${requestScope.warranty.month}</td></tr>
            <tr><td>Description</td><td>${requestScope.warranty.description}</td></tr>
            <tr><td>Type</td><td>${requestScope.warranty.type}</td></tr>
            <tr><td>Start Date</td><td>${requestScope.warranty.startdate}</td></tr>
            <tr><td>End Date</td><td>${requestScope.warranty.enddate}</td></tr>
            <tr><td>Terms and Conditions</td><td>${requestScope.warranty.termsandconditions}</td></tr>
        </table>

        <form action="WarrantyController" style="padding-top: 10px">
            <input type=hidden name="action" value="list">
            <input type=submit value="Return" ></form>

        <form action="WarrantyController" style="padding-top: 10px">
            <input type=hidden name="id" value="${requestScope.warranty.id}">
            <input type=hidden name="action" value="edit">
            <input type=submit value="Edit" ></form>
    </body>
</html>

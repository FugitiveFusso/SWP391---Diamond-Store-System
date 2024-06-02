
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ring Management Page</title>
        <script>
            window.onload = function() {
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
        <h1>Ring Details</h1>         
        <p>Login username: ${sessionScope.salessession.username}</p>

        <style>
            #searchbox {
                margin-top: 5px;
            }
            body {
                font-size: 16px;
                font-family: Arial, Helvetica, sans-serif;
            }
            table {
                margin-top: 10px;
            }
            table, tr, td {
                border-collapse: collapse;
                width: 400px;
                border: 2px solid black;
                text-align: center;
            }
            tr, td {
                padding: 6px 10px;
            }
        </style>
        <table>
            <tr><td>Ring Name</td><td>${requestScope.ring.ringName}</td></tr>
            <tr><td>Ring Image</td><td><img src="${requestScope.ring.ringImage}" width="300px" height="300px"></td></tr>
            <tr><td>Price</td><td>${requestScope.ring.price}</td></tr>
            <tr><td>Category</td><td>${requestScope.ring.categoryID}</td></tr>
            <tr><td>Collection</td><td>${requestScope.ring.collectionID}</td></tr>
            <tr><td>Ring Placement Name</td><td>${requestScope.ring.ringPlacementName}</td></tr>
            <tr><td>Material</td><td>${requestScope.ring.material}</td></tr>
            <tr><td>Ring Placement Color</td><td>${requestScope.ring.ringColor}</td></tr>
            <tr><td>Ring Placement Price</td><td>${requestScope.ring.rpPrice}</td></tr>
            <tr><td>Diamond Name</td><td>${requestScope.ring.diamondName}</td></tr>
            <tr><td>Diamond Size</td><td>${requestScope.ring.diamondSize}</td></tr>
            <tr><td>Carat Weight</td><td>${requestScope.ring.caratWeight}</td></tr>
            <tr><td>Color</td><td>${requestScope.ring.color}</td></tr>
            <tr><td>Clarity</td><td>${requestScope.ring.clarity}</td></tr>
            <tr><td>Cut</td><td>${requestScope.ring.cut}</td></tr>
            <tr><td>Diamond Price</td><td>${requestScope.ring.diamondPrice}</td></tr>
            <tr><td>Total Price</td><td>${requestScope.ring.totalPrice}</td></tr>
        </table>
        
        <form action="RingController" style="padding-top: 10px">
            <input type="hidden" name="action" value="list">
            <input type="submit" value="Return">
        </form>

        <form action="RingController" style="padding-top: 10px">
            <input type="hidden" name="id" value="${requestScope.ring.ringID}">
            <input type="hidden" name="action" value="edit">
            <input type="submit" value="Edit">
        </form>
    </body>
</html>

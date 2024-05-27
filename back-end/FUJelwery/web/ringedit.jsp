<%-- 
    Document   : ringedit
    Created on : May 27, 2024, 8:24:40 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ring Editing</title>
    </head>
    <body>
        <jsp:include page="/menu.jsp" flush="true" />

        <h1>Ring Edit </h1>
        <p> Login user: ${sessionScope.adminsession.username}</p>

        <form action="./RingController" method="POST">
            <table>

                <tr><td></td><td><input name="id" value="${requestScope.ring.ringID}" required="Please enter" type="hidden"</td></tr>
                <tr><td>Ring Name</td><td><input name="ringName" value="${requestScope.ring.ringName}" required="Please enter" </td></tr>
                <tr><td>Ring Image</td><td><input name="ringImage" value="${requestScope.ring.ringImage}" required="Please enter"</td></tr>
                <tr><td>Diamond ID</td><td><input name="diamondID" value="${requestScope.ring.diamondID}" required="Please enter"</td></tr>
                <tr><td>Gender</td><td><input name="gender" value="${requestScope.ring.gender}" required="Please enter" </td></tr>
                <tr><td>Price</td><td><input name="price" value="${requestScope.ring.price}" required="Please enter" </td></tr>
                <tr><td>Quantity</td><td><input name="quantity" value="${requestScope.ring.quantity}" required="Please enter"</td></tr>
                <tr><td>Category</td><td><input name="categoryID" value="${requestScope.ring.categoryID}" required="Please enter"</td></tr>
                <tr><td>Collection</td><td><input name="collectionID" value="${requestScope.ring.collectionID}" required="Please enter"</td></tr>
                <tr><td colspan="2">
                        <input name="action" value="${requestScope.nextaction}" type="hidden">
                        <input type="submit" value="Save">
                    </td></tr>
            </table>

        </form>
    </body>
</html>

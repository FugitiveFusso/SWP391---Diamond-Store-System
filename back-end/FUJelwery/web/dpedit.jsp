<%-- 
    Document   : dpedit
    Created on : Jun 1, 2024, 10:20:35 AM
    Author     : phucu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="/salesmenu.jsp" flush="true" />

        <h1>DiamondPrice Edit </h1>
        <p> Login user: ${sessionScope.salessession.username}</p>

        <form action="./DiamondPriceController" method="POST">
            <table>

                <tr><td></td><td><input name="id" value="${requestScope.dp.id}" required="Please enter" type="hidden"</td></tr>
                <tr><td>Diamond Size</td><td><input name="diamondSize" value="${requestScope.dp.size}" required="Please enter" </td></tr>
                <tr><td>Carat Weight</td><td><input name="caratWeight" value="${requestScope.dp.caratWeight}" required="Please enter" </td></tr>
                <tr><td>Color</td><td><input name="color" value="${requestScope.dp.color}" required="Please enter"</td></tr>
                <tr><td>Clarity</td><td><input name="clarity" value="${requestScope.dp.clarity}" required="Please enter" </td></tr>
                <tr><td>Cut</td><td><input name="cut" value="${requestScope.dp.cut}" required="Please enter"</td></tr>
                <tr><td>Price</td><td><input name="price" value="${requestScope.dp.price}" required="Please enter"</td></tr>
                <tr><td colspan="2">
                        <input name="action" value="${requestScope.nextaction}" type="hidden">
                        <input type="submit" value="Save">
                    </td></tr>
            </table>

        </form>
    </body>
</html>

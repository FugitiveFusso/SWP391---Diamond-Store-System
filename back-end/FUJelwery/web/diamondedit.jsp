<%-- 
    Document   : diamondedit
    Created on : May 27, 2024, 8:24:12 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Diamond Editing</title>
    </head>
    <body>
        <jsp:include page="/menu.jsp" flush="true" />

        <h1>Diamond Edit </h1>
        <p> Login user: ${sessionScope.adminsession.username}</p>

        <form action="./DiamondController" method="POST">
            <table>

                <tr><td></td><td><input name="id" value="${requestScope.diamond.diamondID}" required="Please enter" type="hidden"</td></tr>
                <tr><td>Diamond Name</td><td><input name="diamondName" value="${requestScope.diamond.diamondName}" required="Please enter" </td></tr>
                <tr><td>Diamond Image</td><td><input name="diamondImage" value="${requestScope.diamond.diamondImage}" required="Please enter"</td></tr>
                <tr><td>Origin</td><td><input name="origin" value="${requestScope.diamond.origin}" required="Please enter"</td></tr>
                <tr><td>Carat Weight</td><td><input name="caratWeight" value="${requestScope.diamond.caratWeight}" required="Please enter" </td></tr>
                <tr><td>Cut</td><td><input name="cut" value="${requestScope.diamond.cut}" required="Please enter"</td></tr>
                <tr><td>Color</td><td><input name="color" value="${requestScope.diamond.color}" required="Please enter"</td></tr>
                <tr><td>Clarity</td><td><input name="clarity" value="${requestScope.diamond.clarity}" required="Please enter"</td></tr>
                <tr><td>Certificate</td><td><input name="clarity" value="${requestScope.diamond.certificateID}" required="Please enter"</td></tr>
                <tr><td colspan="2">
                        <input name="action" value="${requestScope.nextaction}" type="hidden">
                        <input type="submit" value="Save">
                    </td></tr>
            </table>

        </form>
    </body>
</html>

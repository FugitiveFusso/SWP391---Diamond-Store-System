<%-- 
    Document   : categoryedit
    Created on : May 29, 2024, 10:49:56 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category Editing Page</title>
    </head>
    <body>
        <jsp:include page="/menu.jsp" flush="true" />

        <h1>Category Edit </h1>
        <p> Login user: ${sessionScope.adminsession.username}</p>

        <form action="./CategoryController" method="POST">
            <table>

                <tr><td></td><td><input name="id" value="${requestScope.category.categoryID}" required="Please enter" type="hidden"</td></tr>
                <tr><td>Category Name</td><td><input name="categoryName" value="${requestScope.category.categoryName}" required="Please enter" </td></tr>
                <tr><td colspan="2">
                        <input name="action" value="${requestScope.nextaction}" type="hidden">
                        <input type="submit" value="Save">
                    </td></tr>
            </table>

        </form>
    </body>
</html>

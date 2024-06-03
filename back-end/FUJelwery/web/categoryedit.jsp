
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category Editing Page</title>


        <script type="text/javascript">
            function validateInput() {
                var input = document.getElementsByName('id')[0];
                var value = input.value;
                if (value === "" || isNaN(value) || parseInt(value) < 0) {
                    alert("Please enter a non-negative integer.");
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body>
        <jsp:include page="/menu.jsp" flush="true" />


        <h1>Category Edit </h1>
        <p> Login user: ${sessionScope.adminsession.username}</p>

        <% String error1 = (String) request.getAttribute("error"); %>
        <% if (error1 != null) {%>
        <h4 style="color: red; text-align: center"> <%= error1%> </h4>
        <% }%>

        <form action="./CategoryController" method="POST" onsubmit="return validateInput()">
            <table>

                <tr>
                    <td>ID</td>
                    <td><input type="number" name="id" value="${requestScope.category.categoryID}" min="0" required></td>
                </tr>
                <tr><td>Category Name</td><td><input name="categoryName" value="${requestScope.category.categoryName}" required="Please enter" </td></tr>
                <tr><td colspan="2">
                        <input name="action" value="${requestScope.nextaction}" type="hidden">
                        <input type="submit" value="Save">
                    </td></tr>
            </table>

        </form>
    </body>
</html>

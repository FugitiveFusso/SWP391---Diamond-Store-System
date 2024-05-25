<%-- 
    Document   : adminedit
    Created on : May 25, 2024, 10:43:22 AM
    Author     : phucu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrator Management Page</title>
    </head>
    <body>
        <jsp:include page="/managermenu.jsp" flush="true" />

        <h1>Administrator Edit </h1>
        <p> Login user: ${sessionScope.managersession.username}</p>

        <form action="./AdminController" method="POST">
            <table>

                <tr><td></td><td><input name="id" value="${requestScope.admin.userid}" required="Please enter" type="hidden"</td></tr>
                <tr><td>User Name</td><td><input name="userName" value="${requestScope.admin.username}" required="Please enter" </td></tr>
                <tr><td>Password</td><td><input name="password" value="${requestScope.admin.password}" required="Please enter" </td></tr>
                <tr><td>First Name</td><td><input name="firstName" value="${requestScope.admin.firstname}" required="Please enter"</td></tr>
                <tr><td>Last Name</td><td><input name="lastName" value="${requestScope.admin.lastname}" required="Please enter"</td></tr>
                <tr><td>Phone Number</td><td><input name="phoneNumber" value="${requestScope.admin.phonenumber}" required="Please enter" </td></tr>
                <tr><td>Email</td><td><input name="email" value="${requestScope.admin.email}" required="Please enter"</td></tr>
                <tr><td>Address</td><td><input name="address" value="${requestScope.admin.address}" required="Please enter"</td></tr>
                <tr><td>Point</td><td><input name="point" value="${requestScope.admin.point}" required="Please enter"</td></tr>
                <tr><td></td><td><input name="roleID" value=1 required="Please enter"   type="hidden"</td></tr>
                <tr><td colspan="2">
                        <input name="action" value="${requestScope.nextaction}" type="hidden">
                        <input type="submit" value="Save">
                    </td></tr>
            </table>

        </form>
    </body>
</html>

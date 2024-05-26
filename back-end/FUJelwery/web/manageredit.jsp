<%-- 
    Document   : manageredit
    Created on : May 25, 2024, 11:18:03 AM
    Author     : phucu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Management Page</title>
    </head>
    <body>
        <jsp:include page="/menu.jsp" flush="true" />

        <h1>Manager Edit </h1>
        <p> Login user: ${sessionScope.adminsession.username}</p>

        <form action="./ManagerController" method="POST">
            <table>

                <tr><td></td><td><input name="id" value="${requestScope.manager.userid}" required="Please enter" type="hidden"</td></tr>
                <tr><td>User Name</td><td><input name="userName" value="${requestScope.manager.username}" required="Please enter" </td></tr>
                <tr><td>Password</td><td><input name="password" value="${requestScope.manager.password}" required="Please enter" </td></tr>
                <tr><td>First Name</td><td><input name="firstName" value="${requestScope.manager.firstname}" required="Please enter"</td></tr>
                <tr><td>Last Name</td><td><input name="lastName" value="${requestScope.manager.lastname}" required="Please enter"</td></tr>
                <tr><td>Phone Number</td><td><input name="phoneNumber" value="${requestScope.manager.phonenumber}" required="Please enter" </td></tr>
                <tr><td>Email</td><td><input name="email" value="${requestScope.manager.email}" required="Please enter"</td></tr>
                <tr><td>Address</td><td><input name="address" value="${requestScope.manager.address}" required="Please enter"</td></tr>
                <tr><td>Point</td><td><input name="point" value="${requestScope.manager.point}" required="Please enter"</td></tr>
                <tr><td></td><td><input name="roleID" value=2 required="Please enter"   type="hidden"</td></tr>
                <tr><td colspan="2">
                        <input name="action" value="${requestScope.nextaction}" type="hidden">
                        <input type="submit" value="Save">
                    </td></tr>
            </table>

        </form>
    </body>
</html>

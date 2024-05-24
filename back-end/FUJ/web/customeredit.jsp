<%-- 
    Document   : customeredit
    Created on : May 24, 2024, 7:55:03 PM
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
        <jsp:include page="/menu.jsp" flush="true" />

        <h1>Customer Edit </h1>
        <p> Login user: ${sessionScope.adminsession.username}</p>

        <form action="./CustomerController" method="POST">
            <table>

                <tr><td></td><td><input name="id" value="${requestScope.customer.userid}" required="Please enter" type="hidden"</td></tr>
                <tr><td>User Name</td><td><input name="userName" value="${requestScope.customer.username}" required="Please enter" </td></tr>
                <tr><td>First Name</td><td><input name="firstName" value="${requestScope.customer.firstname}" required="Please enter"</td></tr>
                <tr><td>Last Name</td><td><input name="lastName" value="${requestScope.customer.lastname}" required="Please enter"</td></tr>
                <tr><td>Phone Number</td><td><input name="phoneNumber" value="${requestScope.customer.phonenumber}" required="Please enter" </td></tr>
                <tr><td>Email</td><td><input name="email" value="${requestScope.customer.email}" required="Please enter"</td></tr>
                <tr><td>Address</td><td><input name="address" value="${requestScope.customer.address}" required="Please enter"</td></tr>
                <tr><td>Point</td><td><input name="point" value="${requestScope.customer.point}" required="Please enter"</td></tr>
                <tr><td></td><td><input name="roleID" value=5 required="Please enter"   type="hidden"</td></tr>
                <tr><td colspan="2">
                        <input name="action" value="${requestScope.nextaction}" type="hidden">
                        <input type="submit" value="Save">
                    </td></tr>
            </table>

        </form>
    </body>
</html>

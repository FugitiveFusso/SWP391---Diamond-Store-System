<%-- 
    Document   : customerlist
    Created on : May 24, 2024, 6:42:32 PM
    Author     : phucu
--%>

<%@page import="com.khac.swp.fuj.users.UserDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customers Page</title>
        <link rel="stylesheet" href="css/navbar.css">
        <link rel="stylesheet" href="css/staff_list.css">
    </head>
    <body>
        
        <div class="menu">
            <!--you will code the horizontal menu here-->
            <ul class="navbar">
                <li class="navbar__link"><a href="#">Order</a></li>
                <li class="navbar__link"><a href="#">Products</a></li>
                <li class="navbar__link"><a href="#">Voucher</a></li>
                <img src="./images/Screenshot (656).png">
                <li class="navbar__link"><a href="#">Delivery Tracking</a></li>
                <li class="navbar__link"><a href="#">Dashboard</a></li>
                <li class="navbar__link"><a href="#">Account</a></li>
            </ul>

        </div>
        <%@ include file="/menu.jsp" %>

        <div class="list-container">
            <div class="smaller-container">
                <div class="list-title">Staff List</div>
                <div class="list">
                    <form action='' method=GET id="searchbox"> 
                        <input name=keyword type=text value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>">
                        <input type=submit value=Search >
                    </form>

                    <table>
                        <tr>
                            <th>Customer ID</td>
                            <th><a href=?colSort=username>User Name</a></th>
                            <th><a href=?colSort=firstname>First Name</a></th>
                            <th><a href=?colSort=lastname>Last Name</a></th>
                            <th><a href=?colSort=email>Email</a></th>
                            <th>Address</th>
                            <th>Delete</th>
                        </tr>
                        <%
                            List<UserDTO> list = (List<UserDTO>) request.getAttribute("customerlist");
                            for (UserDTO customer : list) {
                                pageContext.setAttribute("customer", customer);
                        %>
                        <tr>
                            <td>
                                <a href="CustomerController?action=details&id=${customer.userid}">   ${customer.userid}</td>
                            <td>${customer.username}</td>
                            <td>${customer.firstname}</td>
                            <td>${customer.lastname}</td>
                            <td>${customer.email}</td>
                            <td>${customer.address}</td>
                            <td>
                                <form action="CustomerController" method="POST">
                                    <input name="action" value="delete" type="hidden">
                                    <input name="id" value="${customer.userid}" type="hidden">
                                    <input type="submit" value="Delete">
                                </form>
                            </td>

                        </tr>
                        <%
                            }
                        %>    

                    </table>
                </div>
            </div>
        </div>
    </body>
</html>

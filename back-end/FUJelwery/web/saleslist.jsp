<%-- 
    Document   : saleslist
    Created on : May 25, 2024, 11:30:40 AM
    Author     : phucu
--%>

<%@page import="java.util.List"%>
<%@page import="com.khac.swp.fuj.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sales Staff Management Page</title>
        <link rel="stylesheet" href="css/navbar.css">
        <link rel="stylesheet" href="css/staff_list.css">
        
    </head>
    <body>
<!--        <div class="menu">
            you will code the horizontal menu here
            <ul class="navbar">

                <li class="navbar__link">
                    <a href="#">Products</a>
                    <div class="sub-menu-1">
                        <ul>
                            <li><a href='DiamondController'>Diamond</a></li>
                            <li><a href='RingController'>Ring</a></li>
                            <li><a href='CollectionController'>Collection</a></li>
                        </ul>
                    </div>                  
                </li>
                <li class="navbar__link"><a href='VoucherController'>Voucher</a></li>
                <img src="./images/Screenshot (656).png">
                <li class="navbar__link">
                    <a href="#">Dashboard</a>
                    <div class="sub-menu-1">
                        <ul>
                            <li><a href='AdminController'>View Admins</a></li>   
                            <li><a href='DeliveryStaffController'>View Delivery Staffs</a></li>
                            <li><a href='SalesController'>View Sale Staffs</a></li>
                            <li><a href='CertificateController'>View Certificate</a></li>

                        </ul>
                    </div>
                </li>
                <li class="navbar__link">
                    <a href="#">Account</a>
                    <div class="sub-menu-1">
                        <ul>
                            <li><a href='adminlogin?action=logout'>Logout</a></li>          
                        </ul>
                    </div>
                </li>               
            </ul>
        </div>-->

        <%@ include file="/managermenu.jsp" %>

        <div class="list-container">
            <div class="smaller-container">
                <div class="list-title">Sale Staff List</div>
                <div class="list">
                    <form action='' method=GET id="searchbox"> 
                        <input name=keyword type=text value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>">
                        <input type=submit value=Search >
                    </form>

                    <table>
                        <tr>
                            <td>Sales Staff ID</td>
                            <td><a href=?colSort=username>User Name</a></td>
                            <td><a href=?colSort=firstname>First Name</a></td>
                            <td><a href=?colSort=lastname>Last Name</a></td>
                            <td><a href=?colSort=email>Email</a></td>
                            <td>Address</td>
                            <td>Delete</td>
                        </tr>
                        <%
                            List<UserDTO> list = (List<UserDTO>) request.getAttribute("saleslist");
                            for (UserDTO sales : list) {
                                pageContext.setAttribute("sales", sales);
                        %>
                        <tr>
                            <td>
                                <a href="SalesController?action=details&id=${sales.userid}">   ${sales.userid}</td>
                            <td>${sales.username}</td>
                            <td>${sales.firstname}</td>
                            <td>${sales.lastname}</td>
                            <td>${sales.email}</td>
                            <td>${sales.address}</td>
                            <td>
                                <form action="SalesController" method="POST" class="input">
                                    <input name="action" value="delete" type="hidden">
                                    <input name="id" value="${sales.userid}" type="hidden">
                                    <input type="submit" value="Delete">
                                </form>
                            </td>

                        </tr>
                        <%
                            }
                        %>    
                        <tr><td colspan="6">
                                <form action="SalesController" method="POST" class="input">
                                    <input name="action" value="create" type="hidden">
                                    <input type="submit" value="Create">
                                </form>
                            </td></tr>
                    </table>
                </div>
            </div>

        </div>



    </body>
</html>

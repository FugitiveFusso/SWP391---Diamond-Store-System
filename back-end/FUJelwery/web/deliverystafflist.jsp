<%-- 
    Document   : deliverystafflist
    Created on : May 25, 2024, 11:46:34 AM
    Author     : phucu
--%>

<%@page import="java.util.List"%>
<%@page import="com.khac.swp.fuj.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delivery Staff Management Page</title>
        <link rel="stylesheet" href="css/navbar.css">
        <link rel="stylesheet" href="css/staff_list.css">
    </head>
    <body>
        <div class="menu">
            <!--you will code the horizontal menu here-->
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
        </div>

        <%@ include file="/managermenu.jsp" %>
        <div class="list-container">
            <div class="smaller-container">
                <div class="list-title">Delivery Staff List</div>
                <div class="list">

                    <form action='' method=GET id="searchbox"> 
                        <input id="field" name=keyword type=text value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>">
                        <input type=submit value=Search >
                    </form>

                    <table>
                        <tr>
                            <th>Administrator ID</th>
                            <th><a href=?colSort=username>User Name</a></th>
                            <th><a href=?colSort=firstname>First Name</a></th>
                            <th><a href=?colSort=lastname>Last Name</a></th>
                            <th><a href=?colSort=email>Email</a></th>
                            <th>Address</th>
                            <th>Delete</th>
                        </tr>
                        <%
                            List<UserDTO> list = (List<UserDTO>) request.getAttribute("deliverystafflist");
                            for (UserDTO deliverystaff : list) {
                                pageContext.setAttribute("deliverystaff", deliverystaff);
                        %>
                        <tr>
                            <td>
                                <a href="DeliveryStaffController?action=details&id=${deliverystaff.userid}">   ${deliverystaff.userid}</td>
                            <td>${deliverystaff.username}</td>
                            <td style="font-weight: bold">${deliverystaff.firstname}</td>
                            <td style="font-weight: bold">${deliverystaff.lastname}</td>
                            <td>${deliverystaff.email}</td>
                            <td>${deliverystaff.address}</td>
                            <td>
                                <form action="DeliveryStaffController" method="POST">
                                    <input name="action" value="delete" type="hidden">
                                    <input name="id" value="${deliverystaff.userid}" type="hidden">
                                    <input type="submit" value="Delete">
                                </form>
                            </td>

                        </tr>
                        <%
                            }
                        %>    
                        <tr><td colspan="6">
                                <form action="AdminController" method="POST" class="input">
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

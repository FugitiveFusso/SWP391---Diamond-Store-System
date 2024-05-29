<%-- 
    Document   : ringlist
    Created on : May 27, 2024, 10:27:21 AM
    Author     : Dell
--%>

<%@page import="com.khac.swp.fuj.ring.RingDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ring Management</title>
        <link rel="stylesheet" href="css/navbar.css">
        <link rel="stylesheet" href="css/staff_list.css">
    </head>
    <body>
       <div class="menu">
            <!--you will code the horizontal menu here-->
            <ul class="navbar">
                <li class="navbar__link"><a href="#">Order</a></li>
                <li class="navbar__link">
                    <a href="#">Products</a>
                    <div class="sub-menu-1">
                        <ul>
                            <li><a href='DiamondController'>Diamond</a></li>
                            <li><a href='RingController'>Ring</a></li>
                        </ul>
                    </div>                  
                </li>
                <li class="navbar__link"><a href="VoucherController">Voucher</a></li>
                <img src="./images/Screenshot (656).png">
                <li class="navbar__link"><a href="#">Delivery Tracking</a></li>
                <li class="navbar__link">
                    <a href="#">Dashboard</a>
                    <div class="sub-menu-1">
                        <ul>
                            <li><a href='CustomerController'>View Customer</a></li>
                            <li><a href='ManagerController'>View Manager</a></li>
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

        <div class="list-container">
            <div class="smaller-container">
                <div class="list-title">Ring List</div>
                <div class="list">
                    <form action='' method=GET id="searchbox"> 
                        <input name=keyword type=text value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>">
                        <input type=submit value=Search >
                    </form>

                    <table>
                        <tr>
                            <th>Ring ID</th>
                            <th><a href=?colSort=ringName>Ring Name</th>
                            <th>Ring Image</th>
                            <th><a href=?colSort=diamondName>Diamond Name</a></th>
                            <th>Gender</th>
                            <th><a href=?colSort=price>Price</th>
                            <th><a href=?colSort=categoryID>Category</th>
                            <th><a href=?colSort=collectionID>Collection</th>
                            <th>Delete</th>
                        </tr>
                        <%
                            List<RingDTO> list = (List<RingDTO>) request.getAttribute("ringlist");
                            for (RingDTO ring : list) {
                                pageContext.setAttribute("ring", ring);
                        %>
                        <tr>
                            <td>
                                <a href="RingController?action=details&id=${ring.ringID}">   ${ring.ringID}</td>
                            <td>${ring.ringName}</td>
                            <td><img src=${ring.ringImage} width="300px" height="300px"></td>
                            <td>${ring.diamondName}</td>
                            <td>${ring.gender}</td>
                            <td>${ring.price}</td>
                            
                            <td>${ring.categoryID}</td>
                            <td>${ring.collectionID}</td>
                            <td>
                                <form action="RingController" method="POST">
                                    <input name="action" value="delete" type="hidden">
                                    <input name="id" value="${ring.ringID}" type="hidden">
                                    <input type="submit" value="Delete">
                                </form>
                            </td>

                        </tr>
                        <%
                            }
                        %>    
                        <tr><td colspan="10">
                                <form action="RingController" method="POST">
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

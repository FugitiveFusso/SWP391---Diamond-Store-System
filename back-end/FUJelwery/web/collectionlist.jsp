<%-- 
    Document   : collectionlist
    Created on : May 29, 2024, 10:46:59 AM
    Author     : Dell
--%>

<%@page import="com.khac.swp.fuj.collection.CollectionDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                            <li><a href='CollectionController'>Collection</a></li>
                        </ul>
                    </div>                  
                </li>
                <li class="navbar__link"><a href='VoucherController'>Voucher</a></li>
                <img src="./images/Screenshot (656).png">
                <li class="navbar__link"><a href="#">Delivery Tracking</a></li>
                <li class="navbar__link">
                    <a href="#">Dashboard</a>
                    <div class="sub-menu-1">
                        <ul>
                            <li><a href='CustomerController'>View Customer</a></li>
                            <li><a href='ManagerController'>View Manager</a></li>
                            <li><a href='CertificateController'>View Certificate</a></li>
                            <li><a href='CategoryController'>View Category</a></li>
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
                <div class="list-title">Collection List</div>
                <div class="list">
                    <form action='' method=GET id="searchbox"> 
                        <input name=keyword type=text value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>">
                        <input type=submit value=Search >
                    </form>

                    <table>
                        <tr>
                            <td>Collection ID</td>
                            <td><a href=?colSort=collectionName>Collection Name</a></td>
                            <td>Collection Image</td>
                            <td>Description</td>
                        </tr>
                        <%
                            List<CollectionDTO> list = (List<CollectionDTO>) request.getAttribute("collectionlist");
                            for (CollectionDTO collection : list) {
                                pageContext.setAttribute("collection", collection);
                        %>
                        <tr>
                            <td>
                                <a href="CollectionController?action=details&id=${collection.collectionID}">   ${collection.collectionID}</td>
                            <td>${collection.collectionName}</td>
                            <td><img src=${collection.collectionImage} width="300px" height="300px"></td>
                            <td>${collection.collectionDescription}</td>
                            <td>
                                <form action="CollectionController" method="POST">
                                    <input name="action" value="delete" type="hidden">
                                    <input name="id" value="${collection.collectionID}" type="hidden">
                                    <input type="submit" value="Delete">
                                </form>
                            </td>

                        </tr>
                        <%
                            }
                        %>    
                        <tr><td colspan="10">
                                <form action="CollectionController" method="POST">
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

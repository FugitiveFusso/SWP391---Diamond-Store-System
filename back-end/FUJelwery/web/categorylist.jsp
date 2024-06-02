<%-- 
    Document   : categorylist
    Created on : May 29, 2024, 10:49:30 AM
    Author     : Dell
--%>

<%@page import="com.khac.swp.fuj.category.CategoryDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category List</title>
        <link rel="stylesheet" href="css/navbar.css">
        <link rel="stylesheet" href="css/customer_list.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>
<!--        <div class="menu">
            you will code the horizontal menu here
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
                <li class="navbar__link"><a href="#">Delivery</a></li>
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
        </div>-->       
                <%@ include file="/menu.jsp" %>

                

        <div class="list-container">
            <div class="smaller-container">
                <div class="list1">
                    <div class="list-intro-left">
                        <div class="left-icon">
                            <i class='bx bx-category'></i>
                        </div>
                        <div class="left-info">
                            <div class="list-title">Category List</div>
                            <div class="">List of Category</div>
                        </div>
                    </div>
                    <div class="list-intro-right">
                        <form action="CategoryController" method="POST" class="input1">
                            <input name="action" value="create" type="hidden">
                            <button type="submit" class="styled-button">
                                <span>Add a Category</span>                                
                            </button>
                        </form>
                    </div>
                </div>
                
                <div class="list">
                    <form action='' method=GET id="searchbox"> 
                        <input name=keyword type=text class="search-input" value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>">
                        <button type="submit" class="search-button"><i class="fas fa-search"></i></button>
                    </form>

                    <table>
                        <tr>
                            <th>Category ID</th>
                            <th><a href=?colSort=categoryName>Category Name</a></th>
                            <th>Delete</th>
                        </tr>
                        <%
                            List<CategoryDTO> list = (List<CategoryDTO>) request.getAttribute("categorylist");
                            for (CategoryDTO category : list) {
                                pageContext.setAttribute("category", category);
                        %>
                        <tr>
                            <td>
                                <a href="CategoryController?action=details&id=${category.categoryID}">   ${category.categoryID}</td>
                            <td>${category.categoryName}</td>
                            <td>
                                <form action="CategoryController" method="POST" class="input">
                                    <input name="action" value="delete" type="hidden">
                                    <input name="id" value="${category.categoryID}" type="hidden">
                                    <input type="submit" value="Delete">
                                </form>
                            </td>

                        </tr>
                        <%
                            }
                        %>    
<!--                        <tr><td colspan="10">
                                <form action="CategoryController" method="POST">
                                    <input name="action" value="create" type="hidden">
                                    <input type="submit" value="Create">
                                </form>
                            </td></tr>-->
                    </table>
                </div>
            </div>             
        </div>



    </body>
</html>

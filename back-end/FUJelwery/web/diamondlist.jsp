<%-- 
    Document   : diamondetails
    Created on : May 25, 2024, 10:07:49 AM
    Author     : Dell
--%>

<%@page import="com.khac.swp.fuj.diamond.DiamondDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Diamond Management Page</title>
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
                    <ul class="dropdown">
                        <li><a href='DiamondController'>Diamond</a></li>
                        <li><a href='RingController'>Ring</a></li>
                    </ul>
                </li>
                <li class="navbar__link"><a href="#">Voucher</a></li>
                <img src="./images/Screenshot (656).png">
                <li class="navbar__link"><a href="#">Delivery Tracking</a></li>
                <li class="navbar__link">
                    <a href="#">Dashboard</a>
                    <ul class="dropdown">
                        <li><a href='CustomerController'>View Customer List</a></li>
                        <li><a href='ManagerController'>View Manager List</a></li>
                    </ul>
                </li>
                <li class="navbar__link">
                    <a href="#">Account</a>
                    <ul class="dropdown">
                        <li><a href='adminlogin?action=logout'>Log Out</a></li>                     
                    </ul>
                </li>
            </ul>
        </div>

        <div class="list-container">
            <div class="smaller-container">
                <div class="list-title">Diamond List</div>
                <div class="list">
                    <form action='' method=GET id="searchbox"> 
                        <input name=keyword type=text value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>">
                        <input type=submit value=Search >
                    </form>

                    <table>
                        <tr>
                            <th>Diamond ID</td>
                            <th><a href=?colSort=diamondName>Diamond Name</a></th>
                            <th>Diamond Image</th>
                            <th>Origin</th>
                            <th><a href=?colSort=caratWeight>Carat Weight</a></th>
                            <th>Cut</th>
                            <th>Color</th>
                            <th>Clarity</th>
                        </tr>
                        <%
                            List<DiamondDTO> list = (List<DiamondDTO>) request.getAttribute("diamondlist");
                            for (DiamondDTO diamond : list) {
                                pageContext.setAttribute("diamond", diamond);
                        %>
                        <tr>
                            <td>
                                <a href="DiamondController?action=details&id=${diamond.diamondID}">   ${diamond.diamondID}</td>
                            <td>${diamond.diamondName}</td>
                            <td><img src=${diamond.diamondImage} width="300px" height="300px"></td>
                            <td>${diamond.origin}</td>
                            <td>${diamond.caratWeight}</td>
                            <td>${diamond.cut}</td>
                            <td>${diamond.color}</td>
                            <td>${diamond.clarity}</td>
                            <td>
                                <form action="DiamondController" method="POST">
                                    <input name="action" value="delete" type="hidden">
                                    <input name="id" value="${diamond.diamondID}" type="hidden">
                                    <input type="submit" value="Delete">
                                </form>
                            </td>

                        </tr>
                        <%
                            }
                        %>    
                        <tr><td colspan="10">
                                <form action="DiamondController" method="POST">
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

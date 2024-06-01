<%-- 
    Document   : voucherlist
    Created on : May 29, 2024, 6:54:21 PM
    Author     : phucu
--%>

<%@page import="com.khac.swp.fuj.voucher.VoucherDTO"%>
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
<!--        <div class="menu">
            you will code the horizontal menu here
            <ul class="navbar">      
                <li class="navbar__link"><a href='#'>Orders</a></li>
                <li class="navbar__link"><a href='VoucherController'>Voucher</a></li>              
                <img src="./images/Screenshot (656).png">               
                <li class="navbar__link">
                    <a href="#">Account</a>
                    <div class="sub-menu-1">
                        <ul>
                            <li><a href='saleslogin?action=logout'>Logout</a></li>          
                        </ul>
                    </div>
                </li>
                
            </ul>
        </div>-->
                <%@ include file="/salesmenu.jsp" %>

        <div class="list-container">
            <div class="smaller-container">
                <div class="list-title">Voucher List</div>
                <div class="list">
                    <!-- <jsp:include page="/salesmenu.jsp" flush="true" /> -->
        
                    <form action='' method=GET id="searchbox"> 
                        <input name=keyword type=text value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>">
                        <input type=submit value=Search >
                    </form>

                    <table>
                        <tr>
                            <td>Voucher ID</td>
                            <td><a href=?colSort=postName>Voucher Name</a></td>
                            <td>Image</td>
                            <td>Description</td>

                        </tr>
                        <%
                            List<VoucherDTO> list = (List<VoucherDTO>) request.getAttribute("voucherlist");
                            for (VoucherDTO voucher : list) {
                                pageContext.setAttribute("voucher", voucher);
                        %>
                        <tr>
                            <td>
                                <a href="VoucherController?action=details&id=${voucher.id}">   ${voucher.id}</td>
                            <td>${voucher.name}</td>    
                            <td><img src=${voucher.image} width="300px" height="300px"></td>
                            <td>${voucher.description}</td>
                            <td>
                                <form action="VoucherController" method="POST">
                                    <input name="action" value="delete" type="hidden">
                                    <input name="id" value="${voucher.id}" type="hidden">
                                    <input type="submit" value="Delete">
                                </form>
                            </td>

                        </tr>
                        <%
                            }
                        %>    
                        <tr><td colspan="10">
                                <form action="VoucherController" method="POST">
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

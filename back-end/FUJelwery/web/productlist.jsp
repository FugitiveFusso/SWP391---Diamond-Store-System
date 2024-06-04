
<%@page import="com.khac.swp.fuj.ring.RingDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/navbar.css">

    </head>
    <body>
        <%--<%@ include file="/productmenu.jsp" %>--%>

        <div class="menu">
            <ul class="navbar">
                <li class="navbar__link">
                    <a href="#">Jewelry</a>
                    <div class="sub-menu-1">
                        <ul>
                            <li><a href='./ProductController'>Diamond</a></li>
                            <li><a href='./RingController'>Ring</a></li>
                            <li><a href='CollectionController'>Collection</a></li>
                        </ul>
                    </div>                  
                </li>
                <li class="navbar__link"><a href='./VoucherController'>Voucher</a></li>
                <li class="navbar__link"><a href="#">Blog</a></li>
                <a href="user_homepage.jsp"><img src="./images/Screenshot (656).png"></a>
                <li class="navbar__link"><a href="#">About Us</a></li>
                <li class="navbar__link"><a href="#">Order</a></li>

                <li class="navbar__link">
                    <a href="#">Account</a>
                    <div class="sub-menu-1">
                        <ul>
                            <li><a href='userlogin?action=logout'>Logout</a></li>          
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
                            <th><a href=?colSort=price>Price</th>
                            <th><a href=?colSort=categoryID>Category</th>
                            <th><a href=?colSort=collectionID>Collection</th>
                        </tr>
                        <%
                            List<RingDTO> list = (List<RingDTO>) request.getAttribute("productlist");
                            for (RingDTO product : list) {
                                pageContext.setAttribute("product", product);
                        %>
                        <tr>
                            <td>
                                <a href="ProductController?action=details&id=${product.ringID}">   ${product.ringID}</td>
                            <td>${product.ringName}</td>
                            <td><img src=${product.ringImage} width="300px" height="300px"></td>
                            <td>${product.diamondName}</td>
                            <td>${product.totalPrice}</td>
                            <td>${product.categoryID}</td>
                            <td>${product.collectionID}</td>

                        </tr>
                        <%
                            }
                        %>    
                        <tr><td colspan="10">
                            </td></tr>
                    </table>
                </div>
            </div>

        </div>

    </body>
</html>


<%@page import="com.khac.swp.fuj.ring.RingDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="/productmenu.jsp" %>


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

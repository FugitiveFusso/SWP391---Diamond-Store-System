<%-- 
    Document   : productlist
    Created on : Jun 2, 2024, 7:56:22 AM
    Author     : Dell
--%>

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
        <%@ include file="/salesmenu.jsp" %>


        <div class="list-container">
            <div class="smaller-container">
                <div class="list-title">Ring List</div>
                <div class="list">
                    <form action='' method=GET id="searchbox"> 
                        <input name=keyword type=text value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>">
                        <input type=submit value=Search >
                    </form>
                    <p>You need to add Diamond Price, Diamond, Ring Placement Price, before you add a new Ring</p>
                    <table>
                        <tr>
                            <th>Ring ID</th>
                            <th><a href=?colSort=ringName>Ring Name</th>
                            <th>Ring Image</th>
                            <th><a href=?colSort=diamondName>Diamond Name</a></th>
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
                            <td>${ring.totalPrice}</td>
                            <td>${ring.categoryID}</td>
                            <td>${ring.collectionID}</td>
                            <td>
                                <form action="ProductController" method="POST">
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
                                <form action="ProductController" method="POST">
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

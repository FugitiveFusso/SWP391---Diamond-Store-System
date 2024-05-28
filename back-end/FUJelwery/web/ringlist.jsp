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
    </head>
    <body>
        <h1>Ring List </h1>         
        <p> Login username: ${sessionScope.adminsession.username}</p>
        <%@ include file="/menu.jsp" %>
        <form action='' method=GET id="searchbox"> 
            <input name=keyword type=text value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>">
            <input type=submit value=Search >
        </form>
        <style>
            #searchbox{
                margin-top: 5px;
            }
            body{
                font-size: 16px;
                font-family: Arial, Helvetica, sans-serif;
            }
            table{
                margin-top: 10px
            }
            table, tr, td{
                border-collapse: collapse;
                width: 1000px;
                border: 1px solid black;
                text-align: center;
            }
            tr,td{
                padding: 6px 10px;
            }
        </style>
        <table>
            <tr>
                <td>Ring ID</td>
                <td><a href=?colSort=ringName>Ring Name</td>
                <td>Ring Image</td>
                <td><a href=?colSort=diamondName>Diamond Name</a></td>
                <td>Gender</td>
                <td><a href=?colSort=price>Price</td>
                <td><a href=?colSort=quantity>Quantity</td>
                <td><a href=?colSort=categoryID>Category</td>
                <td><a href=?colSort=collectionID>Collection</td>                
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
                <td>${ring.quantity}</td>
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
            <tr><td colspan="6">
                    <form action="RingController" method="POST">
                        <input name="action" value="create" type="hidden">
                        <input type="submit" value="Create">
                    </form>
                </td></tr>
        </table>
    </body>
</html>

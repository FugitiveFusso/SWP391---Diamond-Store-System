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
    </head>
    <body>
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
                margin-top: 10px;
                    width: 100%;
            }
            table, tr, td{
                border-collapse: collapse;
                border: 1px solid black;
                text-align: center;
            }
            tr,td{
                padding: 6px 10px;
            }
        </style>
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
    </body>
</html>

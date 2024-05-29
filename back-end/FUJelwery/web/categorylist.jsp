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
                <td>Category ID</td>
                <td><a href=?colSort=categoryName>Category Name</a></td>
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
                    <form action="CategoryController" method="POST">
                        <input name="action" value="delete" type="hidden">
                        <input name="id" value="${category.categoryID}" type="hidden">
                        <input type="submit" value="Delete">
                    </form>
                </td>

            </tr>
            <%
                }
            %>    
            <tr><td colspan="10">
                    <form action="CategoryController" method="POST">
                        <input name="action" value="create" type="hidden">
                        <input type="submit" value="Create">
                    </form>
                </td></tr>
        </table>
    </body>
</html>

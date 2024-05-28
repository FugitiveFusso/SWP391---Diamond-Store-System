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
                <td>Diamond ID</td>
                <td><a href=?colSort=diamondName>Diamond Name</a></td>
                <td>Diamond Image</td>
                <td>Origin</td>
                <td><a href=?colSort=caratWeight>Carat Weight</a></td>
                <td>Cut</td>
                <td>Color</td>
                <td>Clarity</td>
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
    </body>
</html>

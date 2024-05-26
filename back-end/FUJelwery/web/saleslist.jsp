<%-- 
    Document   : saleslist
    Created on : May 25, 2024, 11:30:40 AM
    Author     : phucu
--%>

<%@page import="java.util.List"%>
<%@page import="com.khac.swp.fuj.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sales Staff Management Page</title>
    </head>
    <body>
        <%@ include file="/managermenu.jsp" %>
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
                
                border: 2px solid black;
                text-align: center;
            }
            tr,td{
                padding: 6px 10px;
            }
        </style>
        <table>
            <tr>
                <td>Sales Staff ID</td>
                <td><a href=?colSort=username>User Name</a></td>
                <td><a href=?colSort=firstname>First Name</a></td>
                <td><a href=?colSort=lastname>Last Name</a></td>
                <td><a href=?colSort=email>Email</a></td>
                <td>Address</td>
                <td>Delete</td>
            </tr>
            <%
                List<UserDTO> list = (List<UserDTO>) request.getAttribute("saleslist");
                for (UserDTO sales : list) {
                    pageContext.setAttribute("sales", sales);
            %>
            <tr>
                <td>
                    <a href="SalesController?action=details&id=${sales.userid}">   ${sales.userid}</td>
                <td>${sales.username}</td>
                <td>${sales.firstname}</td>
                <td>${sales.lastname}</td>
                <td>${sales.email}</td>
                <td>${sales.address}</td>
                <td>
                    <form action="SalesController" method="POST">
                        <input name="action" value="delete" type="hidden">
                        <input name="id" value="${sales.userid}" type="hidden">
                        <input type="submit" value="Delete">
                    </form>
                </td>

            </tr>
            <%
                }
            %>    
            <tr><td colspan="6">
                    <form action="SalesController" method="POST">
                        <input name="action" value="create" type="hidden">
                        <input type="submit" value="Create">
                    </form>
                </td></tr>
        </table>
    </body>
</html>

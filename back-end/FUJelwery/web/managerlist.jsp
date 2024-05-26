<%-- 
    Document   : managerlist
    Created on : May 25, 2024, 11:09:09 AM
    Author     : phucu
--%>

<%@page import="java.util.List"%>
<%@page import="com.khac.swp.fuj.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Management Page</title>
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
                
                border: 2px solid black;
                text-align: center;
            }
            tr,td{
                padding: 6px 10px;
            }
        </style>
        <table>
            <tr>
                <td>Manager ID</td>
                <td><a href=?colSort=username>User Name</a></td>
                <td><a href=?colSort=firstname>First Name</a></td>
                <td><a href=?colSort=lastname>Last Name</a></td>
                <td><a href=?colSort=email>Email</a></td>
                <td>Address</td>
                <td>Delete</td>
            </tr>
            <%
                List<UserDTO> list = (List<UserDTO>) request.getAttribute("managerlist");
                for (UserDTO manager : list) {
                    pageContext.setAttribute("manager", manager);
            %>
            <tr>
                <td>
                    <a href="ManagerController?action=details&id=${manager.userid}">   ${manager.userid}</td>
                <td>${manager.username}</td>
                <td>${manager.firstname}</td>
                <td>${manager.lastname}</td>
                <td>${manager.email}</td>
                <td>${manager.address}</td>
                <td>
                    <form action="ManagerController" method="POST">
                        <input name="action" value="delete" type="hidden">
                        <input name="id" value="${manager.userid}" type="hidden">
                        <input type="submit" value="Delete">
                    </form>
                </td>

            </tr>
            <%
                }
            %>    
            <tr><td colspan="6">
                    <form action="ManagerController" method="POST">
                        <input name="action" value="create" type="hidden">
                        <input type="submit" value="Create">
                    </form>
                </td></tr>
        </table>
    </body>
</html>

<%-- 
    Document   : deliverystafflist
    Created on : May 25, 2024, 11:46:34 AM
    Author     : phucu
--%>

<%@page import="java.util.List"%>
<%@page import="com.khac.swp.fuj.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delivery Staff Management Page</title>
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
                <td>Delivery Staff ID</td>
                <td><a href=?colSort=username>User Name</a></td>
                <td><a href=?colSort=firstname>First Name</a></td>
                <td><a href=?colSort=lastname>Last Name</a></td>
                <td><a href=?colSort=email>Email</a></td>
                <td>Address</td>
                <td>Delete</td>
            </tr>
            <%
                List<UserDTO> list = (List<UserDTO>) request.getAttribute("deliverystafflist");
                for (UserDTO deliverystaff : list) {
                    pageContext.setAttribute("deliverystaff", deliverystaff);
            %>
            <tr>
                <td>
                    <a href="DeliveryStaffController?action=details&id=${deliverystaff.userid}">   ${deliverystaff.userid}</td>
                <td>${deliverystaff.username}</td>
                <td>${deliverystaff.firstname}</td>
                <td>${deliverystaff.lastname}</td>
                <td>${deliverystaff.email}</td>
                <td>${deliverystaff.address}</td>
                <td>
                    <form action="DeliveryStaffController" method="POST">
                        <input name="action" value="delete" type="hidden">
                        <input name="id" value="${deliverystaff.userid}" type="hidden">
                        <input type="submit" value="Delete">
                    </form>
                </td>

            </tr>
            <%
                }
            %>    
            <tr><td colspan="6">
                    <form action="DeliveryStaffController" method="POST">
                        <input name="action" value="create" type="hidden">
                        <input type="submit" value="Create">
                    </form>
                </td></tr>
        </table>
    </body>
</html>

<%-- 
    Document   : customerlist
    Created on : May 24, 2024, 6:42:32 PM
    Author     : phucu
--%>

<%@page import="com.khac.swp.fuj.users.UserDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customers Page</title>
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
                <td>Customer ID</td>
                <td><a href=?colSort=username>User Name</a></td>
                <td><a href=?colSort=firstname>First Name</a></td>
                <td><a href=?colSort=lastname>Last Name</a></td>
                <td><a href=?colSort=email>Email</a></td>
                <td>Address</td>
                <td>Delete</td>
            </tr>
            <%
                List<UserDTO> list = (List<UserDTO>) request.getAttribute("customerlist");
                for (UserDTO customer : list) {
                    pageContext.setAttribute("customer", customer);
            %>
            <tr>
                <td>
                    <a href="CustomerController?action=details&id=${customer.userid}">   ${customer.userid}</td>
                <td>${customer.username}</td>
                <td>${customer.firstname}</td>
                <td>${customer.lastname}</td>
                <td>${customer.email}</td>
                <td>${customer.address}</td>
                <td>
                    <form action="CustomerController" method="POST">
                        <input name="action" value="delete" type="hidden">
                        <input name="id" value="${customer.userid}" type="hidden">
                        <input type="submit" value="Delete">
                    </form>
                </td>

            </tr>
            <%
                }
            %>    
            
        </table>
    </body>
</html>

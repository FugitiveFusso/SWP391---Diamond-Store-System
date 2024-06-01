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
        <link rel="stylesheet" href="css/navbar.css">
        <link rel="stylesheet" href="css/staff_list.css">
        <style>
            /* CSS styles */
            p {
                font-family: Arial, sans-serif; /* Set font family */
                color: #333; /* Set text color */
                background-color: #f0f0f0; /* Set background color */
                padding: 10px; /* Add padding */
                margin: 0; /* Remove default margin */
                border: 1px solid #ccc; /* Add border */
                border-radius: 5px; /* Add border radius */
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Add box shadow */
                text-align: center
            }
        </style>
    </head>
    <body>

        <%@ include file="/salesmenu.jsp" %>
        <div class="list-container">
            <div class="smaller-container">
                <div class="list-title">Diamond List</div>
                <div class="list">
                    <form action='' method=GET id="searchbox"> 
                        <input name=keyword type=text value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>">
                        <input type=submit value=Search >
                    </form>
                    <p>You need to add Diamond Price, before you add a Diamond</p>
                    <table>
                        <tr>
                            <th>Diamond ID</td>
                            <th><a href=?colSort=diamondName>Diamond Name</a></th>
                            <th>Diamond Image</th>
                            <th>Origin</th>
                            <th><a href=?colSort=diamondSize>Diamond Size</a></th>
                            <th><a href=?colSort=caratWeight>Carat Weight</a></th>
                            <th>Cut</th>
                            <th><a href=?colSort=color>Color</a></th>
                            <th><a href=?colSort=clarity>Clarity</a></th>
                            <th><a href=?colSort=price>Price</a></th>
                            <th>Delete</th>                            
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
                            <td>${diamond.diamondSize}</td>
                            <td>${diamond.caratWeight}</td>
                            <td>${diamond.cut}</td>
                            <td>${diamond.color}</td>
                            <td>${diamond.clarity}</td>
                            <td>${diamond.diamondPrice}</td>
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
                </div>
            </div>

        </div>


    </body>
</html>

<%-- 
    Document   : dplist
    Created on : Jun 1, 2024, 9:49:23 AM
    Author     : phucu
--%>

<%@page import="com.khac.swp.fuj.diamondprice.DiamondPriceDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/staff_list.css">   
    </head>
    <body>
        <%@ include file="/salesmenu.jsp" %>

        <div class="list-container">
            <div class="smaller-container">
                <div class="list-title">DiamondPrice List</div>
                <div class="list">        
                    <form action='' method=GET id="searchbox"> 
                        <input name=keyword type=text value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>">
                        <input type=submit value=Search >
                    </form>

                    <table>
                        <tr>
                            <td>Diamond Price ID</td>
                            <td><a href=?colSort=diamondSize>Diamond Size</a></td>
                            <td><a href=?colSort=caratWeight>Diamond Weight</a></td>
                            <td><a href=?colSort=color>Color</a></td>
                            <td><a href=?colSort=clarity>Clarity</a></td>
                            <td>Cut</td>
                            <td><a href=?colSort=price>Price</a></td>

                        </tr>
                        <%
                            List<DiamondPriceDTO> list = (List<DiamondPriceDTO>) request.getAttribute("dplist");
                            for (DiamondPriceDTO dp : list) {
                                pageContext.setAttribute("dp", dp);
                        %>
                        <tr>
                            <td>
                                <a href="DiamondPriceController?action=details&id=${dp.id}">   ${dp.id}</td>
                            <td>${dp.size}</td>    
                            <td>${dp.caratWeight}</td>  
                            <td>${dp.color}</td>  
                            <td>${dp.clarity}</td>  
                            <td>${dp.cut}</td>  
                            <td>${dp.price}</td>  

                            <td>
                                <form action="DiamondPriceController" method="POST">
                                    <input name="action" value="delete" type="hidden">
                                    <input name="id" value="${dp.id}" type="hidden">
                                    <input type="submit" value="Delete">
                                </form>
                            </td>

                        </tr>
                        <%
                            }
                        %>    
                        <tr><td colspan="10">
                                <form action="DiamondPriceController" method="POST">
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

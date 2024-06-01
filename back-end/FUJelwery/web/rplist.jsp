

<%@page import="com.khac.swp.fuj.ringplacementprice.RingPlacementPriceDTO"%>
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
                <div class="list-title">Ring Price List</div>
                <div class="list">        
                    <form action='' method=GET id="searchbox"> 
                        <input name=keyword type=text value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>">
                        <input type=submit value=Search >
                    </form>

                    <table>
                        <tr>
                            <td>Ring Placement Price ID</td>
                            <td><a href=?colSort=rName>Ring Placement Name</a></td>
                            <td><a href=?colSort=material>Material</a></td>
                            <td><a href=?colSort=color>Color</a></td>
                            <td><a href=?colSort=rpPrice>Price</a></td>

                        </tr>
                        <%
                            List<RingPlacementPriceDTO> list = (List<RingPlacementPriceDTO>) request.getAttribute("rplist");
                            for (RingPlacementPriceDTO rp : list) {
                                pageContext.setAttribute("rp", rp);
                        %>
                        <tr>
                            <td>
                                <a href="RingPlacementPriceController?action=details&id=${rp.id}">   ${rp.id}</td>
                            <td>${rp.name}</td>    
                            <td>${rp.material}</td>  
                            <td>${rp.color}</td>  
                            <td>${rp.price}</td>  

                            <td>
                                <form action="RingPlacementPriceController" method="POST">
                                    <input name="action" value="delete" type="hidden">
                                    <input name="id" value="${rp.id}" type="hidden">
                                    <input type="submit" value="Delete">
                                </form>
                            </td>

                        </tr>
                        <%
                            }
                        %>    
                        <tr><td colspan="10">
                                <form action="RingPlacementPriceController" method="POST">
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

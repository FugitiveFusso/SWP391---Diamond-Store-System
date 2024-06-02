

<%@page import="com.khac.swp.fuj.diamondprice.DiamondPriceDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/staff_list.css"> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script src="js/pagination.js"></script>
        <link rel="stylesheet" href="css/pagination.css">

    </head>
    <body>
        <%@ include file="/salesmenu.jsp" %>

        <div class="list-container">
            <div class="smaller-container">
                <div class="list-title">Diamond Price List</div>
                <div class="list">        
                    <form action='' method=GET id="searchbox"> 
                        <input name=keyword type=text value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>">
                        <input type=submit value=Search >
                    </form>

                    <table id="pagination">
                        <thead>
                            <tr>
                                <td>Diamond Price ID</td>
                                <td><a href=?colSort=diamondSize>Diamond Size</a></td>
                                <td><a href=?colSort=caratWeight>Carat Weight</a></td>
                                <td><a href=?colSort=color>Color</a></td>
                                <td><a href=?colSort=clarity>Clarity</a></td>
                                <td>Cut</td>
                                <td><a href=?colSort=price>Price</a></td>

                            </tr>
                        </thead>
                        <tbody>

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
                        </tbody>
                    </table>
                    <div id="paginationControls" class="pagination-controls">
                        <button id="prevButton" class="pagination-button"><i class="fas fa-chevron-left"></i></button>
                        <div id="pageNumbers"></div>
                        <button id="nextButton" class="pagination-button"><i class="fas fa-chevron-right"></i></button>
                    </div>
                </div>
            </div>
        </div>

        <script src="js/pagination.js"></script>

    </body>
</html>

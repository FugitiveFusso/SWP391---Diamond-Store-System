
<%@page import="com.khac.swp.fuj.diamondprice.DiamondPriceDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Diamond Price Page</title>
        <link rel="stylesheet" href="css/customer_list.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script src="js/pagination.js"></script>
        <link rel="stylesheet" href="css/pagination.css">
    </head>
    <body>
        <div class="list-container">
            <div class="smaller-container">


                <div class="list">  
                    <div class="list1">
                        <div class="list-intro-left">
                            <div class="left-icon">
                                <i class='bx bx-diamond'></i>
                            </div>
                            <div class="left-info">
                                <div class="list-title">Diamond Price List</div>
                                <div class="">List of Diamond Price</div>
                            </div>
                        </div>
                    </div>
                    <form action='' method=GET id="searchbox">
                        <input name=keyword type=text class="search-input" value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>">
                        <button type="submit" class="search-button"><i class="fas fa-search"></i></button>
                    </form>

                    <table id="pagination">
                        <thead>
                            <tr>
                                <th><a href=?colSort=diamondSize>Diamond Size</a></th>
                                <th><a href=?colSort=caratWeight>Carat Weight</a></th>
                                <th><a href=?colSort=color>Color</a></th>
                                <th><a href=?colSort=clarity>Clarity</a></th>
                                <th>Cut</th>
                                <th><a href=?colSort=price>Price</a></th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                List<DiamondPriceDTO> list = (List<DiamondPriceDTO>) request.getAttribute("dplist");
                                for (DiamondPriceDTO dp : list) {
                                    pageContext.setAttribute("dp", dp);
                            %>
                            <tr>
                                <td>${dp.size}</td>    
                                <td>${dp.caratWeight}</td>  
                                <td>${dp.color}</td>  
                                <td>${dp.clarity}</td>  
                                <td>${dp.cut}</td>  
                                <td>${dp.price}</td>  
                            </tr>
                            <%
                                }
                            %>    


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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.js"
                integrity="sha512-8Z5++K1rB3U+USaLKG6oO8uWWBhdYsM3hmdirnOEWp8h2B1aOikj5zBzlXs8QOrvY9OxEnD2QDkbSKKpfqcIWw=="
        crossorigin="anonymous"></script>
        <script src="js/sidenav.js"></script>

    </body>
</html>

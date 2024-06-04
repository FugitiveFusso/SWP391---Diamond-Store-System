
<%@page import="com.khac.swp.fuj.diamond.DiamondDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Diamond Management Page</title>
        <link rel="stylesheet" href="css/navbar.css">
        <!--<link rel="stylesheet" href="css/staff_list.css">-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script src="js/pagination.js"></script>
        <link rel="stylesheet" href="css/pagination.css">
        <link rel="stylesheet" href="css/customer_list.css">

        <style>
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
                <div class="list1">
                    <div class="list-intro-left">
                        <div class="left-icon">
                            <i class='bx bx-diamond'></i>
                        </div>
                        <div class="left-info">
                            <div class="list-title">Diamond List</div>
                            <div class="">List of Diamond</div>
                        </div>
                    </div>
                    <div class="list-intro-right">
                        <form action="DiamondController" method="POST" class="input1">
                            <input name="action" value="create" type="hidden">
                            <button type="submit" class="styled-button">
                                <span>Add new Diamond</span>
                            </button>
                        </form>
                    </div>
                </div>
                <div class="list">
                    <form action='' method=GET id="searchbox"> 
                        <input name=keyword type=text class="search-input" value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>">
                        <button type="submit" class="search-button"><i class="fas fa-search"></i></button>
                    </form>
                    <p>You need to add Diamond Price, Certificate, before you add a Diamond</p>
                    <table id="pagination">
                        <thead>
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
                        </thead>
                        <tbody>
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
                                    <form action="DiamondController" method="POST" class="input">
                                        <input name="action" value="delete" type="hidden">
                                        <input name="id" value="${diamond.diamondID}" type="hidden">
                                        <input type="submit" value="Delete">
                                    </form>
                                </td>

                            </tr>
                            <%
                                }
                            %>    
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

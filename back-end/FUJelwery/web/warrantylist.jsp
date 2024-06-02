
<%@page import="com.khac.swp.fuj.warranty.WarrantyDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Warranty Management Page</title>
        <link rel="stylesheet" href="css/customer_list.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script src="js/pagination.js"></script>
        <link rel="stylesheet" href="css/pagination.css">
    </head>
    <body>
        <%@ include file="/salesmenu.jsp" %>
        <div class="list-container">
            <div class="smaller-container">
                <div class="list1">
                    <div class="list-intro-left">
                        <div class="left-icon">
                            <i class='bx bxs-badge-dollar'></i>
                        </div>
                        <div class="left-info">
                            <div class="list-title">Warranty List</div>
                            <div class="">List of Warranty</div>
                        </div>
                    </div>
                    <div class="list-intro-right">
                        <form action="WarrantyController" method="POST" class="input1">
                            <input name="action" value="create" type="hidden">
                            <button type="submit" class="styled-button3">
                                <span>Add a Warranty</span>
                            </button>
                        </form>
                    </div>
                </div>

                <div class="list">
                    <form action='' method=GET id="searchbox">
                        <input name=keyword type=text class="search-input" value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>">
                        <button type="submit" class="search-button"><i class="fas fa-search"></i></button>
                    </form>

                    <table id="pagination">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th><a href=?colSort=warrantyName>Name</a></th>
                                <th>Image</th>
                                <th><a href=?colSort=warrantyMonth>Month</a></th>
                                <th>Description</th>
                                <th><a href=?colSort=warrantyType>Warranty Type</a></th>
                                <th><a href=?colSort=startDate>Start Date</a></th>
                                <th><a href=?colSort=endDate>End Date</a></th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<WarrantyDTO> list = (List<WarrantyDTO>) request.getAttribute("warrantylist");
                                for (WarrantyDTO warranty : list) {
                                    pageContext.setAttribute("warranty", warranty);
                            %>
                            <tr>
                                <td style="text-align: center"><a href="WarrantyController?action=details&id=${warranty.id}">${warranty.id}</a></td>
                                <td style="width: 20%; text-align: center">${warranty.name}</td>
                                <td><img src=${warranty.image} width="250px" height="250px"></td>
                                <td style="text-align: center; width: 5%;">${warranty.month}</td>
                                <td style="width: 20%; text-align: center">${warranty.description}</td>
                                <td style="text-align: center">${warranty.type}</td>
                                <td style="text-align: center">${warranty.startdate}</td>
                                <td style="text-align: center">${warranty.enddate}</td>
                                <td>
                                    <form action="WarrantyController" method="POST" class="input">
                                        <input name="action" value="delete" type="hidden">
                                        <input name="id" value="${warranty.id}" type="hidden">
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
                        <span id="pageNumbers"></span>
                        <button id="nextButton" class="pagination-button"><i class="fas fa-chevron-right"></i></button>
                    </div>
                </div>
            </div>
        </div>

        <script src="js/pagination.js"></script>

    </body>
</html>

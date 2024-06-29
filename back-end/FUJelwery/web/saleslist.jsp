<%@page import="java.util.List"%>
<%@page import="com.khac.swp.fuj.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sales Staff Management Page</title>
        <link rel="stylesheet" href="css/navbar.css">
        <script src="https://unpkg.com/@phosphor-icons/web"></script>
        <link rel="stylesheet" href="css/customer_list.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script src="js/pagination.js"></script>
        <link rel="stylesheet" href="css/pagination.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.0/dist/sweetalert2.min.css">

    </head>
    <body>

        <div class="menu-btn">
            <div class="btn-cover">
                <i class="fas fa-bars"></i>
            </div>            
        </div>

        <div class="side-bar">
            <header>
                <div class="close-btn">
                    <i class="fa-solid fa-xmark"></i>
                </div>
                <img src="images/Screenshot (656).png">
                <h1>${sessionScope.adminsession.lastname} ${sessionScope.adminsession.firstname}</h1>
            </header>

            <div class="menu">               
                <div class="item"><a class="sub-btn"><i class="fas fa-table"></i>View List
                        <i class="fas fa-angle-right dropdown"></i>
                        <div class="sub-menu">
                            <a href="CustomerController" class="sub-item">Customer List</a>
                            <a href="AdminController" class="sub-item">Administrator List</a>
                            <a href="DeliveryStaffController" class="sub-item">Delivery Staff List</a>
                            <a href="SalesController" class="sub-item">Sale Staff List</a>
                            <a href="ManagerController" class="sub-item">Manager List</a>
                        </div>
                    </a>
                </div>

                <div class="item"><a href="PostController"><i class="fas fa-file"></i>Posts</a></div>

                <div class="item"><a href="adminaccount.jsp"><i class="fas fa-user"></i>Account</a></div>
                <div class="item"><a href="adminlogin?action=logout"><i class="fas fa-right-from-bracket"></i>Logout</a></div>

            </div>
        </div>

        <div class="list-container">
            <div class="smaller-container">
                <div class="list1">
                    <div class="list-intro-left">
                        <div class="left-icon">
                            <i class='bx bx-money'></i>
                        </div>
                        <div class="left-info">
                            <div class="list-title">Sale Staffs List</div>
                            <div class="">List of Sale Staffs</div>
                        </div>
                    </div>
                    <div class="list-intro-right">
                        <form action="SalesController" method="POST" class="input1">
                            <input name="action" value="create" type="hidden">
                            <button type="submit" class="styled-button">
                                <span>Add a Staff</span>                                           
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
                                <th>Sales Staff ID</th>
                                <th><a href=?colSort=username>User Name</a></th>
                                <th><a href=?colSort=firstname>First Name</a></th>
                                <th><a href=?colSort=lastname>Last Name</a></th>
                                <th><a href=?colSort=email>Email</a></th>
                                <th>Address</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<UserDTO> list = (List<UserDTO>) request.getAttribute("saleslist");
                                for (UserDTO sales : list) {
                                    pageContext.setAttribute("sales", sales);
                            %>
                            <tr>
                                <td>
                                    <a href="SalesController?action=details&id=${sales.userid}">   ${sales.userid}</td>
                                <td>${sales.username}</td>
                                <td>${sales.firstname}</td>
                                <td>${sales.lastname}</td>
                                <td>${sales.email}</td>
                                <td>${sales.address}</td>
                                <td>
                                    <form id="deleteForm" action="SalesController" method="POST" class="input">
                                        <input name="action" value="delete" type="hidden">
                                        <input name="id" value="${sales.userid}" type="hidden">
                                        <input type="submit" value="Delete"  class="deleteButton">
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.js"
                integrity="sha512-8Z5++K1rB3U+USaLKG6oO8uWWBhdYsM3hmdirnOEWp8h2B1aOikj5zBzlXs8QOrvY9OxEnD2QDkbSKKpfqcIWw=="
        crossorigin="anonymous"></script>
        <script src="js/sidenav.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.0/dist/sweetalert2.all.min.js"></script>
        <script src="js/deleteConfirmation.js"></script>


    </body>
</html>

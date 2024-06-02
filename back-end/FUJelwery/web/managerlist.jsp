
<%@page import="java.util.List"%>
<%@page import="com.khac.swp.fuj.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Management Page</title>
        <link rel="stylesheet" href="css/navbar.css">
        <link rel="stylesheet" href="css/customer_list.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="css/pagination.css">
        <script src="js/pagination.js"></script>

    </head>
    <body>
        <!--        <div class="menu">
                    you will code the horizontal menu here
                    <ul class="navbar">
                        <li class="navbar__link"><a href="#">Order</a></li>
                        <li class="navbar__link">
                            <a href="#">Products</a>
                            <div class="sub-menu-1">
                                <ul>
                                    <li><a href='DiamondController'>Diamond</a></li>
                                    <li><a href='RingController'>Ring</a></li>
                                    <li><a href='CollectionController'>Collection</a></li>
                                </ul>
                            </div>                  
                        </li>
                        <li class="navbar__link"><a href='VoucherController'>Voucher</a></li>
                        <img src="./images/Screenshot (656).png">
                        <li class="navbar__link"><a href="#">Delivery</a></li>
                        <li class="navbar__link">
                            <a href="#">Dashboard</a>
                            <div class="sub-menu-1">
                                <ul>
                                    <li><a href='CustomerController'>View Customer</a></li>
                                    <li><a href='ManagerController'>View Manager</a></li>
                                    <li><a href='CertificateController'>View Certificate</a></li>
                                    <li><a href='CategoryController'>View Category</a></li>
                                </ul>
                            </div>
                        </li>
                        <li class="navbar__link">
                            <a href="#">Account</a>
                            <div class="sub-menu-1">
                                <ul>
                                    <li><a href='adminlogin?action=logout'>Logout</a></li>          
                                </ul>
                            </div>
                        </li>
                        
                    </ul>
                </div>-->

        <jsp:include page="/menu.jsp" flush="true" />
        <div class="list-container">
            <div class="smaller-container">
                <div class="list1">
                    <div class="list-intro-left">
                        <div class="left-icon">
                            <i class='bx bx-user'></i>
                        </div>
                        <div class="left-info">
                            <div class="list-title">Manager List</div>
                            <div class="">List of Manager</div>
                        </div>
                    </div>
                    <div class="list-intro-right">
                        <form action="ManagerController" method="POST" class="input1">
                            <input name="action" value="create" type="hidden">
                            <button type="submit" class="styled-button">
                                <span>Add a Manager</span>                                
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
                                <th>Manager ID</th>
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
                                List<UserDTO> list = (List<UserDTO>) request.getAttribute("managerlist");
                                for (UserDTO manager : list) {
                                    pageContext.setAttribute("manager", manager);
                            %>
                            <tr>
                                <td>
                                    <a href="ManagerController?action=details&id=${manager.userid}">   ${manager.userid}</td>
                                <td>${manager.username}</td>
                                <td>${manager.firstname}</td>
                                <td>${manager.lastname}</td>
                                <td>${manager.email}</td>
                                <td>${manager.address}</td>
                                <td>
                                    <form action="ManagerController" method="POST" class="input">
                                        <input name="action" value="delete" type="hidden">
                                        <input name="id" value="${manager.userid}" type="hidden">
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

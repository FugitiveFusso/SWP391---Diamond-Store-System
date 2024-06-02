
<%@page import="java.util.List"%>
<%@page import="com.khac.swp.fuj.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrator Management Page</title>
        <link rel="stylesheet" href="css/navbar.css">
        <link rel="stylesheet" href="css/staff_list.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="js/pagination.js"></script>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="css/pagination.css">



    </head>
    <body>
        <!--        <div class="menu">
                    you will code the horizontal menu here
                    <ul class="navbar">
                        
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
                        <li class="navbar__link">
                            <a href="#">Dashboard</a>
                            <div class="sub-menu-1">
                                <ul>
                                    <li><a href='AdminController'>View Admins</a></li>   
                                    <li><a href='DeliveryStaffController'>View Delivery Staffs</a></li>
                                    <li><a href='SalesController'>View Sale Staffs</a></li>
                                    <li><a href='CertificateController'>View Certificate</a></li>
                                    
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

        <%@ include file="/managermenu.jsp" %>
        <p> Login username: ${sessionScope.adminsession.username}</p>

        <div class="list-container">
            <div class="smaller-container">
                <div class="list-title">Administrator List</div>
                <div class="list">

                    <form action='' method=GET id="searchbox"> 
                        <input id="field" name=keyword type=text value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>">
                        <input type=submit value=Search >
                    </form>

                    <table id="pagination">
                        <thead>
                            <tr>
                                <th>Administrator ID</th>
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
                                List<UserDTO> list = (List<UserDTO>) request.getAttribute("adminlist");
                                for (UserDTO admin : list) {
                                    pageContext.setAttribute("admin", admin);
                            %>
                            <tr>
                                <td>
                                    <a href="AdminController?action=details&id=${admin.userid}">   ${admin.userid}</td>
                                <td>${admin.username}</td>
                                <td style="font-weight: bold">${admin.firstname}</td>
                                <td style="font-weight: bold">${admin.lastname}</td>
                                <td>${admin.email}</td>
                                <td>${admin.address}</td>
                                <td>
                                    <form action="AdminController" method="POST" class="input">
                                        <input name="action" value="delete" type="hidden">
                                        <input name="id" value="${admin.userid}" type="hidden">
                                        <input type="submit" value="Delete">
                                    </form>
                                </td>

                            </tr>
                            <%
                                }
                            %>    
                        </tbody>
                        <tr><td colspan="6">
                                <form action="AdminController" method="POST" class="input">
                                    <input name="action" value="create" type="hidden">
                                    <input type="submit" value="Create">
                                </form>
                            </td></tr>

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

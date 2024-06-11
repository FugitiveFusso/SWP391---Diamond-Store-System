<%@page import="com.khac.swp.fuj.voucher.VoucherDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Voucher Page</title>
        <link rel="stylesheet" href="css/navbaruser.css">
        <link rel="stylesheet" href="css/customer_list.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script src="js/pagination.js"></script>
        <link rel="stylesheet" href="css/pagination.css">

    </head>
    <body>
        <div class="menu">
            <ul class="navbar">
                <li class="navbar__link">
                    <a href="#">Jewelry</a>
                    <div class="sub-menu-1">
                        <ul>
                            <li><a href='./ProductController'>Ring</a></li>
                            <li><a href='./UserCollectionController'>Collection</a></li>
                        </ul>
                    </div>                  
                </li>
                <li class="navbar__link"><a href='./UserVoucherController'>Voucher</a></li>
                <li class="navbar__link"><a href="./UserPostController">Blog</a></li>
                <a href="user_homepage.jsp"><img src="./images/Screenshot (656).png"></a>
                <li class="navbar__link"><a href="user_aboutus.jsp">About Us</a></li>
                <li class="navbar__link"><a href="#">Order</a></li>

                <li class="navbar__link">
                    <a href="#">Account</a>
                    <div class="sub-menu-1">
                        <ul>
                            <li><a href='userlogin?action=logout'>Logout</a></li>          
                        </ul>
                    </div>
                </li>

            </ul>
        </div> 
        <div class="list-container">
            <div class="smaller-container">
                <div class="list1">
                    <div class="list-intro-left">
                        <div class="left-icon">
                            <i class='bx bxs-badge-dollar'></i>
                        </div>
                        <div class="left-info">
                            <div class="list-title">Voucher List</div>
                            <div class="">List of Voucher</div>
                        </div>
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
                                <th>Voucher ID</th>
                                <th><a href=?colSort=postName>Voucher Name</a></th>
                                <th>Image</th>
                                <th>Created Date</th>
                                <th>Created By</th>
                                <th>Coupon</th>
                                <th>Description</th>
                                <th>Percentage</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<VoucherDTO> list = (List<VoucherDTO>) request.getAttribute("uservoucherlist");
                                for (VoucherDTO voucher : list) {
                                    pageContext.setAttribute("voucher", voucher);
                            %>
                            <tr>
                                <td><a href="UserVoucherController?action=details&id=${voucher.id}">${voucher.id}</a></td>
                                <td>${voucher.name}</td>
                                <td><img src=${voucher.image} width="300px" height="300px"></td>
                                <td>${voucher.createddate}</td>
                                <td>${voucher.createdby}</td>
                                <td>${voucher.coupon}</td>
                                <td>${voucher.description}</td>
                                <td>${voucher.percentage}</td>
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

        <!--<script src="js/pagination.js"></script>-->

    </body>
</html>


<%@page import="com.khac.swp.fuj.certificate.CertificateDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/navbar.css">
        <script src="https://unpkg.com/@phosphor-icons/web"></script>
        <link rel="stylesheet" href="css/customer_list.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script src="js/pagination.js"></script>
        <link rel="stylesheet" href="css/pagination.css">

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
        <!--<%@ include file="/salesmenu.jsp" %>-->
        
        <div class="header_menu">
            <div id="mySidenav" class="sidenav menu">
                <a href="javascript:void(0)" id="closebtn" class="closebtn" onclick="closeNav()">&times;</a>
                <ul>                   
                    <li>
                        <a href="javascript:void(0)" onclick="toggleSubMenu(this)">
                            <i class="icon ph-bold ph-user"></i>
                            <span class="text">View Product</span>
                            <i class="arrow ph-bold ph-caret-down"></i>
                        </a>
                        <ul class="sub-menu">
                            <li>
                                <a href="DiamondController">
                                    <span class="text">Diamond List</span>
                                </a>
                            </li>
                            <li>
                                <a href="RingController">
                                    <span class="text">Ring List</span>
                                </a>
                            </li>
                            <li>
                                <a href="CollectionController">
                                    <span class="text">Collection List</span>
                                </a>
                            </li>                           
                        </ul>
                        <a href="javascript:void(0)" onclick="toggleSubMenu(this)">
                            <i class="icon ph-bold ph-user"></i>
                            <span class="text">View Product Price</span>
                            <i class="arrow ph-bold ph-caret-down"></i>
                        </a>
                        <ul class="sub-menu">
                            <li>
                                <a href="DiamondPriceController">
                                    <span class="text">Diamond List</span>
                                </a>
                            </li>
                            <li>
                                <a href="RingPlacementPriceController">
                                    <span class="text">Ring List</span>
                                </a>
                            </li>                                                     
                        </ul>
                        <a href="javascript:void(0)" onclick="toggleSubMenu(this)">
                            <i class="icon ph-bold ph-user"></i>
                            <span class="text">View Document</span>
                            <i class="arrow ph-bold ph-caret-down"></i>
                        </a>
                        <ul class="sub-menu">
                            <li>
                                <a href="VoucherController">
                                    <span class="text">Voucher List</span>
                                </a>
                            </li>
                            <li>
                                <a href="WarrantyController">
                                    <span class="text">Warranty List</span>
                                </a>
                            </li> 
                            <li>
                                <a href="CertificateController">
                                    <span class="text">Certificate List</span>
                                </a>
                            </li> 
                        </ul>
                    </li>
                    <li class="active">
                        <a href="CategoryController">
                            <i class="icon ph-bold ph-file-text"></i>
                            <span class="text">View Category</span>
                        </a>
                    </li>                   
                </ul>
                <div class="menu">

                    <ul>
                        <li>
                            <a href="salesstaffaccount.jsp">
                                <i class="icon ph-bold ph-user"></i>
                                <span class="text">Account</span>
                            </a>
                        </li>
                        <li>
                            <a href="saleslogin?action=logout">
                                <i class="icon ph-bold ph-sign-out"></i>
                                <span class="text">Logout</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>


            <span class="cainut" style="font-size:30px;cursor:pointer;" onclick="openNav()">&#9776; Menu</span>
        </div>

        <div class="list-container">
            <div class="smaller-container">
                <div class="list1">
                    <div class="list-intro-left">
                        <div class="left-icon">
                            <i class='bx bx-certification' ></i>
                        </div>
                        <div class="left-info">
                            <div class="list-title">Certificate List</div>
                            <div class="">List of Certificate</div>
                        </div>
                    </div>
                    <div class="list-intro-right">
                        <form action="CertificateController" method="POST" class="input1">
                            <input name="action" value="create" type="hidden">
                            <button type="submit" class="styled-button">
                                <span>Add a Certificate</span>                                           
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
                                <th>Certificate ID</th>
                                <th>Image</th>
                                <th>Description</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                List<CertificateDTO> list = (List<CertificateDTO>) request.getAttribute("certificatelist");
                                for (CertificateDTO certificate : list) {
                                    pageContext.setAttribute("certificate", certificate);
                            %>
                            <tr>
                                <td>
                                    <a href="CertificateController?action=details&id=${certificate.certificateID}">   ${certificate.certificateID}</td>
                                <td><img src=${certificate.certificateImage} width="300px" height="300px"></td>
                                <td>${certificate.certificateDescription}</td>
                                <td>
                                    <form action="CertificateController" method="POST" class="input">
                                        <input name="action" value="delete" type="hidden">
                                        <input name="id" value="${certificate.certificateID}" type="hidden">
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
        <script src="js/pagination.js"></script><script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.js"
                                                        integrity="sha512-8Z5++K1rB3U+USaLKG6oO8uWWBhdYsM3hmdirnOEWp8h2B1aOikj5zBzlXs8QOrvY9OxEnD2QDkbSKKpfqcIWw=="
        crossorigin="anonymous"></script>
        <script src="js/sidenav.js"></script>

    </body>
</html>

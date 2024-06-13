<%@page import="com.khac.swp.fuj.order.OrderDTO"%>
<%@page import="com.khac.swp.fuj.ring.RingDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/navbaruser.css">
        <link rel="stylesheet" href="css/user_productlist.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="css/pagination.css">

    </head>
    <body>
        <%--<%@ include file="/productmenu.jsp" %>--%>

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
                <li class="navbar__link">
                    <a href="static_webpages/certificate_edu.jsp">Education</a>
                    <div class="sub-menu-1">
                        <ul>
                            <li><a href='UserPostController'>Blog</a></li>
                            <li><a href='static_webpages/ringmeasuring.jsp'>Ring Measuring Guide</a></li>          
                            <li><a href='static_webpages/faqs.jsp'>Frequently Asking Questions</a></li>
                        </ul>
                    </div>
                </li>
                <a href="user_homepage.jsp"><img src="images/Screenshot (656).png"></a>
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


        <div class="bannerContainer">
            <div class="bannerContent">
                <div class="bannerText">
                    <p class="intro">To day we have</p>
                    <h1>Diamond</h1>
                    <div class="description_hero">
                        <span>Round is our most popular cut. For almost 100 years, diamond cutters have been using advanced theories of light behavior and precise mathematical calculations to optimize the fire and brilliance in a round diamond. Round cuts also have the widest variety of setting styles so you can customize to your heart's content.</span>
                    </div>
                    <a style="margin-top: 15px" class="slpBtn" title="Shop Diamond" href="productlist.jsp">Shop Diamond</a>
                </div>
                <div class="bannerImage">
                    <img src="images/diamond_hero.webp" id="diamondHero" style="width: 432px; height: 432px">
                </div>
            </div>
        </div>

        <div class="list-container">
            <div class="smaller-container">
                <div class="list-title">Ring List</div>
                <div class="list">
                    <form action='' method=GET id="searchbox"> 
                        <input name=keyword type=text value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>">
                        <input type=submit value=Search >
                    </form>

                    <table>
                        <tr>
                            <th>Order ID</th>
                            <th>Ring Name</th>
                            <th>Ring Size</th>
                            <th>Price</th>
                            <th>Delete</th>
                        </tr>
                        <%
                            List<OrderDTO> list = (List<OrderDTO>) request.getAttribute("cartlist");
                            for (OrderDTO order : list) {
                                pageContext.setAttribute("order", order);
                        %>
                        <tr>
                            <td>
                                ${order.orderID}</td>
                            <td>${order.ringName}</td>
                            <td>${order.ringSize}</td>
                            <td>${order.totalPrice}</td>
                            <td>
                                <form action="OrderController" method="POST">
                                    <input name="action" value="delete" type="hidden">
                                    <input name="id" value="${order.orderID}" type="hidden">
                                    <input type="submit" value="Delete">
                                </form>
                            </td>

                        </tr>
                        <%
                            }
                        %>    
                        <tr><td colspan="10">
                                <form action="OrderController" method="POST">
                                    <input name="action" value="create" type="hidden">
                                    <input type="submit" value="Create">
                                </form>
                            </td></tr>
                    </table>

                    <div class="footer">
                        <div class="footer-content">
                            <div class="info">
                                <div class="info-img">
                                    <img src="images/Screenshot (659).png" />
                                </div>

                                <div class="info-text">
                                    <p>
                                        Address: FPT University, District 9, HCMC
                                    </p>
                                    <p>
                                        Email: CuongNPSE183844@fpt.edu.vn
                                    </p>
                                    <p>
                                        Phone: (+ 84) 898876512
                                    </p>
                                    <p>
                                        © Copyright 2024
                                    </p>
                                </div>
                            </div>

                            <div class="customer-service">
                                <div class="customer-service-title">
                                    Customer service
                                </div>

                                <div class="customer-service-text">
                                    <p><a href="static_webpages/ringmeasuring.jsp">Instructions for measuring rings</a></p>
                                    <p><a href="static_webpages/consulation.jsp">Product consultation by month of birth</a></p>
                                    <p><a href="static_webpages/faqs.jsp">Frequently asked questions</a></p>
                                </div>
                            </div>

                            <div class="policy">
                                <div class="policy-title">
                                    Policy
                                </div>

                                <div class="policy-text">
                                    <p><a href="static_webpages/warrantyPolicy.jsp">Warranty Policy</a></p>
                                    <p><a href="static_webpages/deliveryPolicy.jsp">Delivery Policy</a></p>
                                    <p><a href="static_webpages/returnPolicy.jsp">Return Policy</a></p>
                                    <p><a href="static_webpages/privatePolicy.jsp">Privacy policy</a></p>
                                </div>
                            </div>
                        </div>
                    </div>


                    <script src="js/productlist_pagination.js"></script>

                    </body>
                    </html>

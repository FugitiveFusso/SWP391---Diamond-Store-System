<%@page import="com.khac.swp.fuj.order.OrderDTO"%>
<%@page import="com.khac.swp.fuj.ring.RingDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Order Tracking</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/user_accountdetails.css">
        <link rel="stylesheet" href="css/navigation_bar.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    </head>
    <body>

        <div class="header">
            <div class="header-top">
                <div class="top-info-left">
                    <ul>
                        <li>Timeless elegance and craftsmanship</li>
                        <li style="margin-left: 30px">at FUJ Jewelry Online Shop.</li>                         
                    </ul>
                </div>
                <a href="user_homepage.jsp"><img src="./images/Screenshot (656).png"></a>
                <div class="top-info-right">
                    <ul>
                        <li>FUJ Jewelry Shop - <strong>(+ 84) 898876512</strong></li>
                    </ul>
                </div>
            </div>
            <hr>
            <div class="header-bottom">
                <ul class="navbar">
                    <li class="navbar-link">
                        <a href="#" class="line">Jewelry</a>
                        <div class="sub-menu-1">
                            <ul>
                                <li><a href='./ProductController'>Ring</a></li>
                                <li><a href='./UserCategoryController'>Category</a></li>  
                                <li><a href='./UserCollectionController'>Collection</a></li>  


                            </ul>
                        </div>   
                    </li>
                    <li class="navbar-link"><a href='./UserDiamondPriceController' class="line">Diamond Price</a></li>
                    <li class="navbar-link"><a href='./UserVoucherController' class="line">Voucher</a></li>
                    <li class="navbar-link"><a href="#" class="line">Order Monitor</a>                       
                        <div class="sub-menu-1">
                            <ul>
                                <li><a href='OrderController?action=list&id=${sessionScope.usersession.userid}'>Cart</a></li>
                                <li><a href='BillController?action=list&id=${sessionScope.usersession.userid}'>Tracking Orders</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="navbar-link">
                        <a href="static_webpages/certificate_edu.jsp" class="line">Education</a>
                        <div class="sub-menu-1">
                            <ul>
                                <li><a href='./UserPostController'>Blog</a></li>
                                <li><a href='static_webpages/ringmeasuring.jsp'>Ring Measuring Guide</a></li>          
                                <li><a href='static_webpages/faqs.jsp'>Frequently Asking Questions</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="navbar-link"><a href="user_aboutus.jsp" class="line">About Us</a></li>                    
                    <li class="navbar-link">
                        <a href="user_accountdetails.jsp" class="line">Account</a>
                        <div class="sub-menu-1">
                            <ul>
                                <li><a href='HistoryController?action=list&id=${sessionScope.usersession.userid}'>History</a></li>
                                <li><a href='./userlogin?action=logout'>Logout</a></li> 
                            </ul>
                        </div>
                    </li>
                </ul>

            </div>
        </div>

        <div class="container bootstrap snippets bootdey">
            <div class="row">
                <div class="profile-nav col-md-3">
                    <div class="panel">
                        <div class="user-heading round">
                            <a href="#">
                                <img src="images/man-user-circle-icon.webp" alt="">
                            </a>
                            <h1>${sessionScope.usersession.firstname} ${sessionScope.usersession.lastname}</h1>
                            <p>${sessionScope.usersession.email}</p>
                        </div>

                        <div class="nav-stacks">
                            <ul class="nav nav-pills nav-stacked">
                                <li><a href="user_accountdetails.jsp"> <i class="fa fa-user"></i> Profile</a></li>
                                <li class="active"><a href='BillController?action=list&id=${sessionScope.usersession.userid}'> <i class="fa fa-calendar"></i> Recent Activity</a></li>
                                <li><a href='HistoryController?action=list&id=${sessionScope.usersession.userid}'> <i class="fa fa-edit"></i> History</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="profile-info col-md-9">
                    <div class="panel">
                        <!--                        <div class="panel">
                                                    <div class="bio-graph-heading">
                                                        FUJ hope you have a great experience from using our service
                                                    </div>
                                                    <div class="panel-body bio-graph-info">
                                                        <h1>Personal Details</h1>
                                                        <div class="row">
                                                            <div class="bio-row">
                                                                <p><span>First Name </span>: ${sessionScope.usersession.lastname}</p>
                                                            </div>
                                                            <div class="bio-row">
                                                                <p><span>Last Name </span>: ${sessionScope.usersession.firstname}</p>
                                                            </div>
                                                            <div class="bio-row">
                                                                <p><span>Address </span>: ${sessionScope.usersession.address}</p>
                                                            </div>
                                                            <div class="bio-row">
                                                                <p><span>Email </span>: ${sessionScope.usersession.email}</p>
                                                            </div>
                                                            <div class="bio-row">
                                                                <p><span>Mobile </span>: ${sessionScope.usersession.phonenumber}</p>
                                                            </div>
                                                            <div class="bio-row">
                                                                <p><span>Points </span>: ${sessionScope.usersession.point}</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>-->

                        <div class="panel-body" style="border: none;">
                            <!--                            <form action='' method="GET" id="searchbox"> 
                                                            <input name="keyword" type="text" value="<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>">
                                                            <input type="submit" value="Search">
                                                        </form>-->

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="panel">
                                        <div class="panel-body">
                                            <table class="order-history-table">
                                                <caption>Store Received Orders</caption>
                                                <tr>
                                                    <th>Order ID</th>
                                                    <th>Ring Name</th>
                                                    <th>Ring Size</th>
                                                    <th>Date Purchased</th>
                                                    <th>Price</th>
                                                    <th>Status</th>
                                                </tr>
                                                <%
                                                    List<OrderDTO> listForReceiveHistory = (List<OrderDTO>) request.getAttribute("listreceive");
                                                    for (OrderDTO bill : listForReceiveHistory) {
                                                        pageContext.setAttribute("bill", bill);
                                                %>
                                                <tr>
                                                    <td><a href="BillController?action=detailsprocess_store&id=${bill.orderID}">${bill.orderID}</a></td>
                                                    <td><a href="ProductController?action=details&id=${bill.ringID}">${bill.ringName}</a></td>
                                                    <td>${bill.ringSize}</td>
                                                    <td>${bill.orderDate}</td>
                                                    <td style="font-weight: bolder">${bill.totalPrice} VND</td>
                                                    <td>${bill.status}</td>
                                                </tr>
                                                <% } %>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="panel">
                                        <div class="panel-body">
                                            <table class="delivery-history-table">
                                                <caption>Delivery Orders</caption>
                                                <tr>
                                                    <th>Order ID</th>
                                                    <th>Ring Name</th>
                                                    <th>Ring Size</th>
                                                    <th>Date Purchased</th>
                                                    <th>Price</th>
                                                    <th>Status</th>
                                                </tr>
                                                <%
                                                    List<OrderDTO> listForDeliveryHistory = (List<OrderDTO>) request.getAttribute("listdelivery");
                                                    for (OrderDTO bill : listForDeliveryHistory) {
                                                        pageContext.setAttribute("bill", bill);
                                                %>
                                                <tr>
                                                    <td><a href="BillController?action=detailsprocess_home&id=${bill.orderID}">${bill.orderID}</a></td>
                                                    <td><a href="ProductController?action=details&id=${bill.ringID}">${bill.ringName}</a></td>
                                                    <td>${bill.ringSize}</td>
                                                    <td>${bill.orderDate}</td>
                                                    <td style="font-weight: bolder">${bill.totalPrice} VND</td>
                                                    <td>${bill.status}</td>
                                                </tr>
                                                <% }%>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>


        <div class="footer">
            <div class="footer-content">
                <div class="info">
                    <div class="info-img">
                        <img src="images/Screenshot (659).png" />
                    </div>

                    <div class="info-text">
                        <p>
                            Address: FPT University, District 9, Ho Chi Minh City
                        </p>
                        <p>
                            Email: fuj.khac.diamondshopsystem@gmail.com
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

    </body>
</html>

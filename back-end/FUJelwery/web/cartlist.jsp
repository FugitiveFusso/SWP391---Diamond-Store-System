<%@page import="com.khac.swp.fuj.order.OrderDTO"%>
<%@page import="com.khac.swp.fuj.ring.RingDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Details</title>
        <link rel="stylesheet" href="css/navbaruser.css">
        <link rel="stylesheet" href="css/usercart.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="css/pagination.css">


    </head>
    <body style="background-color: #f1f1f1;">
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

        <div class="container">
            <div class="wrapper wrapper-content animated fadeInRight">
                <div class="row">
                    <%
                        List<OrderDTO> list = (List<OrderDTO>) request.getAttribute("cartlist");
                        int totalNumberOfThings = 0;
                        if (list != null) {
                            for (OrderDTO order : list) {
                                totalNumberOfThings = order.getNumberOfThings();
                            }
                        }
                        request.setAttribute("totalNumberOfThings", totalNumberOfThings);
                    %>
                    <div class="col-md-9">
                        <div class="ibox">
                            <div class="ibox-title">
                                <span class="pull-right">(<strong>${totalNumberOfThings}</strong>) items</span>
                                <h5>Items in your cart</h5>
                            </div>
                            <%
                                for (OrderDTO order : list) {
                                    pageContext.setAttribute("order", order);
                            %>
                            <div class="ibox-content">

                                <div class="table-responsive">
                                    <table class="table shoping-cart-table">
                                        <tbody>
                                            <tr>
                                                <td width="90">
                                                    <div class="cart-product-imitation">
                                                        <img src="${order.image}" width="80px" alt="${order.ringName}"
                                                    </div>                                                     

                                                </td>
                                                <td class="desc" width="600">
                                                    <h4>                                                      
                                                        <a href="ProductController?action=details&id=${order.ringID}" class="text-navy">
                                                            ${order.ringName}
                                                        </a>
                                                    </h4>                                                                                                      
                                                    <div class="m-t-sm">  
                                                        <form action="OrderController" method="POST" class="text-muted" id="deleteForm">
                                                            <input name="action" value="delete" type="hidden">
                                                            <input name="id" value="${order.orderID}" type="hidden">
                                                            <i class="fa fa-trash"></i>
                                                            <a href="#" onclick="document.getElementById('deleteForm').submit(); return false;">Remove item</a>
                                                        </form>
                                                    </div>
                                                </td>
                                                <td>
                                                    <h4 style="font-size: 20px;">
                                                        ${order.totalPrice} VND
                                                    </h4>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <%
                                }
                            %>
                        </div>

                        <div class="ibox-content">
                            <div class="voucher">
                                <!-- Apply Voucher Form -->
                                <form action="OrderController" method="POST" class="mt-3">
                                    <div class="form-group">
                                        <input name="action" value="applyVoucher" type="hidden">
                                        <input name="coupon" type="text" placeholder="Enter coupon code" class="form-control">
                                        <input type="hidden" name="userid" value="${sessionScope.usersession.userid}">
                                    </div>
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-ticket"></i>Apply Voucher</button>
                                </form>

                                <!-- Remove Voucher Form -->
                                <form action="OrderController" method="POST" class="mt-3">
                                    <input name="action" value="removeVoucher" type="hidden">
                                    <input type="hidden" name="userid" value="${sessionScope.usersession.userid}">
                                    <button type="submit" class="btn btn-danger"><i class="fa fa-ticket"></i>Remove Voucher</button>
                                </form>
                            </div>
                        </div>

                        <div class="ibox-content">       
                            <!-- Purchase Method Form -->
                            <div class="purchase">
                                <form action="OrderController" method="POST" class="mt-3">
                                    <div class="form-group">
                                        <label for="purchaseMethod">Select your preferred payment method:</label>
                                        <select name="purchaseMethod" id="purchaseMethod" required class="form-control">
                                            <option value="">Please select your preferred payment method:</option>
                                            <option value="Received at store" ${requestScope.order.purchaseMethod == 'Received at store' ? 'selected' : ''}>Received at store</option>
                                            <option value="Door-to-door delivery service" ${requestScope.order.purchaseMethod == 'Door-to-door delivery service' ? 'selected' : ''}>Door-to-door delivery service</option>
                                        </select>
                                    </div>
                                    <input name="action" value="purchase" type="hidden">
                                    <input type="hidden" name="userid" value="${sessionScope.usersession.userid}">
                                    <div class="form-group text-right">
                                        <button type="submit" class="btn btn-primary btn-large">
                                            <i class="fa fa-shopping-cart"></i> Purchase
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-3">
                        <div class="ibox">
                            <div class="ibox-title">
                                <h5>Cart Summary</h5>
                            </div>
                            <div class="ibox-content">
                                <span>
                                    Total
                                </span>
                                <h2 class="font-bold" style="color: red">
                                    ${totalPrice} VND
                                </h2>

                            </div>
                        </div>

                        <div class="ibox">
                            <div class="ibox-title">
                                <h5>Support</h5>
                            </div>
                            <div class="ibox-content text-center">
                                <h5><i class="fa fa-phone"></i>(+ 84) 898876512</h5>
                                <span class="small">
                                    Please contact with us if you have any questions. We are available 24h.
                                </span>
                            </div>
                        </div>

                        <div class="ibox">
                            <div class="ibox-title">
                                <h5>Trouble with ring?</h5>
                            </div>
                            <div class="ibox-content text-center">
                                <h5 style="font-size: 20px; display: block; text-align: center; text-justify: inter-word; width: 100%;">Don't know your size?</h5>
                                <span class="small">
                                    <a href='static_webpages/ringmeasuring.jsp' style="color: black">Click here to find out!</a>
                                </span>
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

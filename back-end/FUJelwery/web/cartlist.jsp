<%@page import="com.khac.swp.fuj.order.OrderDTO"%>
<%@page import="com.khac.swp.fuj.ring.RingDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Details</title>
        <link rel="stylesheet" href="css/navigation_bar.css">
        <link rel="stylesheet" href="css/usercart.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="css/pagination.css">


    </head>
    <body style="background-color: #f1f1f1;">

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
        <div class="container">
            <div class="wrapper wrapper-content animated fadeInRight">
                <div class="row" style="margin-top: 30px;">
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
                                                        <form action="OrderController" method="POST" class="text-muted" id="deleteForm-${order.orderID}">
                                                            <input name="action" value="delete" type="hidden">
                                                            <input name="id" value="${order.orderID}" type="hidden">
                                                            <i class="fa fa-trash"></i>
                                                            <a href="#" onclick="confirmDelete(${order.orderID}); return false;">Remove item</a>
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
                                <!-- Hidden inputs for messages -->
                                <input type="hidden" id="success-message" value="${requestScope.success}">
                                <input type="hidden" id="error-message" value="${requestScope.errorMessage}">

                                <!-- Apply Voucher Form -->
                                <form action="OrderController" method="POST" class="mt-3">
                                    <div class="form-group">
                                        <p>Remember to Apply Voucher to get better price: </p>
                                        <input name="action" value="applyVoucher" type="hidden">
                                        <input name="coupon" type="text" placeholder="Enter coupon code" class="form-control">
                                        <input type="hidden" name="userid" value="${sessionScope.usersession.userid}">
                                    </div>
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-ticket"></i> Apply Voucher</button>
                                </form>

                                <!-- Remove Voucher Form -->
                                <form action="OrderController" method="POST" class="mt-3">
                                    <input name="action" value="removeVoucher" type="hidden">
                                    <input type="hidden" name="userid" value="${sessionScope.usersession.userid}">
                                    <button type="submit" class="btn btn-danger"><i class="fa fa-ticket"></i> Remove Voucher</button>
                                </form>
                            </div>
                        </div>

                        <div class="ibox-content">       
                            <!-- Purchase Method Form -->
                            <div class="purchase">
                                <form id="purchaseForm" action="OrderController" method="POST" class="mt-3">
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
                                        <button type="button" id="purchaseButton" class="btn btn-primary btn-large">
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

        <!--        <script src="js/voucherConfirmation.js"></script>-->
        <script src="js/productlist_pagination.js"></script>
        <script>
        document.getElementById('purchaseButton').addEventListener('click', function (event) {
            event.preventDefault();
            const purchaseMethod = document.getElementById('purchaseMethod').value;

            if (!purchaseMethod) {
                Swal.fire({
                    title: 'Error',
                    text: 'Please select a payment method.',
                    icon: 'error',
                    confirmButtonText: 'OK'
                });
                return;
            }

            Swal.fire({
                title: 'Are you sure?',
                text: "Do you want to proceed with the purchase?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, purchase it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    document.getElementById('purchaseForm').submit();
                }
            });
        });
        </script>
        <script>
            function confirmDelete(orderID) {
                Swal.fire({
                    title: 'Are you sure?',
                    text: "You won't be able to revert this!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        document.getElementById('deleteForm-' + orderID).submit();
                    }
                })
            }
        </script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Get session attributes
                var successMessage = '${sessionScope.success}';
                var errorMessage = '${sessionScope.errorMessage}';

                // Display success message if it exists
                if (successMessage) {
                    Swal.fire({
                        icon: 'success',
                        title: 'Success',
                        text: successMessage,
                        timer: 3000,
                        showConfirmButton: false
                    });
                    // Remove the attribute from session scope
                    <c:remove var="success" scope="session"/>
                }

                // Display error message if it exists
                if (errorMessage) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: errorMessage,
                        timer: 3000,
                        showConfirmButton: false
                    });
                    // Remove the attribute from session scope
                    <c:remove var="errorMessage" scope="session"/>
                }
            });
        </script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                // Check if success message is present
                let successMessage = document.querySelector("#success-message").value;
                if (successMessage) {
                    Swal.fire({
                        icon: 'success',
                        title: 'Success',
                        text: successMessage,
                    });
                }

                // Check if error message is present
                let errorMessage = document.querySelector("#error-message").value;
                if (errorMessage) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: errorMessage,
                    });
                }
            });
        </script>
    </body>
</html>

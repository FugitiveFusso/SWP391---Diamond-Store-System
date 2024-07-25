
<%@page import="com.khac.swp.fuj.order.TransactionDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History of Transaction</title>
        <link rel="icon" type="image/x-icon" href="images/Screenshot__656_-removebg-preview.png">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/user_accountdetails.css">
        <link rel="stylesheet" href="css/navigation_bar.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            .pagination {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-top: 20px;
            }

            .pagination a, .pagination span {
                text-decoration: none;
                color: #1A1A3D;
                background-color: #fff;
                border: 1px solid #1A1A3D;
                border-radius: 50%;
                padding: 10px;
                width: 40px;
                height: 40px;
                margin: 0 5px;
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 16px;
                transition: background-color 0.3s, color 0.3s;
            }

            .pagination a:hover {
                background-color: #1A1A3D;
                color: #fff;
            }

            .pagination a.disabled, .pagination span.disabled {
                pointer-events: none;
                opacity: 0.5;
            }

            .pagination a.active, .pagination span.active {
                background-color: #1A1A3D;
                color: #fff;
            }

        </style>

    </head>
    <body>
        <div class="header">
            <div class="header-top">
                <div class="top-info-left">
                    <ul>
                        <li>Timeless elegance and craftsmanship</li>
                        <li style="margin-left: 5px">at KHAC Diamond Ring Online Shop.</li>                         
                    </ul>
                </div>
                <a href="user_homepage.jsp"><img src="./images/Screenshot (656).png"></a>
                <div class="top-info-right">
                    <ul>
                        <li>KHAC Diamond Ring Shop - <strong>(+ 84) 898876512</strong></li>
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
                                <li><a href='TransactionTracking?action=list&id=${sessionScope.usersession.userid}'>Transactions</a></li>
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
                                <li><a href='BillController?action=list&id=${sessionScope.usersession.userid}'> <i class="fa fa-calendar"></i> Recent Activity</a></li>
                                <li  ><a href='HistoryController?action=list&id=${sessionScope.usersession.userid}'> <i class="fa fa-edit"></i> History</a></li>
                                <li class="active"><a href='TransactionTracking?action=list&id=${sessionScope.usersession.userid}'> <i class="fa fa-money-bill"></i> Transaction</a></li>

                            </ul>
                        </div>
                    </div>
                </div>
                <div class="profile-info col-md-9">
                    <div class="panel">

                        <div class="panel-body" style="border: none;">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="panel">
                                        <div class="panel-body">
                                            <table class="delivery-history-table">
                                                <caption>Transaction Records</caption>
                                                <thead>
                                                    <tr>
                                                        <th>Transaction ID</th>
                                                        <th>Purchase Date</th>
                                                        <th>Total Price</th>              
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        List<TransactionDTO> list = (List<TransactionDTO>) request.getAttribute("transactionlist");
                                                        for (TransactionDTO transaction : list) {
                                                            pageContext.setAttribute("transaction", transaction);
                                                    %>
                                                    <tr>
                                                        <td>${transaction.transactionID}</td>
                                                        <td>${transaction.paymentDate}</td>
                                                        <td>${transaction.totalPrice} VND</td>
                                                    </tr>
                                                    <%
                                                        }
                                                    %>    
                                                </tbody>
                                            </table>
                                            <div class="pagination">
                                                <% int currentPage = (Integer) request.getAttribute("currentPage");
                                                    int totalPages = (Integer) request.getAttribute("totalPages");
                                                    String sortCol = (String) request.getAttribute("sortCol");
                                                    int id = (Integer) request.getAttribute("id");
                                                    String keyword = (String) request.getAttribute("keyword");
                                                    int maxPagesToShow = 5; // Adjust this to change how many pages to show around current page
                                                %>

                                                <% if (currentPage > 1) {%>
                                                <a href="?action=list&id=<%= id %>&page=<%= currentPage - 1%><%= !sortCol.isEmpty() ? "&colSort=" + sortCol : ""%><%= !keyword.isEmpty() ? "&keyword=" + keyword : ""%>" class="pagination-arrow">&#8249;</a>
                                                <% } else { %>
                                                <span class="pagination-arrow disabled">&#8249;</span>
                                                <% } %>

                                                <%
                                                    int startPage = Math.max(1, currentPage - (maxPagesToShow / 2));
                                                    int endPage = Math.min(totalPages, startPage + maxPagesToShow - 1);

                                                    if (startPage > 1) {%>
                                                <a href="?action=list&id=<%= id %>&page=1<%= !sortCol.isEmpty() ? "&colSort=" + sortCol : ""%><%= !keyword.isEmpty() ? "&keyword=" + keyword : ""%>" class="pagination-number">1</a>
                                                <% if (startPage > 2) { %>
                                                <span class="pagination-ellipsis">...</span>
                                                <% }
                                                    }

                                                    for (int i = startPage; i <= endPage; i++) {%>
                                                <a href="?action=list&id=<%= id %>&page=<%= i%><%= !sortCol.isEmpty() ? "&colSort=" + sortCol : ""%><%= !keyword.isEmpty() ? "&keyword=" + keyword : ""%>"
                                                   class="pagination-number <%= (i == currentPage) ? "active" : ""%>"><%= i%></a>
                                                <% }

                                                    if (endPage < totalPages) { %>
                                                <% if (endPage < totalPages - 1) { %>
                                                <span class="pagination-ellipsis">...</span>
                                                <% }%>
                                                <a href="?action=list&id=<%= id %>&page=<%= totalPages%><%= !sortCol.isEmpty() ? "&colSort=" + sortCol : ""%><%= !keyword.isEmpty() ? "&keyword=" + keyword : ""%>" class="pagination-number"><%= totalPages%></a>
                                                <% }
                                                %>

                                                <% if (currentPage < totalPages) {%>
                                                <a href="?action=list&id=<%= id %>&page=<%= currentPage + 1%><%= !sortCol.isEmpty() ? "&colSort=" + sortCol : ""%><%= !keyword.isEmpty() ? "&keyword=" + keyword : ""%>" class="pagination-arrow">&#8250;</a>
                                                <% } else { %>
                                                <span class="pagination-arrow disabled">&#8250;</span>
                                                <% }%>
                                            </div>
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

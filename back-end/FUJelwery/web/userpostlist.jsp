
<%@page import="com.khac.swp.fuj.posts.PostDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Post List</title>
        <link rel="icon" type="image/x-icon" href="images/Screenshot__656_-removebg-preview.png">
        <link rel="stylesheet" href="css/navigation_bar.css">
        <link rel="stylesheet" href="css/blog.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
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
                padding: 3px; /* Adjust padding for smaller size */
                width: 36px; /* Adjust width for smaller size */
                height: 36px; /* Adjust height for smaller size */
                margin: 0 5px;
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 14px; /* Adjust font size for smaller size */
                font-weight: bolder
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

            .pagination-number {
                font-size: 100px; /* Larger font size for numbers */
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

        <div class="bannerContainer">
            <div class="bannerContent">
                <div class="bannerText">
                    <p class="intro">Today we have</p>
                    <h1>Explore the World of Rings: From Timeless Elegance to Modern Glamour</h1>
                    <div class="description_hero">
                        <span>Dive into a world of elegance and allure as we showcase stunning engagement 
                            ring ideas, expert styling tips for any occasion, and insights into the latest 
                            jewelry trends. Whether you're seeking inspiration for a special milestone or 
                            simply fascinated by the craftsmanship behind each piece, join us on a journey 
                            through the diverse and enchanting realm of rings.</span>
                    </div>

                </div>
                <div class="bannerImage">
                    <img src="images/Fashion_Rings.webp" id="diamondHero" style="width: 432px; height: 432px">
                </div>
            </div>
        </div>

        <div class="main">           
            <div class="content">    
                <form action='' method="GET" id="searchbox" style="margin-bottom: 30px">
                    <input name="keyword" type="text" class="search-input" value="<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>">
                    <button type="submit" class="search-button"><i class="fas fa-search"></i></button>
                </form>

                <table>
                    <tbody>
                        <% List<PostDTO> list = (List<PostDTO>) request.getAttribute("userpostlist");
                            for (PostDTO post : list) {
                                pageContext.setAttribute("post", post);
                        %>
                        <tr style="border-radius: 20px">
                            <td>
                                <img src="${post.image}" style="width: 400px; height: 280px">
                            </td>
                            <td>
                                <div class="blog-content">
                                    <div class="blog-title" style="text-align: left; margin-left: 40px; margin-bottom: 5px">
                                        ${post.name}
                                    </div>
                                    <p class="date" style="margin-bottom: 10px; font-weight: bolder">Author: ${post.author} - Created date: ${post.date}</p>  
                                    <p>${post.description}</p>
                                    <br>
                                    <p class="read-more" style="text-align: right;"><a href="UserPostController?action=details&id=${post.id}" style="color: blue; text-decoration: none; font-style: italic">Read More...</a></p>
                                </div>
                            </td>
                        </tr>
                        <% } %>    
                    </tbody>
                </table>  

                <div class="pagination">
                    <% int currentPage = (Integer) request.getAttribute("currentPage");
                        int totalPages = (Integer) request.getAttribute("totalPages");
                        String sortCol = (String) request.getAttribute("sortCol");
                        String keyword = (String) request.getAttribute("keyword");
                        int maxPagesToShow = 5; // Adjust this to change how many pages to show around current page
                    %>

                    <% if (currentPage > 1) {%>
                    <a href="?page=<%= currentPage - 1%><%= !sortCol.isEmpty() ? "&colSort=" + sortCol : ""%><%= !keyword.isEmpty() ? "&keyword=" + keyword : ""%>" class="pagination-arrow">&#8249;</a>
                    <% } else { %>
                    <span class="pagination-arrow disabled">&#8249;</span>
                    <% } %>

                    <%
                        int startPage = Math.max(1, currentPage - (maxPagesToShow / 2));
                        int endPage = Math.min(totalPages, startPage + maxPagesToShow - 1);

                        if (startPage > 1) {%>
                    <a href="?page=1<%= !sortCol.isEmpty() ? "&colSort=" + sortCol : ""%><%= !keyword.isEmpty() ? "&keyword=" + keyword : ""%>" class="pagination-number">1</a>
                    <% if (startPage > 2) { %>
                    <span class="pagination-ellipsis">...</span>
                    <% }
                        }

                        for (int i = startPage; i <= endPage; i++) {%>
                    <a href="?page=<%= i%><%= !sortCol.isEmpty() ? "&colSort=" + sortCol : ""%><%= !keyword.isEmpty() ? "&keyword=" + keyword : ""%>"
                       class="pagination-number <%= (i == currentPage) ? "active" : ""%>"><%= i%></a>
                    <% }

                        if (endPage < totalPages) { %>
                    <% if (endPage < totalPages - 1) { %>
                    <span class="pagination-ellipsis">...</span>
                    <% }%>
                    <a href="?page=<%= totalPages%><%= !sortCol.isEmpty() ? "&colSort=" + sortCol : ""%><%= !keyword.isEmpty() ? "&keyword=" + keyword : ""%>" class="pagination-number"><%= totalPages%></a>
                    <% }
                    %>

                    <% if (currentPage < totalPages) {%>
                    <a href="?page=<%= currentPage + 1%><%= !sortCol.isEmpty() ? "&colSort=" + sortCol : ""%><%= !keyword.isEmpty() ? "&keyword=" + keyword : ""%>" class="pagination-arrow">&#8250;</a>
                    <% } else { %>
                    <span class="pagination-arrow disabled">&#8250;</span>
                    <% }%>
                </div>
            </div>



            <div class="footer">
                <div class="footer-content">
                    <div class="footer-content-info">
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

        </div>
    </body>
</html>

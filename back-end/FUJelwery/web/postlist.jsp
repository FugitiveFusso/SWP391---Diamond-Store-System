
<%@page import="com.khac.swp.fuj.posts.PostDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Post Management List</title>
        <link rel="icon" type="image/x-icon" href="images/Screenshot__656_-removebg-preview.png">
        <link rel="stylesheet" href="css/navbar.css">
        <script src="https://unpkg.com/@phosphor-icons/web"></script>
        <link rel="stylesheet" href="css/customer_list.css">
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
        <div class="menu-btn">
            <div class="btn-cover">
                <i class="fas fa-bars"></i>
            </div>            
        </div>

        <div class="side-bar">
            <header>
                <div class="close-btn">
                    <i class="fa-solid fa-xmark"></i>
                </div>
                <img src="images/Screenshot (656).png">
                <h1>${sessionScope.adminsession.lastname} ${sessionScope.adminsession.firstname}</h1>
            </header>

            <div class="menu">               
                <div class="item"><a class="sub-btn"><i class="fas fa-table"></i>View List
                        <i class="fas fa-angle-right dropdown"></i>
                        <div class="sub-menu">
                            <a href="CustomerController" class="sub-item">Customer List</a>
                            <a href="AdminController" class="sub-item">Administrator List</a>
                            <a href="DeliveryStaffController" class="sub-item">Delivery Staff List</a>
                            <a href="SalesController" class="sub-item">Sale Staff List</a>
                            <a href="ManagerController" class="sub-item">Manager List</a>
                        </div>
                    </a>
                </div>

                <div class="item"><a href="PostController"><i class="fas fa-file"></i>Posts</a></div>

                <div class="item"><a href="adminaccount.jsp"><i class="fas fa-user"></i>Account</a></div>
                <div class="item"><a href="adminlogin?action=logout"><i class="fas fa-right-from-bracket"></i>Logout</a></div>

            </div>
        </div>


        <div class="list-container">
            <div class="smaller-container">
                <div class="list1">
                    <div class="list-intro-left">
                        <div class="left-icon">
                            <i class="fa-regular fa-newspaper"></i>
                        </div>
                        <div class="left-info">
                            <div class="list-title">Post List</div>
                            <div class="">List of Post</div>
                        </div>
                    </div>
                    <div class="list-intro-right">
                        <form action="PostController" method="POST">
                            <input name="action" value="create" type="hidden">
                            <button type="submit" class="styled-button">
                                <div style="align-items: center;">
                                    Add a Post
                                </div>                                           
                            </button>
                        </form>
                    </div>
                </div>
                <div class="list">
                    <form action='' method=GET id="searchbox">
                        <input name=keyword type=text class="search-input" value="<%= request.getAttribute("keyword") != null ? request.getAttribute("keyword") : ""%>">
                        <button type="submit" class="search-button"><i class="fas fa-search"></i></button>
                    </form>

                    <table>
                        <thead>
                            <tr>
                                <th>Post ID</th>
                                <th><a href="?colSort=postName<%= request.getAttribute("keyword") != null && !request.getAttribute("keyword").toString().isEmpty() ? "&keyword=" + request.getAttribute("keyword") : ""%>">Post Name</a></th>
                                <th>Post Image</th>
                                <th>Date</th>
                                <th>Author</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<PostDTO> list = (List<PostDTO>) request.getAttribute("postlist");
                                for (PostDTO post : list) {
                                    pageContext.setAttribute("post", post);
                            %>
                            <tr>
                                <td><a href="PostController?action=details&id=${post.id}">${post.id}</a></td>
                                <td>${post.name}</td>
                                <td><img src="${post.image}" width="300px" height="300px" style="border-radius: 20px;"></td>
                                <td>${post.date}</td>
                                <td>${post.author}</td>

                                <td>
                                    <form id="deleteForm" action="PostController" method="POST" class="input">
                                        <input name="action" value="delete" type="hidden">
                                        <input name="id" value="${post.id}" type="hidden">
                                        <input type="submit" value="Delete" class="deleteButton btn">
                                    </form>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>

                    <!-- Pagination controls -->
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
            </div>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.js"
                    integrity="sha512-8Z5++K1rB3U+USaLKG6oO8uWWBhdYsM3hmdirnOEWp8h2B1aOikj5zBzlXs8QOrvY9OxEnD2QDkbSKKpfqcIWw=="
            crossorigin="anonymous"></script>
            <script src="js/sidenav.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.0/dist/sweetalert2.all.min.js"></script>
            <script src="js/deleteConfirmation.js"></script>
    </body>
</html>
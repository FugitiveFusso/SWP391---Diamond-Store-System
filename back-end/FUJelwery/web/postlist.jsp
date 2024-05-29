<%-- 
    Document   : postlist
    Created on : May 26, 2024, 10:42:55 AM
    Author     : phucu
--%>

<%@page import="com.khac.swp.fuj.posts.PostDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/navbar.css">
        <link rel="stylesheet" href="css/staff_list.css">
    </head>
    <body>
        <div class="menu">
            <!--you will code the horizontal menu here-->
            <ul class="navbar">
                <li class="navbar__link"><a href="#">Order</a></li>
                <li class="navbar__link">
                    <a href="#">Products</a>
                    <ul class="dropdown">
                        <li><a href='DiamondController'>Diamond</a></li>
                        <li><a href='RingController'>Ring</a></li>
                    </ul>
                </li>
                <li class="navbar__link"><a href="#">Voucher</a></li>
                <img src="./images/Screenshot (656).png">
                <li class="navbar__link"><a href="#">Delivery Tracking</a></li>
                <li class="navbar__link">
                    <a href="#">Dashboard</a>
                    <ul class="dropdown">
                        <li><a href='CustomerController'>View Customer List</a></li>
                        <li><a href='ManagerController'>View Manager List</a></li>
                    </ul>
                </li>
                <li class="navbar__link">
                    <a href="#">Account</a>
                    <ul class="dropdown">
                        <li><a href='adminlogin?action=logout'>Log Out</a></li>                     
                    </ul>
                </li>
            </ul>
        </div>       

        <div class="list-container">
            <div class="smaller-container">
                <div class="list-title">Blog List</div>
                <div class="list">
                    <form action='' method=GET id="searchbox"> 
                        <input name=keyword type=text value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>">
                        <input type=submit value=Search >
                    </form>

                    <table>
                        <tr>
                            <th>Post ID</th>
                            <th><a href=?colSort=postName>Post Name</a></th>
                            <th>Post Image</th>
                            <th>Description</th>
                            <th>Delete</th>
                        </tr>
                        <%
                            List<PostDTO> list = (List<PostDTO>) request.getAttribute("postlist");
                            for (PostDTO post : list) {
                                pageContext.setAttribute("post", post);
                        %>
                        <tr>
                            <td><a href="PostController?action=details&id=${post.id}">${post.id}</td>
                            <td>${post.name}</td>
                            <td> <img src=${post.image} width="300px" height="300px"></td>
                            <td>${post.description}</td>

                            <td>
                                <form action="PostController" method="POST">
                                    <input name="action" value="delete" type="hidden">
                                    <input name="id" value="${post.id}" type="hidden">
                                    <input type="submit" value="Delete">
                                </form>
                            </td>

                        </tr>
                        <%
                            }
                        %>    
                        <tr><td colspan="6">
                                <form action="PostController" method="POST">
                                    <input name="action" value="create" type="hidden">
                                    <input type="submit" value="Create">
                                </form>
                            </td></tr>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>

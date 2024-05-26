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
    </head>
    <body>
        <%@ include file="/menu.jsp" %>
        <form action='' method=GET id="searchbox"> 
            <input name=keyword type=text value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>">
            <input type=submit value=Search >
        </form>
        <style>
            #searchbox{
                margin-top: 5px;
            }
            body{
                font-size: 16px;
                font-family: Arial, Helvetica, sans-serif;
            }
            table{
                margin-top: 10px;
                    width: 100%;
            }
            table, tr, td{
                border-collapse: collapse;
                border: 1px solid black;
                text-align: center;
            }
            tr,td{
                padding: 6px 10px;
            }
        </style>
        <table>
            <tr>
                <td>Post ID</td>
                <td><a href=?colSort=postName>Post Name</a></td>
                <td>Post Image</td>
                <td>Descrip tion</td>
                <td>Delete</td>
            </tr>
            <%
                List<PostDTO> list = (List<PostDTO>) request.getAttribute("postlist");
                for (PostDTO post : list) {
                    pageContext.setAttribute("post", post);
            %>
            <tr>
                <td><a href="PostController?action=details&id=${post.id}">${post.id}</td>
                <td>${post.name}</td>
                <td> <img src=${post.image} width="300px" height="300px">  </td>
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
    </body>
</html>

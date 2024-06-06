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

    </head>
    <body>
        <%--<%@ include file="/productmenu.jsp" %>--%>

        <div class="menu">
            <ul class="navbar">
                <li class="navbar__link">
                    <a href="#">Jewelry</a>
                    <div class="sub-menu-1">
                        <ul>
                            <li><a href='./ProductController'>Diamond</a></li>
                            <li><a href='./RingController'>Ring</a></li>
                            <li><a href='#'>Collection</a></li>
                        </ul>
                    </div>                  
                </li>
                <li class="navbar__link"><a href='./UserVoucherController'>Voucher</a></li>
                <li class="navbar__link"><a href="UserPostController">Blog</a></li>
                <a href="user_homepage.jsp"><img src="./images/Screenshot (656).png"></a>
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

        <div class="Main-hero">
            <div class="hero-details">
                <h2 style="font-family: Inter; font-weight: bold;">UP TO 50% OFF</h2>
                <h1 style="font-family: Inika;">To Mom, With Love</h1>
                <h3>A mother’s love is deep and everlasting. <br>Celebrate it with something that will always shin like she does (and save up to 50%)</h3>
                <div class="button">
                    <button id="button1" > <a href="#">Shop Sale Jewelry</a></button>
                    <button><a href="#">Shop Engagement Rings</a></button>
                </div>
            </div>
            <img src="images/hero1.jpg" alt="" srcset="">
        </div>

        <div class="list-container">
            <div class="smaller-container">
                <div class="list-title">Ring List</div>
                <div class="list">
                    <form action='' method=GET id="searchbox"> 
                        <input name=keyword type=text value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>">
                        <input type=submit value=Search >
                    </form>
                    <div class="card-container">
                        <%
                            List<RingDTO> list = (List<RingDTO>) request.getAttribute("productlist");
                            for (RingDTO product : list) {
                                pageContext.setAttribute("product", product);
                        %>
                        <div class="product-card">
                            <a href="ProductController?action=details&id=${product.ringID}">
                                <img src="${product.ringImage}" alt="${product.ringName}">
                                <h3>${product.ringName}</h3>
                                <p>Diamond: ${product.diamondName}</p>
                                <p>Price: ${product.totalPrice}</p>
                                <p>Category: ${product.categoryID}</p>
                                <p>Collection: ${product.collectionID}</p>
                            </a>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

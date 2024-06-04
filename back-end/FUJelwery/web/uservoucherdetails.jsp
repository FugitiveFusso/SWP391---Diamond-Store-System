
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Voucher Page</title>
        <link rel="stylesheet" href="css/navbar.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>
        <div class="menu">
            <ul class="navbar">
                <li class="navbar__link">
                    <a href="#">Jewelry</a>
                    <div class="sub-menu-1">
                        <ul>
                            <li><a href='./ProductController'>Diamond</a></li>
                            <li><a href='./ProductController'>Ring</a></li>
                            <li><a href='CollectionController'>Collection</a></li>
                        </ul>
                    </div>                  
                </li>
                <li class="navbar__link"><a href='./UserVoucherController'>Voucher</a></li>
                <li class="navbar__link"><a href="./UserPostController">Blog</a></li>
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
        <h1>Voucher Details </h1>         
        <p> Login username: ${sessionScope.usersession.username}</p>

        <style>
            #searchbox{
                margin-top: 5px;
            }
            body{
                font-size: 16px;
                font-family: Arial, Helvetica, sans-serif;
            }
            table{
                margin-top: 10px
            }
            table, tr, td{
                border-collapse: collapse;
                width: 400px;
                border: 2px solid black;
                text-align: center;
            }
            tr,td{
                padding: 6px 10px;
            }
        </style>
        <table>

            <tr><td>Voucher ID</td><td>${requestScope.voucher.id}</td></tr>
            <tr><td>Voucher Name</td><td>${requestScope.voucher.name}</td></tr>
            <tr><td>Voucher Image</td><td><img src=${requestScope.voucher.image} width="300px" height="300px"></td></tr>
            <tr><td>Description</td><td>${requestScope.voucher.description}</td></tr>
            <tr><td>Coupon</td><td>${requestScope.voucher.coupon}</td></tr>
            <tr><td>Percentage</td><td>${requestScope.voucher.percentage}%</td></tr>
        </table>

        <form action="UserVoucherController" style="padding-top: 10px">
            <input type=hidden name="action" value="list">
            <input type=submit value="Return" ></form>

    </body>
</html>

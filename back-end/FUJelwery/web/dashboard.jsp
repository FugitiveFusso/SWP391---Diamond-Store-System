
<%@page import="com.khac.swp.fuj.certificate.CertificateDTO"%>
<%@page import="com.khac.swp.fuj.voucher.VoucherDTO"%>
<%@page import="com.khac.swp.fuj.collection.CollectionDTO"%>
<%@page import="com.khac.swp.fuj.category.CategoryDTO"%>
<%@page import="com.khac.swp.fuj.users.UserDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Management Dashboard</title>
        <link rel="stylesheet" href="css/navbar.css">
        <script src="https://unpkg.com/@phosphor-icons/web"></script>
        <link rel="stylesheet" href="css/staff_details.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/3.6.95/css/materialdesignicons.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/3.6.95/css/materialdesignicons.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
            body {
                font-size: 16px;
                font-family: Arial, Helvetica, sans-serif;
            }

            table {
                margin: 10px auto;
                border-collapse: separate; /* Change to separate to allow border radius */
                border-spacing: 0; /* Reset border-spacing to ensure no gaps */
                width: 65%;
                border: 1px solid #ddd;
                box-shadow: 0 2px 5px rgba(0,0,0,0.15);
                border-radius: 10px; /* Add border radius here */
                overflow: hidden; /* Ensure border radius is applied */
            }

            th, td {
                padding: 12px 15px;
                border: 1px solid #ddd;
                text-align: center;
            }

            th {
                background-color: #f4f4f4;
                font-weight: bold;
                color: #333;
            }

            tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            tr:hover {
                background-color: #f1f1f1;
            }

            h1 {
                color: #333;
            }

            strong {
                display: block;
                margin: 10px 0;
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
                <h1>${sessionScope.managersession.lastname} ${sessionScope.managersession.firstname}</h1>
            </header>

            <div class="menu">
                <div class="item"><a href="./DashboardController"><i class="fas fa-chart-line"></i>Dashboard</a></div>
                <div class="item"><a href="manageraccount.jsp"><i class="fas fa-user"></i>Account</a></div>
                <div class="item"><a href="managerlogin?action=logout"><i class="fas fa-right-from-bracket"></i>Logout</a></div>

            </div>
        </div>
        <div style="text-align: center">
            <h1>User Statistics</h1>
            <table style="margin: 0 auto;">
                <tr>
                    <th>Role Name</th>
                    <th>Total Users</th>
                    <th>Active User Count</th>
                    <th>Banned User Count</th>
                </tr>
                <%
                    List<UserDTO> list = (List<UserDTO>) request.getAttribute("uslist");
                    for (UserDTO user : list) {
                        pageContext.setAttribute("user", user);
                %>
                <tr>
                    <td>${user.rolename}</td>
                    <td>${user.totalUsers}</td>
                    <td>${user.totalActiveUserCount}</td>
                    <td>${user.totalBannedUSerCount}</td>
                </tr>
                <%
                    }
                %>    
            </table>

            <h1>Category Statistics</h1>
            <%
                List<CategoryDTO> cateList = (List<CategoryDTO>) request.getAttribute("calist");
                int totalCategories = 0;
                int activeCategories = 0;
                int deletedCategories = 0;

                if (cateList != null) {
                    for (CategoryDTO category : cateList) {
                        totalCategories = category.getTotalCategories();
                        activeCategories = category.getActiveCategories();
                        deletedCategories = category.getDeletedCategories();
                    }
                }
                request.setAttribute("totalCategories", totalCategories);
                request.setAttribute("activeCategories", activeCategories);
                request.setAttribute("deletedCategories", deletedCategories);
            %>
            <strong>Total Categories: ${totalCategories}</strong>
            <strong>Total Active Categories: ${activeCategories}</strong>
            <strong>Total Deleted Categories: ${deletedCategories}</strong>

            <table style="margin: 0 auto;">
                <tr>
                    <th>Top3 Category Names</th>
                    <th>Top3 Category Ring Counts</th>
                </tr>
                <% for (CategoryDTO cate : cateList) {
                        pageContext.setAttribute("cate", cate);
                %>
                <tr>
                    <td>${cate.top3CategoryNames}</td>
                    <td>${cate.top3CategoryRingCounts}</td>
                </tr>
                <%
                    }
                %>    
            </table>
            <h1>Collection Statistics</h1>
            <%
                List<CollectionDTO> collList = (List<CollectionDTO>) request.getAttribute("colist");
                int numberOfCollections = 0;

                if (collList != null) {
                    for (CollectionDTO collection : collList) {
                        numberOfCollections = collection.getNumberOfCollections();
                    }
                }
                request.setAttribute("numberOfCollections", numberOfCollections);

            %>
            <strong>Total Number Of Collections: ${numberOfCollections}</strong>
            <strong>THE COLLECTIONS HAVE RINGS ARE SHOWN BELOW</strong>

            <table style="margin: 0 auto;">
                <tr>
                    <th>Collection Name</th>
                    <th>Number Of Rings</th>
                    <th>Total Collection Price</th>
                </tr>
                <% for (CollectionDTO coll : collList) {
                        pageContext.setAttribute("coll", coll);
                %>
                <tr>
                    <td>${coll.collectionName}</td>
                    <td>${coll.numberOfRings}</td>
                    <td><strong>${coll.totalCollectionPrice} VND</strong></td>
                </tr>
                <%
                    }
                %>    
            </table>
            <h1>Voucher Statistics</h1>
            <%
                List<VoucherDTO> vouList = (List<VoucherDTO>) request.getAttribute("voulist");
                int numberOfVouchers = 0;

                if (vouList != null) {
                    for (VoucherDTO voucher : vouList) {
                        numberOfVouchers = voucher.getTotalActiveVouchers();
                    }
                }
                request.setAttribute("numberOfVouchers", numberOfVouchers);

            %>
            <strong>Total Number Of Vouchers: ${numberOfVouchers}</strong>
            <strong>The TOP 3 MOSTLY USED Vouchers </strong>

            <table style="margin: 0 auto;">
                <tr>
                    <th>Voucher Name</th>
                    <th>Created Date</th>
                    <th>Total Orders using Voucher</th>
                </tr>
                <% for (VoucherDTO vou : vouList) {
                        pageContext.setAttribute("vou", vou);
                %>
                <tr>
                    <td>${vou.name}</td>
                    <td>${vou.createddate}</td>
                    <td><strong>${vou.totalOrdersUsingVoucher}</strong></td>
                </tr>
                <%
                    }
                %>    
            </table>
            <h1>Post Statistics</h1>
            <strong>Total Active Posts: ${requestScope.post.totalNumberOfActivePosts}</strong>
            <strong>Total Author: ${requestScope.post.totalNumberOfAuthors}</strong>
            <strong>Total Posts Date: ${requestScope.post.totalNumberOfPostDays}</strong>
            <strong>Date of oldest post: ${requestScope.post.earliestPostDate}</strong>
            <strong>Date of latest post: ${requestScope.post.latestPostDate}</strong>
            <h1>Certificate Statistics</h1>

            <%
                List<CertificateDTO> certList = (List<CertificateDTO>) request.getAttribute("certlist");
                int totalCertificates = 0;
                int activeCertificates = 0;
                int deletedCertificates = 0;
                int usedCertificates = 0;
                int unusedCertificates = 0;
                double usedPercentage = 0.0;
                double unusedPercentage = 0.0;

                if (certList != null) {
                    for (CertificateDTO certificate : certList) {
                        totalCertificates = certificate.getTotalCertificates();
                        activeCertificates = certificate.getActiveCertificates();
                        deletedCertificates = certificate.getDeletedCertificates();
                        usedCertificates = certificate.getUsedCertificates();
                        unusedCertificates = certificate.getUnusedCertificates();
                        usedPercentage = certificate.getUsedPercentage();
                        unusedPercentage = certificate.getUnusedPercentage();
                    }
                }
                request.setAttribute("totalCertificates", totalCertificates);
                request.setAttribute("activeCertificates", activeCertificates);
                request.setAttribute("deletedCertificates", deletedCertificates);
                request.setAttribute("usedCertificates", usedCertificates);
                request.setAttribute("unusedCertificates", unusedCertificates);
                request.setAttribute("usedPercentage", usedPercentage);
                request.setAttribute("unusedPercentage", unusedPercentage);

            %>
            <strong>Total Certificates: ${totalCertificates}</strong>
            <strong>Total Active Certificates: ${activeCertificates}</strong>
            <strong>Total Deleted Certificates: ${deletedCertificates}</strong>
            <strong>Total Used Certificates: ${usedCertificates}</strong>
            <strong>Total Unused Certificates: ${unusedCertificates}</strong>
            <strong>Total Used Percentage: ${usedPercentage}%</strong>
            <strong>Total Unused Percentage: ${unusedPercentage}%</strong>
            <strong>The Unused Certificates are below </strong>

            <table style="margin: 0 auto;">
                <tr>
                    <th>Certificate ID</th>
                    <th>Description</th>
                </tr>
                <% for (CertificateDTO certificate : certList) {
                        pageContext.setAttribute("certificate", certificate);
                %>
                <tr>
                    <td>${certificate.certificateID}</td>
                    <td>${certificate.certificateDescription}</td>
                </tr>
                <%
                    }
                %>    
            </table>

            <h1>Diamond Price Statistics</h1>
            <strong>Total Diamond Price: ${requestScope.diamondprice.totalDiamondsPrice}</strong>
            <strong>Average Price: ${requestScope.diamondprice.averagePrice}VND</strong>
            <strong>Highest Price: ${requestScope.diamondprice.highestPrice}VND</strong>
            <strong>Lowest Price: ${requestScope.diamondprice.lowestPrice}VND</strong>
            <strong>Active Diamond Price: ${requestScope.diamondprice.activeDiamondsPrice}</strong>
            <strong>Delete Diamond Price: ${requestScope.diamondprice.deletedDiamondsPrice}</strong>
            <strong>All Diamond Sizes: ${requestScope.diamondprice.allDiamondSizes}</strong>
            <strong>All Carat Weights: ${requestScope.diamondprice.allCaratWeights}</strong>         
            <strong>All Colors: ${requestScope.diamondprice.allColors}</strong>
            <strong>All Clarities: ${requestScope.diamondprice.allClarities}</strong>

        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.js"
                integrity="sha512-8Z5++K1rB3U+USaLKG6oO8uWWBhdYsM3hmdirnOEWp8h2B1aOikj5zBzlXs8QOrvY9OxEnD2QDkbSKKpfqcIWw=="
        crossorigin="anonymous"></script>
        <script src="js/sidenav.js"></script>
    </body>
</html>

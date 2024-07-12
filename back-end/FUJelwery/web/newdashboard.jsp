
<%@page import="com.khac.swp.fuj.order.OrderDTO"%>
<%@page import="com.khac.swp.fuj.diamond.DiamondDTO"%>
<%@page import="com.khac.swp.fuj.ring.RingDTO"%>
<%@page import="com.khac.swp.fuj.ringplacementprice.RingPlacementPriceDTO"%>
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
        <link rel="icon" type="image/x-icon" href="images/Screenshot__656_-removebg-preview.png">
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
            /* Basic Link Styling */
            a {
                color: #3d3d3d;
                font-size: 16px;
                text-decoration: none;
                display: block;
                padding: 1px 20px;
                line-height: 48px;
            }
            .positive {
                color: green;
            }

            .negative {
                color: red;
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
            <br>
            <h4>List Of Staffs</h4>
            <table style="margin: 0 auto;">
                <tr>
                    <th>Full Name</th>
                    <th>Role Name</th>
                </tr>
                <%
                    List<UserDTO> listStaff = (List<UserDTO>) request.getAttribute("usliststaff");
                    for (UserDTO usListStaff : listStaff) {
                        pageContext.setAttribute("usliststaff", usListStaff);
                %>
                <tr>
                    <td><a href="DashboardController?action=userdetails&id=${usliststaff.userid}">${usliststaff.fullName}</td>
                    <td>${usliststaff.rolename}</td>

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
                    <td><a href="DashboardController?action=categorydetails&id=${cate.categoryID}">${cate.top3CategoryNames}</td>
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
            <h4>The Top 5 Collections are shown below</h4>

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
                    <td><a href="DashboardController?action=collectiondetails&id=${coll.collectionID}">${coll.collectionName}</td>
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
            <h4>The Top 3 mostly used Vouchers </h4>

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
                    <td><a href="DashboardController?action=voucherdetails&id=${vou.id}">${vou.name}</td>
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
                    <td><a href="DashboardController?action=certificatedetails&id=${certificate.certificateID}">${certificate.certificateID}</td>
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

            <h1>Diamond Statistics</h1>
            <%
                List<DiamondDTO> diaList = (List<DiamondDTO>) request.getAttribute("dialist");
                int totalDiamonds = 0;
                int activeDiamonds = 0;
                int deletedDiamonds = 0;
                int diamondsUsedInRing = 0;
                int diamondsNotUsedInRing = 0;
                double percentageDiamondsUsed = 0.0;
                double percentageDiamondsNotUsed = 0.0;
                String diamondsNotUsedListByID = "";
                String diamondsUsedListbyID = "";
                if (diaList != null) {
                    for (DiamondDTO diamond : diaList) {
                        totalDiamonds = diamond.getTotalDiamonds();
                        activeDiamonds = diamond.getActiveDiamonds();
                        deletedDiamonds = diamond.getDeletedDiamonds();
                        diamondsUsedInRing = diamond.getDiamondsUsedInRing();
                        diamondsNotUsedInRing = diamond.getDiamondsNotUsedInRing();
                        percentageDiamondsUsed = diamond.getPercentageDiamondsUsed();
                        percentageDiamondsNotUsed = diamond.getPercentageDiamondsNotUsed();
                        diamondsNotUsedListByID = diamond.getDiamondsNotUsedListByID();
                        diamondsUsedListbyID = diamond.getDiamondsUsedListbyID();
                    }
                }
                request.setAttribute("totalDiamonds", totalDiamonds);
                request.setAttribute("activeDiamonds", activeDiamonds);
                request.setAttribute("deletedDiamonds", deletedDiamonds);
                request.setAttribute("diamondsUsedInRing", diamondsUsedInRing);
                request.setAttribute("diamondsNotUsedInRing", diamondsNotUsedInRing);
                request.setAttribute("percentageDiamondsUsed", percentageDiamondsUsed);
                request.setAttribute("percentageDiamondsNotUsed", percentageDiamondsNotUsed);
                request.setAttribute("diamondsNotUsedListByID", diamondsNotUsedListByID);
                request.setAttribute("diamondsUsedListbyID", diamondsUsedListbyID);
            %>
            <strong>Total Diamonds: ${totalDiamonds}</strong>
            <strong>Active Diamonds: ${activeCategories}</strong>
            <strong>Deleted Diamonds: ${deletedCategories}</strong>
            <strong>Diamonds Used In Ring: ${diamondsUsedInRing}</strong>
            <strong>Diamonds Unused In Ring: ${diamondsNotUsedInRing}</strong>
            <strong>Percentage Diamonds Used: ${percentageDiamondsUsed}%</strong>
            <strong>Percentage Diamonds Not Used: ${percentageDiamondsNotUsed}%</strong>
            <strong>Diamonds Not Used List By ID: ${diamondsNotUsedListByID}</strong>
            <strong>Diamonds Used List By ID: ${diamondsUsedListbyID}</strong>

            <h4>The Top 5 Countries that Shop have Diamonds from</h4>
            <table style="margin: 0 auto;">
                <tr>
                    <th>Country</th>
                    <th>Ring Count</th>
                </tr>
                <% for (DiamondDTO diamond : diaList) {
                        pageContext.setAttribute("diamond", diamond);
                %>
                <tr>
                    <td>${diamond.country}</td>
                    <td>${diamond.diamondCount}</td>
                </tr>
                <%
                    }
                %>    
            </table>

            <h1>Ring Placement Price Statistics</h1>
            <strong>Total Ring Placements: ${requestScope.rppa.totalRp}</strong>
            <strong>Average Price: ${requestScope.rppa.averagePrice} VND</strong>

            <h4>The Top 5 Ring Placement By Material</h4>
            <table style="margin: 0 auto;">
                <tr>
                    <th>Material</th>
                    <th>Ring Placement By Material</th>
                    <th>Total Price of Ring Placement By Material</th>
                </tr>
                <%
                    List<RingPlacementPriceDTO> rppListA = (List<RingPlacementPriceDTO>) request.getAttribute("rpplista");
                    for (RingPlacementPriceDTO rpplista : rppListA) {
                        pageContext.setAttribute("rpplista", rpplista);
                %>
                <tr>
                    <td>${rpplista.material}</td>
                    <td>${rpplista.ringPlacementsByMaterial}</td>
                    <td><strong>${rpplista.totalMaterialPrice} VND</strong></td>
                </tr>
                <%
                    }
                %>    
            </table>
            <br>
            <h4>The Top 5 Ring Placement By Color</h4>
            <table style="margin: 0 auto;">
                <tr>
                    <th>Color</th>
                    <th>Ring Placement By Color</th>
                </tr>
                <%
                    List<RingPlacementPriceDTO> rppListB = (List<RingPlacementPriceDTO>) request.getAttribute("rpplistb");
                    for (RingPlacementPriceDTO rpplistb : rppListB) {
                        pageContext.setAttribute("rpplistb", rpplistb);
                %>
                <tr>
                    <td>${rpplistb.color}</td>
                    <td>${rpplistb.ringPlacementsByColor}</td>
                </tr>
                <%
                    }
                %>    
            </table>

            <h1>Warranty Statistics</h1>
            <strong>Total Warranties: ${requestScope.warranty.totalWarranties}</strong>
            <strong>Used Active Warranties: ${requestScope.warranty.usedActiveWarranties}</strong>
            <strong>Unused Active Warranties: ${requestScope.warranty.unusedActiveWarranties}</strong>
            <strong>Percentage Used Active: ${requestScope.warranty.percentageUsedActive}</strong>
            <strong>Percentage Unused Active: ${requestScope.warranty.percentageUnusedActive}</strong>
            <strong>Manufacturer Warranties: ${requestScope.warranty.manufacturerWarranties}</strong>

            <strong>Extended Warranties: ${requestScope.warranty.extendedWarranties}</strong>
            <strong>Limited Warranties: ${requestScope.warranty.limitedWarranties}</strong>
            <strong>Lifetime Warranties: ${requestScope.warranty.lifetimeWarranties}</strong>
            <strong>Retailer Warranties: ${requestScope.warranty.retailerWarranties}</strong>
            <strong>Earliest Start Date: ${requestScope.warranty.earliestStartDate}</strong>
            <strong>Latest Start Date: ${requestScope.warranty.latestStartDate}</strong>
            <strong>Average Warranty Duration Months: ${requestScope.warranty.avgWarrantyDurationMonths} months</strong>
            <strong>Active Warranties: ${requestScope.warranty.activeWarranties}</strong>
            <strong>Deleted Warranties: ${requestScope.warranty.deletedWarranties}</strong>
            <strong>Earliest End Date: ${requestScope.warranty.earliestEndDate}</strong>
            <strong>Latest End Date: ${requestScope.warranty.latestEndDate}</strong>
            <strong>Percentage Manufacturer Warranties: ${requestScope.warranty.percentageManufacturerWarranties}</strong>
            <strong>Percentage Extended Warranties: ${requestScope.warranty.percentageExtendedWarranties}</strong>
            <strong>Percentage Limited Warranties: ${requestScope.warranty.percentageLimitedWarranties}</strong>
            <strong>Percentage Lifetime Warranties: ${requestScope.warranty.percentageLifetimeWarranties}</strong>
            <strong>Percentage Retailer Warranties: ${requestScope.warranty.percentageRetailerWarranties}</strong>
            <strong>Unused Active Warranty List By Ids: ${requestScope.warranty.unusedActiveWarrantyIds}</strong>

            <h1>Ring Statistics</h1
            <strong>Total Rings: ${requestScope.ringtotal.totalRings}</strong>

            <h4>Top 5 Rings have highest price</h4>

            <table style="margin: 0 auto;">
                <tr>
                    <!--                    <th>Ring ID</th>-->
                    <th>Ring Name</th>
                    <th>Ring Image</th>
                    <th>Price</th>
                </tr>
                <%
                    List<RingDTO> ringHighest = (List<RingDTO>) request.getAttribute("ringlisthighest");
                    for (RingDTO ringlisthighest : ringHighest) {
                        pageContext.setAttribute("ringlisthighest", ringlisthighest);
                %>
                <tr>
<!--                    <td>${ringlisthighest.ringID}</td>-->
                    <td><a href="DashboardController?action=ringdetails&id=${ringlisthighest.ringID}">${ringlisthighest.ringName}</td>
                    <td><img src=${ringlisthighest.ringImage} width="100px" height="100px"></td>
                    <td><strong> ${ringlisthighest.totalPrice} VND</strong></td>
                </tr>
                <%
                    }
                %>    
            </table>
            <br>
            <h4>Top 5 Rings that have lowest price</h4>

            <table style="margin: 0 auto;">
                <tr>
                    <!--                    <th>Ring ID</th>-->
                    <th>Ring Name</th>
                    <th>Ring Image</th>
                    <th>Price</th>
                </tr>
                <%
                    List<RingDTO> ringLowest = (List<RingDTO>) request.getAttribute("ringlistlowest");
                    for (RingDTO ringlistlowest : ringLowest) {
                        pageContext.setAttribute("ringlistlowest", ringlistlowest);
                %>
                <tr>
<!--                    <td>${ringlistlowest.ringID}</td>-->
                    <td><a href="DashboardController?action=ringdetails&id=${ringlistlowest.ringID}">${ringlistlowest.ringName}</td>
                    <td><img src=${ringlistlowest.ringImage} width="100px" height="100px"></td>
                    <td><strong>${ringlistlowest.totalPrice} VND</strong></td>
                </tr>
                <%
                    }
                %>    
            </table>
            <br>
            <h4>Top 5 Sales From Each Month (Latest to Earliest)</h4>
            <table style="margin: 0 auto;">
                <tr>
                    <th>Order Year</th>
                    <th>Order Month</th>
                    <th>Month Name</th>
                    <!--                    <th>Ring ID</th>-->
                    <th>Ring Name</th>
                    <th>Ring Image</th>
                    <th>Number of Purchased Ring</th>
                    <th>Price</th>

                </tr>
                <%
                    List<RingDTO> ringListTopSales = (List<RingDTO>) request.getAttribute("ringlisttopsales");
                    for (RingDTO ringlisttopsales : ringListTopSales) {
                        pageContext.setAttribute("topsales", ringlisttopsales);
                %>
                <tr>
                    <td>${topsales.orderYear}</td>
                    <td>${topsales.orderMonth}</td>
                    <td>${topsales.monthName}</td>
<!--                    <td>${topsales.ringID}</td>-->
                    <td><a href="DashboardController?action=ringdetails&id=${topsales.ringID}">${topsales.ringName}</td>
                    <td><img src=${topsales.ringImage} width="100px" height="100px"></td>
                    <td>${topsales.purchaseCount}</td>
                    <td><strong>${topsales.totalPrice} VND</strong></td>
                </tr>
                <%
                    }
                %>    
            </table>

            <h1>Order Statistics</h1>
            <h4>Number of Orders for Home Delivery/Store Pickup</h4>

            <table style="margin: 0 auto;">
                <tr>
                    <th>Month Name</th>
                    <th>Year</th>
                    <th>Purchase Method</th>
                    <th>Order Count</th>

                </tr>
                <%
                    List<OrderDTO> listOrderA = (List<OrderDTO>) request.getAttribute("lista");
                    for (OrderDTO lista : listOrderA) {
                        pageContext.setAttribute("lista", lista);
                %>
                <tr>
                    <td>${lista.monthName}</td>
                    <td>${lista.year}</td>
                    <td>${lista.purchaseMethod}</td>
                    <td>${lista.orderCount}</td>
                </tr>
                <%
                    }
                %>    
            </table>

            <h4>Number of orders in a week</h4>
            <table style="margin: 0 auto;">
                <tr>
                    <th>Week Number</th>
                    <th>Year</th>
                    <th>Order Count</th>

                </tr>
                <%
                    List<OrderDTO> listOrderC = (List<OrderDTO>) request.getAttribute("listc");
                    for (OrderDTO listc : listOrderC) {
                        pageContext.setAttribute("listc", listc);
                %>
                <tr>
                    <td>${listc.weekNumber}</td>
                    <td>${listc.year}</td>
                    <td>${listc.orderCount}</td>
                </tr>
                <%
                    }
                %>    
            </table>

            <h4>Number of orders in month</h4>
            <table style="margin: 0 auto;">
                <tr>
                    <th>Month Name</th>
                    <th>Month Number</th>
                    <th>Year</th>
                    <th>Order Count</th>

                </tr>
                <%
                    List<OrderDTO> listOrderB = (List<OrderDTO>) request.getAttribute("listb");
                    for (OrderDTO listb : listOrderB) {
                        pageContext.setAttribute("listb", listb);
                %>
                <tr>
                    <td>${listb.monthName}</td>
                    <td>${listb.monthNumber}</td>
                    <td>${listb.year}</td>
                    <td>${listb.orderCount}</td>
                </tr>
                <%
                    }
                %>    
            </table>
            <h4>Number of orders for each method in month</h4>
            <table style="margin: 0 auto;">
                <tr>
                    <th>Month Name</th>
                    <th>Month Number</th>
                    <th>Year</th>
                    <th>Store Order Count</th>
                    <th>Delivery Order Count</th>

                </tr>
                <%
                    List<OrderDTO> listOrderI = (List<OrderDTO>) request.getAttribute("listi");
                    for (OrderDTO listi : listOrderI) {
                        pageContext.setAttribute("listi", listi);
                %>
                <tr>
                    <td>${listi.monthName}</td>
                    <td>${listi.monthNumber}</td>
                    <td>${listi.year}</td>
                    <td>${listi.storeOrderCount}</td>
                    <td>${listi.deliveryOrderCount}</td>
                </tr>
                <%
                    }
                %>    
            </table>
            <h4>List of weekly transactions</h4>
            <table style="margin: 0 auto;">
                <tr>
                    <th>Order ID</th>
                    <th>User ID</th>
                    <th>Order Date</th>
                    <th>Ring ID</th>

                </tr>
                <%
                    List<OrderDTO> listOrderD = (List<OrderDTO>) request.getAttribute("listd");
                    for (OrderDTO listd : listOrderD) {
                        pageContext.setAttribute("listd", listd);
                %>
                <tr>
                    <td>
                        <%-- Check if orderID is non-zero --%>
                        <% if (listd.getOrderID() != 0) {%>
                        <a href="DashboardController?action=orderdetails&id=<%= listd.getOrderID()%>"><%= listd.getOrderID()%></a>
                        <% } else {%>
                        <%= listd.getOrderID()%>
                        <% } %>
                    </td>
                    <td>
                        <%-- Check if userID is non-zero --%>
                        <% if (listd.getUserID() != 0) {%>
                        <a href="DashboardController?action=userdetails&id=<%= listd.getUserID()%>"><%= listd.getUserID()%></a>
                        <% } else {%>
                        <%= listd.getUserID()%>
                        <% }%>
                    </td>
                    <td><%= listd.getOrderDate()%></td>
                    <td>
                        <%-- Check if ringID is non-zero --%>
                        <% if (listd.getRingID() != 0) {%>
                        <a href="DashboardController?action=ringdetails&id=<%= listd.getRingID()%>"><%= listd.getRingID()%></a>
                        <% } else {%>
                        <%= listd.getRingID()%>
                        <% } %>
                    </td>
                </tr>

                <%
                    }
                %>    
            </table>
            <h4>Revenue for Week have Changes</h4>
            <table style="margin: 0 auto;">
                <tr>
                    <th>Year</th>
                    <th>Current Week</th>
                    <th>Current Week Revenue</th>
                    <th>Previous Week Revenue</th>
                    <th>Percentage Change</th>

                </tr>
                <%
                    List<OrderDTO> listOrderE = (List<OrderDTO>) request.getAttribute("liste");
                    for (OrderDTO liste : listOrderE) {
                        pageContext.setAttribute("liste", liste);
                %>
                <tr>
                    <td>${liste.year}</td>
                    <td>${liste.currentWeek}</td>
                    <td>${liste.currentWeekRevenue} VND</td>
                    <td>${liste.previousWeekRevenue} VND</td>
                    <td class="${liste.percentageChange > 0 ? 'positive' : 'negative'}">${liste.percentageChange}%</td>
                </tr>
                <%
                    }
                %>    
            </table>
            <h4>Revenue for Month have Changes</h4>
            <table style="margin: 0 auto;">
                <tr>
                    <th>Year</th>
                    <th>Month Number</th>
                    <th>Month Name</th>
                    <th>Current Month Revenue</th>
                    <th>Previous Month Revenue</th>
                    <th>Percentage Change</th>

                </tr>
                <%
                    List<OrderDTO> listOrderF = (List<OrderDTO>) request.getAttribute("listf");
                    for (OrderDTO listf : listOrderF) {
                        pageContext.setAttribute("listf", listf);
                %>
                <tr>
                    <td>${listf.year}</td>
                    <td>${listf.monthNumber}</td>
                    <td>${listf.monthName}</td>
                    <td>${listf.currentMonthRevenue} VND</td>
                    <td>${listf.previousMonthRevenue} VND</td>
                    <td class="${listf.percentageChange > 0 ? 'positive' : 'negative'}">${listf.percentageChange}%</td>
                </tr>
                <%
                    }
                %>    
            </table>
            <h4>Revenue for Week</h4>
            <table style="margin: 0 auto;">
                <tr>
                    <th>Year</th>
                    <th>Week Number</th>
                    <th>Total Revenue</th>
                </tr>
                <%
                    List<OrderDTO> listOrderG = (List<OrderDTO>) request.getAttribute("listg");
                    for (OrderDTO listg : listOrderG) {
                        pageContext.setAttribute("listg", listg);
                %>
                <tr>
                    <td>${listg.year}</td>
                    <td>${listg.weekNumber}</td>
                    <td>${listg.totalRevenue} VND</td>
                </tr>
                <%
                    }
                %>    
            </table>
            <h4>Revenue for Month</h4>
            <table style="margin: 0 auto;">
                <tr>
                    <th>Year</th>
                    <th>Month Number</th>
                    <th>Month Name</th>
                    <th>Total Revenue</th>

                </tr>
                <%
                    List<OrderDTO> listOrderH = (List<OrderDTO>) request.getAttribute("listh");
                    for (OrderDTO listh : listOrderH) {
                        pageContext.setAttribute("listh", listh);
                %>
                <tr>
                    <td>${listh.year}</td>
                    <td>${listh.monthNumber}</td>
                    <td>${listh.monthName}</td>
                    <td>${listh.totalRevenue} VND</td>
                </tr>
                <%
                    }
                %>    
            </table>

        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.js"
                integrity="sha512-8Z5++K1rB3U+USaLKG6oO8uWWBhdYsM3hmdirnOEWp8h2B1aOikj5zBzlXs8QOrvY9OxEnD2QDkbSKKpfqcIWw=="
        crossorigin="anonymous"></script>
        <script src="js/sidenav.js"></script>
    </body>
</html>
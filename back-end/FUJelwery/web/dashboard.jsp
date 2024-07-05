<%@page import="com.google.gson.Gson"%>
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
<%
    List<OrderDTO> listOrderA = (List<OrderDTO>) request.getAttribute("lista");
%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <title>Admin Dashboard</title>

        <!-- Montserrat Font -->
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&display=swap"
              rel="stylesheet">

        <!-- Material Icons -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">

        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/dashboard.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>

    <body>
        <div class="grid-container">

            <!-- Main -->
            <main class="main-container">
                <div class="main-title">
                    <h2>DASHBOARD</h2>
                </div>


                <div class="main-cards">
                    <div class="card">
                        <%
                            List<DiamondDTO> diaList = (List<DiamondDTO>) request.getAttribute("dialist");
                            int totalDiamonds = 0;
                            if (diaList != null) {
                                for (DiamondDTO diamond : diaList) {
                                    totalDiamonds = diamond.getTotalDiamonds();
                                }
                            }
                            request.setAttribute("totalDiamonds", totalDiamonds);
                        %>
                        <div class="card-inner">
                            <h3>DIAMONDS</h3>
                            <span class="material-icons-outlined">diamond</span>
                        </div>                      
                        <h1>40</h1>
                    </div>


                    <div class="card">
                        <%
                            List<CertificateDTO> certList = (List<CertificateDTO>) request.getAttribute("certlist");
                            int totalCertificates = 0;
                            if (certList != null) {
                                for (CertificateDTO certificate : certList) {
                                    totalCertificates = certificate.getTotalCertificates();
                                }
                            }
                            request.setAttribute("totalCertificates", totalCertificates);
                        %>
                        <div class="card-inner">
                            <h3>CERTIFICATES</h3>
                            <span class="material-icons-outlined">card_membership</span>
                        </div>
                        <h1>${totalCertificates}</h1>
                    </div>

                    <div class="card">
                        <div class="card-inner">
                            <h3>WARRANTY</h3>
                            <span class="material-icons-outlined">verified_user</span>
                        </div>
                        <h1>${requestScope.warranty.totalWarranties}</h1>
                    </div>

                    <div class="card">
                        <div class="card-inner">
                            <h3>POSTS</h3>
                            <span class="material-icons-outlined">newspaper</span>
                        </div>
                        <h1>${requestScope.post.totalNumberOfActivePosts}</h1>
                    </div>

                </div>

                <div class="charts">
                    <div class="charts-card1 area-chart">
                        <h2 class="chart-title">Purchase and Sales Orders</h2>
                        <div id="area-chart"></div>
                    </div>

                    <div class="pie-chart">
                        <%
                            List<CertificateDTO> certListB = (List<CertificateDTO>) request.getAttribute("certlist");
                            double usedPercentage = 0.0;
                            double unusedPercentage = 0.0;

                            if (certListB != null) {
                                for (CertificateDTO certificate : certListB) {
                                    usedPercentage = certificate.getUsedPercentage();
                                    unusedPercentage = certificate.getUnusedPercentage();
                                }
                            }
                            request.setAttribute("usedPercentage", usedPercentage);
                            request.setAttribute("unusedPercentage", unusedPercentage);
                        %>
                        <div class="charts-card1">
                            <h2 class="chart-title">Certificate Usage</h2>
                            <div id="degree-pie-chart"></div>
                        </div>

                        <div class="charts-card1">
                            <h2 class="chart-title">Warranty Usage</h2>
                            <div id="diamond-pie-chart"></div>
                        </div>
                    </div>
                </div>

                <div class="charts-row1">
                    <div class="charts-card2 bar-chart">
                        <h2 class="chart-title">Orders for Home Delivery/Store Pickup</h2>
                        <div id="orders-column-chart"></div>
                    </div>

                    <div class="charts-card2 line-chart">
                        <h2 class="chart-title">Number of Orders per Week</h2>
                        <div id="orders-weekly-line-chart"></div>
                    </div>

                    <div class="charts-card2 line-chart">
                        <h2 class="chart-title">Number of Orders per Month</h2>
                        <div id="orders-monthly-line-chart"></div>
                    </div>
                </div>

                <div class="charts-row">
                    <div class="charts-card2 column-chart">
                        <h2 class="chart-title">Revenue for Week</h2>
                        <div id="revenue-week-column-chart"></div>
                        <div class="percentage-change" id="weekly-revenue-change"></div>
                    </div>

                    <div class="charts-card2 column-chart">
                        <h2 class="chart-title">Revenue for Month</h2>
                        <div id="revenue-month-column-chart"></div>
                        <div class="percentage-change" id="monthly-revenue-change"></div>
                    </div>
                </div>


                <div class="merged-charts-container">
                    <%
// Initialize a variable to hold the JavaScript data array
StringBuilder jsDataArray = new StringBuilder("[");

for (DiamondDTO diamond : diaList) {
    pageContext.setAttribute("diamond", diamond);

    // Add each diamond's data to the JavaScript array
    jsDataArray.append("{")
              .append("\"name\": \"").append(diamond.getCountry()).append("\", ")
              .append("\"value\": ").append(diamond.getDiamondCount())
              .append("},");
}

// Remove the trailing comma if array has elements and close the array
if (jsDataArray.length() > 1) {
    jsDataArray.setLength(jsDataArray.length() - 1);
}
jsDataArray.append("]");
%>
                    <div class="chart-card" id="map-chart-container">
                        <h2 class="chart-title">Top 5 Countries with Most Diamonds Originated</h2>
                        <div id="map-chart"></div>
                    </div>
                    <div class="chart-card" id="bar-chart-container">
                        <h2 class="chart-title">125.7k Views from 60 countries</h2>
                        <div id="bar-chart"></div>
                    </div>
                </div>

                <div class="purchased-history-container">
                    <div class="table-container1">
                        <div class="x_title">
                            <h2>Purchased History</h2>
                            <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                        </div>
                        <div class="collapse-content">
                            <table>
                                <tr class="flex-row1">
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
                                <!-- Add your rows here -->
                                <tr class="flex-row1">
                                    <td><a href="DashboardController?action=orderdetails&id=${listd.orderID}">${listd.orderID}</td>
                                    <td><a href="DashboardController?action=userdetails&id=${listd.userID}">${listd.userID}</td>
                                    <td>${listd.orderDate}</td>
                                    <td><a href="DashboardController?action=ringdetails&id=${listd.ringID}">${listd.ringID}</td>
                                </tr>
                                <%
                                    }
                                %>                                  
                                <!-- Add more rows as needed -->
                            </table>
                        </div>
                    </div>
                </div>

                <!-- New Tables Section -->
                <div class="charts-row">
                    <div class="x_content" style="display: block;">
                        <div class="table-container">
                            <div class="x_title">
                                <h2>Top 5 Rings with Highest Price</h2>
                                <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </div>
                            <div class="collapse-content">
                                <table>
                                    <tr>
                                        <th>Ring</th>
                                        <th>Price</th>
                                    </tr>
                                    <tr>
                                        <%
                                            List<RingDTO> ringHighest = (List<RingDTO>) request.getAttribute("ringlisthighest");
                                            for (RingDTO ringlisthighest : ringHighest) {
                                                pageContext.setAttribute("ringlisthighest", ringlisthighest);
                                        %>
                                        <td class="flex-row">
                                            <img
                                                src="${ringlisthighest.ringImage}"
                                                alt="Diamond Platinum Ring" class="smaller-size">
                                            <a href="DashboardController?action=ringdetails&id=${ringlisthighest.ringID}">${ringlisthighest.ringName}
                                        </td>
                                        <td>${ringlisthighest.totalPrice} VND</td>

                                    </tr>    
                                    <%
                                        }
                                    %> 
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="x_content" style="display: block;">
                        <div class="table-container">
                            <div class="x_title">
                                <h2>Top 5 Rings with Lowest Price</h2>
                                <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </div>
                            <div class="collapse-content">
                                <table>
                                    <tr>
                                        <th>Ring</th>
                                        <th>Price</th>
                                    </tr>
                                    <tr>
                                        <%
                                            List<RingDTO> ringLowest = (List<RingDTO>) request.getAttribute("ringlistlowest");
                                            for (RingDTO ringlistlowest : ringLowest) {
                                                pageContext.setAttribute("ringlistlowest", ringlistlowest);
                                        %>
                                        <td class="flex-row">
                                            <img src="${ringlistlowest.ringImage}"
                                                 alt="Silver Ring" class="smaller-size">
                                            <a href="DashboardController?action=ringdetails&id=${ringlistlowest.ringID}">${ringlistlowest.ringName}
                                        </td>
                                        <td>${ringlistlowest.totalPrice} VND</td>
                                    </tr>
                                    <%
                                        }
                                    %>                                      
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="x_content" style="display: block;">
                        <div class="table-container">
                            <div class="x_title">
                                <h2>Top 5 Ring Sales From Each Month</h2>
                                <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </div>
                            <div class="collapse-content">
                                <table>
                                    <tr>
                                        <th>Month</th>
                                        <th>Ring</th>
                                        <th>Sales</th>
                                    </tr>
                                    <tr>
                                        <%
                                            List<RingDTO> ringListTopSales = (List<RingDTO>) request.getAttribute("ringlisttopsales");
                                            for (RingDTO ringlisttopsales : ringListTopSales) {
                                                pageContext.setAttribute("topsales", ringlisttopsales);
                                        %>
                                        <td>${topsales.monthName}</td>
                                        <td class="flex-row">
                                            <img src="${topsales.ringImage}"
                                                 alt="Silver Ring" class="smaller-size">
                                            <a href="DashboardController?action=ringdetails&id=${topsales.ringID}">${topsales.ringName}
                                        </td>
                                        <td>${topsales.totalPrice} VND</td>
                                    </tr>
                                    <%
                                        }
                                    %>                                      
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End New Tables Section -->

                <div class="charts-row">
                    <div class="x_content" style="display: block;">
                        <div class="table-container">
                            <div class="x_title">
                                <h2>Top 5 Ring Placements</h2>
                                <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </div>
                            <div class="collapse-content">
                                <table>
                                    <tr>
                                        <th>Material</th>
                                        <th>Ring Placement By Material</th>
                                    </tr>
                                    <tr>
                                        <%
                                            List<RingPlacementPriceDTO> rppListA = (List<RingPlacementPriceDTO>) request.getAttribute("rpplista");
                                            for (RingPlacementPriceDTO rpplista : rppListA) {
                                                pageContext.setAttribute("rpplista", rpplista);
                                        %>
                                        <td class="flex-row">${rpplista.material}</td>
                                        <td>${rpplista.ringPlacementsByMaterial}</td>
                                    </tr>
                                    <%
                                        }
                                    %>                                      
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="x_content" style="display: block;">
                        <div class="table-container">
                            <div class="x_title">
                                <h2>Top 3 Most Used Vouchers</h2>
                                <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </div>
                            <div class="collapse-content">
                                <table>
                                    <tr>
                                        <th>Coupon</th>
                                        <th>Usage</th>
                                    </tr>
                                    <tr>
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
                                        <% for (VoucherDTO vou : vouList) {
                                                pageContext.setAttribute("vou", vou);
                                        %>
                                        <td class="flex-row"><a href="DashboardController?action=voucherdetails&id=${vou.id}">${vou.name}</td>
                                        <td>${vou.totalOrdersUsingVoucher}</td>
                                    </tr>
                                    <%
                                        }
                                    %>                                     
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="x_content" style="display: block;">
                        <div class="table-container">
                            <div class="x_title">
                                <h2>All Warranty Types</h2>
                                <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </div>
                            <div class="collapse-content">
                                <table>
                                    <tr>
                                        <th>Type</th>
                                        <th>Usage</th>
                                    </tr>
                                    <tr>
                                        <td class="flex-row"> Limited
                                            Warranties</td>
                                        <td>${requestScope.warranty.limitedWarranties}</td>
                                    </tr>
                                    <tr>
                                        <td class="flex-row">
                                            Manufacturer Warranties</td>
                                        <td>${requestScope.warranty.manufacturerWarranties}</td>
                                    </tr>
                                    <tr>
                                        <td class="flex-row"> Extended
                                            Warranties</td>
                                        <td>${requestScope.warranty.extendedWarranties}</td>
                                    </tr>
                                    <tr>
                                        <td class="flex-row"> Lifetime
                                            Warranties</td>
                                        <td>${requestScope.warranty.lifetimeWarranties}</td>
                                    </tr>
                                    <tr>
                                        <td class="flex-row"> Retailer
                                            Warranties</td>
                                        <td>${requestScope.warranty.retailerWarranties}</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="charts-card" style="margin-top: 20px;">
                    <h2 class="chart-title">FUJ Staffs</h2>
                    <div class="staff-container">
                        <%
                            List<UserDTO> listStaff = (List<UserDTO>) request.getAttribute("usliststaff");
                            for (UserDTO usListStaff : listStaff) {
                                pageContext.setAttribute("usliststaff", usListStaff);
                        %>
                        <div class="staff-member">                            
                            <img src="https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/man-user-circle-icon.png"
                                 alt="Nguyen Phu Cuong" class="staff-photo">
                            <h3><a href="DashboardController?action=userdetails&id=${usliststaff.userid}">${usliststaff.fullName}</h3>
                            <p>${usliststaff.rolename}</p>
                        </div>
                        <%
                            }
                        %> 
                    </div>
                </div>

        </div>
    </div>

</main>
<!-- End Main -->

</div>

<!-- Scripts -->
<!-- Highcharts -->
<script src="https://code.highcharts.com/maps/highmaps.js"></script>
<script src="https://code.highcharts.com/maps/modules/exporting.js"></script>
<script src="https://code.highcharts.com/mapdata/custom/world.js"></script>
<script src="https://code.highcharts.com/maps/modules/data.js"></script>
<script src="https://code.highcharts.com/maps/modules/exporting.js"></script>
<script src="https://code.highcharts.com/mapdata/custom/world.js"></script>
<!-- ApexCharts -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.35.5/apexcharts.min.js"></script>
<!-- Custom JS -->
<script src="js/dashboard.js"></script>

<!--Certificate Pie Chart-->
<script>
    // Get JSP variables into JavaScript
    var usedPercentage = <%= usedPercentage%>;
    var unusedPercentage = <%= unusedPercentage%>;

    // ApexCharts configuration
    const degreePieChartOptions = {
        series: [usedPercentage, unusedPercentage],
        chart: {
            type: 'pie',
            background: 'transparent',
            height: 130,
        },
        labels: ['Used', 'Not Used'],
        legend: {
            labels: {
                colors: '#f5f7ff',
            },
            show: true,
            position: 'bottom',
        },
        tooltip: {
            theme: 'dark',
        },
    };

    // Render the chart
    const degreePieChart = new ApexCharts(document.querySelector('#degree-pie-chart'), degreePieChartOptions);
    degreePieChart.render();
</script>   

<!--Warranty Pie Chart-->
<script>
    <%-- Retrieve data from request scope --%>
    var percentageUsedActive = ${requestScope.warranty.percentageUsedActive};
    var percentageUnusedActive = ${requestScope.warranty.percentageUnusedActive};

    // ApexCharts configuration
    const options = {
        series: [percentageUsedActive, percentageUnusedActive],
        chart: {
            type: 'pie',
            background: 'transparent', // Adding background property to match the first snippet
            height: 130,
        },
        labels: ['Used', 'Not Used'],
        legend: {
            labels: {
                colors: '#f5f7ff',
            },
            show: true,
            position: 'bottom',
        },
        tooltip: {
            theme: 'dark',
        },
        responsive: [{
                breakpoint: 480,
                options: {
                    chart: {
                        width: 200
                    },
                    legend: {
                        position: 'bottom'
                    }
                }
            }]
    };


    // Render ApexCharts
    var chart = new ApexCharts(document.querySelector("#diamond-pie-chart"), options);
    chart.render();
</script>

<!--Orders for Home Delivery/Store Pickup Grouped Column Chart-->
<script>
    var ordersDataFromJSP = JSON.parse('<%= new Gson().toJson(listOrderA)%>');
</script>

<!--Map Chart-->
<script>
    // Parse the JavaScript data array from JSP
    var diamondData = <%= jsDataArray.toString() %>;

    // Initialize the Highcharts map chart with the dynamic data
    Highcharts.mapChart('map-chart', {
        chart: {
            map: 'custom/world',
            width: 600, // Adjusted width
            height: 300 // Adjusted height
        },
        title: {
            text: 'Top Countries with Most Diamonds Sold'
        },
        mapNavigation: {
            enabled: true,
            buttonOptions: {
                verticalAlign: 'bottom'
            }
        },
        colorAxis: {
            min: 0
        },
        series: [{
            data: diamondData,
            mapData: Highcharts.maps['custom/world'],
            joinBy: ['name', 'name'], // Match data by country name
            name: 'Diamonds Sold',
            states: {
                hover: {
                    color: '#a4edba'
                }
            },
            dataLabels: {
                enabled: true,
                format: '{point.name}'
            }
        }]
    });
</script>
<script>
    // Assuming you have retrieved diaList from your JSP file
    var diaList = [
    <%
        for (DiamondDTO diamond : diaList) {
            // Outputting data in the format needed for JavaScript
%>{country: '<%= diamond.getCountry()%>', diamondCount: <%= diamond.getDiamondCount()%>},
    <% }%>
    ];

    // Extract categories (countries) and data (diamond counts)
    var categories = [];
    var data = [];
    diaList.forEach(function (diamond) {
        categories.push(diamond.country);
        data.push(diamond.diamondCount);
    });

    // ApexCharts configuration
    var optionsBar = {
        series: [{
                data: data
            }],
        chart: {
            type: 'bar',
            height: 200,
            width: '90%' // Adjusted width to span the container
        },
        plotOptions: {
            bar: {
                horizontal: true,
                colors: {
                    ranges: [{
                            from: 0,
                            to: 1000,
                            color: '#007bff'
                        }]
                }
            }
        },
        dataLabels: {
            enabled: false
        },
        yaxis: {
            labels: {
                style: {
                    colors: '#fff', // Simplified for all labels
                    fontSize: '14px'
                }
            }
        },
        xaxis: {
            categories: categories,
            labels: {
                style: {
                    colors: '#fff', // Simplified for all labels
                    fontSize: '14px'
                }
            }
        }
    };

    // Initialize and render the chart
    var chartBar = new ApexCharts(document.querySelector("#bar-chart"), optionsBar);
    chartBar.render();
</script>
</body>

</html>
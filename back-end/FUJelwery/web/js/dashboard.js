
// ---------- CHARTS ----------


// Bar Chart


// AREA CHART
const areaChartOptions = {
    series: [
        {
            name: 'Purchase Orders',
            data: [31, 40, 28, 51, 42, 109, 100],
        },
        {
            name: 'Sales Orders',
            data: [11, 32, 45, 32, 34, 52, 41],
        },
    ],
    chart: {
        type: 'area',
        background: 'transparent',
        height: 250, // Reduced height
        width: 900,
        stacked: false,
        toolbar: {
            show: false,
        },
    },
    colors: ['#00ab57', '#d50000'],
    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'],
    dataLabels: {
        enabled: false,
    },
    fill: {
        gradient: {
            opacityFrom: 0.4,
            opacityTo: 0.1,
            shadeIntensity: 1,
            stops: [0, 100],
            type: 'vertical',
        },
        type: 'gradient',
    },
    grid: {
        borderColor: '#55596e',
        yaxis: {
            lines: {
                show: true,
            },
        },
        xaxis: {
            lines: {
                show: true,
            },
        },
    },
    legend: {
        labels: {
            colors: '#f5f7ff',
        },
        show: true,
        position: 'top',
    },
    markers: {
        size: 6,
        strokeColors: '#1b2635',
        strokeWidth: 3,
    },
    stroke: {
        curve: 'smooth',
    },
    xaxis: {
        axisBorder: {
            color: '#55596e',
            show: true,
        },
        axisTicks: {
            color: '#55596e',
            show: true,
        },
        labels: {
            offsetY: 5,
            style: {
                colors: '#f5f7ff',
            },
        },
    },
    yaxis: [
        {
            title: {
                text: 'Purchase Orders',
                style: {
                    color: '#f5f7ff',
                },
            },
            labels: {
                style: {
                    colors: ['#f5f7ff'],
                },
            },
        },
        {
            opposite: true,
            title: {
                text: 'Sales Orders',
                style: {
                    color: '#f5f7ff',
                },
            },
            labels: {
                style: {
                    colors: ['#f5f7ff'],
                },
            },
        },
    ],
    tooltip: {
        shared: true,
        intersect: false,
        theme: 'dark',
    },
};

const areaChart = new ApexCharts(
        document.querySelector('#area-chart'),
        areaChartOptions
        );
areaChart.render();

// DEGREE USAGE PIE CHART


// DIAMOND USAGE PIE CHART


document.querySelectorAll('.collapse-link').forEach(link => {
    link.addEventListener('click', function () {
        const collapseContent = this.closest('.x_title').nextElementSibling;
        collapseContent.classList.toggle('show');
        const icon = this.querySelector('i');
        icon.classList.toggle('fa-chevron-up');
        icon.classList.toggle('fa-chevron-down');
    });
});

document.addEventListener("DOMContentLoaded", function () {
    // Sample data for charts (replace with actual data)
    const ordersData = {
        categories: ['Home Delivery', 'Store Pickup'],
        series: [{
                data: [120, 80]
            }]
    };

    // Initialize ApexCharts for each chart
    const ordersBarChartOptions = {
        chart: {
            type: 'bar',
            height: 350
        },
        plotOptions: {
            bar: {
                horizontal: false,
                columnWidth: '55%',
                endingShape: 'rounded'
            },
        },
        dataLabels: {
            enabled: true,
            style: {
                colors: ['#ffffff'] // White color for data labels
            }
        },
        stroke: {
            show: true,
            width: 2,
            colors: ['transparent']
        },
        xaxis: {
            categories: ordersData.categories,
            labels: {
                style: {
                    colors: ['#ffffff'], // White color for x-axis labels
                }
            }
        },
        yaxis: {
            title: {
                text: 'Orders',
                style: {
                    color: '#ffffff' // White color for y-axis title
                }
            },
            labels: {
                style: {
                    colors: ['#ffffff'], // White color for y-axis labels
                }
            }
        },
        fill: {
            opacity: 1
        },
        tooltip: {
            y: {
                formatter: function (val) {
                    return val
                }
            }
        }
    };

    // Render ApexCharts
    const ordersBarChart = new ApexCharts(document.querySelector("#orders-bar-chart"), ordersBarChartOptions);
    ordersBarChart.render();

});

document.addEventListener("DOMContentLoaded", function () {
    // Assume 'ordersDataFromJSP' is populated with OrderDTO data from JSP
    const ordersData = {
        categories: [], // Array to hold month and year names
        series: [] // Array to hold series data (per purchase method)
    };

    // Process data from ordersDataFromJSP to prepare for chart rendering
    ordersDataFromJSP.forEach(item => {
        const monthYear = `${item.monthName} ${item.year}`;

        if (!ordersData.categories.includes(monthYear)) {
            ordersData.categories.push(monthYear);
        }

        // Check if series for purchaseMethod exists, if not, create it
        let seriesItem = ordersData.series.find(series => series.name === item.purchaseMethod);
        if (!seriesItem) {
            seriesItem = { name: item.purchaseMethod, data: [] };
            ordersData.series.push(seriesItem);
        }

        seriesItem.data.push(item.orderCount);
    });

    // ApexCharts configuration for grouped column chart
    const ordersColumnChartOptions = {
        chart: {
            type: 'bar',
            height: 150,
            toolbar: {
                show: false // Hide toolbar
            }
        },
        plotOptions: {
            bar: {
                horizontal: false,
                columnWidth: '50%',
                endingShape: 'rounded'
            },
        },
        dataLabels: {
            enabled: false
        },
        stroke: {
            show: true,
            width: 2,
            colors: ['transparent']
        },
        series: ordersData.series, // Assign series data dynamically
        xaxis: {
            categories: ordersData.categories,
            labels: {
                style: {
                    colors: '#ffffff' // White color for x-axis labels
                }
            }
        },
        yaxis: {
            title: {
                text: 'Number of Orders',
                style: {
                    color: '#ffffff' // White color for y-axis title
                }
            },
            labels: {
                style: {
                    colors: '#ffffff' // White color for y-axis labels
                }
            }
        },
        fill: {
            opacity: 1
        },
        tooltip: {
            y: {
                formatter: function (val) {
                    return val + " orders"
                }
            }
        },
        legend: {
            show: true,
            labels: {
                colors: '#ffffff' // White color for legend labels
            }
        },
        responsive: [{
            breakpoint: 480,
            options: {
                legend: {
                    position: 'bottom'
                }
            }
        }]
    };

    // Initialize the chart with options
    const ordersColumnChart = new ApexCharts(document.querySelector("#orders-column-chart"), ordersColumnChartOptions);
    ordersColumnChart.render();
});



const revenueMonthColumnChartOptions = {
    chart: {
        type: 'bar',
        width: 550,
        height: 150,
    },
    plotOptions: {
        bar: {
            horizontal: false,
            columnWidth: '55%',
            endingShape: 'rounded'
        },
    },
    dataLabels: {
        enabled: false
    },
    stroke: {
        show: true,
        width: 2,
        colors: ['transparent']
    },
    series: [{
            name: 'Revenue',
            data: [1600, 1800, 2000, 2200, 2400, 2600, 2800]
        }],
    xaxis: {
        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'],
        labels: {
            style: {
                colors: '#ffffff' // White color for x-axis labels
            }
        }
    },
    yaxis: {
        title: {
            text: 'Revenue ($)',
            style: {
                color: '#ffffff' // White color for y-axis title
            }
        }
    },
    fill: {
        opacity: 1
    },
    tooltip: {
        y: {
            formatter: function (val) {
                return '$' + val
            }
        }
    },
    legend: {
        colors: ['#ffffff'], // White color for legend items
    }
};

// Initialize the charts

const revenueMonthChart = new ApexCharts(document.querySelector("#revenue-month-column-chart"), revenueMonthColumnChartOptions);
revenueMonthChart.render();

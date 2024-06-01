<%@page import="com.khac.swp.fuj.voucher.VoucherDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Voucher Management Page</title>
    <link rel="stylesheet" href="css/navbar.css">
    <link rel="stylesheet" href="css/customer_list.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
    <%@ include file="/salesmenu.jsp" %>
    <div class="list-container">
        <div class="smaller-container">
            <div class="list1">
                <div class="list-intro-left">
                    <div class="left-icon">
                        <i class='bx bxs-badge-dollar'></i>
                    </div>
                    <div class="left-info">
                        <div class="list-title">Voucher List</div>
                        <div class="">List of Voucher</div>
                    </div>
                </div>
                <div class="list-intro-right">
                    <form action="VoucherController" method="POST" class="input1">
                        <input name="action" value="create" type="hidden">
                        <button type="submit" class="styled-button3">
                            <span>Add a Voucher</span>
                        </button>
                    </form>
                </div>
            </div>

            <div class="list">
                <form action='' method=GET id="searchbox">
                    <input name=keyword type=text class="search-input" value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>">
                    <button type="submit" class="search-button"><i class="fas fa-search"></i></button>
                </form>

                <table id="voucherTable">
                    <thead>
                        <tr>
                            <th>Voucher ID</th>
                            <th><a href=?colSort=postName>Voucher Name</a></th>
                            <th>Image</th>
                            <th>Description</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            List<VoucherDTO> list = (List<VoucherDTO>) request.getAttribute("voucherlist");
                            for (VoucherDTO voucher : list) {
                                pageContext.setAttribute("voucher", voucher);
                        %>
                        <tr>
                            <td><a href="VoucherController?action=details&id=${voucher.id}">${voucher.id}</a></td>
                            <td>${voucher.name}</td>
                            <td><img src=${voucher.image} width="300px" height="300px"></td>
                            <td>${voucher.description}</td>
                            <td>
                                <form action="VoucherController" method="POST" class="input">
                                    <input name="action" value="delete" type="hidden">
                                    <input name="id" value="${voucher.id}" type="hidden">
                                    <input type="submit" value="Delete">
                                </form>
                            </td>
                        </tr>
                        <% 
                            }
                        %>
                    </tbody>
                </table>
                <div id="paginationControls" class="pagination-controls">
                    <button id="prevButton" class="pagination-button"><i class="fas fa-chevron-left"></i></button>
                    <span id="pageNumbers"></span>
                    <button id="nextButton" class="pagination-button"><i class="fas fa-chevron-right"></i></button>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const rowsPerPage = 1;
            const table = document.getElementById('voucherTable').getElementsByTagName('tbody')[0];
            const rows = table.getElementsByTagName('tr');
            const rowsCount = rows.length;
            const pageCount = Math.ceil(rowsCount / rowsPerPage);
            const paginationControls = document.getElementById('paginationControls');
            const prevButton = document.getElementById('prevButton');
            const nextButton = document.getElementById('nextButton');
            const pageNumbers = document.getElementById('pageNumbers');
            let currentPage = 1;

            function showPage(pageNumber) {
                let start = (pageNumber - 1) * rowsPerPage;
                let end = start + rowsPerPage;
                for (let i = 0; i < rowsCount; i++) {
                    rows[i].style.display = (i >= start && i < end) ? '' : 'none';
                }
                currentPage = pageNumber;
                updatePaginationControls();
            }

            function updatePaginationControls() {
                pageNumbers.innerHTML = `${currentPage}`;
                prevButton.disabled = currentPage === 1;
                nextButton.disabled = currentPage === pageCount;
            }

            prevButton.addEventListener('click', function() {
                if (currentPage > 1) {
                    showPage(currentPage - 1);
                }
            });

            nextButton.addEventListener('click', function() {
                if (currentPage < pageCount) {
                    showPage(currentPage + 1);
                }
            });

            showPage(1);
        });
    </script>
</body>
</html>

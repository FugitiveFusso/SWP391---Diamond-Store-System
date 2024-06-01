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
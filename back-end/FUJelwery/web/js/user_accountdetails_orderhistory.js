document.addEventListener('DOMContentLoaded', function() {
    const rowsPerPage = 10;

    function setupPagination(tableBodyId, paginationControlsId, prevButtonId, nextButtonId, pageNumbersId) {
        const tableBody = document.getElementById(tableBodyId);
        const rows = Array.from(tableBody.getElementsByTagName('tr'));
        const totalPages = Math.ceil(rows.length / rowsPerPage);
        const paginationControls = document.getElementById(paginationControlsId);
        const prevButton = document.getElementById(prevButtonId);
        const nextButton = document.getElementById(nextButtonId);
        const pageNumbersContainer = document.getElementById(pageNumbersId);
        let currentPage = 1;

        function displayRows() {
            tableBody.innerHTML = '';
            const start = (currentPage - 1) * rowsPerPage;
            const end = start + rowsPerPage;
            const rowsToDisplay = rows.slice(start, end);
            rowsToDisplay.forEach(row => tableBody.appendChild(row));
        }

        function createPageNumbers() {
            pageNumbersContainer.innerHTML = '';

            function createPageButton(page) {
                const pageButton = document.createElement('button');
                pageButton.textContent = page;
                pageButton.classList.add('pagination-button');
                if (page === currentPage) {
                    pageButton.classList.add('active');
                }
                pageButton.onclick = function() {
                    currentPage = page;
                    updatePagination();
                };
                pageNumbersContainer.appendChild(pageButton);
            }

            function createEllipsis() {
                const ellipsis = document.createElement('span');
                ellipsis.textContent = '...';
                pageNumbersContainer.appendChild(ellipsis);
            }

            if (totalPages <= 7) {
                for (let i = 1; i <= totalPages; i++) {
                    createPageButton(i);
                }
            } else {
                createPageButton(1);
                if (currentPage > 4) {
                    createEllipsis();
                }
                let startPage = Math.max(2, currentPage - 1);
                let endPage = Math.min(totalPages - 1, currentPage + 1);
                if (currentPage <= 4) {
                    endPage = 4;
                }
                if (currentPage >= totalPages - 3) {
                    startPage = totalPages - 3;
                }
                for (let i = startPage; i <= endPage; i++) {
                    createPageButton(i);
                }
                if (currentPage < totalPages - 3) {
                    createEllipsis();
                }
                createPageButton(totalPages);
            }
        }

        function updatePagination() {
            displayRows();
            createPageNumbers();
            updateButtonStates();
        }

        function updateButtonStates() {
            prevButton.disabled = currentPage === 1;
            nextButton.disabled = currentPage === totalPages;
        }

        prevButton.onclick = function() {
            if (currentPage > 1) {
                currentPage--;
                updatePagination();
            }
        };

        nextButton.onclick = function() {
            if (currentPage < totalPages) {
                currentPage++;
                updatePagination();
            }
        };

        // Initial display
        updatePagination();
    }

    // Setup pagination for both tables
    setupPagination('store-received-orders-body', 'paginationControls1', 'prevButton1', 'nextButton1', 'pageNumbers1');
    setupPagination('delivery-orders-body', 'paginationControls2', 'prevButton2', 'nextButton2', 'pageNumbers2');
});

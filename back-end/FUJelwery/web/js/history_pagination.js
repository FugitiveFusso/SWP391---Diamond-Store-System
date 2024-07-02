document.addEventListener('DOMContentLoaded', function() {
    const rowsPerPage = 10;
    const tableBody = document.querySelector('.delivery-history-table tbody');
    const rows = Array.from(tableBody.getElementsByTagName('tr'));
    const totalPages = Math.ceil(rows.length / rowsPerPage);
    const paginationControls = document.getElementById('paginationControls');
    const prevButton = document.getElementById('prevButton');
    const nextButton = document.getElementById('nextButton');
    const pageNumbersContainer = document.getElementById('pageNumbers');
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
});

// pagination.js

document.addEventListener("DOMContentLoaded", function () {
    function setupPagination(tableClass, itemsPerPage) {
        let currentPage = 1;
        const table = document.querySelector(`.${tableClass}`);
        const rows = table.querySelectorAll('tr');
        const totalPages = Math.ceil((rows.length - 1) / itemsPerPage);

        const prevButton = document.getElementById(`prevButton-${tableClass}`);
        const nextButton = document.getElementById(`nextButton-${tableClass}`);
        const pageNumbers = document.getElementById(`pageNumbers-${tableClass}`);

        function updateTable() {
            rows.forEach((row, index) => {
                if (index === 0) return; // Skip header row
                if (index > (currentPage * itemsPerPage) || index <= ((currentPage - 1) * itemsPerPage)) {
                    row.style.display = 'none';
                } else {
                    row.style.display = '';
                }
            });
        }

        function updatePaginationControls() {
            pageNumbers.innerHTML = `Page ${currentPage} of ${totalPages}`;
            prevButton.disabled = currentPage === 1;
            nextButton.disabled = currentPage === totalPages;
        }

        prevButton.addEventListener('click', function () {
            if (currentPage > 1) {
                currentPage--;
                updateTable();
                updatePaginationControls();
            }
        });

        nextButton.addEventListener('click', function () {
            if (currentPage < totalPages) {
                currentPage++;
                updateTable();
                updatePaginationControls();
            }
        });

        // Initial call to set up the table and controls
        updateTable();
        updatePaginationControls();
    }

    setupPagination('order-history-table', 5); // Adjust itemsPerPage as needed
    setupPagination('delivery-history-table', 5); // Adjust itemsPerPage as needed
});

document.addEventListener('DOMContentLoaded', (event) => {
    const rowsPerPage = 5;
    const table = document.getElementById('top-sales-table');
    const rows = table.querySelectorAll('tr:not(:first-child)');
    const totalRows = rows.length;
    const totalPages = Math.ceil(totalRows / rowsPerPage);
    let currentPage = 1;

    function displayRows(start, end) {
        rows.forEach((row, index) => {
            row.style.display = (index >= start && index < end) ? 'table-row' : 'none';
        });
    }

    function updatePaginationControls() {
        const paginationControls = document.getElementById('top-sales-pagination');
        paginationControls.innerHTML = '';

        // Previous button with Font Awesome icon
        const prevButton = document.createElement('button');
        prevButton.id = 'prevButton';
        prevButton.classList.add('pagination-button');
        const prevIcon = document.createElement('i');
        prevIcon.classList.add('fas', 'fa-chevron-left');
        prevButton.appendChild(prevIcon);
        prevButton.disabled = currentPage === 1;
        prevButton.addEventListener('click', () => {
            if (currentPage > 1) {
                currentPage--;
                paginate();
            }
        });
        paginationControls.appendChild(prevButton);

        // Determine which pages to show based on current page and total pages
        let startPage = Math.max(1, currentPage - 2);
        let endPage = Math.min(totalPages, currentPage + 2);

        if (currentPage - 1 <= 2) {
            endPage = Math.min(5, totalPages);
        }

        if (totalPages - currentPage <= 2) {
            startPage = Math.max(1, totalPages - 4);
        }

        // Add "1" and "..." at the beginning if necessary
        if (startPage > 1) {
            const firstPageButton = document.createElement('button');
            firstPageButton.textContent = '1';
            firstPageButton.addEventListener('click', () => {
                currentPage = 1;
                paginate();
            });
            paginationControls.appendChild(firstPageButton);

            if (startPage > 2) {
                const dotsSpan = document.createElement('span');
                dotsSpan.textContent = '...';
                paginationControls.appendChild(dotsSpan);
            }
        }

        // Add page buttons
        for (let i = startPage; i <= endPage; i++) {
            const pageButton = document.createElement('button');
            pageButton.textContent = i;
            pageButton.classList.toggle('active', i === currentPage);
            pageButton.addEventListener('click', () => {
                currentPage = i;
                paginate();
            });
            paginationControls.appendChild(pageButton);
        }

        // Add "..." and last page button at the end if necessary
        if (endPage < totalPages) {
            if (endPage < totalPages - 1) {
                const dotsSpan = document.createElement('span');
                dotsSpan.textContent = '...';
                paginationControls.appendChild(dotsSpan);
            }

            const lastPageButton = document.createElement('button');
            lastPageButton.textContent = totalPages;
            lastPageButton.addEventListener('click', () => {
                currentPage = totalPages;
                paginate();
            });
            paginationControls.appendChild(lastPageButton);
        }

        // Next button with Font Awesome icon
        const nextButton = document.createElement('button');
        nextButton.id = 'nextButton';
        nextButton.classList.add('pagination-button');
        const nextIcon = document.createElement('i');
        nextIcon.classList.add('fas', 'fa-chevron-right');
        nextButton.appendChild(nextIcon);
        nextButton.disabled = currentPage === totalPages;
        nextButton.addEventListener('click', () => {
            if (currentPage < totalPages) {
                currentPage++;
                paginate();
            }
        });
        paginationControls.appendChild(nextButton);
    }

    function paginate() {
        const start = (currentPage - 1) * rowsPerPage;
        const end = start + rowsPerPage;
        displayRows(start, end);
        updatePaginationControls();
    }

    // Initial call to paginate function
    paginate();
});

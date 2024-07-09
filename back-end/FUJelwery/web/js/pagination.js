document.addEventListener('DOMContentLoaded', function() {
    setupPagination('pagination', 'paginationControls', 'prevButton', 'nextButton', 'pageNumbers');
    setupPagination('pagination1', 'paginationControls1', 'prevButton1', 'nextButton1', 'pageNumbers1');
});

function setupPagination(tableId, controlsId, prevButtonId, nextButtonId, pageNumbersId) {
    const rowsPerPage = 10;
    const table = document.getElementById(tableId).getElementsByTagName('tbody')[0];
    const rows = table.getElementsByTagName('tr');
    const rowsCount = rows.length;
    const pageCount = Math.ceil(rowsCount / rowsPerPage);
    const paginationControls = document.getElementById(controlsId);
    const prevButton = document.getElementById(prevButtonId);
    const nextButton = document.getElementById(nextButtonId);
    const pageNumbers = document.getElementById(pageNumbersId);
    const currentURL = window.location.href;
    const savedPage = localStorage.getItem(tableId + '_currentPage');
    const savedURL = localStorage.getItem(tableId + '_currentURL');
    
    let currentPage;

    if (savedURL !== currentURL) {
        currentPage = 1;
        localStorage.setItem(tableId + '_currentURL', currentURL);
    } else {
        currentPage = savedPage ? parseInt(savedPage) : 1;
    }

    function showPage(pageNumber) {
        let start = (pageNumber - 1) * rowsPerPage;
        let end = start + rowsPerPage;
        for (let i = 0; i < rowsCount; i++) {
            rows[i].style.display = (i >= start && i < end) ? '' : 'none';
        }
        currentPage = pageNumber;
        localStorage.setItem(tableId + '_currentPage', currentPage); // Save current page to localStorage
        updatePaginationControls();
        window.scrollTo(0, 0); // Scroll to the top of the page
    }

    function updatePaginationControls() {
        pageNumbers.innerHTML = '';

        const createPageButton = (page) => {
            let pageNumberElement = document.createElement('span');
            pageNumberElement.textContent = page;
            pageNumberElement.className = 'page-number';
            if (page === currentPage) {
                pageNumberElement.classList.add('active');
            }
            pageNumberElement.addEventListener('click', function() {
                showPage(page);
            });
            pageNumbers.appendChild(pageNumberElement);
        };

        const ellipsis = document.createElement('span');
        ellipsis.textContent = '...';

        if (pageCount <= 7) {
            for (let i = 1; i <= pageCount; i++) {
                createPageButton(i);
            }
        } else {
            createPageButton(1);

            if (currentPage > 4) {
                pageNumbers.appendChild(ellipsis.cloneNode(true));
            }

            let startPage = Math.max(2, currentPage - 2);
            let endPage = Math.min(pageCount - 1, currentPage + 2);

            if (currentPage <= 3) {
                endPage = Math.min(5, pageCount - 1);
            }
            if (currentPage >= pageCount - 2) {
                startPage = Math.max(2, pageCount - 4);
            }

            for (let i = startPage; i <= endPage; i++) {
                createPageButton(i);
            }

            if (currentPage < pageCount - 3) {
                pageNumbers.appendChild(ellipsis.cloneNode(true));
            }

            createPageButton(pageCount);
        }

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

    showPage(currentPage);
}

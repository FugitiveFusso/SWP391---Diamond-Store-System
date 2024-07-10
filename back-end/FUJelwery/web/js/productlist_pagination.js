//document.addEventListener('DOMContentLoaded', function() {
//    const products = document.querySelectorAll('.product-card');
//    const productsPerPage = 9;
//    let currentPage = 1;
//    const totalPages = Math.ceil(products.length / productsPerPage);
//
//    const paginationControls = document.getElementById('paginationControls');
//    const prevButton = document.getElementById('prevButton');
//    const nextButton = document.getElementById('nextButton');
//    const pageNumbersContainer = document.getElementById('pageNumbers');
//
//    function showPage(page) {
//        products.forEach((product, index) => {
//            product.style.display = (index >= (page - 1) * productsPerPage && index < page * productsPerPage) ? 'block' : 'none';
//        });
//        updatePageNumbers();
//        prevButton.disabled = page === 1;
//        nextButton.disabled = page === totalPages;
//    }
//
//    function updatePageNumbers() {
//        pageNumbersContainer.innerHTML = '';
//        
//        if (totalPages <= 1) return;
//
//        const maxPagesToShow = 5;
//        const ellipsis = '...';
//
//        const createPageButton = (page) => {
//            const pageButton = document.createElement('button');
//            pageButton.textContent = page;
//            pageButton.classList.add('page-number-button');
//            if (page === currentPage) {
//                pageButton.classList.add('active');
//            }
//            pageButton.addEventListener('click', () => {
//                currentPage = page;
//                showPage(currentPage);
//            });
//            pageNumbersContainer.appendChild(pageButton);
//        };
//
//        if (totalPages <= maxPagesToShow) {
//            for (let i = 1; i <= totalPages; i++) {
//                createPageButton(i);
//            }
//        } else {
//            createPageButton(1);
//            if (currentPage > 3) {
//                pageNumbersContainer.appendChild(document.createTextNode(ellipsis));
//            }
//
//            let startPage = Math.max(2, currentPage - 2);
//            let endPage = Math.min(totalPages - 1, currentPage + 2);
//
//            if (currentPage === 1) {
//                endPage = Math.min(3, totalPages - 2);
//            }
//            if (currentPage === totalPages) {
//                startPage = Math.max(2, totalPages - 2);
//            }
//
//            for (let i = startPage; i <= endPage; i++) {
//                createPageButton(i);
//            }
//
//            if (currentPage < totalPages - 2) {
//                pageNumbersContainer.appendChild(document.createTextNode(ellipsis));
//            }
//            createPageButton(totalPages);
//        }
//    }
//
//    prevButton.addEventListener('click', () => {
//        if (currentPage > 1) {
//            currentPage--;
//            showPage(currentPage);
//        }
//    });
//
//    nextButton.addEventListener('click', () => {
//        if (currentPage < totalPages) {
//            currentPage++;
//            showPage(currentPage);
//        }
//    });
//
//    // Initialize the first page
//    showPage(currentPage);
//});


document.addEventListener('DOMContentLoaded', function() {
    const products = document.querySelectorAll('.product-card');
    const productsPerPage = 9;
    let currentPage = parseInt(localStorage.getItem('currentPage')) || 1; // Load currentPage from localStorage or default to 1
    const totalPages = Math.ceil(products.length / productsPerPage);

    const paginationControls = document.getElementById('paginationControls');
    const prevButton = document.getElementById('prevButton');
    const nextButton = document.getElementById('nextButton');
    const pageNumbersContainer = document.getElementById('pageNumbers');

    function showPage(page) {
        products.forEach((product, index) => {
            product.style.display = (index >= (page - 1) * productsPerPage && index < page * productsPerPage) ? 'block' : 'none';
        });
        updatePageNumbers();
        prevButton.disabled = page === 1;
        nextButton.disabled = page === totalPages;

        // Save currentPage to localStorage
        localStorage.setItem('currentPage', page);
    }

    function updatePageNumbers() {
        pageNumbersContainer.innerHTML = '';

        if (totalPages <= 1) return;

        const maxPagesToShow = 5;
        const ellipsis = '...';

        const createPageButton = (page) => {
            const pageButton = document.createElement('button');
            pageButton.textContent = page;
            pageButton.classList.add('page-number-button');
            if (page === currentPage) {
                pageButton.classList.add('active');
            }
            pageButton.addEventListener('click', () => {
                currentPage = page;
                showPage(currentPage);
            });
            pageNumbersContainer.appendChild(pageButton);
        };

        if (totalPages <= maxPagesToShow) {
            for (let i = 1; i <= totalPages; i++) {
                createPageButton(i);
            }
        } else {
            createPageButton(1);
            if (currentPage > 3) {
                pageNumbersContainer.appendChild(document.createTextNode(ellipsis));
            }

            let startPage = Math.max(2, currentPage - 2);
            let endPage = Math.min(totalPages - 1, currentPage + 2);

            if (currentPage === 1) {
                endPage = Math.min(3, totalPages - 2);
            }
            if (currentPage === totalPages) {
                startPage = Math.max(2, totalPages - 2);
            }

            for (let i = startPage; i <= endPage; i++) {
                createPageButton(i);
            }

            if (currentPage < totalPages - 2) {
                pageNumbersContainer.appendChild(document.createTextNode(ellipsis));
            }
            createPageButton(totalPages);
        }
    }

    prevButton.addEventListener('click', () => {
        if (currentPage > 1) {
            currentPage--;
            showPage(currentPage);
        }
    });

    nextButton.addEventListener('click', () => {
        if (currentPage < totalPages) {
            currentPage++;
            showPage(currentPage);
        }
    });

    // Initialize the first page
    showPage(currentPage);
});

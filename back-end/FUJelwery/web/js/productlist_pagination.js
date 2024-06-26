document.addEventListener('DOMContentLoaded', function() {
    const products = document.querySelectorAll('.product-card');
    const productsPerPage = 6
    let currentPage = 1;
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
    }

    function updatePageNumbers() {
        pageNumbersContainer.innerHTML = '';
        for (let i = 1; i <= totalPages; i++) {
            const pageButton = document.createElement('button');
            pageButton.textContent = i;
            pageButton.classList.add('page-number-button');
            if (i === currentPage) {
                pageButton.classList.add('active');
            }
            pageButton.addEventListener('click', () => {
                currentPage = i;
                showPage(currentPage);
            });
            pageNumbersContainer.appendChild(pageButton);
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

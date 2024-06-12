document.addEventListener('DOMContentLoaded', function () {
    const voucherContainers = document.querySelectorAll('.voucher-content > .voucher-container');
    const itemsPerPage = 1;
    let currentPage = 1;
    const totalPages = Math.ceil(voucherContainers.length / itemsPerPage);

    function showPage(page) {
        voucherContainers.forEach((container, index) => {
            container.style.display = (index >= (page - 1) * itemsPerPage && index < page * itemsPerPage) ? 'block' : 'none';
        });
        currentPage = page;
        updatePaginationControls();
    }

    function updatePaginationControls() {
        const pageNumbers = document.getElementById('pageNumbers');
        pageNumbers.innerHTML = '';

        for (let i = 1; i <= totalPages; i++) {
            const pageLink = document.createElement('a');
            pageLink.href = '#';
            pageLink.innerText = i;
            pageLink.className = 'pagination-link';
            pageLink.addEventListener('click', function (event) {
                event.preventDefault();
                showPage(i);
            });
            if (i === currentPage) {
                pageLink.classList.add('current-page');
            }
            pageNumbers.appendChild(pageLink);
        }

        const prevButton = document.getElementById('prevButton');
        const nextButton = document.getElementById('nextButton');

        prevButton.style.display = currentPage > 1 ? 'inline-block' : 'none';
        nextButton.style.display = currentPage < totalPages ? 'inline-block' : 'none';

        prevButton.onclick = function () {
            if (currentPage > 1) {
                showPage(currentPage - 1);
            }
        };

        nextButton.onclick = function () {
            if (currentPage < totalPages) {
                showPage(currentPage + 1);
            }
        };
    }

    showPage(currentPage);
});

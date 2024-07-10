document.addEventListener("DOMContentLoaded", function() {
    const containers = document.querySelectorAll(".gallery .container");
    const rowsPerPage = 2;
    const containersPerRow = 4;
    const containersPerPage = rowsPerPage * containersPerRow;
    const pageNumbersContainer = document.getElementById("pageNumbers");
    const prevButton = document.getElementById("prevButton");
    const nextButton = document.getElementById("nextButton");
    let currentPage = 1;

    function displayPage(page) {
        const start = (page - 1) * containersPerPage;
        const end = start + containersPerPage;
        containers.forEach((container, index) => {
            container.style.display = (index >= start && index < end) ? "block" : "none";
        });
    }

    function createPageNumbers() {
        const totalPages = Math.ceil(containers.length / containersPerPage);
        pageNumbersContainer.innerHTML = "";

        if (totalPages <= 5) {
            for (let i = 1; i <= totalPages; i++) {
                createPageButton(i);
            }
        } else {
            if (currentPage <= 3) {
                for (let i = 1; i <= 4; i++) {
                    createPageButton(i);
                }
                createEllipsis();
                createPageButton(totalPages);
            } else if (currentPage > 3 && currentPage < totalPages - 2) {
                createPageButton(1);
                createEllipsis();
                for (let i = currentPage - 1; i <= currentPage + 1; i++) {
                    createPageButton(i);
                }
                createEllipsis();
                createPageButton(totalPages);
            } else {
                createPageButton(1);
                createEllipsis();
                for (let i = totalPages - 3; i <= totalPages; i++) {
                    createPageButton(i);
                }
            }
        }
    }

    function createPageButton(page) {
        const pageButton = document.createElement("button");
        pageButton.className = "page-number-button";
        pageButton.textContent = page;
        pageButton.addEventListener("click", function() {
            currentPage = page;
            displayPage(currentPage);
            createPageNumbers();
        });
        if (page === currentPage) {
            pageButton.classList.add("active");
        }
        pageNumbersContainer.appendChild(pageButton);
    }

    function createEllipsis() {
        const ellipsis = document.createElement("span");
        ellipsis.className = "ellipsis";
        ellipsis.textContent = "...";
        pageNumbersContainer.appendChild(ellipsis);
    }

    prevButton.addEventListener("click", function() {
        if (currentPage > 1) {
            currentPage--;
            displayPage(currentPage);
            createPageNumbers();
        }
    });

    nextButton.addEventListener("click", function() {
        const totalPages = Math.ceil(containers.length / containersPerPage);
        if (currentPage < totalPages) {
            currentPage++;
            displayPage(currentPage);
            createPageNumbers();
        }
    });

    // Initial setup
    displayPage(currentPage);
    createPageNumbers();
});

document.addEventListener('DOMContentLoaded', function() {
    const table = document.getElementById('pagination');

    table.addEventListener('submit', function(event) {
        if (event.target.classList.contains('salesStaffOrderForm')) {
            event.preventDefault(); // Prevent the form from submitting immediately

            const form = event.target;

            Swal.fire({
                title: 'Are you sure?',
                text: "Do you want to proceed with this action?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, accept it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    form.submit(); // Submit the form if the user confirms
                }
            });
        }
    });
});


document.addEventListener('DOMContentLoaded', function() {
    const table = document.getElementById('pagination1');

    table.addEventListener('submit', function(event) {
        if (event.target.classList.contains('salesStaffOrderForm')) {
            event.preventDefault(); // Prevent the form from submitting immediately

            const form = event.target;

            Swal.fire({
                title: 'Are you sure?',
                text: "Do you want to proceed with this action?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, accept it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    form.submit(); // Submit the form if the user confirms
                }
            });
        }
    });
});
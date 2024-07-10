document.addEventListener('DOMContentLoaded', function() {
    // Apply Voucher Form submission
    document.querySelector('form[action="OrderController"][method="POST"] button.btn.btn-primary').addEventListener('click', function(event) {
        event.preventDefault();
        var form = this.closest('form');
        Swal.fire({
            title: 'Are you sure?',
            text: "Do you want to apply this voucher?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, apply it!'
        }).then((result) => {
            if (result.isConfirmed) {
                form.submit();
                Swal.fire(
                    'Applied!',
                    'Your voucher has been applied.',
                    'success'
                )
            }
        })
    });

    // Remove Voucher Form submission
    document.querySelector('form[action="OrderController"][method="POST"] button.btn.btn-danger').addEventListener('click', function(event) {
        event.preventDefault();
        var form = this.closest('form');
        Swal.fire({
            title: 'Are you sure?',
            text: "Do you want to remove this voucher?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, remove it!'
        }).then((result) => {
            if (result.isConfirmed) {
                form.submit();
                Swal.fire(
                    'Removed!',
                    'Your voucher has been removed.',
                    'success'
                )
            }
        })
    });
});

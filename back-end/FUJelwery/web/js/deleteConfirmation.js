document.addEventListener('DOMContentLoaded', function () {
    console.log('deleteConfirmation.js is loaded'); // Debugging line

    document.querySelectorAll('.deleteButton').forEach(button => {
        button.addEventListener('click', function (event) {
            event.preventDefault(); // Prevent the default form submission

            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Yes, delete it!',
                cancelButtonText: 'No, cancel!',
                reverseButtons: true
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                        title: 'Deleted',
                        text: 'Your item has been deleted',
                        icon: 'success',
                        confirmButtonText: 'OK'
                    }).then(() => {
                        this.closest('form').submit();
                    });
                } else if (result.dismiss === Swal.DismissReason.cancel) {
                    Swal.fire(
                        'Cancelled',
                        'Cancelled successfully',
                        'error'
                    );
                }
            });
        });
    });
});

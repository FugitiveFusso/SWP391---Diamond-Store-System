document.addEventListener('DOMContentLoaded', function () {
    console.log('deleteConfirmation.js is loaded'); // Debugging line

    // Select all forms that contain action buttons
    document.querySelectorAll('.actionForm').forEach(form => {
        form.addEventListener('submit', function (event) {
            event.preventDefault(); // Prevent the default form submission

            let actionText = form.querySelector('input[name="action"]').value;
            let successText = '';

            switch (actionText) {
                case 'active':
                    successText = 'activated';
                    break;
                case 'banned':
                    successText = 'banned';
                    break;
                default:
                    return; // Exit if action is unknown
            }

            Swal.fire({
                title: 'Are you sure?',
                text: `You are about to ${actionText} this user. Are you sure?`,
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: `Yes, ${actionText} it!`,
                cancelButtonText: 'No, cancel!',
                reverseButtons: true
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                        title: 'Action Confirmed',
                        text: `User has been ${successText} successfully!`,
                        icon: 'success',
                        confirmButtonText: 'OK'
                    }).then(() => {
                        form.submit(); // Submit the form after confirmation
                    });
                } else if (result.dismiss === Swal.DismissReason.cancel) {
                    Swal.fire(
                        'Cancelled',
                        'Action cancelled. User remains unchanged.',
                        'error'
                    );
                }
            });
        });
    });
});

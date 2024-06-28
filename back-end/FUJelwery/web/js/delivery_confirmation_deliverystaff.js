function confirmAction(action, orderID, status) {
    let message = "Are you sure you want to proceed?";
    if (action === 'delivered' && status !== 'shipping') {
        message = "You must make sure that the order was shipping";
        Swal.fire('Error', message, 'error');
        return;
    }

    Swal.fire({
        title: 'Confirm Action',
        text: message,
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Proceed'
    }).then((result) => {
        if (result.isConfirmed) {
            document.getElementById(`form-${action}-${orderID}`).submit();
        }
    });
}

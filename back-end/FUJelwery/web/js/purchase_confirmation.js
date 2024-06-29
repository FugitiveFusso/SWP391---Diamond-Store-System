document.addEventListener('DOMContentLoaded', function () {
    document.getElementById('purchaseButton').addEventListener('click', function () {
        const totalNumberOfThings = parseInt(document.getElementById('totalNumberOfThings').textContent); // Get the total number of things from the span element
        if (totalNumberOfThings > 0) {
            Swal.fire({
                title: 'Confirm Purchase',
                text: 'Are you sure you want to proceed with the purchase?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, purchase it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    document.getElementById('purchaseForm').submit();
                }
            });
        } else {
            Swal.fire({
                title: 'Cart is empty',
                text: 'Please add items to your cart before making a purchase.',
                icon: 'info',
                confirmButtonColor: '#3085d6',
            });
        }
    });
});

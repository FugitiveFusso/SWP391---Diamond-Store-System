document.querySelectorAll('.accept-btn').forEach(button => {
    button.addEventListener('click', function () {
        const orderID = this.getAttribute('data-order-id');
        const warrantyID = document.getElementById(this.getAttribute('data-warranty-id')).value;

        Swal.fire({
            title: 'Are you sure?',
            text: "Do you want to accept this order?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, accept it!'
        }).then((result) => {
            if (result.isConfirmed) {
                const form = document.createElement('form');
                form.method = 'POST';
                form.action = 'SalesStaffOrderController';

                const actionInput = document.createElement('input');
                actionInput.type = 'hidden';
                actionInput.name = 'action';
                actionInput.value = 'accept';
                form.appendChild(actionInput);

                const orderIDInput = document.createElement('input');
                orderIDInput.type = 'hidden';
                orderIDInput.name = 'orderID';
                orderIDInput.value = orderID;
                form.appendChild(orderIDInput);

                const warrantyIDInput = document.createElement('input');
                warrantyIDInput.type = 'hidden';
                warrantyIDInput.name = 'warrantyID';
                warrantyIDInput.value = warrantyID;
                form.appendChild(warrantyIDInput);

                document.body.appendChild(form);
                form.submit();
            }
        })
    });
});

document.querySelectorAll('.received-btn').forEach(button => {
    button.addEventListener('click', function () {
        const orderID = this.getAttribute('data-order-id');

        Swal.fire({
            title: 'Are you sure?',
            text: "Has the customer received the order at the store?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, confirm it!'
        }).then((result) => {
            if (result.isConfirmed) {
                const form = document.createElement('form');
                form.method = 'POST';
                form.action = 'SalesStaffOrderController';

                const actionInput = document.createElement('input');
                actionInput.type = 'hidden';
                actionInput.name = 'action';
                actionInput.value = 'received';
                form.appendChild(actionInput);

                const orderIDInput = document.createElement('input');
                orderIDInput.type = 'hidden';
                orderIDInput.name = 'orderID';
                orderIDInput.value = orderID;
                form.appendChild(orderIDInput);

                document.body.appendChild(form);
                form.submit();
            }
        })
    });
});
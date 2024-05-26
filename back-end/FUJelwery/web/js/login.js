document.addEventListener('DOMContentLoaded', function() {
    const roleSelect = document.getElementById('roleSelect');

    roleSelect.addEventListener('change', function() {
        const selectedValue = this.value;
        
        if (selectedValue !== "0") { // Ignore the "Select your role" option
            let url = '';

            switch (selectedValue) {
                case "1":
                    url = 'userlogin.jsp';
                    break;
                case "2":
                    url = 'adminlogin.jsp';
                    break;
                case "3":
                    url = 'managerlogin.jsp';
                    break;
                case "4":
                    url = 'saleslogin.jsp';
                    break;
                case "5":
                    url = 'deliverystafflogin.jsp';
                    break;
                default:
                    url = 'adminlogin.jsp'; // Default URL or handle error
            }

            if (url) {
                window.location.href = url;
            }
        }
    });
});

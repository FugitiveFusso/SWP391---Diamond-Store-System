// Function to check if the user is logged in
function isLoggedIn() {
    // Replace this with your actual login check logic
    return false; // For demonstration, assuming the user is not logged in
}

// Function to show the modal
function showModal() {
    const modal = document.getElementById('loginPopup');
    const closeBtn = document.querySelector('.close');
    const loginBtn = document.getElementById('loginButton');
    const registerBtn = document.getElementById('registerButton');

    modal.style.display = 'block';

    // Close the modal when the 'x' is clicked
    closeBtn.onclick = function() {
        modal.style.display = 'none';
    };

    // Redirect to login page when login button is clicked
    loginBtn.onclick = function() {
        window.location.href = '/login'; // Change this to your login page URL
    };

    // Redirect to register page when register button is clicked
    registerBtn.onclick = function() {
        window.location.href = '/register'; // Change this to your register page URL
    };

    // Close the modal if the user clicks outside of it
    window.onclick = function(event) {
        if (event.target === modal) {
            modal.style.display = 'none';
        }
    };
}

// Add event listener to all links and buttons
document.querySelectorAll('a:not([href="register.jsp"]):not([href="userlogin.jsp"]), button').forEach(function(element) {
    element.addEventListener('click', function(event) {
        event.preventDefault();
        if (!isLoggedIn()) {
            showModal();
        }
    });
});
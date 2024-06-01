document.addEventListener('DOMContentLoaded', function () {
    // Get the password input field and the eye icons
    var passwordInput = document.getElementById("myInput");
    var showEye = document.getElementById("hide1");
    var hideEye = document.getElementById("hide2");

    // Set the initial visibility state of eye icons based on the password input field
    updateEyeVisibility();

    // Toggle password visibility on eye icon click
    showEye.addEventListener('click', togglePasswordVisibility);
    hideEye.addEventListener('click', togglePasswordVisibility);

    // Dropdown functionality
    let dropdown = document.querySelector('.dropdown');
    dropdown.onclick = function () {
        dropdown.classList.toggle('active');
    };
});

function updateEyeVisibility() {
    var passwordInput = document.getElementById("myInput");
    var showEye = document.getElementById("hide1");
    var hideEye = document.getElementById("hide2");

    if (passwordInput.type === 'password') {
        showEye.style.display = "block";
        hideEye.style.display = "none";
    } else {
        showEye.style.display = "none";
        hideEye.style.display = "block";
    }
}

function togglePasswordVisibility() {
    var passwordInput = document.getElementById("myInput");

    if (passwordInput.type === 'password') {
        passwordInput.type = "text";
    } else {
        passwordInput.type = "password";
    }

    // Update the visibility of eye icons after toggling password visibility
    updateEyeVisibility();
}

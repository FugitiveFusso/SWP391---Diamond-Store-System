document.addEventListener("DOMContentLoaded", function() {
    const form = document.querySelector(".form-horizontal");
    const passwordInput = document.querySelector("input[name='password']");
    const confPasswordInput = document.querySelector("input[name='confPassword']");

    form.addEventListener("submit", function(event) {
        const password = passwordInput.value;
        const confPassword = confPasswordInput.value;
        
        if (password.length < 8 || confPassword.length < 8) {
            event.preventDefault(); // Prevent form submission
            alert("Passwords must be at least 8 characters long.");
        }
    });
});

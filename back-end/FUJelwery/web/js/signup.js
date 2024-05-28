const form = document.getElementById("form");
const username1 = document.getElementById("username1");
const email1 = document.getElementById("email1");
const password1 = document.getElementById("password1");
const password2 = document.getElementById("repass1");
const firstname1 = document.getElementById("firstname1");
const lastname1 = document.getElementById("lastname1");
const phonenumber1 = document.getElementById("phonenumber1");
const address1 = document.getElementById("address1");

form.addEventListener("submit", e => {
    e.preventDefault();
    if (validateInputs()) {
        form.submit();
    }
});

const setError = (element, message) => {
    const inputControl = element.parentElement;
    const errorDisplay = inputControl.querySelector(".error");

    errorDisplay.innerText = message;
    inputControl.classList.add("error");
    inputControl.classList.remove("success");
};

const setSuccess = element => {
    const inputControl = element.parentElement;
    const errorDisplay = inputControl.querySelector(".error");

    errorDisplay.innerText = "";
    inputControl.classList.add("success");
    inputControl.classList.remove("error");
};

const isValidEmail = email => {
    const re = /^[a-zA-Z0-9._%+-]+@gmail\.com$/;
    return re.test(String(email).toLowerCase());
};

const validateInputs = () => {
    const usernameValue = username1.value.trim();
    const emailValue = email1.value.trim();
    const passwordValue = password1.value.trim();
    const password2Value = password2.value.trim();
    const firstnameValue = firstname1.value.trim();
    const lastnameValue = lastname1.value.trim();
    const phonenumberValue = phonenumber1.value.trim();
    const addressValue = address1.value.trim();

    let isValid = true;

    if (usernameValue === "") {
        setError(username1, "Username is required");
        isValid = false;
    } else {
        setSuccess(username1);
    }

    if (emailValue === "") {
        setError(email1, "Email is required");
        isValid = false;
    } else if (!isValidEmail(emailValue)) {
        setError(email1, "Provide a valid email address with @gmail.com");
        isValid = false;
    } else {
        setSuccess(email1);
    }

    if (passwordValue === "") {
        setError(password1, "Password is required");
        isValid = false;
    } else if (passwordValue.length < 8) {
        setError(password1, "Password must be at least 8 characters.");
        isValid = false;
    } else {
        setSuccess(password1);
    }

    if (password2Value === "") {
        setError(password2, "Please confirm your password");
        isValid = false;
    } else if (password2Value !== passwordValue) {
        setError(password2, "Passwords don't match");
        isValid = false;
    } else {
        setSuccess(password2);
    }

    if (firstnameValue === "") {
        setError(firstname1, "First Name is required");
        isValid = false;
    } else {
        setSuccess(firstname1);
    }

    if (lastnameValue === "") {
        setError(lastname1, "Last Name is required");
        isValid = false;
    } else {
        setSuccess(lastname1);
    }

    if (phonenumberValue === "") {
        setError(phonenumber1, "Phone Number is required");
        isValid = false;
    } else if (!/^0\d{9}$/.test(phonenumberValue)) {
        setError(phonenumber1, "Phone number must be exactly 10 digits and begin with 0.");
        isValid = false;
    } else {
        setSuccess(phonenumber1);
    }

    if (addressValue === "") {
        setError(address1, "Address is required");
        isValid = false;
    } else {
        setSuccess(address1);
    }

    return isValid;
};
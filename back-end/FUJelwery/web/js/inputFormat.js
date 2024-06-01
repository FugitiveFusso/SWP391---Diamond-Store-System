function validateForm() {
    var emailInput = document.getElementById("email1");
    var phoneNumberInput = document.getElementById("phonenumber1");
    var email = emailInput.value.trim();
    var phoneNumber = phoneNumberInput.value.trim();
    var emailError = document.querySelector("#email1 + .error");
    var phoneNumberError = document.querySelector("#phonenumber1 + .error");
    var valid = true;

    // Kiểm tra định dạng email
    if (!email.endsWith('@gmail.com')) {
        emailError.innerHTML = "Email must end with '@gmail.com'";
        valid = false;
    } else {
        emailError.innerHTML = ""; // Xóa thông báo lỗi nếu có
    }

    // Kiểm tra số điện thoại
    var phoneNumberRegex = /^0\d{9}$/; // Số điện thoại bắt đầu từ 0 và có tổng cộng 10 số
    if (!phoneNumber.match(phoneNumberRegex)) {
        phoneNumberError.innerHTML = "Must start with 0, have 10 digits";
        valid = false;
    } else {
        phoneNumberError.innerHTML = ""; // Xóa thông báo lỗi nếu có
    }

    // Nếu tất cả các điều kiện đều đúng, submit form
    if (valid) {
        document.getElementById("form").submit();
    }

    return false; // Ngăn chặn form submit mặc định
}

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FUJ - FPT Jewelry</title>
        <link rel="icon" type="image/x-icon" href="images/Screenshot__656_-removebg-preview.png">

        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link rel="stylesheet" href="css/adminlogin.css">

        <style>
            .wrapper h1 a{
                color: white;
                text-decoration: none;
            }
        </style>
    </head>

    <body>

        <section class="ftco-section">                       
            <div class="wrapper">
                <form action="./userlogin" name="" method="POST" class="signin-form">
                    <h1><a href="guest_homepage.jsp">User Login</a></h1>

                    <% String error = (String) request.getAttribute("error"); %>
                    <% if (error != null) {%>
                    <h3 style="color: red; display: flex; justify-content: center; text-align: center ;margin-top: 10px"> <%= error%> </h3>
                    <% }%>

                    <div class="input-box">
                        <input name="user" type="text" autofocus required>
                        <span class="placeholder">Username</span>
                        <i class='bx bxs-user'></i>
                    </div>
                    <div class="input-box">
                        <input id="myInput" name="password" type="password" autofocus required>
                        <span class="placeholder">Password</span>
                        <span class="eye" onclick="myFunction()">
                            <i id="hide1" class="fa-solid fa-eye" style="display:none;"></i>
                            <i id="hide2" class="fa-solid fa-eye-slash"></i>
                        </span>
                        <p id="capslock-warning" hidden style="margin-top: 2px">⚠ Caps Lock is on.</p>
                    </div>

                    <div class="dropdown-forget">
                        <div class="dropdown1">
                            <select  id="roleSelect" class="select-box" style="width: 200px;">
                                <option value="0">Select your role</option>
                                <option value="1">Customer</option>
                                <option value="2">Administrator</option>
                                <option value="3">Manager</option>
                                <option value="4">Sales Staff</option>
                                <option value="5">Delivery Staff</option>

                            </select>             
                        </div>

                        <div class="forgot-password">
                            <a href="forgotPassword.jsp">Forgot Password?</a>
                        </div>
                    </div>

                    <button type="submit" class="btn">Login</button>

                    <div class="other-login">Or Sign In With</div>

                    <div class="social-icon">
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/FUJelwery/LoginGoogleServlet&response_type=code
                           &client_id=792757160936-kke52p9ud3fl6h3qe93tl4i6lug4sotd.apps.googleusercontent.com&approval_prompt=force" class="social-login"><i class="fa-brands fa-google"></i></a>
                    </div>

                    <div class="register-link">
                        <p>Don't have an account? <a href="register.jsp">Register</a></p>
                    </div>

                </form>
            </div>
        </section>


        <!--JS-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link rel="stylesheet" href="alert/dist/sweetalert.css">
        <script src="js/login.js"></script>
        <script>
                            // Caps Lock Warning
                            const passwordInput = document.getElementById('myInput');
                            const warning = document.getElementById('capslock-warning');

                            passwordInput.addEventListener('keyup', (event) => {
                                if (event.getModifierState('CapsLock')) {
                                    warning.hidden = false;
                                } else {
                                    warning.hidden = true;
                                }
                            });

                            // Show/Hide Password Function
                            function myFunction() {
                                var x = document.getElementById("myInput");
                                var y = document.getElementById("hide1");
                                var z = document.getElementById("hide2");

                                if (x.type === 'password') {
                                    x.type = "text";
                                    y.style.display = "block";
                                    z.style.display = "none";
                                } else {
                                    x.type = "password";
                                    y.style.display = "none";
                                    z.style.display = "block";
                                }
                            }

                            // Dropdown Toggle
                            let dropdown = document.querySelector('.dropdown');
                            dropdown.onclick = function () {
                                dropdown.classList.toggle('active');
                            }
        </script>

        <script type="text/javascript">
            window.onload = function () {
                var status = "<%= request.getAttribute("status")%>";
                if (status == "failed") {
                    swal("Sorry", "Wrong Username or Password", "error");
                } else if (status == "invalidEmail") {
                    swal("Sorry", "Please Enter Username", "error");
                } else if (status == "invalidPassword") {
                    swal("Sorry", "Please Enter Password", "error");
                } else if (status == "resetSuccess") {
                    swal("Congrats", "Password Reset Successfully", "success");
                } else if (status == "resetFailed") {
                    swal("Sorry", "Password Reset Failed", "error");
                }
            };
        </script>
    </body>
</html>

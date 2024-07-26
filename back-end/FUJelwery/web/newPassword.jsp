<!doctype html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>Reset Password</title>
        <link rel="icon" type="image/x-icon" href="images/Screenshot__656_-removebg-preview.png">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link rel="stylesheet" href="css/adminlogin.css">

    </head>
    <body>


        <section class="ftco-section">                       
            <div class="wrapper">
                <form class="form-horizontal" action="newPassword" method="POST">
                    <h1>Reset Password</h1>

                    <div class="input-box">
                        <input type="password" name="password" id="myInput" required>
                        <span class="placeholder">New Password</span>
                        <span class="eye" onclick="myFunction()">
                            <i id="hide1" class="fa-solid fa-eye"></i>
                            <i id="hide2" class="fa-solid fa-eye-slash" id="eyeicon"></i>
                        </span>  
                    </div>
                    <div class="input-box">
                        <input input type="password" name="confPassword" required>
                        <span class="placeholder">Re-enter Password</span>

                    </div>

                    <button input type="submit" value="Reset" class="btn">Reset</button>

                    <div class="register-link">
                        <p>Don't have an account? <a href="register.jsp">Register</a></p>
                    </div>
                </form>
            </div>
        </section>

        <script type='text/javascript'
        src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
        <script>
                            function myFunction() {
                                var x = document.getElementById("myInput");
                                var y = document.getElementById("hide1");
                                var z = document.getElementById("hide2");

                                if (x.type === 'password') {
                                    x.type = "text";
                                    y.style.display = "block";
                                    z.style.display = "none"
                                } else {
                                    x.type = "password";
                                    y.style.display = "none";
                                    z.style.display = "block"
                                }
                            }

                            let dropdown = document.querySelector('.dropdown');
                            dropdown.onclick = function () {
                                dropdown.classList.toggle('active');
                            }
        </script>
        <script src="js/newPasswordValidation.js"></script>
    </body>
</html>
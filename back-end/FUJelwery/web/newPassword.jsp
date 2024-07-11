<!doctype html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>Reset Password</title>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link rel="stylesheet" href="css/adminlogin.css">
        <!--        <style>
                    .placeicon {
                        font-family: fontawesome
                    }
        
                    .custom-control-label::before {
                        background-color: #dee2e6;
                        border: #dee2e6
                    }
                </style>-->
        <!--        <link rel="stylesheet" href="css/newPassword.css">-->
    </head>
    <body>
        <!-- Container containing all contents -->
        <!--        <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-12 col-md-9 col-lg-7 col-xl-6 mt-5">
                             White Container 
                            <div class="content-container rounded mt-2 mb-2 px-0 wrapper">
                                 Main Heading 
                                <div class="row justify-content-center align-items-center pt-3">
                                    <h1>
                                        <strong style="color: #fff">Reset Password</strong>
                                    </h1>
                                </div>
                                <div class="pt-3 pb-3">
                                    <form class="form-horizontal" action="newPassword" method="POST">
                                         User Name Input 
                                        <div class="form-group row justify-content-center px-3 input-box">
                                            <div class="col-9 px-0 ">
                                                                                        <input type="text" name="password" placeholder="&#xf084; &nbsp; New Password"
                                                                                               class="form-control border-info placeicon">
                                                <input name="password" type="password" required>
                                                <span class="placeholder">Password</span>
                                            </div>
                                        </div>
                                         Password Input 
                                        <div class="form-group row justify-content-center px-3 input-box">
                                            <div class="col-9 px-0">
                                                                                        <input type="password" name="confPassword"
                                                                                               placeholder="&#xf084; &nbsp; Confirm New Password"
                                                                                               class="form-control border-info placeicon">
                                                <input name="confPassword" type="password" required>
                                                <span class="placeholder">Re-enter Password</span>
                                            </div>
                                        </div>
        
                                         Log in Button 
                                        <div class="form-group row justify-content-center">
                                            <div class="col-3 px-3 mt-3">
                                                <input type="submit" value="Reset"
                                                       class="btn btn-block btn-info">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                 Alternative Login 
                                <div class="mx-0 px-0">
        
                                     Horizontal Line 
                                    <div class="px-4">
                                        <hr>
                                    </div>
                                     Register Now 
                                    <div class="pt-2">
                                        <div class="row justify-content-center">
                                            <div class="register-link">
                                                <p>Don't have an account? <a href="register.jsp">Register</a></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>-->

        <section class="ftco-section">                       
            <div class="wrapper">
                <form class="form-horizontal" action="newPassword" method="POST">
                    <h1>Reset Password</h1>

                    <div class="input-box">
                        <input type="text" name="password" id="myInput" required>
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

    </body>
</html>
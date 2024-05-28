<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FUJ - FPT Jewelry</title>

        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link rel="stylesheet" href="css/adminlogin.css">
    </head>
    <body>

<<<<<<< HEAD

        <section class="ftco-section">
            <div class="container">

                <div class="row justify-content-center">
                    <div class="col-md-7 col-lg-5">
                        <div class="wrap">
                            <div class="img" style="background-image: url(images/diamondbackground.jpg);"></div>
                            <div class="login-wrap p-4 p-md-5">
                                <div class="d-flex">
                                    <div class="w-100">
                                        <h2 class="mb-4">User Login</h2>
                                        <% String error = (String) request.getAttribute("error"); %>
                                        <% if (error != null) {%>
                                        <h4 style="color: red"> <%= error%> </h3>
                                        <% }%>			      		</div>
                                    <div class="w-100">
                                        <p class="social-media d-flex justify-content-end">
                                            <a href="#" class="social-icon d-flex align-items-center justify-content-center"><span class="fa fa-google"></span></a>
                                        </p>
                                    </div>                     
                                </div>
                                <form action="./userlogin" name="" method="POST" class="signin-form">
                                    <div class="form-group mt-3">
                                        <input name="user" type="text" class="form-control" required>
                                        <label class="form-control-placeholder" for="username">Username</label>
                                    </div>
                                    <div class="form-group">
                                        <input name="password" id="password-field" type="password" class="form-control" required>
                                        <label class="form-control-placeholder" for="password">Password</label>
                                    </div>
                                    <div class="form-group">
                                        <input value="Login" type="submit" class="submit">
                                    </div>
                                    <div class="form-group d-md-flex">

                                        <select  id="roleSelect" style="width: 200px;">
                                            <option value="0">Select your role first</option>
                                            <option value="1">Customer</option>
                                            <option value="2">Administrator</option>
                                            <option value="3">Manager</option>
                                            <option value="4">Sales Staff</option>
                                            <option value="5">Delivery Staff</option>

                                        </select>

                                        <div class="w-50 text-md-right" id="forgotpass">
                                            <a href="#" >Forgot Password</a>
                                        </div>
                                    </div>
                                </form>
                                    <p class="text-center">Not a member? <a data-toggle="tab" href="register.jsp" style="text-decoration: underline">Sign Up</a></p>
                            </div>
                        </div>
=======
        <section class="ftco-section">                       
            <div class="wrapper">
                <form action="./userlogin" name="" method="POST" class="signin-form">
                    <h1>User Login</h1>
                    
                    <% String error = (String) request.getAttribute("error"); %>
                    <% if (error != null) {%>
                    <h3 style="color: red"> <%= error%> </h3>
                    <% }%>
                    
                    <div class="input-box">
                        <input name="user" type="text" required>
                        <span class="placeholder">Username</span>
                        <i class='bx bxs-user'></i>
>>>>>>> 161afbe36095b53d6a310bdb8d581d66b1abb11f
                    </div>
                    <div class="input-box">
                        <input name="password" type="password" id="myInput" required>
                        <span class="placeholder">Password</span>
                        <span class="eye" onclick="myFunction()">
                            <i id="hide1" class="fa-solid fa-eye"></i>
                            <i id="hide2" class="fa-solid fa-eye-slash" id="eyeicon"></i>
                        </span>              
                    </div>


                    <div class="dropdown">
                        Or login as &nbsp
                        <select  id="roleSelect" class="select-box" style="width: 200px;">
                            <option value="0">Select your role</option>
                            <option value="1">Customer</option>
                            <option value="2">Administrator</option>
                            <option value="3">Manager</option>
                            <option value="4">Sales Staff</option>
                            <option value="5">Delivery Staff</option>

                        </select>             
                    </div>

                    <button type="submit" class="btn">Login</button>
                </form>
            </div>
        </section>
        <script src="js/login.js"></script>

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

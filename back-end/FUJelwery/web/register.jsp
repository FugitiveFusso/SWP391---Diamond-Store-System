
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="icon" type="image/x-icon" href="images/Screenshot__656_-removebg-preview.png">
        <link rel="stylesheet" href="./css/signup.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <script defer src="./js/signup.js"></script>
        <link rel="stylesheet" href="css/adminlogin.css">

    </head>
    <body>

        <section class="ftco-section">       
            <div class="wrapper">


                <form name="registerForm" id="form" action="register" method="POST" onsubmit="return validateForm();">
                    <h1>Register</h1>
                    <% String error1 = (String) request.getAttribute("error1"); %>
                    <% if (error1 != null) {%>
                    <h4 style="color: red; text-align: center"> <%= error1%> </h4>
                    <% }%>

                    <div class="input-box"><input name="username" id="username1"type="text" required>
                        <span class="placeholder2">Username</span>
                        <div class="error"></div></div>
                    <div class="input-box">
                        <input name="password" type="password" id="myInput"  required>
                        <span class="placeholder2">Password</span>
                        <span class="eye" onclick="myFunction()">
                            <i id="hide1" class="fa-solid fa-eye"></i>
                            <i id="hide2" class="fa-solid fa-eye-slash" id="eyeicon"></i>
                        </span>  
                        <div class="error"></div>
                    </div>
                    <div class="input-box">
                        <input name="repass" id="repass1" type="password"  required>
                        <span class="placeholder2">Re-password</span>
                        <!--                        <span class="eye" onclick="myFunction()">
                                                    <i id="hide1" class="fa-solid fa-eye"></i>
                                                    <i id="hide2" class="fa-solid fa-eye-slash" id="eyeicon"></i>
                                                </span>  -->
                        <div class="error"></div>
                    </div>
                    <div class="input-box"><input name="firstname" type="text" id="firstname1" required>
                        <span class="placeholder2">First Name</span>
                        <div class="error"></div>
                    </div>
                    <div class="input-box"><input name="lastname" type="text" id="lastname1" required>
                        <span class="placeholder2">Last Name</span>
                        <div class="error"></div>
                    </div>

                    <div class="input-box"><input name="phonenumber" type="text" id="phonenumber1" required>
                        <span class="placeholder2">Phone Contact</span>
                        <div class="error"></div>
                    </div>

                    <div class="input-box"><input name="email" type="text" id="email1"  required>
                        <span class="placeholder2">Email</span>
                        <div class="error"></div>
                    </div>

                    <div class="input-box"><input name="address" type="text" id="address1" required>
                        <span class="placeholder2">Address</span>
                        <div class="error"></div>
                    </div>
                    <button type="submit" class="btn">Sign Up</button>

                    <div class="register-link">
                        <p>Already a member? <a href="userlogin.jsp">Login</a></p><br>
                    </div>
                </form>
            </div>
        </section>
        <script src="js/signup.js"></script>
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

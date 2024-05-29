<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FUJ - FPT Jewelry</title>

        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="css/login.css">
    </head>
    <body>


        <section class="ftco-section">
            <div class="container">

                <div class="row justify-content-center">
                    <div class="col-md-7 col-lg-5">
                        <div class="wrap">
                            <div class="img" style="background-image: url(images/diamondbackground.jpg);"></div>
                            <div class="login-wrap p-4 p-md-5">
                                <div class="d-flex">
                                    <div class="w-100">
                                        <h2 class="mb-4">Manager Login</h2>
                                        <% String error = (String) request.getAttribute("error"); %>
                                        <% if (error != null) {%>
                                        <h4 style="color: red"> <%= error%> </h3>
                                        <% }%>			      		</div>
<!--                                    <div class="w-100">
                                        <p class="social-media d-flex justify-content-end">
                                            <a href="#" class="social-icon d-flex align-items-center justify-content-center"><span class="fa fa-google"></span></a>
                                        </p>
                                    </div>                     -->
                                </div>
                                <form action="./managerlogin" name="" method="POST" class="signin-form">
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

                                        <div class="w-50 text-md-right">
                                            <a href="#" style="color: white">Forgot Password</a>
                                        </div>
                                    </div>
                                </form>
<!--                                <p class="text-center">Not a member? <a data-toggle="tab" href="#signup">Sign Up</a></p>-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="js/login.js"></script>

    </body>
</html>

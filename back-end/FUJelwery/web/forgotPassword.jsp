<!doctype html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>Reset Password</title>
        <link
            href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'
            rel='stylesheet'>
        <link href='' rel='stylesheet'>
        <script type='text/javascript'
        src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <link rel="stylesheet" href="css/forgotpassword.css">


    </head>
    <body oncontextmenu='return false' class='snippet-body'>
        <div class="container ">
            <div class="row justify-content-center ">
                <div class="col-lg-8 col-md-10">
                    <div class="wrapper">
                        <h2 style="font-size: 40px">Forgot your password?</h2>
                        <p>Change your password in three easy steps. This will help you to secure your password!</p>
                        <ol class="list-unstyled">
                            <li><span style="color: #fff">1. </span>Enter your email address below.</li>
                            <li><span style="color: #fff">2. </span>Our system will send you an OTP to your email</li>
                            <li><span style="color: #fff">3. </span>Enter the OTP on the next page</li>
                        </ol>
                    </div>
                    <form class="mt-4" action="forgotPassword" method="POST">
                        <div class="card-body wrapper">
                            <div class="form-content">
                                <h3>Enter your email address</h3>
                                <small style="color: #fff">Enter the registered email address . Then we'll email a OTP to this address.</small>
                            </div>
                            <div class="input-box ">
                                <input type="text" name="email" id="email-for-pass" required="">
                                <span class="placeholder">Enter your email</span>
                                <i class='bx bxs-user'></i>
                            </div>
                            <div class="d-flex justify-content-between">
                                <button class="btn btn-success" type="submit">Get New Password</button>
                                <a href="userlogin.jsp" class="btn btn-danger">Return to Login</a>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>

        <script type='text/javascript'
        src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
        <script type='text/javascript' src=''></script>
        <script type='text/javascript' src=''></script>
        <script type='text/Javascript'></script>
    </body>
</html>
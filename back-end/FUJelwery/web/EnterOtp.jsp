<html>
    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>Reset Password</title>
        <link
            href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
            rel="stylesheet" id="bootstrap-css">
        <script
        src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->

        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="css/enterOTP.css">
        <style type="text/css">
            .form-gap {
                padding-top: 70px;
            }
        </style>
    </head>

    <body>
        <div class="form-gap"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="wrapper">
                        <div class="panel-body">
                            <div class="text-center">
                                <h3>
                                    <i class="fa fa-lock fa-4x"></i>
                                </h3>
                                <h2 class="text-center" id="title">Enter OTP</h2>
                                <%
                                    if (request.getAttribute("message") != null) {
                                        out.print("<p class='text-danger ml-1'>" + request.getAttribute("message") + "</p>");
                                    }

                                %>

                                <div class="panel-body">

                                    <form id="register-form" action="ValidateOtp" role="form" autocomplete="off"
                                          class="form" method="post">

                                        <!--                                        <div class="form-group">
                                                                                    <div class="input-group">
                                                                                        <span class="input-group-addon"><i
                                                                                                class="glyphicon glyphicon-envelope color-blue"></i></span> 
                                                                                        <input id="opt" name="otp" placeholder="Enter OTP"
                                                                                               class="form-control" type="text" required="required">
                                                                                    </div>
                                                                                </div>-->
                                        <div class="input-box ">
                                            <input type="text" name="email" id="email-for-pass" required="">
                                            <span class="placeholder">Enter OTP</span>
                                            <i class='bx bxs-user'></i>
                                        </div>
                                        <div class="form-group">
                                            <input name="recover-submit"
                                                   class="btn btn-lg btn-primary btn-block"
                                                   value="Reset Password" type="submit">
                                        </div>

                                        <input type="hidden" class="hide" name="token" id="token"
                                               value="">
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>